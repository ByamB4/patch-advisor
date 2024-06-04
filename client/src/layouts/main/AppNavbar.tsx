import { useRouter } from "next/router";
import { v4 } from "uuid";

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
    {
      id: v4(),
      title: "Redhat",
      link: "/redhat",
    },
    {
      id: v4(),
      title: "VMware",
      link: "/vmware",
    },
    {
      id: v4(),
      title: "Cisco",
      link: "/cisco",
    },
    {
      id: v4(),
      title: "Microsoft",
      link: "/microsoft",
    },
    {
      id: v4(),
      title: "Oracle",
      link: "/oracle",
    },
  ];
  return (
    <nav
      className={`flex items-center justify-between border-[#D6D8DB] border-b bg-white py-4 px-12 ${className}`}
    >
      <div className="cursor-pointer">
        <img
          src="/kb-logo.svg"
          className="h-8"
          onClick={() => router.push("/")}
        />
      </div>
      <div className="flex gap-4 justify-center">
        {middleLinks.map((it) => (
          <div
            className={`hover:cursor-pointer rounded-2xl py-2 px-5 ${
              checkActivePage(it.title) ? "bg-[#EFF6FF]" : ""
            }`}
            key={it.id}
            onClick={() => router.push(it.link)}
          >
            <span
              className={`font-exo font-medium ${
                checkActivePage(it.title)
                  ? "font-semibold text-[#044BE7]"
                  : "text-[#384454]"
              }`}
            >
              {it.title}
            </span>
          </div>
        ))}
      </div>
      <div className="cursor-pointer">
        <img
          src="/byamb4.png"
          className="w-12 rounded-full border-2 border-[#044BE7]"
        />
      </div>
    </nav>
  );
};

export default AppNavbar;
