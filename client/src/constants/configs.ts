import { v4 } from "uuid";

export const REDHAT_TABS = [
  {
    id: v4(),
    title: "All",
    unread: 0,
  },
  {
    id: v4(),
    title: "Enhancement",
    unread: 2,
  },
  {
    id: v4(),
    title: "Bug Fix",
    unread: 0,
  },
  {
    id: v4(),
    title: "Security Advisory",
    unread: 0,
  },
];

export const MICROSOFT_TABS = [
  {
    id: v4(),
    title: "All",
    unread: 0,
  },
  {
    id: v4(),
    title: "Moderate",
    unread: 0,
  },
  {
    id: v4(),
    title: "Low",
    unread: 0,
  },
  {
    id: v4(),
    title: "Important",
    unread: 0,
  },
];

export const VMWARE_TABS = [
  {
    id: v4(),
    title: "All",
  },
  {
    id: v4(),
    title: "Moderate",
  },
  {
    id: v4(),
    title: "Critical",
  },
  {
    id: v4(),
    title: "Important",
  },
  {
    id: v4(),
    title: "Low",
  },
];

export const CISCO_TABS = [
  {
    id: v4(),
    title: "All",
  },
  {
    id: v4(),
    title: "Medium",
  },
  {
    id: v4(),
    title: "High",
  },
  {
    id: v4(),
    title: "Critical",
  },
];

export const ORACLE_TABS = [
  {
    id: v4(),
    title: "All",
  },
];
