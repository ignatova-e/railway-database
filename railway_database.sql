--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-28 18:22:54 MSK

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
-- TOC entry 224 (class 1259 OID 16832)
-- Name: car_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car_types (
    car_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.car_types OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16831)
-- Name: car_types_car_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.car_types_car_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.car_types_car_type_id_seq OWNER TO postgres;

--
-- TOC entry 3701 (class 0 OID 0)
-- Dependencies: 223
-- Name: car_types_car_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.car_types_car_type_id_seq OWNED BY public.car_types.car_type_id;


--
-- TOC entry 226 (class 1259 OID 16843)
-- Name: cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cars (
    car_id integer NOT NULL,
    train_id integer NOT NULL,
    car_number integer NOT NULL,
    car_type_id integer NOT NULL
);


ALTER TABLE public.cars OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16842)
-- Name: cars_car_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cars_car_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cars_car_id_seq OWNER TO postgres;

--
-- TOC entry 3702 (class 0 OID 0)
-- Dependencies: 225
-- Name: cars_car_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cars_car_id_seq OWNED BY public.cars.car_id;


--
-- TOC entry 232 (class 1259 OID 16901)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    payment_id integer NOT NULL,
    ticket_id integer NOT NULL,
    amount numeric(10,2) NOT NULL,
    payment_method character varying(50) NOT NULL,
    payment_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status character varying(50) DEFAULT 'pending'::character varying NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16900)
-- Name: payments_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_payment_id_seq OWNER TO postgres;

--
-- TOC entry 3703 (class 0 OID 0)
-- Dependencies: 231
-- Name: payments_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_payment_id_seq OWNED BY public.payments.payment_id;


--
-- TOC entry 222 (class 1259 OID 16810)
-- Name: routes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.routes (
    route_id integer NOT NULL,
    train_id integer NOT NULL,
    start_station_id integer NOT NULL,
    end_station_id integer NOT NULL,
    departure_time timestamp without time zone NOT NULL,
    arrival_time timestamp without time zone NOT NULL,
    route_date date NOT NULL
);


ALTER TABLE public.routes OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16809)
-- Name: routes_route_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.routes_route_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.routes_route_id_seq OWNER TO postgres;

--
-- TOC entry 3704 (class 0 OID 0)
-- Dependencies: 221
-- Name: routes_route_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.routes_route_id_seq OWNED BY public.routes.route_id;


--
-- TOC entry 228 (class 1259 OID 16862)
-- Name: seats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seats (
    seat_id integer NOT NULL,
    car_id integer NOT NULL,
    seat_number integer NOT NULL
);


ALTER TABLE public.seats OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16861)
-- Name: seats_seat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seats_seat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seats_seat_id_seq OWNER TO postgres;

--
-- TOC entry 3705 (class 0 OID 0)
-- Dependencies: 227
-- Name: seats_seat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seats_seat_id_seq OWNED BY public.seats.seat_id;


--
-- TOC entry 220 (class 1259 OID 16803)
-- Name: stations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stations (
    station_id integer NOT NULL,
    name character varying(100) NOT NULL,
    city character varying(100) NOT NULL
);


ALTER TABLE public.stations OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16802)
-- Name: stations_station_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stations_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stations_station_id_seq OWNER TO postgres;

--
-- TOC entry 3706 (class 0 OID 0)
-- Dependencies: 219
-- Name: stations_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stations_station_id_seq OWNED BY public.stations.station_id;


--
-- TOC entry 230 (class 1259 OID 16876)
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tickets (
    ticket_id integer NOT NULL,
    user_id integer NOT NULL,
    route_id integer NOT NULL,
    seat_id integer NOT NULL,
    purchase_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16875)
-- Name: tickets_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tickets_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tickets_ticket_id_seq OWNER TO postgres;

--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 229
-- Name: tickets_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tickets_ticket_id_seq OWNED BY public.tickets.ticket_id;


--
-- TOC entry 218 (class 1259 OID 16792)
-- Name: trains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trains (
    train_id integer NOT NULL,
    train_number character varying(10) NOT NULL,
    description text
);


