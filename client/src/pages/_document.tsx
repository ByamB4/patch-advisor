import Document, { Html, Head, Main, NextScript } from "next/document";

class _ extends Document<unknown> {
  render(): JSX.Element {
    return (
      <Html lang="mn">
        <Head>
          <meta name="robots" content="index, follow" />
        </Head>
        <body>
          <Main />
          <NextScript />
        </body>
      </Html>
    );
  }
}

export default _;
