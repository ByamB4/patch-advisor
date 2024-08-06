from requests import get
from prisma import Prisma, Client
from dotenv import load_dotenv
from datetime import datetime
from json import loads as json_loads


class RedhatErrata:
    URL: str = "https://access.redhat.com/hydra/rest/securitydata"
    HTTP_TIMEOUT: int = 10

    def __init__(self, db: Client) -> None:
        self.db = db
        self.clear_db()
        self.write_db()
        # self.read_db()

    def read_db(self) -> None:
        redhat = self.db.redhat.find_first(
            include={
                "document": {
                    "include": {
                        "publisher": True,
                        "notes": True,
                    }
                },
                "vulnerabilities": True,
            }
        )
        if redhat:
            print(json_loads(redhat.json()))

    def write_db(self) -> None:
        for csaf in get(f"{self.URL}/csaf.json", timeout=self.HTTP_TIMEOUT).json():
            # if csaf["RHSA"] == "RHSA-2024:4846":
            #     data = get(f"{self.URL}/csaf/{csaf['RHSA']}", timeout=self.HTTP_TIMEOUT).json()
            #     print(data)
            #     input()
            if not self.db.redhat.find_first(where={"RHSA": csaf["RHSA"]}):
                data = get(f"{self.URL}/csaf/{csaf['RHSA']}", timeout=self.HTTP_TIMEOUT).json()
                redhat = json_loads(
                    self.db.redhat.create(
                        {
                            "RHSA": csaf["RHSA"],
                            "severity": csaf["severity"],
                            "released_on": csaf["released_on"],
                            "CVEs": csaf["CVEs"],
                            "bugzillas": csaf["bugzillas"],
                            "released_packages": csaf["released_packages"],
                            "resource_url": csaf["resource_url"],
                        }
                    ).json()
                )
                print("[redhat]", redhat["RHSA"])
                self.write_document(data, redhat)
                self.write_vulnerabilities(data, redhat)
                print("=" * 60)

    def write_document(self, data, redhat) -> None:
        document = json_loads(
            self.db.redhat_document.create(
                {
                    "category": data["document"]["category"],
                    "csaf_version": data["document"]["csaf_version"],
                    "lang": data["document"]["lang"],
                    "title": data["document"]["title"],
                    "redhatId": redhat["id"],
                }
            ).json()
        )
        self.db.redhat_document_tracking.create(
            {
                "current_release_date": data["document"]["tracking"]["current_release_date"],
                "ID": data["document"]["tracking"]["id"],
                "documentId": document["id"],
            }
        )
        print(f"[document] {document['id']}")
        write_aggregateseverity = json_loads(
            self.db.redhat_document_aggregateseverity.create(
                {
                    "namespace": data["document"]["aggregate_severity"]["namespace"],
                    "text": data["document"]["aggregate_severity"]["text"],
                    "documentId": document["id"],
                }
            ).json()
        )
        distribution = json_loads(
            self.db.redhat_document_distribution.create(
                {
                    "text": data["document"]["distribution"]["text"],
                    "documentId": document["id"],
                }
            ).json()
        )
        tlp = data["document"]["distribution"]["tlp"].copy()
        tlp["distributionId"] = distribution["id"]

        self.db.redhat_document_distribution_tlp.create(tlp)
        for _ in data["document"]["notes"]:
            write_notes = _.copy()
            write_notes["documentId"] = document["id"]
            write_notes["text"] = _["text"].replace("\n", "<br>")
            self.db.redhat_document_note.create(write_notes)

        write_publisher = data["document"]["publisher"].copy()
        write_publisher["documentId"] = document["id"]
        publisher = json_loads(self.db.redhat_document_publisher.create(write_publisher).json())

        for _ in data["document"]["references"]:
            write_doc_references = _.copy()
            write_doc_references["documentId"] = document["id"]
            self.db.redhat_document_reference.create(write_doc_references)
        self.db.redhat_document.update(
            where={"id": document["id"]},
            data={
                "aggregateSeverityId": write_aggregateseverity["id"],
                "distributionId": distribution["id"],
                "publisherId": publisher["id"],
            },
        )

    def write_vulnerabilities(self, data, redhat) -> None:
        if not "vulnerabilities" in data:
            return
        for vulnerability in data["vulnerabilities"]:
            record_vuln = json_loads(
                self.db.redhat_vulnerability.create(
                    {
                        "cve": vulnerability["cve"],
                        "discovery_date": vulnerability["discovery_date"],
                        "release_date": vulnerability["release_date"],
                        "title": vulnerability["title"],
                        "redhatId": redhat["id"],
                    }
                ).json()
            )
            if "cwe" in vulnerability:
                self.db.redhat_vulnerability_cwe.create(
                    {
                        "name": vulnerability["cwe"]["name"],
                        "cweId": vulnerability["cwe"]["id"],
                        "vulnerabilityId": record_vuln["id"],
                    }
                )
            for i in vulnerability["ids"]:
                self.db.redhat_vulnerability_id.create(
                    {
                        "system_name": i["system_name"],
                        "text": i["text"],
                        "vulnerabilityId": record_vuln["id"],
                    }
                )
            for i in vulnerability["notes"]:
                self.db.redhat_vulnerability_note.create(
                    {
                        "category": i["category"],
                        "text": i["text"],
                        "title": i["title"],
                        "vulnerabilityId": record_vuln["id"],
                    }
                )
            self.db.redhat_vulnerability_productstatus.create(
                {
                    "fixed": vulnerability["product_status"]["fixed"],
                    "vulnerabilityId": record_vuln["id"],
                }
            )
            for i in vulnerability["references"]:
                self.db.redhat_vulnerability_reference.create(
                    {
                        "category": i["category"],
                        "summary": i["summary"],
                        "url": i["url"],
                        "vulnerabilityId": record_vuln["id"],
                    }
                )
            for i in vulnerability["remediations"]:
                tmp_record = json_loads(
                    self.db.redhat_vulnerability_remediation.create(
                        {
                            "category": i["category"],
                            "details": i["details"],
                            "vulnerabilityId": record_vuln["id"],
                            "product_ids": i["product_ids"],
                        }
                    ).json()
                )
                if "url" in i:
                    self.db.redhat_vulnerability_remediation.update(
                        where={"id": tmp_record["id"]},
                        data={
                            "url": i["url"],
                        },
                    )
                if "restart_required" in i:
                    self.db.redhat_vulnerability_remediation_restartrequired.create(
                        {
                            "category": i["restart_required"]["category"],
                            "remediationId": tmp_record["id"],
                        }
                    )
            if "scores" in vulnerability:
                for i in vulnerability["scores"]:
                    tmp_record = json_loads(
                        self.db.redhat_vulnerability_score.create(
                            {
                                "products": i["products"],
                                "vulnerabilityId": record_vuln["id"],
                            }
                        ).json()
                    )
                    write_cvssv3 = i["cvss_v3"].copy()
                    write_cvssv3["scoreId"] = tmp_record["id"]
                    self.db.redhat_vulnerability_score_cvssv3.create(write_cvssv3)
                if "threads" in vulnerability:
                    for i in vulnerability["threats"]:
                        self.db.redhat_vulnerability_threat.create(
                            {
                                "category": i["category"],
                                "details": i["details"],
                                "vulnerabilityId": record_vuln["id"],
                            }
                        )
            print(f"[vuln] {record_vuln['cve']}")

    def clear_db(self) -> None:
        self.db.redhat.delete_many()
        # self.db.redhat_document.delete_many()
        # self.db.redhat_document_aggregateseverity.delete_many()
        # self.db.redhat_document_distribution.delete_many()
        # self.db.redhat_document_tracking.delete_many()
        # self.db.redhat_document_distribution_tlp.delete_many()
        # self.db.redhat_document_note.delete_many()
        # self.db.redhat_document_publisher.delete_many()
        # self.db.redhat_document_reference.delete_many()
        # self.db.redhat_vulnerability.delete_many()
        # self.db.redhat_vulnerability_id.delete_many()
        # self.db.redhat_vulnerability_note.delete_many()
        # self.db.redhat_vulnerability_productstatus.delete_many()
        # self.db.redhat_vulnerability_reference.delete_many()
        # self.db.redhat_vulnerability_remediation.delete_many()
        # self.db.redhat_vulnerability_remediation_restartrequired.delete_many()
        # self.db.redhat_vulnerability_score.delete_many()
        # self.db.redhat_vulnerability_score_cvssv3.delete_many()
        # self.db.redhat_vulnerability_threat.delete_many()
        # self.db.redhat_vulnerability_cwe.delete_many()

        print("[clear] done")


def main() -> None:
    load_dotenv()
    db = Prisma()
    db.connect()
    formatted_time = datetime.now().strftime("%Y-%m-%d %H:%M")
    print("[current_time]", formatted_time, flush=True)
    RedhatErrata(db)
    db.disconnect()


if __name__ == "__main__":
    main()
