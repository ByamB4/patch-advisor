import { useRouter } from "next/router";
import Image from "next/image";
import Link from "next/link";

interface Props {
  className?: string;
}

const AppNavbar: React.FC<Props> = ({ className = "" }): React.ReactElement => {
  const router = useRouter();
  const checkActivePage = (_: string) => {
    if (router.asPath.includes(_.toLowerCase())) return true;
    return false;
  };

  const middleLinks = [
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
  return (
    <nav className={`flex items-center justify-between border-[#D6D8DB] border-b bg-white py-4 px-12 ${className}`}>
      <div className="cursor-pointer w-full">
        <Link href="/">
          <Image src="/kb-logo.svg" width={150} height={150} alt="kb-logo" className="h-8" />
        </Link>
      </div>
      <div className="flex gap-4 justify-center w-full">
        {middleLinks.map((it) => (
          <Link href={it.link} key={it.id}>
            <div className={`hover:cursor-pointer rounded-2xl py-2 px-5 ${checkActivePage(it.title) ? "bg-[#EFF6FF]" : ""}`}>
              <span className={`font-exo font-medium ${checkActivePage(it.title) ? "font-semibold text-[#044BE7]" : "text-[#384454]"}`}>{it.title}</span>
            </div>
          </Link>
        ))}
      </div>
      <div className="cursor-pointer bg-red-200 w-full">
        {/* <img
          src="/byamb4.png"
          className="w-12 rounded-full border-2 border-[#044BE7]"s
        /> */}
      </div>
    </nav>
  );
};

export default AppNavbar;