ALTER TABLE public.trains OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16791)
-- Name: trains_train_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trains_train_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trains_train_id_seq OWNER TO postgres;

--
-- TOC entry 3708 (class 0 OID 0)
-- Dependencies: 217
-- Name: trains_train_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trains_train_id_seq OWNED BY public.trains.train_id;


--
-- TOC entry 216 (class 1259 OID 16783)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(30)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16782)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 3709 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 3487 (class 2604 OID 16835)
-- Name: car_types car_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_types ALTER COLUMN car_type_id SET DEFAULT nextval('public.car_types_car_type_id_seq'::regclass);


--
-- TOC entry 3488 (class 2604 OID 16846)
-- Name: cars car_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars ALTER COLUMN car_id SET DEFAULT nextval('public.cars_car_id_seq'::regclass);


--
-- TOC entry 3492 (class 2604 OID 16904)
-- Name: payments payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN payment_id SET DEFAULT nextval('public.payments_payment_id_seq'::regclass);


--
-- TOC entry 3486 (class 2604 OID 16813)
-- Name: routes route_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes ALTER COLUMN route_id SET DEFAULT nextval('public.routes_route_id_seq'::regclass);


--
-- TOC entry 3489 (class 2604 OID 16865)
-- Name: seats seat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats ALTER COLUMN seat_id SET DEFAULT nextval('public.seats_seat_id_seq'::regclass);


--
-- TOC entry 3485 (class 2604 OID 16806)
-- Name: stations station_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stations ALTER COLUMN station_id SET DEFAULT nextval('public.stations_station_id_seq'::regclass);


--
-- TOC entry 3490 (class 2604 OID 16879)
-- Name: tickets ticket_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets ALTER COLUMN ticket_id SET DEFAULT nextval('public.tickets_ticket_id_seq'::regclass);


--
-- TOC entry 3484 (class 2604 OID 16795)
-- Name: trains train_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trains ALTER COLUMN train_id SET DEFAULT nextval('public.trains_train_id_seq'::regclass);


--
-- TOC entry 3483 (class 2604 OID 16786)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 3687 (class 0 OID 16832)
-- Dependencies: 224
-- Data for Name: car_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car_types (car_type_id, name, description) FROM stdin;
1	Плацкарт	Бюджетный класс
2	Купе	Средний класс
3	СВ	Комфорт-класс
4	Люкс	Повышенный комфорт
5	Сидячий	Для коротких поездок
6	Плацкарт+	Дополнительный бюджетный класс
7	Купе VIP	Купе повышенной комфортности
8	СВ Премиум	Премиум комфорт
9	Люкс S	Люкс с улучшенным сервисом
10	Сидячий бизнес	Сидячий комфорт бизнес-класса
11	Семейный	Для семейных поездок
12	Эконом	Эконом класс нового типа
13	Бизнес	Бизнес класс
14	Спальный	Для ночных поездок
15	Плацкарт+2	Расширенный плацкарт
\.


--
-- TOC entry 3689 (class 0 OID 16843)
-- Dependencies: 226
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cars (car_id, train_id, car_number, car_type_id) FROM stdin;
1	1	1	2
2	1	2	1
3	2	1	3
4	3	1	2
5	4	1	5
42	6	1	6
43	7	1	7
44	8	1	8
45	9	1	9
46	10	1	10
47	6	2	2
48	7	2	3
49	8	2	4
50	9	2	5
51	10	2	1
\.


--
-- TOC entry 3695 (class 0 OID 16901)
-- Dependencies: 232
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (payment_id, ticket_id, amount, payment_method, payment_date, status) FROM stdin;
1	1	1500.00	карта	2025-05-06 14:04:43.228813	pending
2	2	2000.00	нал	2025-05-06 14:04:43.228813	pending
3	3	1800.00	карта	2025-05-06 14:04:43.228813	pending
4	4	2200.00	карта	2025-05-06 14:04:43.228813	pending
5	5	1600.00	нал	2025-05-06 14:04:43.228813	pending
\.


