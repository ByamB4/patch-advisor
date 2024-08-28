/* eslint-disable @next/next/no-img-element */
import { useRouter } from "next/router";
import Image from "next/image";
import Link from "next/link";
import { ROOT_TABS } from "@/constants/configs";

interface Props {
  className?: string;
}

const AppNavbar: React.FC<Props> = ({ className = "" }): React.ReactElement => {
  const router = useRouter();
  const checkActivePage = (_: string) => {
    if (router.asPath.includes(_.toLowerCase())) return true;
    return false;
  };

  return (
    <nav className={`flex items-center justify-between border-[#D6D8DB] border-b bg-white py-4 px-12 ${className}`}>
      <div className="cursor-pointer w-full">
        <Link href="/">
          <img src="/khan.png" alt="kb-logo" className="max-w-48" />
        </Link>
      </div>
      <div className="flex gap-12 justify-center w-full">
        {ROOT_TABS.map((it) => (
          <Link href={it.link} key={it.id}>
            <div className={`hover:cursor-pointer rounded-xl py-2 px-5 ${checkActivePage(it.title) ? "bg-[#EFF6FF]" : ""}`}>
              <span className={`font-exo font-medium ${checkActivePage(it.title) ? "font-semibold text-[#044BE7]" : "text-[#384454]"}`}>{it.title}</span>
            </div>
          </Link>
        ))}
      </div>
      <div className="w-full" />
      {/* <img
          src="/byamb4.png"
          className="w-12 rounded-full border-2 border-[#044BE7]"s
        /> */}
    </nav>
  );
};

export default AppNavbar;
