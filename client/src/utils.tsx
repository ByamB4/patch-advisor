import { Typography } from "@mui/material";

export const convertToLocalTime = (raw: string): string => {
  const originalDate: Date = new Date(raw);
  originalDate.setUTCHours(originalDate.getUTCHours() + 8);

  return originalDate.toISOString().slice(0, 19).replace("T", " ");
};

export const renderSynopsis = (raw: string): React.ReactElement => {
  return <Typography variant="subtitle1">{raw.split("Red Hat Security Advisory: ")[1]}</Typography>;
};
