import { tableCellClasses } from "@mui/material/TableCell";
import { Table, TableBody, TableContainer, TableRow, TableHead, TableCell, CircularProgress, Paper, Typography } from "@mui/material";
import { styled } from "@mui/material/styles";
import Link from "next/link";
import colors from "@/theme/colors";
import { ICisco } from "@/interfaces";
import { convertToLocalTime } from "@/utils";

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

const CiscoUI: React.FC<{ className?: string; data: ICisco[] }> = ({ className = "", data }): React.ReactElement => {
  const renderSeverity = (raw: string) => {
    var el = <></>;
    if (raw === "Medium") {
      el = (
        <div className="flex items-center gap-2">
          <div className=" bg-[#f5c12e] rounded h-4 w-4" />
          <div>{raw}</div>
        </div>
      );
    } else if (raw === "High") {
      el = (
        <div className="flex items-center gap-2">
          <div className=" bg-[#ff7302] rounded h-4 w-4" />
          <div>{raw}</div>
        </div>
      );
    } else if (raw === "Critical") {
      el = (
        <div className="flex items-center gap-2">
          <div className="bg-[#a30000] rounded h-4 w-4" />
          <div>{raw}</div>
        </div>
      );
    }
    return el;
  };
  return (
    <>
      {data.length > 0 ? (
        <TableContainer component={Paper} className={`${className}`}>
          <Table sx={{ minWidth: 700 }} aria-label="customized table">
            <TableHead>
              <TableRow>
                <StyledTableCell width={500} align="center">
                  Advisory
                </StyledTableCell>
                <StyledTableCell align="left" width={50}>
                  Impact
                </StyledTableCell>
                <StyledTableCell width={100} align="center">
                  CVE
                </StyledTableCell>
                <StyledTableCell width={200} align="center">
                  Last updated
                </StyledTableCell>
                <StyledTableCell width={200} align="center">
                  CVSS score
                </StyledTableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {data.map((row) => (
                <StyledTableRow key={row.advisoryId}>
                  <StyledTableCell>
                    <Link href={`/cisco/${row.advisoryId}`}>
                      <Typography variant="subtitle2" className="hover:cursor-pointer text-primary-blue underline">
                        {row.advisoryTitle}
                      </Typography>
                    </Link>
                  </StyledTableCell>
                  <StyledTableCell align="left">
                    <Typography variant="subtitle2">{renderSeverity(row.sir)}</Typography>
                  </StyledTableCell>
                  <StyledTableCell width={200} className="flex flex-col gap-12" align="center">
                    {row.cves.map((it) => (
                      <Typography key={it} variant="subtitle2">
                        {it}
                      </Typography>
                    ))}
                  </StyledTableCell>
                  <StyledTableCell align="center">
                    <Typography variant="subtitle2">{convertToLocalTime(row.lastUpdated)}</Typography>
                  </StyledTableCell>
                  <StyledTableCell align="center">
                    <Typography variant="subtitle2">{row.cvssBaseScore}</Typography>
                  </StyledTableCell>
                </StyledTableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
      ) : (
        <div className="flex items-center justify-center my-60">
          <Typography variant="h4">No data found 😕</Typography>
        </div>
      )}
    </>
  );
};

export default CiscoUI;
