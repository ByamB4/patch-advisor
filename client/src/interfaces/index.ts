export type { ICisco } from "./ICisco";
export type { ICSAF } from "./ICSAF";

export interface IMicrosoft {
  cve: string;
  release_date: string;
  revision_date: string;
  cve_link: string;
  cve_title: string;
  impact: string;
  severity: string;
  tag: string;
}

export interface IOracle {
  affected_product: string;
  affected_product_link: string;
  patch_document: string;
  patch_document_link: string;
}

export interface IVmware {
  cve: string;
  synopsis: string;
  date: string;
  link: string;
  severity: string;
  detail: string;
}
