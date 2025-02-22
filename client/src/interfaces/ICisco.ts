export interface ICisco {
  advisoryId: string;
  advisoryTitle: string;
  bugIDs: string[];
  ipsSignatures: string[];
  cves: string[];
  cvrfUrl: string;
  csafUrl: string;
  cvssBaseScore: string;
  cwe: string[];
  firstPublished: string;
  lastUpdated: string;
  status: string;
  version: string;
  productNames: string[];
  publicationUrl: string;
  sir: string;
  summary: string;
  document: Document;
  product_tree: ProductTree;
  vulnerabilities: Vulnerability[];
}

interface Document {
  acknowledgments: Acknowledgment[];
  category: string;
  csaf_version: string;
  notes: Note[];
  publisher: Publisher;
  references: Reference[];
  title: string;
  tracking: Tracking;
}

interface Acknowledgment {
  summary: string;
}

interface Note {
  category: string;
  title: string;
  text: string;
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
}

interface RevisionHistory {
  date: string;
  number: string;
  summary: string;
}

interface ProductTree {
  branches: Branch[];
}

interface Branch {
  name: string;
  category: string;
  branches: Branch2[];
}

interface Branch2 {
  name: string;
  category: string;
  product: Product;
}

interface Product {
  name: string;
  product_id: string;
}

interface Vulnerability {
  cve: string;
  ids: Id[];
  notes: Note2[];
  product_status: ProductStatus;
  release_date: string;
  remediations: Remediation[];
  scores: Score[];
  title: string;
}

interface Id {
  system_name: string;
  text: string;
}

interface Note2 {
  category: string;
  title: string;
  text: string;
}

interface ProductStatus {
  known_affected: string[];
}

interface Remediation {
  category: string;
  details: string;
  product_ids: string[];
  url: string;
}

interface Score {
  cvss_v3: CvssV3;
  products: string[];
}

interface CvssV3 {
  baseScore: number;
  baseSeverity: string;
  vectorString: string;
  version: string;
}
