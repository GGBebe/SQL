--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2022-12-01 16:01:42

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 17162)
-- Name: adresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adresses (
    id integer NOT NULL,
    title text NOT NULL,
    adress_line text,
    zipcode text,
    street_id integer NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.adresses OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 17716)
-- Name: adresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.adresses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.adresses_id_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 249 (class 1259 OID 17619)
-- Name: basket_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket_products (
    id integer NOT NULL,
    product_id integer NOT NULL,
    basket_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.basket_products OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 17618)
-- Name: basket_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.basket_products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.basket_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 247 (class 1259 OID 17613)
-- Name: baskets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.baskets (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    order_id integer,
    total_cost money NOT NULL
);


ALTER TABLE public.baskets OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 17612)
-- Name: baskets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.baskets ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.baskets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 17167)
-- Name: brand_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand_products (
    product_id integer NOT NULL,
    brand_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.brand_products OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17170)
-- Name: brand_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.brand_products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.brand_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 17171)
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17176)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying NOT NULL,
    type character varying NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 17718)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categories_id_seq
    START WITH 6
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 17181)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17186)
-- Name: color_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.color_products (
    color_id integer NOT NULL,
    product_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.color_products OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17189)
-- Name: color_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.color_products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.color_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 17190)
-- Name: colors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colors (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.colors OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17195)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17200)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    username character varying NOT NULL,
    first_name character varying NOT NULL,
    surname character varying NOT NULL,
    mail text,
    phone text
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 17711)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customers ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 17205)
-- Name: discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discounts (
    id integer NOT NULL,
    name character varying NOT NULL,
    percent real NOT NULL,
    "desc" text
);


ALTER TABLE public.discounts OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17210)
-- Name: discounts_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discounts_categories (
    category_id integer NOT NULL,
    discount_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.discounts_categories OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17213)
-- Name: discounts_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.discounts_categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.discounts_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 17222)
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    id integer NOT NULL,
    total_price real NOT NULL,
    customer_id integer NOT NULL,
    invoice_adress_id integer NOT NULL,
    payment_id integer NOT NULL,
    shipment_address_id integer NOT NULL,
    order_date date NOT NULL
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 17714)
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.order_details ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 245 (class 1259 OID 17607)
-- Name: order_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_products (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    total_price money NOT NULL
);


ALTER TABLE public.order_products OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 17606)
-- Name: order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.order_products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 251 (class 1259 OID 17631)
-- Name: order_shipments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_shipments (
    id integer NOT NULL,
    order_id integer NOT NULL,
    shipment_id integer NOT NULL
);


ALTER TABLE public.order_shipments OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 17630)
-- Name: order_shipments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.order_shipments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_shipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 17225)
-- Name: payment_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_details (
    id integer NOT NULL,
    status text,
    payment_type character varying NOT NULL,
    payment_date date
);


ALTER TABLE public.payment_details OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 17713)
-- Name: payment_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payment_details ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.payment_details_id_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 17243)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying NOT NULL,
    "desc" text,
    unit_price real NOT NULL,
    stock bigint NOT NULL,
    category_id integer NOT NULL,
    discount_id integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 17720)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_id_seq
    START WITH 500
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 17248)
-- Name: products_sellers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_sellers (
    product_id integer NOT NULL,
    seller_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.products_sellers OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17251)
-- Name: products_sellers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.products_sellers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_sellers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 233 (class 1259 OID 17264)
-- Name: return_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.return_products (
    order_product_id integer NOT NULL,
    return_id integer NOT NULL,
    id integer NOT NULL,
    quantity integer NOT NULL,
    return_reason character varying NOT NULL,
    total_price money NOT NULL
);


ALTER TABLE public.return_products OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17267)
-- Name: return_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.return_products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.return_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 235 (class 1259 OID 17268)
-- Name: returns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.returns (
    id integer NOT NULL,
    total_refund real NOT NULL,
    "desc" text,
    order_id integer NOT NULL,
    payment_detail_id integer NOT NULL,
    refund_date date NOT NULL
);


ALTER TABLE public.returns OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 17715)
-- Name: returns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.returns ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.returns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 17276)
-- Name: sellers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sellers (
    id integer NOT NULL,
    name character varying NOT NULL,
    rating double precision NOT NULL,
    follower_count bigint NOT NULL,
    registration_date date NOT NULL
);


