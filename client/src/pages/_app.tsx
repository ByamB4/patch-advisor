import "@/styles/globals.css";
import type { AppProps } from "next/app";
import Head from "next/head";
import { TabProvider } from "@/contexts/nav";
import { CssBaseline, ThemeProvider } from "@mui/material";
import { MuiTheme, createEmotionCache } from "@/theme";
import { CacheProvider } from "@emotion/react";

const clientSideEmotionCache = createEmotionCache();

interface Props extends AppProps {
  emotionCache: any;
}
const App = ({ emotionCache = clientSideEmotionCache, Component, pageProps }: Props) => {
  return (
    <>
      <Head>
        <title>Patch Advisor | KhanBank</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, viewport-fit=cover"></meta>
      </Head>
      {/* <CacheProvider value={emotionCache}> */}
      <ThemeProvider theme={MuiTheme}>
        <TabProvider>
          <CssBaseline />
          <Component {...pageProps} />
        </TabProvider>
      </ThemeProvider>
      {/* </CacheProvider> */}
    </>
  );
};

export default App;
