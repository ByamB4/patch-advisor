export interface IMicrosoft {
  DocumentTitle: { Value: string };
  DocumentType: { Value: string };
  DocumentPublisher: {
    ContactDetails: { Value: string };
    IssuingAuthority: {
      Value: string;
    };
    Type: number;
  };
  DocumentTracking: {
    Identification: {
      ID: any;
      Alias: any;
    };
    Status: number;
    Version: string;
    RevisionHistory: any[];
    InitialReleaseDate: string;
    CurrentReleaseDate: string;
  };
  DocumentNotes: {
    Title: string;
    Audience: string;
    Type: number;
    Ordinal: string;
    Value: string;
  }[];
  ProductTree: {
    Branch: any[];
    FullProductName: any[];
  };
  Vulnerability: IVulnerability[];
}

export interface IVulnerability {
  Title: any;
  Notes: any[];
  DiscoveryDate: string;
  DiscoveryDateSpecified: boolean;
  ReleaseDate: string;
  ReleaseDateSpecified: boolean;
  CVE: string;
  ProductStatuses: any[];
  Threats: any[];
  CVSSScoreSets: any[];
  Remediations: any[];
  Acknowledgments: any[];
  Ordinal: string;
  RevisionHistory: any[];
}
