// tailwind
export const MARGIN_Y: string = "my-12";
export const MARGIN_T: string = "mt-12";
export const PADDING_X: string = "px-12";
export const PADDING_Y: string = "py-12";

export const POST_PER_PAGE: number = 30;
export const CURRENT_MONTH = new Date().getMonth();

// tabs
export const ROOT_TABS = [
  // {
  //   id: "716a267a-c157-4409-8cf9-318489460ef0",
  //   title: "News",
  //   link: "/news",
  // },
  {
    id: "92e15847-0493-4ed9-a7df-086ea4b0713e",
    title: "Redhat",
    link: "/redhat",
  },
  {
    id: "930a48d3-c9c2-4aa7-8603-01284a343bcc",
    title: "Cisco",
    link: "/cisco",
  },
  // {
  //   id: "424f5e35-8f1e-430d-af6a-88d86eb29207",
  //   title: "VMware",
  //   link: "/vmware",
  // },
  {
    id: "ff3ad85f-88be-499e-9e96-0f1e36c243fa",
    title: "Microsoft",
    link: "/microsoft",
  },
  // {
  //   id: "261e515c-2fc7-4e3e-972c-101eb117b974",
  //   title: "Oracle",
  //   link: "/oracle",
  // },
];

export const NEWS_TABS = [
  {
    id: "5225ad4c-6388-4720-b434-e12fd607a926",
    title: "Hacker news",
    unread: 0,
  },
  {
    id: "d290fba5-0a49-46b2-bd3e-882387dac3f6",
    title: "Bleeping computer",
    unread: 0,
  },
];

export const REDHAT_TABS = [
  {
    id: "39301f48-cb53-4425-81bc-5d4e8777ad9b",
    title: "All",
    unread: 0,
  },
  {
    id: "5f79ea7a-9df5-4ac1-9dc8-c0e8a85faa59",
    title: "This month",
    unread: 0,
  },
];

export const MICROSOFT_TABS = [
  {
    id: "60596e63-fc8d-4649-ba00-9e2b83a9181b",
    title: "All",
    unread: 0,
  },
];

export const VMWARE_TABS = [
  {
    id: "52c83aef-f085-4eef-8f43-c0a83d267074",
    title: "All",
  },
  {
    id: "18bfff42-416d-4764-9956-c3187364fc09",
    title: "Moderate",
  },
  {
    id: "483ec166-0eac-4639-b0f1-69eb2d5a5631",
    title: "Critical",
  },
  {
    id: "d0c31bf6-c805-42b8-a255-3f86b5d542f1",
    title: "Important",
  },
  {
    id: "cf4a5889-2092-4ba9-9a1d-f31324e6f618",
    title: "Low",
  },
];

export const CISCO_TABS = [
  {
    id: "e12d7e83-a122-484d-a007-9c4c4deeb46c",
    title: "All",
  },
  {
    id: "02a90dc2-8b6c-4610-b457-9b5bf9d6b770",
    title: "Medium",
  },
  {
    id: "120e458f-01e6-4e2f-9594-024a2603cfb7",
    title: "High",
  },
  {
    id: "22723175-0130-43d8-9ed0-95654d0d0944",
    title: "Critical",
  },
  {
    id: "759f6442-2c49-4af3-8c9b-3588385aa336",
    title: "This month",
  },
];

export const ORACLE_TABS = [
  {
    id: "ca5b7abc-abd8-43f2-8551-4e7b496e84eb",
    title: "All",
  },
];