ALTER TABLE public.sellers OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 17717)
-- Name: sellers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.sellers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sellers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 237 (class 1259 OID 17281)
-- Name: shipments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipments (
    id integer NOT NULL,
    name character varying NOT NULL,
    price money NOT NULL
);


ALTER TABLE public.shipments OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17286)
-- Name: size_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.size_products (
    product_id integer NOT NULL,
    size_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.size_products OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17289)
-- Name: size_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.size_products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.size_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 17290)
-- Name: sizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sizes (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.sizes OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 17298)
-- Name: streets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.streets (
    id integer NOT NULL,
    name character varying NOT NULL,
    town_id integer NOT NULL
);


ALTER TABLE public.streets OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17303)
-- Name: towns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.towns (
    id integer NOT NULL,
    name character varying NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.towns OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 17308)
-- Name: user_reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_reviews (
    id integer NOT NULL,
    description character varying,
    customer_id integer NOT NULL,
    order_product_id integer NOT NULL,
    score double precision NOT NULL
);


ALTER TABLE public.user_reviews OWNER TO postgres;

--
-- TOC entry 3531 (class 0 OID 17162)
-- Dependencies: 214
-- Data for Name: adresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.adresses (id, title, adress_line, zipcode, street_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (1, 'Ev', NULL, '01170', 4, 101);
INSERT INTO public.adresses (id, title, adress_line, zipcode, street_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (3, 'Yeni Ev', NULL, '06543', 4, 102);
INSERT INTO public.adresses (id, title, adress_line, zipcode, street_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (2, 'İş', NULL, '05666', 6, 3);


--
-- TOC entry 3566 (class 0 OID 17619)
-- Dependencies: 249
-- Data for Name: basket_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.basket_products (id, product_id, basket_id, quantity) OVERRIDING SYSTEM VALUE VALUES (1, 501, 2, 1);
INSERT INTO public.basket_products (id, product_id, basket_id, quantity) OVERRIDING SYSTEM VALUE VALUES (2, 11, 1, 1);
INSERT INTO public.basket_products (id, product_id, basket_id, quantity) OVERRIDING SYSTEM VALUE VALUES (3, 5, 1, 1);


--
-- TOC entry 3564 (class 0 OID 17613)
-- Dependencies: 247
-- Data for Name: baskets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.baskets (id, customer_id, order_id, total_cost) OVERRIDING SYSTEM VALUE VALUES (1, 100, NULL, '£275.00');
INSERT INTO public.baskets (id, customer_id, order_id, total_cost) OVERRIDING SYSTEM VALUE VALUES (2, 103, NULL, '£51.99');


--
-- TOC entry 3532 (class 0 OID 17167)
-- Dependencies: 215
-- Data for Name: brand_products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3534 (class 0 OID 17171)
-- Dependencies: 217
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.brands (id, name) VALUES (4, 'Nike');
INSERT INTO public.brands (id, name) VALUES (3, 'Puma');
INSERT INTO public.brands (id, name) VALUES (2, 'Adidas');
INSERT INTO public.brands (id, name) VALUES (1, 'Zara');
INSERT INTO public.brands (id, name) VALUES (5, 'Hummel');
INSERT INTO public.brands (id, name) VALUES (6, 'Altınyıldız');


--
-- TOC entry 3535 (class 0 OID 17176)
-- Dependencies: 218
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories (id, name, type) OVERRIDING SYSTEM VALUE VALUES (1, 'Spor Ayakkabı', 'Ayakkabı');
INSERT INTO public.categories (id, name, type) OVERRIDING SYSTEM VALUE VALUES (2, 'Günlük Ayakkabı', 'Ayakkabı');
INSERT INTO public.categories (id, name, type) OVERRIDING SYSTEM VALUE VALUES (3, 'Tişört', 'Giyim');
INSERT INTO public.categories (id, name, type) OVERRIDING SYSTEM VALUE VALUES (4, 'Gömlek', 'Giyim');
INSERT INTO public.categories (id, name, type) OVERRIDING SYSTEM VALUE VALUES (5, 'Ceket', 'Giyim');
INSERT INTO public.categories (id, name, type) OVERRIDING SYSTEM VALUE VALUES (6, 'Bilgisayar Bileşenleri', 'Teknoloji');


--
-- TOC entry 3536 (class 0 OID 17181)
-- Dependencies: 219
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cities (id, name, country_id) VALUES (1, 'Adana', 1);
INSERT INTO public.cities (id, name, country_id) VALUES (2, 'İstanbul', 1);
INSERT INTO public.cities (id, name, country_id) VALUES (3, 'Ankara', 1);
INSERT INTO public.cities (id, name, country_id) VALUES (4, 'İzmir', 1);
INSERT INTO public.cities (id, name, country_id) VALUES (5, 'Berlin', 2);


--
-- TOC entry 3537 (class 0 OID 17186)
-- Dependencies: 220
-- Data for Name: color_products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3539 (class 0 OID 17190)
-- Dependencies: 222
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3540 (class 0 OID 17195)
-- Dependencies: 223
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.countries (id, name) VALUES (1, 'Türkiye');
INSERT INTO public.countries (id, name) VALUES (2, 'Almanya');


--
-- TOC entry 3541 (class 0 OID 17200)
-- Dependencies: 224
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customers (id, username, first_name, surname, mail, phone) VALUES (1, 'salimcanincekas', 'Salimcan', 'İncekaş', 'salimcan.incekas@etiya.com', '05314297351');
INSERT INTO public.customers (id, username, first_name, surname, mail, phone) VALUES (2, 'gunercankacar', 'Güner Can', 'Kaçar', 'guner.can.kacar@etiya.com', '05314297352');
INSERT INTO public.customers (id, username, first_name, surname, mail, phone) VALUES (3, 'kaganerayacikgoz', 'Kağan Eray', 'Açıkgöz', 'kagan.eray.acikgoz@etiya.com', '05314297353');
INSERT INTO public.customers (id, username, first_name, surname, mail, phone) VALUES (4, 'mehmeteminarslan', 'Mehmet Emin', 'Arslan', 'mehmet.emin.arslan@etiya.com', '05314297354');
INSERT INTO public.customers (id, username, first_name, surname, mail, phone) VALUES (5, 'melihkaya', 'Melih', 'Kaya', 'melih.kaya@etiya.com', '05314297355');
INSERT INTO public.customers (id, username, first_name, surname, mail, phone) VALUES (100, 'bng', 'Bengisu', 'Şimşek', 'bgn@gg.com', '05567432312');
INSERT INTO public.customers (id, username, first_name, surname, mail, phone) VALUES (101, 'gulbi', 'Gülbahar', 'Ergelen', 'gg@gg.com', '8858483810');
INSERT INTO public.customers (id, username, first_name, surname, mail, phone) VALUES (102, 'bebe', 'Beycan', 'Gözenoğlu', 'bebe@gg.com', '55432123939');
INSERT INTO public.customers (id, username, first_name, surname, mail, phone) VALUES (103, 'mecitt', 'Mecit', 'Tilim', 'mt@gg.com', '242352');
INSERT INTO public.customers (id, username, first_name, surname, mail, phone) VALUES (104, 'yusufh', 'Yusuf Hazar', 'İpekçi', 'yh@gg.com', '111');


--
-- TOC entry 3542 (class 0 OID 17205)
-- Dependencies: 225
-- Data for Name: discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.discounts (id, name, percent, "desc") VALUES (1, 'Sepet İndirimi', 5, NULL);


--
-- TOC entry 3543 (class 0 OID 17210)
-- Dependencies: 226
-- Data for Name: discounts_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3545 (class 0 OID 17222)
-- Dependencies: 228
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_details (id, total_price, customer_id, invoice_adress_id, payment_id, shipment_address_id, order_date) OVERRIDING SYSTEM VALUE VALUES (1, 62, 101, 1, 1, 1, '2022-11-30');
INSERT INTO public.order_details (id, total_price, customer_id, invoice_adress_id, payment_id, shipment_address_id, order_date) OVERRIDING SYSTEM VALUE VALUES (2, 10, 102, 2, 1, 2, '2022-12-01');
INSERT INTO public.order_details (id, total_price, customer_id, invoice_adress_id, payment_id, shipment_address_id, order_date) OVERRIDING SYSTEM VALUE VALUES (3, 45, 101, 1, 1, 1, '2022-12-01');


--
-- TOC entry 3562 (class 0 OID 17607)
-- Dependencies: 245
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_products (id, order_id, product_id, quantity, total_price) OVERRIDING SYSTEM VALUE VALUES (1, 1, 7, 1, '£12.00');
INSERT INTO public.order_products (id, order_id, product_id, quantity, total_price) OVERRIDING SYSTEM VALUE VALUES (2, 1, 2, 2, '£50.00');
INSERT INTO public.order_products (id, order_id, product_id, quantity, total_price) OVERRIDING SYSTEM VALUE VALUES (3, 2, 6, 1, '£10.00');
INSERT INTO public.order_products (id, order_id, product_id, quantity, total_price) OVERRIDING SYSTEM VALUE VALUES (4, 3, 11, 1, '£25.00');
INSERT INTO public.order_products (id, order_id, product_id, quantity, total_price) OVERRIDING SYSTEM VALUE VALUES (5, 3, 3, 1, '£20.00');


--
-- TOC entry 3568 (class 0 OID 17631)
-- Dependencies: 251
-- Data for Name: order_shipments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3546 (class 0 OID 17225)
-- Dependencies: 229
-- Data for Name: payment_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payment_details (id, status, payment_type, payment_date) VALUES (1, NULL, 'Nakit', NULL);
INSERT INTO public.payment_details (id, status, payment_type, payment_date) VALUES (2, NULL, 'Kredi Kartı', NULL);
INSERT INTO public.payment_details (id, status, payment_type, payment_date) VALUES (3, NULL, 'Banka Kartı', NULL);


--
-- TOC entry 3547 (class 0 OID 17243)
-- Dependencies: 230
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products (id, name, "desc", unit_price, stock, category_id, discount_id) OVERRIDING SYSTEM VALUE VALUES (1, 'Unisex Beyaz Rebound Joy Jr Basket Ayakkabısı', NULL, 15, 1, 1, 1);
INSERT INTO public.products (id, name, "desc", unit_price, stock, category_id, discount_id) OVERRIDING SYSTEM VALUE VALUES (2, 'Runfalcon 2.0 K Spor Ayakkabı Cblack', NULL, 25, 1, 1, 1);
INSERT INTO public.products (id, name, "desc", unit_price, stock, category_id, discount_id) OVERRIDING SYSTEM VALUE VALUES (3, 'Nielsen Lifestyle Beyaz Unisex Ayakkabı', NULL, 20, 1, 1, 1);
INSERT INTO public.products (id, name, "desc", unit_price, stock, category_id, discount_id) OVERRIDING SYSTEM VALUE VALUES (4, 'Ismır SMU Siyah Unisex Ayakkabı', NULL, 17, 1, 1, 1);
INSERT INTO public.products (id, name, "desc", unit_price, stock, category_id, discount_id) OVERRIDING SYSTEM VALUE VALUES (6, 'Erkek Beyaz 2''li Bisiklet Yaka %100 Pamuk Basic T-Shirt', NULL, 10, 1, 3, 1);
INSERT INTO public.products (id, name, "desc", unit_price, stock, category_id, discount_id) OVERRIDING SYSTEM VALUE VALUES (7, 'Black İstanbul Erkek Siyah Bisiklet Yaka T-Shirt', NULL, 12, 1, 3, 1);
INSERT INTO public.products (id, name, "desc", unit_price, stock, category_id, discount_id) OVERRIDING SYSTEM VALUE VALUES (8, 'YXC Trend Maker Slim Fit Erkek Kot Gömlek', NULL, 16, 1, 4, 1);
INSERT INTO public.products (id, name, "desc", unit_price, stock, category_id, discount_id) OVERRIDING SYSTEM VALUE VALUES (9, 'NG Giyim Erkek Siyah Ekose Desenli Oduncu Gömlek', NULL, 20, 1, 4, 1);
INSERT INTO public.products (id, name, "desc", unit_price, stock, category_id, discount_id) OVERRIDING SYSTEM VALUE VALUES (10, 'Erkek Yeşil Oversize Basic Ceket', NULL, 25, 1, 5, 1);
INSERT INTO public.products (id, name, "desc", unit_price, stock, category_id, discount_id) OVERRIDING SYSTEM VALUE VALUES (11, 'Unisex Nakışlı Kolej Ceket', NULL, 25, 1, 5, 1);
INSERT INTO public.products (id, name, "desc", unit_price, stock, category_id, discount_id) OVERRIDING SYSTEM VALUE VALUES (5, 'Tommy Deri Sneaker Beyaz', NULL, 250, 1, 2, 1);
INSERT INTO public.products (id, name, "desc", unit_price, stock, category_id, discount_id) OVERRIDING SYSTEM VALUE VALUES (501, 'VGA to HDMI Converter', NULL, 51.99, 3, 6, NULL);


--
-- TOC entry 3548 (class 0 OID 17248)
-- Dependencies: 231
-- Data for Name: products_sellers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products_sellers (product_id, seller_id, id) OVERRIDING SYSTEM VALUE VALUES (5, 1, 1);


--
-- TOC entry 3550 (class 0 OID 17264)
-- Dependencies: 233
-- Data for Name: return_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.return_products (order_product_id, return_id, id, quantity, return_reason, total_price) OVERRIDING SYSTEM VALUE VALUES (2, 1, 1, 1, 'Beğenmedi', '£25.00');


--
-- TOC entry 3552 (class 0 OID 17268)
-- Dependencies: 235
-- Data for Name: returns; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.returns (id, total_refund, "desc", order_id, payment_detail_id, refund_date) OVERRIDING SYSTEM VALUE VALUES (1, 25, 'Beğenmedim', 1, 1, '2022-12-01');


--
-- TOC entry 3553 (class 0 OID 17276)
-- Dependencies: 236
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sellers (id, name, rating, follower_count, registration_date) OVERRIDING SYSTEM VALUE VALUES (1, 'Tommy Life', 9.7, 157000, '2021-12-01');


--
-- TOC entry 3554 (class 0 OID 17281)
-- Dependencies: 237
-- Data for Name: shipments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3555 (class 0 OID 17286)
-- Dependencies: 238
-- Data for Name: size_products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3557 (class 0 OID 17290)
-- Dependencies: 240
-- Data for Name: sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3558 (class 0 OID 17298)
-- Dependencies: 241
-- Data for Name: streets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.streets (id, name, town_id) VALUES (4, '45998', 3);
INSERT INTO public.streets (id, name, town_id) VALUES (3, '67895', 2);
INSERT INTO public.streets (id, name, town_id) VALUES (2, '80790', 1);
INSERT INTO public.streets (id, name, town_id) VALUES (1, '81180', 1);
INSERT INTO public.streets (id, name, town_id) VALUES (5, '56756', 4);
INSERT INTO public.streets (id, name, town_id) VALUES (6, '24776', 5);
INSERT INTO public.streets (id, name, town_id) VALUES (7, '45634', 6);


--
-- TOC entry 3559 (class 0 OID 17303)
-- Dependencies: 242
-- Data for Name: towns; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.towns (id, name, city_id) VALUES (4, 'Üsküdar', 2);
INSERT INTO public.towns (id, name, city_id) VALUES (3, 'Kadıköy', 2);
INSERT INTO public.towns (id, name, city_id) VALUES (2, 'Seyhan', 1);
INSERT INTO public.towns (id, name, city_id) VALUES (1, 'Çukurova', 1);
INSERT INTO public.towns (id, name, city_id) VALUES (5, 'Çankaya', 3);
INSERT INTO public.towns (id, name, city_id) VALUES (6, 'Karşıyaka', 4);


--
-- TOC entry 3560 (class 0 OID 17308)
-- Dependencies: 243
-- Data for Name: user_reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3582 (class 0 OID 0)
-- Dependencies: 256
-- Name: adresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.adresses_id_seq', 4, false);


--
-- TOC entry 3583 (class 0 OID 0)
-- Dependencies: 248
-- Name: basket_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basket_products_id_seq', 3, true);


--
-- TOC entry 3584 (class 0 OID 0)
-- Dependencies: 246
-- Name: baskets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.baskets_id_seq', 2, true);


--
-- TOC entry 3585 (class 0 OID 0)
-- Dependencies: 216
-- Name: brand_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_products_id_seq', 1, false);


--
-- TOC entry 3586 (class 0 OID 0)
-- Dependencies: 258
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 6, true);


--
-- TOC entry 3587 (class 0 OID 0)
-- Dependencies: 221
-- Name: color_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.color_products_id_seq', 1, false);


--
-- TOC entry 3588 (class 0 OID 0)
-- Dependencies: 252
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 104, true);


--
-- TOC entry 3589 (class 0 OID 0)
-- Dependencies: 227
-- Name: discounts_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discounts_categories_id_seq', 1, false);


--
-- TOC entry 3590 (class 0 OID 0)
-- Dependencies: 254
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_details_id_seq', 3, true);


--
-- TOC entry 3591 (class 0 OID 0)
-- Dependencies: 244
-- Name: order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_products_id_seq', 5, true);


--
-- TOC entry 3592 (class 0 OID 0)
-- Dependencies: 250
-- Name: order_shipments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_shipments_id_seq', 1, false);


--
-- TOC entry 3593 (class 0 OID 0)
-- Dependencies: 253
-- Name: payment_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_details_id_seq', 4, false);


--
-- TOC entry 3594 (class 0 OID 0)
-- Dependencies: 259
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 501, true);


