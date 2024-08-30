import { tableCellClasses } from "@mui/material/TableCell";
import { Table, TableBody, TableContainer, TableRow, TableHead, TableCell, CircularProgress, Paper, Typography } from "@mui/material";
import { styled } from "@mui/material/styles";
import colors from "@/theme/colors";
import Link from "next/link";
import { ICSAF } from "@/interfaces";
import { convertToLocalTime, renderSynopsis } from "@/utils";

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
  data: ICSAF[];
}

const RedHatUI: React.FC<Props> = ({ className = "", data }): React.ReactElement => {
  const renderSeverity = (raw: string) => {
    var el = <></>;
    if (raw === "Important") {
      el = <div className="flex items-center justify-center bg-[#b85c00] p-1 rounded text-white">Important</div>;
    } else if (raw === "Moderate") {
      el = <div className="flex items-center justify-center bg-[#f5c12e] p-1 rounded">Moderate</div>;
    } else if (raw === "Low") {
      el = <div className="flex items-center justify-center bg-[#316dc1] p-1 rounded text-white">Low</div>;
    } else if (raw === "Critical") {
      el = <div className="flex items-center justify-center bg-[#a30000] p-1 rounded text-white">Critical</div>;
    }
    return el;
  };

  const renderAdvisoryType = (raw: string) => {
    return <Typography variant="subtitle2">{raw.split(":")[0].split("Red Hat ")[1]}</Typography>;
  };

  return (
    <>
      {data.length > 0 ? (
        <TableContainer component={Paper} className={`${className}`}>
          <Table sx={{ minWidth: 700 }} aria-label="customized table">
            <TableHead>
              <TableRow>
                <StyledTableCell width={150} align="center">
                  Advisory
                </StyledTableCell>
                <StyledTableCell width={250} align="center">
                  Synopsis
                </StyledTableCell>
                <StyledTableCell width={250} align="center">
                  Advisory Type
                </StyledTableCell>
                <StyledTableCell align="center">Type/Severity</StyledTableCell>
                <StyledTableCell align="center">Summary</StyledTableCell>
                <StyledTableCell width={200} align="center">
                  Publish Date
                </StyledTableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {data.map((row) => (
                <StyledTableRow key={row.RHSA}>
                  <StyledTableCell>
                    <Link href={`/redhat/${row.RHSA}`}>
                      <Typography variant="subtitle2" className="hover:cursor-pointer text-primary-blue underline">
                        {row.RHSA}
                      </Typography>
                    </Link>
                  </StyledTableCell>
                  <StyledTableCell>{renderSynopsis(row.document.title)}</StyledTableCell>
                  <StyledTableCell align="center">{renderAdvisoryType(row.document.title)}</StyledTableCell>
                  <StyledTableCell width={100}>{renderSeverity(row.document.aggregate_severity?.text || "")}</StyledTableCell>
                  <StyledTableCell>
                    {row.document.notes && row.document.notes.length > 0 && row.document.notes[0].text && (
                      <Typography variant="subtitle2">
                        <div
                          dangerouslySetInnerHTML={{
                            __html: row.document.notes[0].text,
                          }}
                        />
                      </Typography>
                    )}
                  </StyledTableCell>
                  <StyledTableCell align="center">{row.document.tracking && convertToLocalTime(row.document.tracking.current_release_date)}</StyledTableCell>
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

export default RedHatUI;
