--
-- PostgreSQL database dump
--

\restrict s4Wxeb6N9zWIDfVAjYgIUb0Sogy0qmzyW6bA7C4dFmB9MdhRdBjS2CCAcgQcwdF

-- Dumped from database version 18.3 (Postgres.app)
-- Dumped by pg_dump version 18.3 (Postgres.app)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: access_levels; Type: TABLE; Schema: public; Owner: ilavoronin
--

CREATE TABLE public.access_levels (
    unique_id integer NOT NULL,
    title character varying(100),
    code character varying(50),
    description text
);


ALTER TABLE public.access_levels OWNER TO ilavoronin;

--
-- Name: access_levels_unique_id_seq; Type: SEQUENCE; Schema: public; Owner: ilavoronin
--

CREATE SEQUENCE public.access_levels_unique_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.access_levels_unique_id_seq OWNER TO ilavoronin;

--
-- Name: access_levels_unique_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ilavoronin
--

ALTER SEQUENCE public.access_levels_unique_id_seq OWNED BY public.access_levels.unique_id;


--
-- Name: card_permissions; Type: TABLE; Schema: public; Owner: ilavoronin
--

CREATE TABLE public.card_permissions (
    card_id integer NOT NULL,
    permission_id integer NOT NULL,
    group_of_passage_point_id integer,
    default_floor integer,
    id integer NOT NULL
);


ALTER TABLE public.card_permissions OWNER TO ilavoronin;

--
-- Name: card_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ilavoronin
--

CREATE SEQUENCE public.card_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.card_permissions_id_seq OWNER TO ilavoronin;

--
-- Name: card_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ilavoronin
--

ALTER SEQUENCE public.card_permissions_id_seq OWNED BY public.card_permissions.id;


--
-- Name: cards; Type: TABLE; Schema: public; Owner: ilavoronin
--

CREATE TABLE public.cards (
    unique_id integer NOT NULL,
    code character varying(50) NOT NULL,
    access_level_id integer,
    expiry_date timestamp without time zone,
    user_id integer,
    is_blocked boolean DEFAULT false
);


ALTER TABLE public.cards OWNER TO ilavoronin;

--
-- Name: cards_unique_id_seq; Type: SEQUENCE; Schema: public; Owner: ilavoronin
--

CREATE SEQUENCE public.cards_unique_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cards_unique_id_seq OWNER TO ilavoronin;

--
-- Name: cards_unique_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ilavoronin
--

ALTER SEQUENCE public.cards_unique_id_seq OWNED BY public.cards.unique_id;


--
-- Name: controllers; Type: TABLE; Schema: public; Owner: ilavoronin
--

CREATE TABLE public.controllers (
    unique_id integer NOT NULL,
    ip_address character varying(45),
    type boolean DEFAULT false,
    description text,
    channels integer DEFAULT 2 NOT NULL,
    device_id character varying(100)
);


ALTER TABLE public.controllers OWNER TO ilavoronin;

--
-- Name: controllers_unique_id_seq; Type: SEQUENCE; Schema: public; Owner: ilavoronin
--

CREATE SEQUENCE public.controllers_unique_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.controllers_unique_id_seq OWNER TO ilavoronin;

--
-- Name: controllers_unique_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ilavoronin
--

ALTER SEQUENCE public.controllers_unique_id_seq OWNED BY public.controllers.unique_id;


--
-- Name: custom_templates; Type: TABLE; Schema: public; Owner: ilavoronin
--

CREATE TABLE public.custom_templates (
    id integer NOT NULL,
    stock_template_id integer,
    custom_template text NOT NULL
);


ALTER TABLE public.custom_templates OWNER TO ilavoronin;

--
-- Name: custom_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: ilavoronin
--

CREATE SEQUENCE public.custom_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.custom_templates_id_seq OWNER TO ilavoronin;

--
-- Name: custom_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ilavoronin
--

ALTER SEQUENCE public.custom_templates_id_seq OWNED BY public.custom_templates.id;


--
-- Name: departments; Type: TABLE; Schema: public; Owner: ilavoronin
--