--
-- TOC entry 3595 (class 0 OID 0)
-- Dependencies: 232
-- Name: products_sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_sellers_id_seq', 1, true);


--
-- TOC entry 3596 (class 0 OID 0)
-- Dependencies: 234
-- Name: return_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.return_products_id_seq', 1, true);


--
-- TOC entry 3597 (class 0 OID 0)
-- Dependencies: 255
-- Name: returns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.returns_id_seq', 1, true);


--
-- TOC entry 3598 (class 0 OID 0)
-- Dependencies: 257
-- Name: sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sellers_id_seq', 1, true);


--
-- TOC entry 3599 (class 0 OID 0)
-- Dependencies: 239
-- Name: size_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.size_products_id_seq', 1, false);


--
-- TOC entry 3299 (class 2606 OID 17314)
-- Name: adresses adresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresses
    ADD CONSTRAINT adresses_pkey PRIMARY KEY (id);


--
-- TOC entry 3351 (class 2606 OID 17623)
-- Name: basket_products basket_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3349 (class 2606 OID 17617)
-- Name: baskets baskets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT baskets_pkey PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 17316)
-- Name: brand_products brand_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand_products
    ADD CONSTRAINT brand_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 17318)
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 17320)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 17322)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 17324)
-- Name: color_products color_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color_products
    ADD CONSTRAINT color_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 17326)
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 17328)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 3315 (class 2606 OID 17330)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 3319 (class 2606 OID 17332)
-- Name: discounts_categories discounts_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts_categories
    ADD CONSTRAINT discounts_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3317 (class 2606 OID 17334)