--
-- TOC entry 3685 (class 0 OID 16810)
-- Dependencies: 222
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.routes (route_id, train_id, start_station_id, end_station_id, departure_time, arrival_time, route_date) FROM stdin;
1	1	1	2	2025-05-10 08:00:00	2025-05-10 12:00:00	2025-05-10
2	2	3	4	2025-05-11 09:00:00	2025-05-11 13:00:00	2025-05-11
3	3	5	4	2025-05-12 15:00:00	2025-05-12 18:00:00	2025-05-12
4	4	1	3	2025-05-13 06:00:00	2025-05-13 10:30:00	2025-05-13
5	5	2	5	2025-05-14 20:00:00	2025-05-15 06:00:00	2025-05-14
56	6	6	7	2025-05-15 07:00:00	2025-05-15 14:00:00	2025-05-15
57	7	8	9	2025-05-16 10:00:00	2025-05-16 16:30:00	2025-05-16
58	8	10	1	2025-05-17 18:00:00	2025-05-18 01:00:00	2025-05-17
59	9	2	3	2025-05-18 05:30:00	2025-05-18 11:30:00	2025-05-18
60	10	4	5	2025-05-19 21:00:00	2025-05-20 04:00:00	2025-05-19
61	6	1	6	2025-05-20 08:00:00	2025-05-20 14:30:00	2025-05-20
62	7	3	7	2025-05-21 09:00:00	2025-05-21 15:00:00	2025-05-21
63	8	4	8	2025-05-22 13:00:00	2025-05-22 19:00:00	2025-05-22
64	9	5	9	2025-05-23 16:00:00	2025-05-23 22:00:00	2025-05-23
65	10	6	10	2025-05-24 12:00:00	2025-05-24 18:00:00	2025-05-24
66	6	6	7	2025-05-15 07:00:00	2025-05-15 14:00:00	2025-05-15
67	7	8	9	2025-05-16 10:00:00	2025-05-16 16:30:00	2025-05-16
68	8	10	1	2025-05-17 18:00:00	2025-05-18 01:00:00	2025-05-17
69	9	2	3	2025-05-18 05:30:00	2025-05-18 11:30:00	2025-05-18
70	10	4	5	2025-05-19 21:00:00	2025-05-20 04:00:00	2025-05-19
71	6	1	6	2025-05-20 08:00:00	2025-05-20 14:30:00	2025-05-20
72	7	3	7	2025-05-21 09:00:00	2025-05-21 15:00:00	2025-05-21
73	8	4	8	2025-05-22 13:00:00	2025-05-22 19:00:00	2025-05-22
74	9	5	9	2025-05-23 16:00:00	2025-05-23 22:00:00	2025-05-23
75	10	6	10	2025-05-24 12:00:00	2025-05-24 18:00:00	2025-05-24
76	6	6	7	2025-05-15 07:00:00	2025-05-15 14:00:00	2025-05-15
77	7	8	9	2025-05-16 10:00:00	2025-05-16 16:30:00	2025-05-16
78	8	10	1	2025-05-17 18:00:00	2025-05-18 01:00:00	2025-05-17
79	9	2	3	2025-05-18 05:30:00	2025-05-18 11:30:00	2025-05-18
80	10	4	5	2025-05-19 21:00:00	2025-05-20 04:00:00	2025-05-19
81	6	1	6	2025-05-20 08:00:00	2025-05-20 14:30:00	2025-05-20
82	7	3	7	2025-05-21 09:00:00	2025-05-21 15:00:00	2025-05-21
83	8	4	8	2025-05-22 13:00:00	2025-05-22 19:00:00	2025-05-22
84	9	5	9	2025-05-23 16:00:00	2025-05-23 22:00:00	2025-05-23
85	10	6	10	2025-05-24 12:00:00	2025-05-24 18:00:00	2025-05-24
\.


--
-- TOC entry 3691 (class 0 OID 16862)
-- Dependencies: 228
-- Data for Name: seats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seats (seat_id, car_id, seat_number) FROM stdin;
1	1	1
2	1	2
3	2	1
4	3	1
5	4	1
\.


