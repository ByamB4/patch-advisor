from requests import Session
from prisma import Prisma, Client
from dotenv import load_dotenv
from os import getenv
from datetime import datetime
from json import loads as json_loads

load_dotenv()


class Cisco:
    def __init__(self, db: Client) -> None:
        self.db = db
        # self.clear_db()
        self.login()
        self.write_db()

    def write_db(self) -> None:
        for cisco in self.session.get(f"https://apix.cisco.com/security/advisories/v2/year/{datetime.now().year}").json()["advisories"]:
            # print(cisco)
            # print(f"[url] {cisco["csafUrl"]}")
            # input()
            if not self.db.cisco.find_first(where={"advisoryId": cisco["advisoryId"]}):
                print(f"[id] {cisco['advisoryId']}")
                print(f"[url] {cisco["csafUrl"]}")
                cisco = json_loads(self.db.cisco.create(cisco).json())
                for _ in range(5):
                    try:
                        detail = self.session.get(cisco["csafUrl"]).json()
                        break
                    except:
                        pass
                # if cisco["advisoryId"] == "cisco-sa-radius-spoofing-july-2024-87cCDwZ3":
                #     print(detail)
                #     input()
                self.write_document(cisco, detail["document"])
                if "product_tree" in detail:
                    self.write_product_tree(cisco, detail["product_tree"])
                if "vulnerabilities" in detail:
                    self.write_vulnerabilities(cisco, detail["vulnerabilities"])
                print("=" * 60)

    def write_vulnerabilities(self, cisco, detail) -> None:
        for vuln in detail:
            write_object = {
                "cve": vuln["cve"],
                "title": vuln["title"],
                "ciscoId": cisco["advisoryId"],
            }
            if "release_date" in vuln:
                write_object["release_date"] = vuln["release_date"]
            cisco_vuln = json_loads(self.db.cisco_vulnerabilities.create(write_object).json())
            if "ids" in vuln:
                for id in vuln["ids"]:
                    self.db.cisco_vulnerabilities_ids.create(
                        {
                            "system_name": id["system_name"],
                            "text": id["text"],
                            "ciscoVulnerabilitiesId": cisco_vuln["id"],
                        }
                    )
            for note in vuln["notes"]:
                self.db.cisco_vulnerabilities_notes.create(
                    {
                        "category": note["category"],
                        "title": note["title"],
                        "text": note["text"],
                        "ciscoVulnerabilitiesId": cisco_vuln["id"],
                    }
                )
            self.db.cisco_vulnerabilities_product_status.create(
                {
                    "known_affected": vuln["product_status"]["known_affected"],
                    "ciscoVulnerabilitiesId": cisco_vuln["id"],
                }
            )
            for remediate in vuln["remediations"]:
                write_remediate = {
                    "category": remediate["category"],
                    "details": remediate["details"],
                    "product_ids": remediate["product_ids"],
                    "ciscoVulnerabilitiesId": cisco_vuln["id"],
                }
                if "url" in remediate:
                    write_remediate["url"] = remediate["url"]
                self.db.cisco_vulnerabilities_remediation.create(write_remediate)
            if "scores" in vuln:
                for score in vuln["scores"]:
                    cisco_vuln_score = json_loads(
                        self.db.cisco_vulnerabilities_score.create(
                            {
                                "products": score["products"],
                                "ciscoVulnerabilitiesId": cisco_vuln["id"],
                            }
                        ).json()
                    )
                    self.db.cisco_vulnerabilities_score_cvss.create(
                        {
                            "baseScore": score["cvss_v3"]["baseScore"],
                            "baseSeverity": score["cvss_v3"]["baseSeverity"],
                            "vectorString": score["cvss_v3"]["vectorString"],
                            "version": score["cvss_v3"]["version"],
                            "ciscoVulnerabilitiesScoreId": cisco_vuln_score["id"],
                        }
                    )

    def write_product_tree(self, cisco, detail) -> None:
        cisco_product_tree = json_loads(
            self.db.cisco_product_tree.create(
                {
                    "ciscoId": cisco["advisoryId"],
                }
            ).json()
        )
        for branch in detail["branches"]:
            cisco_product_tree_branch = json_loads(
                self.db.cisco_product_tree_branches.create(
                    {
                        "name": branch["name"],
                        "category": branch["category"],
                        "ciscoProductTreeId": cisco_product_tree["id"],
                    }
                ).json()
            )
            for branch_branches in branch["branches"]:
                tmp = json_loads(
                    self.db.cisco_product_tree_branches_branches.create(
                        {
                            "name": branch_branches["name"],
                            "category": branch_branches["category"],
                            "ciscoProductTreeBranchesId": cisco_product_tree_branch["id"],
                        }
                    ).json()
                )
                if "product" in branch_branches:
                    self.db.cisco_product_tree_branches_branches_product.create(
                        {
                            "name": branch_branches["product"]["name"],
                            "product_id": branch_branches["product"]["product_id"],
                            "ciscoProductTreeBranchesBranchesId": tmp["id"],
                        }
                    )

    def write_document(self, cisco, detail) -> None:
        cisco_document = json_loads(
            self.db.cisco_document.create(
                {
                    "category": detail["category"],
                    "csaf_version": detail["csaf_version"],
                    "title": detail["title"],
                    "ciscoId": cisco["advisoryId"],
                }
            ).json()
        )
        if "acknowledgments" in detail:
            for acknowledgement in detail["acknowledgments"]:
                self.db.cisco_document_acknowledgments.create(
                    {
                        "summary": acknowledgement["summary"],
                        "ciscoDocumentId": cisco_document["id"],
                    }
                )
        for note in detail["notes"]:
            self.db.cisco_document_note.create(
                {
                    "category": note["category"],
                    "title": note["title"],
                    "text": note["text"].replace("\n", "<br>"),
                    "ciscoDocumentId": cisco_document["id"],
                }
            )
        self.db.cisco_document_publisher.create(
            {
                "category": detail["publisher"]["category"],
                "contact_details": detail["publisher"]["contact_details"],
                "issuing_authority": detail["publisher"]["issuing_authority"],
                "name": detail["publisher"]["name"],
                "namespace": detail["publisher"]["namespace"],
                "ciscoDocumentId": cisco_document["id"],
            }
        )
        for reference in detail["references"]:
            self.db.cisco_document_references.create(
                {
                    "category": reference["category"],
                    "summary": reference["summary"],
                    "url": reference["url"],
                    "ciscoDocumentId": cisco_document["id"],
                }
            )
        cisco_tracking = json_loads(
            self.db.cisco_document_tracking.create(
                {
                    "current_release_date": detail["tracking"]["current_release_date"],
                    "id": detail["tracking"]["id"],
                    "initial_release_date": detail["tracking"]["initial_release_date"],
                    "status": detail["tracking"]["status"],
                    "version": detail["tracking"]["version"],
                    "ciscoDocumentId": cisco_document["id"],
                }
            ).json()
        )
        cisco_tracking_generator = json_loads(
            self.db.cisco_document_tracking_generator.create(
                {
                    "date": detail["tracking"]["generator"]["date"],
                    "ciscoTrackingId": cisco_tracking["id"],
                }
            ).json()
        )
        self.db.cisco_document_tracking_generator_engine.create(
            {
                "name": detail["tracking"]["generator"]["engine"]["name"],
                "ciscoTrackingGeneratorId": cisco_tracking_generator["id"],
            }
        )
        for history in detail["tracking"]["revision_history"]:
            self.db.cisco_document_tracking_revision_history.create(
                {
                    "date": history["date"],
                    "number": history["number"],
                    "summary": history["summary"],
                    "ciscoTrackingId": cisco_tracking["id"],
                }
            )

    def login(self) -> None:
        self.session = Session()
        resp = self.session.post(
            "https://id.cisco.com/oauth2/default/v1/token",
            headers={"Content-Type": "application/x-www-form-urlencoded"},
            data={
                "client_id": getenv("CISCO_KEY"),
                "client_secret": getenv("CISCO_SECRET"),
                "grant_type": "client_credentials",
            },
        ).json()
        self.session.headers.update({"Accept": "application/json", "Authorization": f"Bearer {resp['access_token']}"})

    def clear_db(self) -> None:
        self.db.cisco.delete_many()

        print("[clear] done")


def main() -> None:
    load_dotenv()
    db = Prisma()
    db.connect()
    formatted_time = datetime.now().strftime("%Y-%m-%d %H:%M")
    print("[current_time]", formatted_time, flush=True)
    Cisco(db)
    db.disconnect()


if __name__ == "__main__":
    main()