-- Name: discounts discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (id);


--
-- TOC entry 3321 (class 2606 OID 17340)
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3347 (class 2606 OID 17611)
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3353 (class 2606 OID 17635)
-- Name: order_shipments order_shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_shipments
    ADD CONSTRAINT order_shipments_pkey PRIMARY KEY (id);


--
-- TOC entry 3323 (class 2606 OID 17342)
-- Name: payment_details payment_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_details
    ADD CONSTRAINT payment_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3325 (class 2606 OID 17350)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3327 (class 2606 OID 17352)
-- Name: products_sellers products_sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_sellers
    ADD CONSTRAINT products_sellers_pkey PRIMARY KEY (id);


--
-- TOC entry 3329 (class 2606 OID 17360)
-- Name: return_products return_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_products
    ADD CONSTRAINT return_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3331 (class 2606 OID 17362)
-- Name: returns returns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returns
    ADD CONSTRAINT returns_pkey PRIMARY KEY (id);


--
-- TOC entry 3333 (class 2606 OID 17366)
-- Name: sellers sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (id);


--
-- TOC entry 3335 (class 2606 OID 17368)
-- Name: shipments shipment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT shipment_methods_pkey PRIMARY KEY (id);


--
-- TOC entry 3337 (class 2606 OID 17370)
-- Name: size_products size_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.size_products
    ADD CONSTRAINT size_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3339 (class 2606 OID 17372)
