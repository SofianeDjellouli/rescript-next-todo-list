import type { NextPage } from "next";
import Head from "next/head";
import dynamic from "next/dynamic";

const App = dynamic<object>(
  () => import("../src/components/app/App.bs").then((mod) => mod.make),
  { ssr: false },
);

const Home: NextPage = () => {
  return (
    <>
      <Head>
        <title>Rescript + NextJs Todo List</title>

        <link rel="icon" href="/favicon.ico" />
      </Head>

      <App />
    </>
  );
};

export default Home;
