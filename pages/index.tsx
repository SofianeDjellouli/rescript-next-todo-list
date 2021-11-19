import type { NextPage } from "next";
import Head from "next/head";
import styles from "../styles/Home.module.css";
import { make as List } from "../src/components/list/List.bs";

const Home: NextPage = () => (
  <div className={styles.container}>
    <Head>
      <title>Rescript + NextJs Todo List</title>

      <link rel="icon" href="/favicon.ico" />
    </Head>

    <main className={styles.main}>
      <List />
    </main>
  </div>
);

export default Home;
