import type { NextPage } from "next";
import Head from "next/head";
import { useState, useEffect } from "react";
import { App } from "../src/components/app/App.gen";

const Home: NextPage = () => {
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
  }, []);

  return (
    <>
      <Head>
        <title>Rescript + NextJs Todo List</title>

        <link rel="icon" href="/favicon.ico" />
      </Head>

      {mounted && <App />}
    </>
  );
};

export default Home;
