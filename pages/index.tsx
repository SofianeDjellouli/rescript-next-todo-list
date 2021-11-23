import type { NextPage } from "next";
import Head from "next/head";
import { App } from "../src/components/app/App.gen";

const Home: NextPage = () => (
  <>
    <Head>
      <title>Rescript + NextJs Todo List</title>

      <link rel="icon" href="/favicon.ico" />
    </Head>

    <App />
  </>
);

export default Home;