--
-- TOC entry 3683 (class 0 OID 16803)
-- Dependencies: 220
-- Data for Name: stations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stations (station_id, name, city) FROM stdin;
1	Ленинградский вокзал	Москва
2	Московский вокзал	Санкт-Петербург
3	Главный вокзал	Новосибирск
4	Томск-1	Томск
5	Южный вокзал	Омск
6	Владивостокский вокзал	Владивосток
7	Хабаровский вокзал	Хабаровск
8	Екатеринбургский вокзал	Екатеринбург
9	Челябинский вокзал	Челябинск
10	Нижегородский вокзал	Нижний Новгород
11	Казанский вокзал	Казань
12	Пермский вокзал	Пермь
13	Уфимский вокзал	Уфа
14	Краснодарский вокзал	Краснодар
15	Ростовский вокзал	Ростов
\.


--
-- TOC entry 3693 (class 0 OID 16876)
-- Dependencies: 230
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tickets (ticket_id, user_id, route_id, seat_id, purchase_date) FROM stdin;
1	1	1	1	2025-05-06 14:04:43.228813
2	2	2	2	2025-05-06 14:04:43.228813
3	3	3	3	2025-05-06 14:04:43.228813
4	4	4	4	2025-05-06 14:04:43.228813
5	5	5	5	2025-05-06 14:04:43.228813
\.


--
-- TOC entry 3681 (class 0 OID 16792)
-- Dependencies: 218
-- Data for Name: trains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trains (train_id, train_number, description) FROM stdin;
1	A100	Скорый поезд Москва - СПб
2	B200	Экспресс Новосибирск - Томск
3	C300	Пассажирский Омск - Барнаул
4	D400	Сапсан Москва - Нижний
5	E500	Ночной поезд Казань - Уфа
6	F600	Скорый поезд Владивосток - Хабаровск
7	G700	Экспресс Екатеринбург - Челябинск
8	H800	Пассажирский Нижний - Казань
9	I900	Сапсан Пермь - Уфа
10	J1000	Ночной поезд Краснодар - Ростов
11	K1100	Скорый поезд Тверь - Псков
12	L1200	Экспресс Калининград - Москва
13	M1300	Пассажирский Волгоград - Саратов
14	N1400	Сапсан Иваново - Ярославль
15	O1500	Ночной поезд Смоленск - Витебск
\.


--
-- TOC entry 3679 (class 0 OID 16783)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, name, email, phone) FROM stdin;
1	Иван Иванов	ivan@example.com	7-999-456-789
2	Мария Смирнова	maria@example.com	7-911-567-890
3	Алексей Кузнецов	alex@example.com	7-921-678-901
4	Елена Попова	elena@example.com	7-999-789-012
5	Сергей Соколов	sergey@example.com	7-989-890-123
6	Евгения Игнатова	user01@googlo.com	7-999-123-532
7	Елизвавета Свиягина	test@yandex.ru	7-911-757-143
8	Ирина Олюнина	user04@google.com	7-921-356-451
9	Яна Павлова	user942@google.com	7-999-145-547
10	Сергей Соломин	test2@yandex.ru	7-989-674-653
11	Светлана Игнатова	user012@googlo.com	7-919-677-532
12	Елизвавета Шоринкова	test43@yandex.ru	7-911-879-143
13	Полина Бармакова	user54204@google.com	7-921-968-968
14	Карина Казарян	user94@google.com	7-989-075-706
15	Таня Казакова	test422@yandex.ru	7-999-078-467
\.


--
-- TOC entry 3710 (class 0 OID 0)
-- Dependencies: 223
-- Name: car_types_car_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.car_types_car_type_id_seq', 26, true);


--
-- TOC entry 3711 (class 0 OID 0)
-- Dependencies: 225
-- Name: cars_car_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cars_car_id_seq', 51, true);


--
-- TOC entry 3712 (class 0 OID 0)
-- Dependencies: 231
-- Name: payments_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_payment_id_seq', 74, true);


--
-- TOC entry 3713 (class 0 OID 0)
-- Dependencies: 221
-- Name: routes_route_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.routes_route_id_seq', 85, true);


--
-- TOC entry 3714 (class 0 OID 0)
-- Dependencies: 227
-- Name: seats_seat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seats_seat_id_seq', 55, true);


--
-- TOC entry 3715 (class 0 OID 0)
-- Dependencies: 219
-- Name: stations_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stations_station_id_seq', 35, true);


