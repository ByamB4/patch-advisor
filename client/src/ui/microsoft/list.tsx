import { tableCellClasses } from "@mui/material/TableCell";
import { Table, TableBody, TableContainer, TableRow, TableHead, TableCell, CircularProgress, Paper } from "@mui/material";
import { styled } from "@mui/material/styles";
import colors from "@/theme/colors";
import { IMicrosoft } from "@/interfaces";
import { useEffect, useState } from "react";

const StyledTableCell = styled(TableCell)(({ theme }) => ({
  [`&.${tableCellClasses.head}`]: {
    backgroundColor: colors.text.whiteGrey,
    color: colors.primary.dark,
  },
  [`&.${tableCellClasses.body}`]: {
    fontSize: 14,
  },
}));

const StyledTableRow = styled(TableRow)(({ theme }) => ({
  "&:nth-of-type(odd)": {
    backgroundColor: theme.palette.action.hover,
  },
  "&:last-child td, &:last-child th": {
    border: 0,
  },
}));

interface Props {
  className?: string;
  data: IMicrosoft[];
}

const MicrosoftUI: React.FC<Props> = ({ className = "", data = [] }): React.ReactElement => {
  const [sortedData, setSortedData] = useState<IMicrosoft[]>([]);

  useEffect(() => {
    const sorted = data.sort((a, b) => {
      const dateA = a.release_date.split(" ").map(Number);
      const dateB = b.release_date.split(" ").map(Number);

      for (let i = 0; i < 3; i++) {
        if (dateA[i] > dateB[i]) return -1;
        if (dateA[i] < dateB[i]) return 1;
      }
      return 0;
    });
    setSortedData(sorted);
  }, [data]);

  return (
    <>
      {sortedData.length > 0 ? (
        <TableContainer component={Paper} className={`${className}`}>
          <Table sx={{ minWidth: 700 }} aria-label="customized table">
            <TableHead>
              <TableRow>
                <StyledTableCell>Release date</StyledTableCell>
                <StyledTableCell align="center" width={200}>
                  Last Updated
                </StyledTableCell>
                <StyledTableCell align="center">CVE Number</StyledTableCell>
                <StyledTableCell align="center">CVE Title</StyledTableCell>
                <StyledTableCell align="center">Impact</StyledTableCell>
                <StyledTableCell align="center">Max Severity</StyledTableCell>
                <StyledTableCell align="center">Tag</StyledTableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {sortedData.map((row) => (
                <StyledTableRow key={row.cve}>
                  <StyledTableCell>{row.release_date}</StyledTableCell>
                  <StyledTableCell align="center">{row.revision_date}</StyledTableCell>
                  <StyledTableCell align="center">
                    <a target="_blank" href={`https://msrc.microsoft.com/update-guide/vulnerability/${row.cve}`}>
                      {row.cve}
                    </a>
                  </StyledTableCell>
                  <StyledTableCell align="center">{row.cve_title}</StyledTableCell>
                  <StyledTableCell align="center">{row.impact}</StyledTableCell>
                  <StyledTableCell className="flex flex-column gap-12" align="center">
                    {row.severity}
                  </StyledTableCell>
                  <StyledTableCell className="flex flex-column gap-12" align="center">
                    {row.tag}
                  </StyledTableCell>
                </StyledTableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
      ) : (
        <div className="flex items-center justify-center my-60">
          <CircularProgress />
        </div>
      )}
    </>
  );
};

export default MicrosoftUI;
