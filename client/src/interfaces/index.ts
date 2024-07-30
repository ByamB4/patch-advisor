export type { default as IRedhat } from "./IRedHat";
export type { default as IVmware } from "./IVmware";
export type { default as ICisco } from "./ICisco";
export type { IMicrosoft } from "./IMicrosoft";
export type { default as IOracle } from "./IOracle";

export interface ICSAF {
  RHSA: string;
  severity: string;
  released_on: string;
  CVES: string[];
  bugzillas: string[];
  released_packages: string[];
  resource_url: string;
}