CREATE TABLE public.departments (
    unique_id integer NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.departments OWNER TO ilavoronin;

--
-- Name: departments_unique_id_seq; Type: SEQUENCE; Schema: public; Owner: ilavoronin
--

CREATE SEQUENCE public.departments_unique_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departments_unique_id_seq OWNER TO ilavoronin;

--
-- Name: departments_unique_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ilavoronin
--

ALTER SEQUENCE public.departments_unique_id_seq OWNED BY public.departments.unique_id;


--
-- Name: passage_point_assignments; Type: TABLE; Schema: public; Owner: ilavoronin
--

CREATE TABLE public.passage_point_assignments (
    group_id integer NOT NULL,
    passage_point_id integer NOT NULL
);


ALTER TABLE public.passage_point_assignments OWNER TO ilavoronin;

--
-- Name: passage_point_groups; Type: TABLE; Schema: public; Owner: ilavoronin
--

CREATE TABLE public.passage_point_groups (
    unique_id integer NOT NULL,
    title character varying(255),
    min_floor integer,
    max_floor integer
);


ALTER TABLE public.passage_point_groups OWNER TO ilavoronin;

--
-- Name: passage_point_groups_unique_id_seq; Type: SEQUENCE; Schema: public; Owner: ilavoronin
--

CREATE SEQUENCE public.passage_point_groups_unique_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.passage_point_groups_unique_id_seq OWNER TO ilavoronin;

--
-- Name: passage_point_groups_unique_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ilavoronin
--

ALTER SEQUENCE public.passage_point_groups_unique_id_seq OWNED BY public.passage_point_groups.unique_id;


--
-- Name: passage_points; Type: TABLE; Schema: public; Owner: ilavoronin
--

CREATE TABLE public.passage_points (
    unique_id integer NOT NULL,
    title character varying(255),
    floor integer,
    description text
);


ALTER TABLE public.passage_points OWNER TO ilavoronin;

--
-- Name: passage_points_unique_id_seq; Type: SEQUENCE; Schema: public; Owner: ilavoronin
--

CREATE SEQUENCE public.passage_points_unique_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.passage_points_unique_id_seq OWNER TO ilavoronin;

--
-- Name: passage_points_unique_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ilavoronin
--

ALTER SEQUENCE public.passage_points_unique_id_seq OWNED BY public.passage_points.unique_id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: ilavoronin
--

CREATE TABLE public.permissions (
    unique_id integer NOT NULL,
    title character varying(255),
    schedule_id integer
);


ALTER TABLE public.permissions OWNER TO ilavoronin;

--
-- Name: permissions_unique_id_seq; Type: SEQUENCE; Schema: public; Owner: ilavoronin
--

CREATE SEQUENCE public.permissions_unique_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_unique_id_seq OWNER TO ilavoronin;

--
-- Name: permissions_unique_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ilavoronin
--

ALTER SEQUENCE public.permissions_unique_id_seq OWNED BY public.permissions.unique_id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: ilavoronin
--

CREATE TABLE public.posts (
    unique_id integer NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.posts OWNER TO ilavoronin;

--
-- Name: posts_unique_id_seq; Type: SEQUENCE; Schema: public; Owner: ilavoronin
--

CREATE SEQUENCE public.posts_unique_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_unique_id_seq OWNER TO ilavoronin;

--
-- Name: posts_unique_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ilavoronin
--

ALTER SEQUENCE public.posts_unique_id_seq OWNED BY public.posts.unique_id;


--
-- Name: scaners; Type: TABLE; Schema: public; Owner: ilavoronin
--

CREATE TABLE public.scaners (
    unique_id integer NOT NULL,
    code character varying(50),
    address character varying(255),
    channel integer,
    passage_point_id integer,
    controller_id integer,
    description text
);


ALTER TABLE public.scaners OWNER TO ilavoronin;

--
-- Name: scaners_unique_id_seq; Type: SEQUENCE; Schema: public; Owner: ilavoronin
--

CREATE SEQUENCE public.scaners_unique_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.scaners_unique_id_seq OWNER TO ilavoronin;

--
-- Name: scaners_unique_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ilavoronin
--

ALTER SEQUENCE public.scaners_unique_id_seq OWNED BY public.scaners.unique_id;


--
-- Name: stock_templates; Type: TABLE; Schema: public; Owner: ilavoronin
--

CREATE TABLE public.stock_templates (
    id integer NOT NULL,
    year character varying(4) NOT NULL,
    template text NOT NULL
);


ALTER TABLE public.stock_templates OWNER TO ilavoronin;

--
-- Name: stock_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: ilavoronin
--

CREATE SEQUENCE public.stock_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_templates_id_seq OWNER TO ilavoronin;

--
-- Name: stock_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ilavoronin
--

ALTER SEQUENCE public.stock_templates_id_seq OWNED BY public.stock_templates.id;


--
-- Name: system_users; Type: TABLE; Schema: public; Owner: ilavoronin
--

CREATE TABLE public.system_users (
    unique_id integer NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    user_id integer
);


ALTER TABLE public.system_users OWNER TO ilavoronin;

--
-- Name: system_users_unique_id_seq; Type: SEQUENCE; Schema: public; Owner: ilavoronin
--

CREATE SEQUENCE public.system_users_unique_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.system_users_unique_id_seq OWNER TO ilavoronin;

--
-- Name: system_users_unique_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ilavoronin
--

ALTER SEQUENCE public.system_users_unique_id_seq OWNED BY public.system_users.unique_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: ilavoronin
--

CREATE TABLE public.users (
    unique_id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    patronymic character varying(100),
    department_id integer,
    post_id integer,
    description text,
    is_admin boolean DEFAULT false,
    system_user_id integer
);


ALTER TABLE public.users OWNER TO ilavoronin;

--
-- Name: users_unique_id_seq; Type: SEQUENCE; Schema: public; Owner: ilavoronin
--

CREATE SEQUENCE public.users_unique_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_unique_id_seq OWNER TO ilavoronin;

--
-- Name: users_unique_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ilavoronin
--

ALTER SEQUENCE public.users_unique_id_seq OWNED BY public.users.unique_id;


--
-- Name: access_levels unique_id; Type: DEFAULT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.access_levels ALTER COLUMN unique_id SET DEFAULT nextval('public.access_levels_unique_id_seq'::regclass);


--
-- Name: card_permissions id; Type: DEFAULT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.card_permissions ALTER COLUMN id SET DEFAULT nextval('public.card_permissions_id_seq'::regclass);


--
-- Name: cards unique_id; Type: DEFAULT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.cards ALTER COLUMN unique_id SET DEFAULT nextval('public.cards_unique_id_seq'::regclass);


--
-- Name: controllers unique_id; Type: DEFAULT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.controllers ALTER COLUMN unique_id SET DEFAULT nextval('public.controllers_unique_id_seq'::regclass);


--
-- Name: custom_templates id; Type: DEFAULT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.custom_templates ALTER COLUMN id SET DEFAULT nextval('public.custom_templates_id_seq'::regclass);


--
-- Name: departments unique_id; Type: DEFAULT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.departments ALTER COLUMN unique_id SET DEFAULT nextval('public.departments_unique_id_seq'::regclass);


--
-- Name: passage_point_groups unique_id; Type: DEFAULT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.passage_point_groups ALTER COLUMN unique_id SET DEFAULT nextval('public.passage_point_groups_unique_id_seq'::regclass);


--
-- Name: passage_points unique_id; Type: DEFAULT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.passage_points ALTER COLUMN unique_id SET DEFAULT nextval('public.passage_points_unique_id_seq'::regclass);


--
-- Name: permissions unique_id; Type: DEFAULT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.permissions ALTER COLUMN unique_id SET DEFAULT nextval('public.permissions_unique_id_seq'::regclass);


--
-- Name: posts unique_id; Type: DEFAULT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.posts ALTER COLUMN unique_id SET DEFAULT nextval('public.posts_unique_id_seq'::regclass);


--
-- Name: scaners unique_id; Type: DEFAULT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.scaners ALTER COLUMN unique_id SET DEFAULT nextval('public.scaners_unique_id_seq'::regclass);


--
-- Name: stock_templates id; Type: DEFAULT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.stock_templates ALTER COLUMN id SET DEFAULT nextval('public.stock_templates_id_seq'::regclass);


--
-- Name: system_users unique_id; Type: DEFAULT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.system_users ALTER COLUMN unique_id SET DEFAULT nextval('public.system_users_unique_id_seq'::regclass);


--
-- Name: users unique_id; Type: DEFAULT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.users ALTER COLUMN unique_id SET DEFAULT nextval('public.users_unique_id_seq'::regclass);


--
-- Data for Name: access_levels; Type: TABLE DATA; Schema: public; Owner: ilavoronin
--

COPY public.access_levels (unique_id, title, code, description) FROM stdin;
1	Обычный	0	Стандартный уровень доступа
4	Сервис	3	
3	VIP	2	
2	Заблокирован	1	
5	Эскорт	4	
\.


--
-- Data for Name: card_permissions; Type: TABLE DATA; Schema: public; Owner: ilavoronin
--

COPY public.card_permissions (card_id, permission_id, group_of_passage_point_id, default_floor, id) FROM stdin;
2	7	1	5	11
2	8	2	1	12
1	7	1	1	13
\.


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: ilavoronin
--

COPY public.cards (unique_id, code, access_level_id, expiry_date, user_id, is_blocked) FROM stdin;
1	6312110	1	2026-03-31 00:00:00	4	f
2	6023176	4	2026-06-02 00:00:00	1	f
\.


--
-- Data for Name: controllers; Type: TABLE DATA; Schema: public; Owner: ilavoronin
--

COPY public.controllers (unique_id, ip_address, type, description, channels, device_id) FROM stdin;
1	192.168.65.9	f	Левая шахта главного здания	5	SomeNewID
2	192.168.65.30	f		2	DeviceID
3	192.168.65.6	t		2	AnotherDeviceID
\.


--
-- Data for Name: custom_templates; Type: TABLE DATA; Schema: public; Owner: ilavoronin
--

COPY public.custom_templates (id, stock_template_id, custom_template) FROM stdin;
5	2	{"year":2025,"day_types":{"workday":{"description":"Рабочий день","start_hour":"09:00","end_hour":"18:00"},"weekend":{"description":"Выходной день","start_hour":"00:00","end_hour":"00:00"},"shortened":{"description":"Сокращённый день","start_hour":"09:00","end_hour":"16:00"},"special":{"description":"Специальный день","start_hour":"12:00","end_hour":"16:00"}},"months":[{"month":1,"days":{"weekend":[1,2,3,4,5,6,7,8,11,12,18,19,25,26],"shortened":[],"special":[]}},{"month":2,"days":{"weekend":[1,2,8,9,15,16,22,23],"shortened":[],"special":[]}},{"month":3,"days":{"weekend":[1,2,8,9,15,16,22,23,29,30],"shortened":[7],"special":[]}},{"month":4,"days":{"weekend":[5,6,12,13,19,20,26,27],"shortened":[30],"special":[]}},{"month":5,"days":{"weekend":[1,3,4,9,10,11,17,18,24,25,31],"shortened":[],"special":[2,8]}},{"month":6,"days":{"weekend":[1,7,8,12,14,15,21,22,28,29],"shortened":[11],"special":[13]}},{"month":7,"days":{"weekend":[5,6,12,13,19,20,26,27],"shortened":[],"special":[]}},{"month":8,"days":{"weekend":[2,3,9,10,16,17,23,24,30,31],"shortened":[],"special":[]}},{"month":9,"days":{"weekend":[6,7,13,14,20,21,27,28],"shortened":[],"special":[]}},{"month":10,"days":{"weekend":[4,5,11,12,18,19,25,26],"shortened":[],"special":[]}},{"month":11,"days":{"weekend":[2,4,8,9,15,16,22,23,29,30],"shortened":[1],"special":[3]}},{"month":12,"days":{"weekend":[6,7,13,14,20,21,27,28],"shortened":[],"special":[31]}}]}
4	3	{"year":2026,"day_types":{"workday":{"description":"Рабочий день","start_hour":"09:00","end_hour":"18:00"},"weekend":{"description":"Выходной день","start_hour":"00:00","end_hour":"00:00"},"shortened":{"description":"Сокращённый день","start_hour":"09:00","end_hour":"16:00"},"special":{"description":"Специальный день","start_hour":"12:00","end_hour":"16:00"}},"months":[{"month":1,"days":{"weekend":[1,2,3,4,5,6,7,8,10,11,17,18,24,25,31],"shortened":[],"special":[9]}},{"month":2,"days":{"weekend":[1,7,8,14,15,21,22,23,28],"shortened":[],"special":[]}},{"month":3,"days":{"weekend":[1,7,8,14,15,21,22,28,29],"shortened":[],"special":[9]}},{"month":4,"days":{"weekend":[4,5,11,12,18,19,25,26],"shortened":[30],"special":[]}},{"month":5,"days":{"weekend":[1,2,3,9,10,16,17,23,24,30,31],"shortened":[8],"special":[11]}},{"month":6,"days":{"weekend":[6,7,12,13,14,20,21,27,28],"shortened":[11],"special":[]}},{"month":7,"days":{"weekend":[4,5,11,12,18,19,25,26],"shortened":[],"special":[]}},{"month":8,"days":{"weekend":[1,2,8,9,15,16,22,23,29,30,3,4,5,6,7],"shortened":[],"special":[]}},{"month":9,"days":{"weekend":[5,6,12,13,19,20,26,27],"shortened":[],"special":[]}},{"month":10,"days":{"weekend":[3,4,10,11,17,18,24,25,31],"shortened":[],"special":[]}},{"month":11,"days":{"weekend":[1,4,7,8,14,15,21,22,28,29],"shortened":[3],"special":[]}},{"month":12,"days":{"weekend":[5,6,12,13,19,20,26,27],"shortened":[],"special":[31]}}]}
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: ilavoronin
--

COPY public.departments (unique_id, title) FROM stdin;
2	HR
4	Отдел снабжения
12	Бухгалтерия
3	Внутренние аудиторы
1	IT-отдел
\.


--
-- Data for Name: passage_point_assignments; Type: TABLE DATA; Schema: public; Owner: ilavoronin
--

COPY public.passage_point_assignments (group_id, passage_point_id) FROM stdin;
2	1
3	3
3	1
1	3
1	4
\.


--
-- Data for Name: passage_point_groups; Type: TABLE DATA; Schema: public; Owner: ilavoronin
--

COPY public.passage_point_groups (unique_id, title, min_floor, max_floor) FROM stdin;
3	Левая шахта и правая шахта Этажи 1,3	1	3
1	Левая шахта Все этажи	1	15
2	Правая шахта все этажи	1	11
\.


--
-- Data for Name: passage_points; Type: TABLE DATA; Schema: public; Owner: ilavoronin
--

COPY public.passage_points (unique_id, title, floor, description) FROM stdin;
2	Левая шахта 4 этаж	4	
3	Левая шахта 1 этаж	1	
4	Левая шахта 2 этаж	2	
1	Правая шахта 3 этаж	3	
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: ilavoronin
--

COPY public.permissions (unique_id, title, schedule_id) FROM stdin;
8	Тест 2025	5
7	Основное 2026 + Выходные в августе	4
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: ilavoronin
--

COPY public.posts (unique_id, title) FROM stdin;
2	Программист
3	Сотрудник HR-отдела
4	Управляющий
1	Директор
5	Заместитель директора
\.


--
-- Data for Name: scaners; Type: TABLE DATA; Schema: public; Owner: ilavoronin
--

COPY public.scaners (unique_id, code, address, channel, passage_point_id, controller_id, description) FROM stdin;
2	650000	6	1	3	1	
3	268444	9	1	3	2	
1	476444	44	0	1	1	норм
\.


--
-- Data for Name: stock_templates; Type: TABLE DATA; Schema: public; Owner: ilavoronin
--

COPY public.stock_templates (id, year, template) FROM stdin;
2	2025	{\n  "year": 2025,\n  "months": [\n    {\n      "month": 1,\n      "days": "1,2,3,4,5,6,7,8,11,12,18,19,25,26"\n    },\n    {\n      "month": 2,\n      "days": "1,2,8,9,15,16,22,23"\n    },\n    {\n      "month": 3,\n      "days": "1,2,7*,8,9,15,16,22,23,29,30"\n    },\n    {\n      "month": 4,\n      "days": "5,6,12,13,19,20,26,27,30*"\n    },\n    {\n      "month": 5,\n      "days": "1,2+,3,4,8+,9,10,11,17,18,24,25,31"\n    },\n    {\n      "month": 6,\n      "days": "1,7,8,11*,12,13+,14,15,21,22,28,29"\n    },\n    {\n      "month": 7,\n      "days": "5,6,12,13,19,20,26,27"\n    },\n    {\n      "month": 8,\n      "days": "2,3,9,10,16,17,23,24,30,31"\n    },\n    {\n      "month": 9,\n      "days": "6,7,13,14,20,21,27,28"\n    },\n    {\n      "month": 10,\n      "days": "4,5,11,12,18,19,25,26"\n    },\n    {\n      "month": 11,\n      "days": "1*,2,3+,4,8,9,15,16,22,23,29,30"\n    },\n    {\n      "month": 12,\n      "days": "6,7,13,14,20,21,27,28,31+"\n    }\n  ],\n  "transitions": [\n    {"from": "01.04", "to": "05.02"},\n    {"from": "02.23", "to": "05.08"},\n    {"from": "03.08", "to": "06.13"},\n    {"from": "11.01", "to": "11.03"},\n    {"from": "01.05", "to": "12.31"}\n  ],\n  "statistic": {\n    "workdays": 247,\n    "holidays": 118,\n    "hours40": 1972,\n    "hours36": 1774.4,\n    "hours24": 1181.6\n  }\n}\n
5	2024	{\n  "year": 2024,\n  "months": [\n    {\n      "month": 1,\n      "days": "1,2,3,4,5,6,7,8,13,14,20,21,27,28"\n    },\n    {\n      "month": 2,\n      "days": "3,4,10,11,17,18,22*,23,24,25"\n    },\n    {\n      "month": 3,\n      "days": "2,3,7*,8,9,10,16,17,23,24,30,31"\n    },\n    {\n      "month": 4,\n      "days": "6,7,13,14,20,21,28,29+,30+"\n    },\n    {\n      "month": 5,\n      "days": "1,4,5,8*,9,10+,11,12,18,19,25,26"\n    },\n    {\n      "month": 6,\n      "days": "1,2,8,9,11*,12,15,16,22,23,29,30"\n    },\n    {\n      "month": 7,\n      "days": "6,7,13,14,20,21,27,28"\n    },\n    {\n      "month": 8,\n      "days": "3,4,10,11,17,18,24,25,31"\n    },\n    {\n      "month": 9,\n      "days": "1,7,8,14,15,21,22,28,29"\n    },\n    {\n      "month": 10,\n      "days": "5,6,12,13,19,20,26,27"\n    },\n    {\n      "month": 11,\n      "days": "2*,3,4,9,10,16,17,23,24,30"\n    },\n    {\n      "month": 12,\n      "days": "1,7,8,14,15,21,22,29,30+,31+"\n    }\n  ],\n  "transitions": [\n    {"from": "04.27", "to": "04.29"},\n    {"from": "11.02", "to": "04.30"},\n    {"from": "01.06", "to": "05.10"},\n    {"from": "12.28", "to": "12.30"},\n    {"from": "01.07", "to": "12.31"}\n  ],\n  "statistic": {\n    "workdays": 248,\n    "holidays": 118,\n    "hours40": 1979,\n    "hours36": 1780.6000000000001,\n    "hours24": 1185.3999999999999\n  }\n}\n
3	2026	{\n  "year": 2026,\n  "months": [\n    {\n      "month": 1,\n      "days": "1,2,3,4,5,6,7,8,9+,10,11,17,18,24,25,31"\n    },\n    {\n      "month": 2,\n      "days": "1,7,8,14,15,21,22,23,28"\n    },\n    {\n      "month": 3,\n      "days": "1,7,8,9+,14,15,21,22,28,29"\n    },\n    {\n      "month": 4,\n      "days": "4,5,11,12,18,19,25,26,30*"\n    },\n    {\n      "month": 5,\n      "days": "1,2,3,8*,9,10,11+,16,17,23,24,30,31"\n    },\n    {\n      "month": 6,\n      "days": "6,7,11*,12,13,14,20,21,27,28"\n    },\n    {\n      "month": 7,\n      "days": "4,5,11,12,18,19,25,26"\n    },\n    {\n      "month": 8,\n      "days": "1,2,8,9,15,16,22,23,29,30"\n    },\n    {\n      "month": 9,\n      "days": "5,6,12,13,19,20,26,27"\n    },\n    {\n      "month": 10,\n      "days": "3,4,10,11,17,18,24,25,31"\n    },\n    {\n      "month": 11,\n      "days": "1,3*,4,7,8,14,15,21,22,28,29"\n    },\n    {\n      "month": 12,\n      "days": "5,6,12,13,19,20,26,27,31+"\n    }\n  ],\n  "transitions": [\n    {"from": "01.03", "to": "01.09"},\n    {"from": "03.08", "to": "03.09"},\n    {"from": "05.09", "to": "05.11"},\n    {"from": "01.04", "to": "12.31"}\n  ],\n  "statistic": {\n    "workdays": 247,\n    "holidays": 118,\n    "hours40": 1972,\n    "hours36": 1774.4,\n    "hours24": 1181.6\n  }\n}\n
\.


--
-- Data for Name: system_users; Type: TABLE DATA; Schema: public; Owner: ilavoronin
--

COPY public.system_users (unique_id, login, password, user_id) FROM stdin;
1	admin	$2a$10$uUBN0WflkpX2Sgr6FvH.SeXh1b13K1zq5R7JaY6.I.QbmT4LdnBem	6
2	petrov	$2a$10$thbdIc3msGVACljUKWk3/uMK9bMgt9k2CfCCJNk0w6o89xL2FTFdm	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ilavoronin
--

COPY public.users (unique_id, first_name, last_name, patronymic, department_id, post_id, description, is_admin, system_user_id) FROM stdin;
4	Андрей	Гончаров	Владимирович	2	3		f	\N
1	Иван	Петров	Васильевич	1	2	Новый сотрудник	t	\N
7	Андрей	Воронцов	Васильевич	1	2		f	\N
6	Илья	Воронин	Петрович	1	2	Нормальный	t	\N
\.


--
-- Name: access_levels_unique_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ilavoronin
--

SELECT pg_catalog.setval('public.access_levels_unique_id_seq', 6, true);


--
-- Name: card_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ilavoronin
--

SELECT pg_catalog.setval('public.card_permissions_id_seq', 13, true);


--
-- Name: cards_unique_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ilavoronin
--

SELECT pg_catalog.setval('public.cards_unique_id_seq', 17, true);


--
-- Name: controllers_unique_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ilavoronin
--

SELECT pg_catalog.setval('public.controllers_unique_id_seq', 6, true);


--
-- Name: custom_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ilavoronin
--

SELECT pg_catalog.setval('public.custom_templates_id_seq', 5, true);


--
-- Name: departments_unique_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ilavoronin
--

SELECT pg_catalog.setval('public.departments_unique_id_seq', 18, true);


--
-- Name: passage_point_groups_unique_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ilavoronin
--

SELECT pg_catalog.setval('public.passage_point_groups_unique_id_seq', 4, true);


--
-- Name: passage_points_unique_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ilavoronin
--

SELECT pg_catalog.setval('public.passage_points_unique_id_seq', 5, true);


--
-- Name: permissions_unique_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ilavoronin
--

SELECT pg_catalog.setval('public.permissions_unique_id_seq', 9, true);


--
-- Name: posts_unique_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ilavoronin
--

SELECT pg_catalog.setval('public.posts_unique_id_seq', 12, true);


--
-- Name: scaners_unique_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ilavoronin
--

SELECT pg_catalog.setval('public.scaners_unique_id_seq', 5, true);


--
-- Name: stock_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ilavoronin
--

SELECT pg_catalog.setval('public.stock_templates_id_seq', 5, true);


--
-- Name: system_users_unique_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ilavoronin
--

SELECT pg_catalog.setval('public.system_users_unique_id_seq', 2, true);


--
-- Name: users_unique_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ilavoronin
--

SELECT pg_catalog.setval('public.users_unique_id_seq', 7, true);


--
-- Name: access_levels access_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.access_levels
    ADD CONSTRAINT access_levels_pkey PRIMARY KEY (unique_id);


--
-- Name: card_permissions card_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.card_permissions
    ADD CONSTRAINT card_permissions_pkey PRIMARY KEY (id);


--
-- Name: cards cards_code_key; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_code_key UNIQUE (code);


--
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (unique_id);


--
-- Name: controllers controllers_pkey; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.controllers
    ADD CONSTRAINT controllers_pkey PRIMARY KEY (unique_id);


--
-- Name: custom_templates custom_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.custom_templates
    ADD CONSTRAINT custom_templates_pkey PRIMARY KEY (id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (unique_id);


--
-- Name: passage_point_assignments passage_point_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.passage_point_assignments
    ADD CONSTRAINT passage_point_assignments_pkey PRIMARY KEY (group_id, passage_point_id);


--
-- Name: passage_point_groups passage_point_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.passage_point_groups
    ADD CONSTRAINT passage_point_groups_pkey PRIMARY KEY (unique_id);


--
-- Name: passage_points passage_points_pkey; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.passage_points
    ADD CONSTRAINT passage_points_pkey PRIMARY KEY (unique_id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (unique_id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (unique_id);


--
-- Name: scaners scaners_pkey; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.scaners
    ADD CONSTRAINT scaners_pkey PRIMARY KEY (unique_id);


--
-- Name: stock_templates stock_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.stock_templates
    ADD CONSTRAINT stock_templates_pkey PRIMARY KEY (id);


--
-- Name: system_users system_users_login_key; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.system_users
    ADD CONSTRAINT system_users_login_key UNIQUE (login);


--
-- Name: system_users system_users_pkey; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.system_users
    ADD CONSTRAINT system_users_pkey PRIMARY KEY (unique_id);


--
-- Name: access_levels uq_access_levels_title; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.access_levels
    ADD CONSTRAINT uq_access_levels_title UNIQUE (title);


--
-- Name: cards uq_cards_code; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT uq_cards_code UNIQUE (code);


--
-- Name: controllers uq_controllers_device_id; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.controllers
    ADD CONSTRAINT uq_controllers_device_id UNIQUE (device_id);


--
-- Name: departments uq_departments_title; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT uq_departments_title UNIQUE (title);


--
-- Name: passage_points uq_passage_points_title; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.passage_points
    ADD CONSTRAINT uq_passage_points_title UNIQUE (title);


--
-- Name: permissions uq_permissions_title; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT uq_permissions_title UNIQUE (title);


--
-- Name: posts uq_posts_title; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT uq_posts_title UNIQUE (title);


--
-- Name: passage_point_groups uq_pp_groups_title; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.passage_point_groups
    ADD CONSTRAINT uq_pp_groups_title UNIQUE (title);


--
-- Name: scaners uq_scaners_code; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.scaners
    ADD CONSTRAINT uq_scaners_code UNIQUE (code);


--
-- Name: stock_templates uq_stock_templates_year; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.stock_templates
    ADD CONSTRAINT uq_stock_templates_year UNIQUE (year);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (unique_id);


--
-- Name: card_permissions card_permissions_card_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.card_permissions
    ADD CONSTRAINT card_permissions_card_id_fkey FOREIGN KEY (card_id) REFERENCES public.cards(unique_id) ON DELETE CASCADE;


--
-- Name: card_permissions card_permissions_group_of_passage_point_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.card_permissions
    ADD CONSTRAINT card_permissions_group_of_passage_point_id_fkey FOREIGN KEY (group_of_passage_point_id) REFERENCES public.passage_point_groups(unique_id);


--
-- Name: card_permissions card_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.card_permissions
    ADD CONSTRAINT card_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permissions(unique_id) ON DELETE CASCADE;


--
-- Name: cards cards_access_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_access_level_id_fkey FOREIGN KEY (access_level_id) REFERENCES public.access_levels(unique_id);


--
-- Name: cards cards_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(unique_id);


--
-- Name: custom_templates custom_templates_stock_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.custom_templates
    ADD CONSTRAINT custom_templates_stock_template_id_fkey FOREIGN KEY (stock_template_id) REFERENCES public.stock_templates(id) ON DELETE RESTRICT;


--
-- Name: users fk_system_user; Type: FK CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_system_user FOREIGN KEY (system_user_id) REFERENCES public.system_users(unique_id) ON DELETE SET NULL;


--
-- Name: passage_point_assignments passage_point_assignments_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.passage_point_assignments
    ADD CONSTRAINT passage_point_assignments_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.passage_point_groups(unique_id) ON DELETE CASCADE;


--
-- Name: passage_point_assignments passage_point_assignments_passage_point_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.passage_point_assignments
    ADD CONSTRAINT passage_point_assignments_passage_point_id_fkey FOREIGN KEY (passage_point_id) REFERENCES public.passage_points(unique_id) ON DELETE CASCADE;


--
-- Name: permissions permissions_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_schedule_id_fkey FOREIGN KEY (schedule_id) REFERENCES public.custom_templates(id) ON DELETE SET NULL;


--
-- Name: scaners scaners_controller_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.scaners
    ADD CONSTRAINT scaners_controller_id_fkey FOREIGN KEY (controller_id) REFERENCES public.controllers(unique_id);


--
-- Name: scaners scaners_passage_point_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.scaners
    ADD CONSTRAINT scaners_passage_point_id_fkey FOREIGN KEY (passage_point_id) REFERENCES public.passage_points(unique_id);


--
-- Name: system_users system_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.system_users
    ADD CONSTRAINT system_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(unique_id);


--
-- Name: users users_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(unique_id);


--
-- Name: users users_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ilavoronin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(unique_id);


--
-- PostgreSQL database dump complete
--

\unrestrict s4Wxeb6N9zWIDfVAjYgIUb0Sogy0qmzyW6bA7C4dFmB9MdhRdBjS2CCAcgQcwdF