--
-- TOC entry 3716 (class 0 OID 0)
-- Dependencies: 229
-- Name: tickets_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_ticket_id_seq', 91, true);


--
-- TOC entry 3717 (class 0 OID 0)
-- Dependencies: 217
-- Name: trains_train_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trains_train_id_seq', 35, true);


--
-- TOC entry 3718 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 25, true);


--
-- TOC entry 3508 (class 2606 OID 16841)
-- Name: car_types car_types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_types
    ADD CONSTRAINT car_types_name_key UNIQUE (name);


--
-- TOC entry 3510 (class 2606 OID 16839)
-- Name: car_types car_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_types
    ADD CONSTRAINT car_types_pkey PRIMARY KEY (car_type_id);


--
-- TOC entry 3512 (class 2606 OID 16848)
-- Name: cars cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (car_id);


--
-- TOC entry 3514 (class 2606 OID 16850)
-- Name: cars cars_train_id_car_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_train_id_car_number_key UNIQUE (train_id, car_number);


--
-- TOC entry 3524 (class 2606 OID 16908)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 3506 (class 2606 OID 16815)
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (route_id);


--
-- TOC entry 3516 (class 2606 OID 16869)
-- Name: seats seats_car_id_seat_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_car_id_seat_number_key UNIQUE (car_id, seat_number);


--
-- TOC entry 3518 (class 2606 OID 16867)
-- Name: seats seats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (seat_id);


--
-- TOC entry 3504 (class 2606 OID 16808)
-- Name: stations stations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (station_id);


--
-- TOC entry 3520 (class 2606 OID 16882)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_id);


--
-- TOC entry 3522 (class 2606 OID 16884)
-- Name: tickets tickets_seat_id_route_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_seat_id_route_id_key UNIQUE (seat_id, route_id);


--
-- TOC entry 3500 (class 2606 OID 16799)
-- Name: trains trains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trains
    ADD CONSTRAINT trains_pkey PRIMARY KEY (train_id);


--
-- TOC entry 3502 (class 2606 OID 16801)
-- Name: trains trains_train_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trains
    ADD CONSTRAINT trains_train_number_key UNIQUE (train_number);


--
-- TOC entry 3496 (class 2606 OID 16790)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3498 (class 2606 OID 16788)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3528 (class 2606 OID 16856)
-- Name: cars cars_car_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_car_type_id_fkey FOREIGN KEY (car_type_id) REFERENCES public.car_types(car_type_id);


--
-- TOC entry 3529 (class 2606 OID 16851)
-- Name: cars cars_train_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_train_id_fkey FOREIGN KEY (train_id) REFERENCES public.trains(train_id);


--
-- TOC entry 3534 (class 2606 OID 16909)
-- Name: payments payments_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(ticket_id);


--
-- TOC entry 3525 (class 2606 OID 16826)
-- Name: routes routes_end_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_end_station_id_fkey FOREIGN KEY (end_station_id) REFERENCES public.stations(station_id);


--
-- TOC entry 3526 (class 2606 OID 16821)
-- Name: routes routes_start_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_start_station_id_fkey FOREIGN KEY (start_station_id) REFERENCES public.stations(station_id);


--
-- TOC entry 3527 (class 2606 OID 16816)
-- Name: routes routes_train_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_train_id_fkey FOREIGN KEY (train_id) REFERENCES public.trains(train_id);


--
-- TOC entry 3530 (class 2606 OID 16870)
-- Name: seats seats_car_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.cars(car_id);


--
-- TOC entry 3531 (class 2606 OID 16890)
-- Name: tickets tickets_route_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_route_id_fkey FOREIGN KEY (route_id) REFERENCES public.routes(route_id);


--
-- TOC entry 3532 (class 2606 OID 16895)
-- Name: tickets tickets_seat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_seat_id_fkey FOREIGN KEY (seat_id) REFERENCES public.seats(seat_id);


--
-- TOC entry 3533 (class 2606 OID 16885)
-- Name: tickets tickets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


-- Completed on 2025-05-28 18:22:54 MSK

--
-- PostgreSQL database dump complete
--

