import Head from "next/head";
import Image from "next/image";
import styles from "../../styles/Home.module.css";
import { useRouter } from "next/router";
import axios from "axios";
import stylesT from "../../styles/CategoryID.module.css";
import ProductsGrid from "../../components/ProductsGrid";
import SecondaryNavbar from "../../components/SecondaryNavbar";

const domain = process.env.NEXT_PUBLIC_API_DOMAIN_NAME;

const config = {
  headers: {
    "Content-Type": "application/json",
  },
};

export const getStaticPaths = async () => {
  const res = await axios.get(domain + "store/collections/", config);
  const paths = await res.data.map((collection) => ({
    params: { title: collection.title.toString() },
  }));

  return {
    paths,
    fallback: false,
  };
};

export const getStaticProps = async (ctx) => {
  const collection_title = ctx.params?.title;

  const response = await axios.get(
    domain + `store/collection/title/${collection_title}/`,
    config
  );

  return {
    props: {
      collection: response.data["Collection"],
    },
  };
};

export default function CollectionTitleDetailFunction({ collection }) {
  const router = useRouter();

  return collection == undefined ? (
    <div>Error Loading Info</div>
  ) : (
    <div className={styles.container}>
      <Head>
        <title>Collection {collection.title} - Habaneras de Lino</title>
        <meta
          name="description"
          content={`Collection ${
            collection.title
          } of linen and cotton clothes at Habaneras de Lino which is an online store specializes in linen and cotton clothes such as guayaberas and guayamisas`}
        />
        <link rel="icon" href="/favicon.ico" />
        <meta
          property="og:title"
          content={`Collection ${collection.title} - Habaneras de Lino`}
        />
        <meta
          property="og:description"
          content={`Collection ${
            collection.title
          } of linen and cotton clothes at Habaneras de Lino which is an online store specializes in linen and cotton clothes such as guayaberas and guayamisas`}
        />
        <meta
          property="og:url"
          content={`https://habanerasdelino.com/collection-title/${
            collection.title
          }`}
        />
        <meta property="og:type" content="website" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta charSet="utf-8" />
      </Head>

      <SecondaryNavbar navbarShow={false} />

      <main className={styles.main}>
        <h2 className={stylesT.about_title}>
          <span className={stylesT.about_title_span}>{collection.title}</span>
        </h2>
        <ProductsGrid products={collection.all_products_per_collection} />
      </main>
    </div>
  );
}