-- Name: sizes sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_pkey PRIMARY KEY (id);


--
-- TOC entry 3341 (class 2606 OID 17376)
-- Name: streets streets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.streets
    ADD CONSTRAINT streets_pkey PRIMARY KEY (id);


--
-- TOC entry 3343 (class 2606 OID 17378)
-- Name: towns towns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.towns
    ADD CONSTRAINT towns_pkey PRIMARY KEY (id);


--
-- TOC entry 3345 (class 2606 OID 17380)
-- Name: user_reviews user_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_reviews
    ADD CONSTRAINT user_reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 3383 (class 2606 OID 17646)
-- Name: baskets basket_customer_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT basket_customer_fk FOREIGN KEY (customer_id) REFERENCES public.customers(id) NOT VALID;


--
-- TOC entry 3384 (class 2606 OID 17651)
-- Name: baskets basket_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT basket_order_fk FOREIGN KEY (order_id) REFERENCES public.order_details(id) NOT VALID;


--
-- TOC entry 3385 (class 2606 OID 17636)
-- Name: basket_products basketproducts_basket_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basketproducts_basket_fk FOREIGN KEY (basket_id) REFERENCES public.baskets(id) NOT VALID;


--
-- TOC entry 3386 (class 2606 OID 17641)
-- Name: basket_products basketproducts_product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basketproducts_product_fk FOREIGN KEY (product_id) REFERENCES public.products(id) NOT VALID;


