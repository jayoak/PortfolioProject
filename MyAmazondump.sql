--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.carts OWNER TO postgres;

--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_id_seq OWNER TO postgres;

--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    user_id integer NOT NULL,
    cardnumber text NOT NULL,
    cardaddress text NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text NOT NULL,
    price real NOT NULL,
    amountinstock integer NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_carts (
    product_id integer NOT NULL,
    cart_id integer NOT NULL,
    count integer NOT NULL
);


ALTER TABLE public.products_carts OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    address text,
    email text,
    phone text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts (id, user_id) FROM stdin;
1	1
2	2
3	3
4	4
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, user_id, cardnumber, cardaddress) FROM stdin;
1	1	2222-2222-2222	dd
2	2	2222-2222-2223	dd
3	3	2222-2222-2224	dd
4	4	2222-2222-2225	dd
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, price, amountinstock) FROM stdin;
1	eggplants	2	100
2	figs	2.5	100
3	guavas	3	100
4	hazelnuts	3.05	100
\.


--
-- Data for Name: products_carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_carts (product_id, cart_id, count) FROM stdin;
1	1	2
2	1	2
3	1	2
4	1	10
1	2	2
2	2	2
4	2	10
1	3	3
2	3	5
3	3	5
4	3	12
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, address, email, phone) FROM stdin;
1	apple	dd	apple@google.com	000-000-0000
2	bannana	dd	bannana@google.com	000-000-0001
3	cherry	dd	cherry@google.com	000-000-0002
4	durian	dd	durian@google.com	000-000-0003
\.


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_id_seq', 4, true);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 4, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: carts fk_carts_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fk_carts_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: payments fk_payments_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_payments_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: products_carts fk_products_carts_carts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_carts
    ADD CONSTRAINT fk_products_carts_carts FOREIGN KEY (cart_id) REFERENCES public.carts(id);


--
-- Name: products_carts fk_products_carts_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_carts
    ADD CONSTRAINT fk_products_carts_products FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

