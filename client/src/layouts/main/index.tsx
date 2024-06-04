import AppNavbar from "./AppNavbar";
import { MARGIN_Y, PADDING_X } from "constants/layout";

interface Props {
  children: React.ReactNode;
  className?: string;
  NO_PADDING?: boolean;
}

const MainLayout: React.FC<Props> = ({
  children,
  className = "",
  NO_PADDING = false,
}) => {
  return (
    <>
      <div className={`flex flex-col bg-[#F3FAFB] h-full w-full ${className}`}>
        <AppNavbar />
        <main
          className={`min-h-screen ${
            NO_PADDING ? "" : MARGIN_Y + " " + PADDING_X
          }`}
        >
          {children}
        </main>
      </div>
    </>
  );
};

export default MainLayout;
