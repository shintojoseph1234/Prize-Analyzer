--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Debian 12.5-1.pgdg100+1)
-- Dumped by pg_dump version 12.5 (Ubuntu 12.5-1.pgdg16.04+1)

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
-- Name: api_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_customers (
    customer text,
    id integer NOT NULL
);


ALTER TABLE public.api_customers OWNER TO postgres;

--
-- Name: api_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_customers_id_seq OWNER TO postgres;

--
-- Name: api_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_customers_id_seq OWNED BY public.api_customers.id;


--
-- Name: api_ports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_ports (
    code text,
    name text,
    id integer NOT NULL
);


ALTER TABLE public.api_ports OWNER TO postgres;

--
-- Name: api_ports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_ports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_ports_id_seq OWNER TO postgres;

--
-- Name: api_ports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_ports_id_seq OWNED BY public.api_ports.id;


--
-- Name: api_prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_prices (
    orig_code text,
    dest_code text,
    day date,
    price integer,
    id integer NOT NULL,
    customer_id integer
);


ALTER TABLE public.api_prices OWNER TO postgres;

--
-- Name: api_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_prices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_prices_id_seq OWNER TO postgres;

--
-- Name: api_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_prices_id_seq OWNED BY public.api_prices.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer text,
    id integer NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: ports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ports (
    code text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.ports OWNER TO postgres;

--
-- Name: prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prices (
    orig_code text NOT NULL,
    dest_code text NOT NULL,
    day date NOT NULL,
    price integer NOT NULL,
    customer text
);


ALTER TABLE public.prices OWNER TO postgres;

--
-- Name: api_customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_customers ALTER COLUMN id SET DEFAULT nextval('public.api_customers_id_seq'::regclass);


--
-- Name: api_ports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ports ALTER COLUMN id SET DEFAULT nextval('public.api_ports_id_seq'::regclass);


--
-- Name: api_prices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_prices ALTER COLUMN id SET DEFAULT nextval('public.api_prices_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: api_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_customers (customer, id) FROM stdin;
Acme Inc.	1
ООО Вектор	2
Næstad AS	3
\.


--
-- Data for Name: api_ports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_ports (code, name, id) FROM stdin;
CNCWN	Chiwan	1
IESNN	Shannon	2
FRLVE	Le Verdon-sur-Mer	3
NOOSL	Oslo	4
GBPME	Portsmouth	5
NOSVG	Stavanger	6
FIHEL	Helsingfors (Helsinki)	7
NOMAY	Måløy	8
FRLIO	Lyon	9
SEHAD	Halmstad	10
GBTIL	Tilbury	11
DKCPH	Copenhagen (København)	12
NOFRK	Fredrikstad	13
CNYAT	Yantai	14
CNSNZ	Shenzhen	15
NOSKE	Skien	16
DEWVN	Wilhelmshaven	17
NOKSU	Kristiansund	18
SEMMA	Malmö	19
FIRAA	Brahestad (Raahe)	20
FRDKK	Dunkerque	21
GBLON	London	22
NOSVE	Svelgen	23
FRBAS	Bassens	24
NLMOE	Moerdijk	25
IEDUB	Dublin	26
FRDPE	Dieppe	27
FIKOK	Karleby (Kokkola)	28
NLRTM	Rotterdam	29
GBLTP	London Thamesport	30
BEZEE	Zeebrugge	31
FIOUL	Uleåborg (Oulu)	32
NOFUS	Fusa	33
FRNEG	Bougenais	34
DEBRE	Bremen	35
SENRK	Norrköping	36
RUKDT	Kronshtadt	37
FRLRH	La Rochelle	38
FIMTY	Mantyluoto	39
NOIKR	Ikornnes	40
DKFRC	Fredericia	41
NOHVI	Håvik	42
FRMTX	Montoir-de-Bretagne	43
FIKTK	Kotka	44
EEMUG	Muuga	45
PLSZZ	Szczecin	46
NOUME	Straume Industriområde	47
CNSHK	Shekou	48
GBTEE	Teesport	49
FRBOD	Bordeaux	50
FRLEH	Le Havre	51
HKHKG	Hong Kong	52
SESOE	Södertälje	53
NOHAL	Halden	54
ESGIJ	Gijón	55
NOBVG	Berlevåg	56
IEORK	Cork	57
DEBRV	Bremerhaven	58
ESZAZ	Zaragoza	59
SEWAL	Wallhamn	60
CNNBO	Ningbo	61
NOFRO	Florø	62
CNDAL	Dalian	63
GBMNC	Manchester	64
PLGDY	Gdynia	65
CNSGH	Shanghai	66
FITKU	Åbo (Turku)	67
GBHUL	Hull	68
ESVGO	Vigo	69
SEHEL	Helsingborg	70
NOMOL	Molde	71
NOTON	Tønsberg	72
CNHDG	Huadu Pt	73
BEANR	Antwerpen	74
FIRAU	Rauma (Raumo)	75
PLGDN	Gdansk	76
NODRM	Drammen	77
NOSAS	Sandnes	78
NOKRS	Kristiansand	79
NOSUN	Sunndalsøra	80
GBBEL	Belfast	81
DKAAR	Århus	82
FRURO	Rouen	83
GBLGP	London Gateway Port	84
SEAHU	Åhus	85
NOBVK	Brevik	86
FRANT	Antibes	87
RUARH	Arkhangelsk	88
NOTOS	Tromsø	89
SEGOT	Gothenburg (Göteborg)	90
FIIMA	Imatra	91
FIKEM	Kemi/Torneå (Kemi/Tornio)	92
GBGRG	Grangemouth	93
EETLL	Tallinn	94
FIHMN	Fredrikshamn (Hamina)	95
RULED	Saint Petersburg (ex Leningrad)	96
GBLIV	Liverpool	97
CNGGZ	Guangzhou	98
NOTRD	Trondheim	99
FRIRK	Dunkirk	100
FRNTE	Nantes	101
CNQIN	Qingdao	102
RULUG	Lugovoye	103
GBBRS	Bristol	104
GBGOO	Goole	105
CNLYG	Lianyungang	106
GBTHP	Thamesport	107
NOHAU	Haugesund	108
LVRIX	Riga	109
DKAAL	Aalborg	110
GBFXT	Felixstowe	111
NOMSS	Moss	112
NLAMS	Amsterdam	113
FOTHO	Thorshavn	114
NOHYR	Høyanger	115
NOTAE	Tananger	116
CNTXG	Xingang (Tianjin New Pt)	117
SEGVX	Gävle	118
GBSOU	Southampton	119
CNXAM	Xiamen	120
RUULU	Ust'-Luga	121
NOBGO	Bergen	122
ESMPG	Marin, Pontevedra	123
DEHAM	Hamburg	124
SEOXE	Oxelösund	125
NOLAR	Larvik	126
CNYTN	Yantian	127
ISREY	Reykjavík	128
ESBIO	Bilbao	129
ISGRT	Grundartangi	130
NOGJM	Gjemnes	131
FRBES	Brest	132
NOORK	Orkanger	133
NOAES	Ålesund	134
SESTO	Stockholm	135
GBIMM	Immingham	136
LTKLJ	Klaipeda	137
RUKGD	Kaliningrad	138
GBGRK	Greenock	139
SEPIT	Piteå	140
ESVIT	Vitoria-Gasteiz	141
DKEBJ	Esbjerg	142
GBSSH	South Shields	143
\.


--
-- Data for Name: api_prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_prices (orig_code, dest_code, day, price, id, customer_id) FROM stdin;
CNSGH	BEANR	2016-01-01	300	1	1
CNSGH	BEANR	2016-01-01	400	2	2
CNSGH	BEANR	2016-01-01	500	3	3
CNSGH	BEZEE	2016-01-01	300	4	1
CNSGH	BEZEE	2016-01-01	400	5	2
CNSGH	BEZEE	2016-01-01	500	6	3
CNSGH	DEBRV	2016-01-01	500	7	1
CNSGH	DEBRV	2016-01-01	600	8	2
CNSGH	DEBRV	2016-01-01	700	9	3
CNSGH	DEHAM	2016-01-01	500	10	1
CNSGH	DEHAM	2016-01-01	600	11	2
CNSGH	DEHAM	2016-01-01	700	12	3
CNSGH	FRLEH	2016-01-01	600	13	1
CNSGH	FRLEH	2016-01-01	700	14	2
CNSGH	FRLEH	2016-01-01	800	15	3
CNSGH	NLRTM	2016-01-01	700	16	1
CNSGH	NLRTM	2016-01-01	800	17	2
CNSGH	NLRTM	2016-01-01	900	18	3
CNSGH	BEANR	2016-01-02	300	19	1
CNSGH	BEANR	2016-01-02	400	20	2
CNSGH	BEANR	2016-01-02	500	21	3
CNSGH	BEZEE	2016-01-02	300	22	1
CNSGH	BEZEE	2016-01-02	400	23	2
CNSGH	BEZEE	2016-01-02	500	24	3
CNSGH	DEBRV	2016-01-02	500	25	1
CNSGH	DEBRV	2016-01-02	600	26	2
CNSGH	DEBRV	2016-01-02	700	27	3
CNSGH	DEHAM	2016-01-02	500	28	1
CNSGH	DEHAM	2016-01-02	600	29	2
CNSGH	DEHAM	2016-01-02	700	30	3
CNSGH	FRLEH	2016-01-02	600	31	1
CNSGH	FRLEH	2016-01-02	700	32	2
CNSGH	FRLEH	2016-01-02	800	33	3
CNSGH	NLRTM	2016-01-02	700	34	1
CNSGH	NLRTM	2016-01-02	800	35	2
CNSGH	NLRTM	2016-01-02	900	36	3
CNSGH	BEANR	2016-01-04	300	37	1
CNSGH	BEZEE	2016-01-04	300	38	1
CNSGH	DEBRV	2016-01-04	500	39	1
CNSGH	DEHAM	2016-01-04	500	40	1
CNSGH	FRLEH	2016-01-04	600	41	1
CNSGH	NLRTM	2016-01-04	700	42	1
CNSGH	BEANR	2016-01-05	300	43	1
CNSGH	BEANR	2016-01-05	400	44	2
CNSGH	BEANR	2016-01-05	500	45	3
CNSGH	BEZEE	2016-01-05	300	46	1
CNSGH	BEZEE	2016-01-05	400	47	2
CNSGH	BEZEE	2016-01-05	500	48	3
CNSGH	DEBRV	2016-01-05	500	49	1
CNSGH	DEBRV	2016-01-05	600	50	2
CNSGH	DEBRV	2016-01-05	700	51	3
CNSGH	DEHAM	2016-01-05	500	52	1
CNSGH	DEHAM	2016-01-05	600	53	2
CNSGH	DEHAM	2016-01-05	700	54	3
CNSGH	FRLEH	2016-01-05	600	55	1
CNSGH	FRLEH	2016-01-05	700	56	2
CNSGH	FRLEH	2016-01-05	800	57	3
CNSGH	NLRTM	2016-01-05	700	58	1
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add user	3	add_user
6	Can change user	3	change_user
7	Can delete user	3	delete_user
8	Can view user	3	view_user
9	Can add group	2	add_group
10	Can change group	2	change_group
11	Can delete group	2	delete_group
12	Can view group	2	view_group
13	Can add permission	4	add_permission
14	Can change permission	4	change_permission
15	Can delete permission	4	delete_permission
16	Can view permission	4	view_permission
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add customers	8	add_customers
26	Can change customers	8	change_customers
27	Can delete customers	8	delete_customers
28	Can view customers	8	view_customers
29	Can add prices	7	add_prices
30	Can change prices	7	change_prices
31	Can delete prices	7	delete_prices
32	Can view prices	7	view_prices
33	Can add ports	9	add_ports
34	Can change ports	9	change_ports
35	Can delete ports	9	delete_ports
36	Can view ports	9	view_ports
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer, id) FROM stdin;
Acme Inc.	1
ООО Вектор	2
Næstad AS	3
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	user
4	auth	permission
5	contenttypes	contenttype
6	sessions	session
7	api	prices
8	api	customers
9	api	ports
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-12-05 13:36:35.53867+00
2	auth	0001_initial	2020-12-05 13:36:36.362957+00
3	admin	0001_initial	2020-12-05 13:36:37.439319+00
4	admin	0002_logentry_remove_auto_add	2020-12-05 13:36:37.659377+00
5	admin	0003_logentry_add_action_flag_choices	2020-12-05 13:36:37.713092+00
6	api	0001_initial	2020-12-05 13:36:37.766385+00
7	contenttypes	0002_remove_content_type_name	2020-12-05 13:36:37.804073+00
8	auth	0002_alter_permission_name_max_length	2020-12-05 13:36:37.815042+00
9	auth	0003_alter_user_email_max_length	2020-12-05 13:36:37.841106+00
10	auth	0004_alter_user_username_opts	2020-12-05 13:36:37.868265+00
11	auth	0005_alter_user_last_login_null	2020-12-05 13:36:37.888923+00
12	auth	0006_require_contenttypes_0002	2020-12-05 13:36:37.894233+00
13	auth	0007_alter_validators_add_error_messages	2020-12-05 13:36:37.911986+00
14	auth	0008_alter_user_username_max_length	2020-12-05 13:36:38.001015+00
15	auth	0009_alter_user_last_name_max_length	2020-12-05 13:36:38.047176+00
16	auth	0010_alter_group_name_max_length	2020-12-05 13:36:38.066025+00
17	auth	0011_update_proxy_permissions	2020-12-05 13:36:38.098209+00
18	sessions	0001_initial	2020-12-05 13:36:38.234812+00
19	api	0002_prices_customer_link	2020-12-06 07:30:16.132048+00
20	api	0003_remove_prices_customer	2020-12-06 07:31:43.225798+00
21	api	0004_auto_20201206_0732	2020-12-06 07:32:05.640368+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: ports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ports (code, name) FROM stdin;
CNCWN	Chiwan
IESNN	Shannon
FRLVE	Le Verdon-sur-Mer
NOOSL	Oslo
GBPME	Portsmouth
NOSVG	Stavanger
FIHEL	Helsingfors (Helsinki)
NOMAY	Måløy
FRLIO	Lyon
SEHAD	Halmstad
GBTIL	Tilbury
DKCPH	Copenhagen (København)
NOFRK	Fredrikstad
CNYAT	Yantai
CNSNZ	Shenzhen
NOSKE	Skien
DEWVN	Wilhelmshaven
NOKSU	Kristiansund
SEMMA	Malmö
FIRAA	Brahestad (Raahe)
FRDKK	Dunkerque
GBLON	London
NOSVE	Svelgen
FRBAS	Bassens
NLMOE	Moerdijk
IEDUB	Dublin
FRDPE	Dieppe
FIKOK	Karleby (Kokkola)
NLRTM	Rotterdam
GBLTP	London Thamesport
BEZEE	Zeebrugge
FIOUL	Uleåborg (Oulu)
NOFUS	Fusa
FRNEG	Bougenais
DEBRE	Bremen
SENRK	Norrköping
RUKDT	Kronshtadt
FRLRH	La Rochelle
FIMTY	Mantyluoto
NOIKR	Ikornnes
DKFRC	Fredericia
NOHVI	Håvik
FRMTX	Montoir-de-Bretagne
FIKTK	Kotka
EEMUG	Muuga
PLSZZ	Szczecin
NOUME	Straume Industriområde
CNSHK	Shekou
GBTEE	Teesport
FRBOD	Bordeaux
FRLEH	Le Havre
HKHKG	Hong Kong
SESOE	Södertälje
NOHAL	Halden
ESGIJ	Gijón
NOBVG	Berlevåg
IEORK	Cork
DEBRV	Bremerhaven
ESZAZ	Zaragoza
SEWAL	Wallhamn
CNNBO	Ningbo
NOFRO	Florø
CNDAL	Dalian
GBMNC	Manchester
PLGDY	Gdynia
CNSGH	Shanghai
FITKU	Åbo (Turku)
GBHUL	Hull
ESVGO	Vigo
SEHEL	Helsingborg
NOMOL	Molde
NOTON	Tønsberg
CNHDG	Huadu Pt
BEANR	Antwerpen
FIRAU	Rauma (Raumo)
PLGDN	Gdansk
NODRM	Drammen
NOSAS	Sandnes
NOKRS	Kristiansand
NOSUN	Sunndalsøra
GBBEL	Belfast
DKAAR	Århus
FRURO	Rouen
GBLGP	London Gateway Port
SEAHU	Åhus
NOBVK	Brevik
FRANT	Antibes
RUARH	Arkhangelsk
NOTOS	Tromsø
SEGOT	Gothenburg (Göteborg)
FIIMA	Imatra
FIKEM	Kemi/Torneå (Kemi/Tornio)
GBGRG	Grangemouth
EETLL	Tallinn
FIHMN	Fredrikshamn (Hamina)
RULED	Saint Petersburg (ex Leningrad)
GBLIV	Liverpool
CNGGZ	Guangzhou
NOTRD	Trondheim
FRIRK	Dunkirk
FRNTE	Nantes
CNQIN	Qingdao
RULUG	Lugovoye
GBBRS	Bristol
GBGOO	Goole
CNLYG	Lianyungang
GBTHP	Thamesport
NOHAU	Haugesund
LVRIX	Riga
DKAAL	Aalborg
GBFXT	Felixstowe
NOMSS	Moss
NLAMS	Amsterdam
FOTHO	Thorshavn
NOHYR	Høyanger
NOTAE	Tananger
CNTXG	Xingang (Tianjin New Pt)
SEGVX	Gävle
GBSOU	Southampton
CNXAM	Xiamen
RUULU	Ust'-Luga
NOBGO	Bergen
ESMPG	Marin, Pontevedra
DEHAM	Hamburg
SEOXE	Oxelösund
NOLAR	Larvik
CNYTN	Yantian
ISREY	Reykjavík
ESBIO	Bilbao
ISGRT	Grundartangi
NOGJM	Gjemnes
FRBES	Brest
NOORK	Orkanger
NOAES	Ålesund
SESTO	Stockholm
GBIMM	Immingham
LTKLJ	Klaipeda
RUKGD	Kaliningrad
GBGRK	Greenock
SEPIT	Piteå
ESVIT	Vitoria-Gasteiz
DKEBJ	Esbjerg
GBSSH	South Shields
\.


--
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prices (orig_code, dest_code, day, price, customer) FROM stdin;
CNSGH	BEANR	2016-01-01	300	Acme Inc.
CNSGH	BEANR	2016-01-01	400	ООО Вектор
CNSGH	BEANR	2016-01-01	500	Næstad AS
CNSGH	BEZEE	2016-01-01	300	Acme Inc.
CNSGH	BEZEE	2016-01-01	400	ООО Вектор
CNSGH	BEZEE	2016-01-01	500	Næstad AS
CNSGH	DEBRV	2016-01-01	500	Acme Inc.
CNSGH	DEBRV	2016-01-01	600	ООО Вектор
CNSGH	DEBRV	2016-01-01	700	Næstad AS
CNSGH	DEHAM	2016-01-01	500	Acme Inc.
CNSGH	DEHAM	2016-01-01	600	ООО Вектор
CNSGH	DEHAM	2016-01-01	700	Næstad AS
CNSGH	FRLEH	2016-01-01	600	Acme Inc.
CNSGH	FRLEH	2016-01-01	700	ООО Вектор
CNSGH	FRLEH	2016-01-01	800	Næstad AS
CNSGH	NLRTM	2016-01-01	700	Acme Inc.
CNSGH	NLRTM	2016-01-01	800	ООО Вектор
CNSGH	NLRTM	2016-01-01	900	Næstad AS
CNSGH	BEANR	2016-01-02	300	Acme Inc.
CNSGH	BEANR	2016-01-02	400	ООО Вектор
CNSGH	BEANR	2016-01-02	500	Næstad AS
CNSGH	BEZEE	2016-01-02	300	Acme Inc.
CNSGH	BEZEE	2016-01-02	400	ООО Вектор
CNSGH	BEZEE	2016-01-02	500	Næstad AS
CNSGH	DEBRV	2016-01-02	500	Acme Inc.
CNSGH	DEBRV	2016-01-02	600	ООО Вектор
CNSGH	DEBRV	2016-01-02	700	Næstad AS
CNSGH	DEHAM	2016-01-02	500	Acme Inc.
CNSGH	DEHAM	2016-01-02	600	ООО Вектор
CNSGH	DEHAM	2016-01-02	700	Næstad AS
CNSGH	FRLEH	2016-01-02	600	Acme Inc.
CNSGH	FRLEH	2016-01-02	700	ООО Вектор
CNSGH	FRLEH	2016-01-02	800	Næstad AS
CNSGH	NLRTM	2016-01-02	700	Acme Inc.
CNSGH	NLRTM	2016-01-02	800	ООО Вектор
CNSGH	NLRTM	2016-01-02	900	Næstad AS
CNSGH	BEANR	2016-01-04	300	Acme Inc.
CNSGH	BEZEE	2016-01-04	300	Acme Inc.
CNSGH	DEBRV	2016-01-04	500	Acme Inc.
CNSGH	DEHAM	2016-01-04	500	Acme Inc.
CNSGH	FRLEH	2016-01-04	600	Acme Inc.
CNSGH	NLRTM	2016-01-04	700	Acme Inc.
CNSGH	BEANR	2016-01-05	300	Acme Inc.
CNSGH	BEANR	2016-01-05	400	ООО Вектор
CNSGH	BEANR	2016-01-05	500	Næstad AS
CNSGH	BEZEE	2016-01-05	300	Acme Inc.
CNSGH	BEZEE	2016-01-05	400	ООО Вектор
CNSGH	BEZEE	2016-01-05	500	Næstad AS
CNSGH	DEBRV	2016-01-05	500	Acme Inc.
CNSGH	DEBRV	2016-01-05	600	ООО Вектор
CNSGH	DEBRV	2016-01-05	700	Næstad AS
CNSGH	DEHAM	2016-01-05	500	Acme Inc.
CNSGH	DEHAM	2016-01-05	600	ООО Вектор
CNSGH	DEHAM	2016-01-05	700	Næstad AS
CNSGH	FRLEH	2016-01-05	600	Acme Inc.
CNSGH	FRLEH	2016-01-05	700	ООО Вектор
CNSGH	FRLEH	2016-01-05	800	Næstad AS
CNSGH	NLRTM	2016-01-05	700	Acme Inc.
\.


--
-- Name: api_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_customers_id_seq', 3, true);


--
-- Name: api_ports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_ports_id_seq', 143, true);


--
-- Name: api_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_prices_id_seq', 58, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 3, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- Name: api_customers api_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_customers
    ADD CONSTRAINT api_customers_pkey PRIMARY KEY (id);


--
-- Name: api_ports api_ports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ports
    ADD CONSTRAINT api_ports_pkey PRIMARY KEY (id);


--
-- Name: api_prices api_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_prices
    ADD CONSTRAINT api_prices_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: ports ports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ports
    ADD CONSTRAINT ports_pkey PRIMARY KEY (code);


--
-- Name: api_prices_customer_link_id_bfc535bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_prices_customer_link_id_bfc535bf ON public.api_prices USING btree (customer_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: api_prices api_prices_customer_id_b69fd153_fk_api_customers_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_prices
    ADD CONSTRAINT api_prices_customer_id_b69fd153_fk_api_customers_id FOREIGN KEY (customer_id) REFERENCES public.api_customers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prices prices_dest_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_dest_code_fkey FOREIGN KEY (dest_code) REFERENCES public.ports(code);


--
-- Name: prices prices_orig_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_orig_code_fkey FOREIGN KEY (orig_code) REFERENCES public.ports(code);


--
-- PostgreSQL database dump complete
--