--
-- TOC entry 3356 (class 2606 OID 17381)
-- Name: brand_products brands_brand; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand_products
    ADD CONSTRAINT brands_brand FOREIGN KEY (brand_id) REFERENCES public.brands(id);


--
-- TOC entry 3375 (class 2606 OID 17386)
-- Name: size_products brands_brand; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.size_products
    ADD CONSTRAINT brands_brand FOREIGN KEY (size_id) REFERENCES public.sizes(id);


--
-- TOC entry 3361 (class 2606 OID 17391)
-- Name: discounts_categories categories_discount; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts_categories
    ADD CONSTRAINT categories_discount FOREIGN KEY (category_id) REFERENCES public.categories(id) NOT VALID;


--
-- TOC entry 3367 (class 2606 OID 17396)
-- Name: products category_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT category_product FOREIGN KEY (category_id) REFERENCES public.categories(id) NOT VALID;


--
-- TOC entry 3378 (class 2606 OID 17401)
-- Name: towns city_towns; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.towns
    ADD CONSTRAINT city_towns FOREIGN KEY (city_id) REFERENCES public.cities(id) NOT VALID;


--
-- TOC entry 3359 (class 2606 OID 17406)
-- Name: color_products colors_color; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color_products
    ADD CONSTRAINT colors_color FOREIGN KEY (color_id) REFERENCES public.colors(id);


