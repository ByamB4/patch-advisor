export type { default as IVmware } from "./IVmware";
export type { default as ICisco } from "./ICisco";
export type { IMicrosoft } from "./IMicrosoft";
export type { default as IOracle } from "./IOracle";

export interface ICSAF {
  RHSA: string;
  severity: string;
  released_on: string;
  CVEs: string[];
  bugzillas: string[];
  released_packages: string[];
  resource_url: string;
  document: Document;
  product_tree: ProductTree;
  vulnerabilities: Vulnerability[];
}

interface Document {
  aggregate_severity: AggregateSeverity;
  category: string;
  csaf_version: string;
  distribution: Distribution;
  lang: string;
  notes: Note[];
  publisher: Publisher;
  references: Reference[];
  title: string;
  tracking: Tracking;
}

interface AggregateSeverity {
  namespace: string;
  text: string;
}

interface Distribution {
  text: string;
  tlp: Tlp;
}

interface Tlp {
  label: string;
  url: string;
}

interface Note {
  category: string;
  text: string;
  title: string;
}

interface Publisher {
  category: string;
  contact_details: string;
  issuing_authority: string;
  name: string;
  namespace: string;
}

interface Reference {
  category: string;
  summary: string;
  url: string;
}

interface Tracking {
  current_release_date: string;
  generator: Generator;
  id: string;
  initial_release_date: string;
  revision_history: RevisionHistory[];
  status: string;
  version: string;
}

interface Generator {
  date: string;
  engine: Engine;
}

interface Engine {
  name: string;
  version: string;
}

interface RevisionHistory {
  date: string;
  number: string;
  summary: string;
}

interface ProductTree {
  branches: Branch[];
  relationships: Relationship[];
}

interface Branch {
  branches: Branch2[];
  category: string;
  name: string;
}

interface Branch2 {
  branches: Branch3[];
  category: string;
  name: string;
}

interface Branch3 {
  category: string;
  name: string;
  product: Product;
}

interface Product {
  name: string;
  product_id: string;
  product_identification_helper: ProductIdentificationHelper;
}

interface ProductIdentificationHelper {
  cpe?: string;
  purl?: string;
}

interface Relationship {
  category: string;
  full_product_name: FullProductName;
  product_reference: string;
  relates_to_product_reference: string;
}

interface FullProductName {
  name: string;
  product_id: string;
}

interface Vulnerability {
  cve: string;
  cwe: Cwe;
  discovery_date: string;
  ids: Id[];
  notes: Note2[];
  product_status: ProductStatus;
  references: Reference2[];
  release_date: string;
  remediations: Remediation[];
  scores: Score[];
  threats: Threat[];
  title: string;
}

interface Cwe {
  id: string;
  name: string;
}

interface Id {
  system_name: string;
  text: string;
}

interface Note2 {
  category: string;
  text: string;
  title: string;
}

interface ProductStatus {
  fixed: string[];
}

interface Reference2 {
  category: string;
  summary: string;
  url: string;
}

interface Remediation {
  category: string;
  details: string;
  product_ids: string[];
  restart_required?: RestartRequired;
  url?: string;
}

interface RestartRequired {
  category: string;
}

interface Score {
  cvss_v3: CvssV3;
  products: string[];
}

interface CvssV3 {
  attackComplexity: string;
  attackVector: string;
  availabilityImpact: string;
  baseScore: number;
  baseSeverity: string;
  confidentialityImpact: string;
  integrityImpact: string;
  privilegesRequired: string;
  scope: string;
  userInteraction: string;
  vectorString: string;
  version: string;
}

interface Threat {
  category: string;
  details: string;
}
