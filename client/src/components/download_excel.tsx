import { FC, ReactElement } from "react";
import { Button } from "@mui/material";
import { LuDownloadCloud } from "react-icons/lu";
import * as XLSX from "xlsx";

interface Props {
  className?: string;
  data: any;
  label: string;
}

const DownloadAsExcel: FC<Props> = ({ className = "", data = [], label = "" }): ReactElement => {
  const downloadExcel = () => {
    const worksheet = XLSX.utils.json_to_sheet(data);

    const workbook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(workbook, worksheet, "Sheet1");

    XLSX.writeFile(workbook, `${label}.xlsx`);
  };
  return (
    <Button variant="contained" size="medium" startIcon={<LuDownloadCloud />} onClick={downloadExcel}>
      Download
    </Button>
  );
};

export default DownloadAsExcel;