--
-- TOC entry 3358 (class 2606 OID 17411)
-- Name: cities country_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT country_city FOREIGN KEY (country_id) REFERENCES public.countries(id) NOT VALID;


--
-- TOC entry 3354 (class 2606 OID 17416)
-- Name: adresses customer_adress; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresses
    ADD CONSTRAINT customer_adress FOREIGN KEY (customer_id) REFERENCES public.customers(id) NOT VALID;


--
-- TOC entry 3363 (class 2606 OID 17421)
-- Name: order_details customer_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT customer_order FOREIGN KEY (customer_id) REFERENCES public.customers(id) NOT VALID;


--
-- TOC entry 3379 (class 2606 OID 17426)
-- Name: user_reviews customer_reviews; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_reviews
    ADD CONSTRAINT customer_reviews FOREIGN KEY (customer_id) REFERENCES public.customers(id) NOT VALID;


--
-- TOC entry 3368 (class 2606 OID 17431)
-- Name: products discount_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT discount_product FOREIGN KEY (discount_id) REFERENCES public.discounts(id) NOT VALID;


--
-- TOC entry 3362 (class 2606 OID 17436)
-- Name: discounts_categories discounts_discount; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts_categories
    ADD CONSTRAINT discounts_discount FOREIGN KEY (discount_id) REFERENCES public.discounts(id) NOT VALID;


--
-- TOC entry 3364 (class 2606 OID 17451)
-- Name: order_details invoice_adress_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT invoice_adress_order FOREIGN KEY (invoice_adress_id) REFERENCES public.adresses(id) NOT VALID;


--
-- TOC entry 3387 (class 2606 OID 17681)
-- Name: order_shipments order_ordershipments_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_shipments
    ADD CONSTRAINT order_ordershipments_fk FOREIGN KEY (order_id) REFERENCES public.order_details(id) NOT VALID;


--
-- TOC entry 3365 (class 2606 OID 17671)
-- Name: order_details order_payment_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_payment_fk FOREIGN KEY (payment_id) REFERENCES public.payment_details(id) NOT VALID;


--
-- TOC entry 3373 (class 2606 OID 17461)
-- Name: returns order_return; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returns
    ADD CONSTRAINT order_return FOREIGN KEY (order_id) REFERENCES public.order_details(id) NOT VALID;


--
-- TOC entry 3366 (class 2606 OID 17676)
-- Name: order_details order_shipmentaddress_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_shipmentaddress_fk FOREIGN KEY (shipment_address_id) REFERENCES public.adresses(id) NOT VALID;


--
-- TOC entry 3381 (class 2606 OID 17691)
-- Name: order_products orderproducts_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT orderproducts_order_fk FOREIGN KEY (order_id) REFERENCES public.order_details(id) NOT VALID;


--
-- TOC entry 3382 (class 2606 OID 17696)
-- Name: order_products orderproducts_product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT orderproducts_product_fk FOREIGN KEY (product_id) REFERENCES public.products(id) NOT VALID;


--
-- TOC entry 3388 (class 2606 OID 17686)
-- Name: order_shipments ordershipments_shipment_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_shipments
    ADD CONSTRAINT ordershipments_shipment_fk FOREIGN KEY (shipment_id) REFERENCES public.shipments(id) NOT VALID;


--
-- TOC entry 3374 (class 2606 OID 17471)
-- Name: returns payment_return; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returns
    ADD CONSTRAINT payment_return FOREIGN KEY (payment_detail_id) REFERENCES public.payment_details(id) NOT VALID;


--
-- TOC entry 3357 (class 2606 OID 17481)
-- Name: brand_products product_brand; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand_products
    ADD CONSTRAINT product_brand FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3360 (class 2606 OID 17486)
-- Name: color_products product_color; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color_products
    ADD CONSTRAINT product_color FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3369 (class 2606 OID 17491)
-- Name: products_sellers product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_sellers
    ADD CONSTRAINT product_fk FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3376 (class 2606 OID 17521)
-- Name: size_products products_size; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.size_products
    ADD CONSTRAINT products_size FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3371 (class 2606 OID 17551)
-- Name: return_products return_returns; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_products
    ADD CONSTRAINT return_returns FOREIGN KEY (return_id) REFERENCES public.returns(id);


--
-- TOC entry 3372 (class 2606 OID 17701)
-- Name: return_products returnproducts_orderproducts_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_products
    ADD CONSTRAINT returnproducts_orderproducts_fk FOREIGN KEY (order_product_id) REFERENCES public.order_products(id) NOT VALID;


--
-- TOC entry 3370 (class 2606 OID 17561)
-- Name: products_sellers seller_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_sellers
    ADD CONSTRAINT seller_fk FOREIGN KEY (seller_id) REFERENCES public.sellers(id);


--
-- TOC entry 3355 (class 2606 OID 17581)
-- Name: adresses street_adress; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresses
    ADD CONSTRAINT street_adress FOREIGN KEY (street_id) REFERENCES public.streets(id) NOT VALID;


--
-- TOC entry 3377 (class 2606 OID 17586)
-- Name: streets town_streets; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.streets
    ADD CONSTRAINT town_streets FOREIGN KEY (town_id) REFERENCES public.towns(id) NOT VALID;


--
-- TOC entry 3380 (class 2606 OID 17706)
-- Name: user_reviews userreview_orderproducts_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_reviews
    ADD CONSTRAINT userreview_orderproducts_fk FOREIGN KEY (order_product_id) REFERENCES public.order_products(id) NOT VALID;


-- Completed on 2022-12-01 16:01:42

--
-- PostgreSQL database dump complete
--

