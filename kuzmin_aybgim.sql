--
-- PostgreSQL database dump
--

\restrict c3ji1OmswArj1BxLgUHTz9ellPNJW3Nms07jTPFHgIq6COeL3rUpeJAGJOv10ct

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-14 16:41:14

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
-- TOC entry 226 (class 1259 OID 16721)
-- Name: disciplines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disciplines (
    discipline_id integer NOT NULL,
    discipline_name character varying(100) NOT NULL,
    hours integer NOT NULL,
    CONSTRAINT disciplines_hours_check CHECK ((hours > 0))
);


ALTER TABLE public.disciplines OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16720)
-- Name: disciplines_discipline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disciplines_discipline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.disciplines_discipline_id_seq OWNER TO postgres;

--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 225
-- Name: disciplines_discipline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disciplines_discipline_id_seq OWNED BY public.disciplines.discipline_id;


--
-- TOC entry 220 (class 1259 OID 16496)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    group_id integer NOT NULL,
    group_name character varying(20) NOT NULL,
    specialty character varying(100) NOT NULL,
    admission_year integer NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16495)
-- Name: groups_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groups_group_id_seq OWNER TO postgres;

--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 219
-- Name: groups_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_group_id_seq OWNED BY public.groups.group_id;


--
-- TOC entry 228 (class 1259 OID 16734)
-- Name: lessons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lessons (
    lesson_id integer NOT NULL,
    group_id integer NOT NULL,
    discipline_id integer NOT NULL,
    teacher_id integer NOT NULL,
    lesson_date date NOT NULL,
    lesson_type character varying(30) NOT NULL
);


ALTER TABLE public.lessons OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16733)
-- Name: lessons_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lessons_lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lessons_lesson_id_seq OWNER TO postgres;

--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 227
-- Name: lessons_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lessons_lesson_id_seq OWNED BY public.lessons.lesson_id;


--
-- TOC entry 222 (class 1259 OID 16509)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    students_id integer NOT NULL,
    last_name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    middle_name character varying(50),
    birth_date date NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16508)
-- Name: students_students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_students_id_seq OWNER TO postgres;

--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 221
-- Name: students_students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_students_id_seq OWNED BY public.students.students_id;


--
-- TOC entry 224 (class 1259 OID 16526)
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    teacher_id integer NOT NULL,
    last_name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    department character varying(100) NOT NULL
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16525)
-- Name: teachers_teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teachers_teacher_id_seq OWNER TO postgres;

--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 223
-- Name: teachers_teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_teacher_id_seq OWNED BY public.teachers.teacher_id;


--
-- TOC entry 4748 (class 2604 OID 16724)
-- Name: disciplines discipline_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines ALTER COLUMN discipline_id SET DEFAULT nextval('public.disciplines_discipline_id_seq'::regclass);


--
-- TOC entry 4745 (class 2604 OID 16499)
-- Name: groups group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN group_id SET DEFAULT nextval('public.groups_group_id_seq'::regclass);


--
-- TOC entry 4749 (class 2604 OID 16737)
-- Name: lessons lesson_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons ALTER COLUMN lesson_id SET DEFAULT nextval('public.lessons_lesson_id_seq'::regclass);


--
-- TOC entry 4746 (class 2604 OID 16512)
-- Name: students students_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN students_id SET DEFAULT nextval('public.students_students_id_seq'::regclass);


--
-- TOC entry 4747 (class 2604 OID 16529)
-- Name: teachers teacher_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN teacher_id SET DEFAULT nextval('public.teachers_teacher_id_seq'::regclass);


--
-- TOC entry 4923 (class 0 OID 16721)
-- Dependencies: 226
-- Data for Name: disciplines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disciplines (discipline_id, discipline_name, hours) FROM stdin;
1	Основы проектирование баз данных	72
2	Информационные технологии	72
3	Программирование	144
4	Компьютерные сети	72
\.


--
-- TOC entry 4917 (class 0 OID 16496)
-- Dependencies: 220
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (group_id, group_name, specialty, admission_year) FROM stdin;
3	ЭК-21	Экономика	2026
1	П-21	Програмирование	2026
4	ТЕСТ-01	Тестовая специальность	2026
5	П-23	Программирование	2026
\.


--
-- TOC entry 4925 (class 0 OID 16734)
-- Dependencies: 228
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lessons (lesson_id, group_id, discipline_id, teacher_id, lesson_date, lesson_type) FROM stdin;
5	3	2	2	2026-09-12	Практика
1	1	1	1	2026-09-10	Лекция
2	1	3	3	2026-09-11	Практика
\.


--
-- TOC entry 4919 (class 0 OID 16509)
-- Dependencies: 222
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (students_id, last_name, first_name, middle_name, birth_date, group_id) FROM stdin;
5	Смирнова	Елена	Андреевна	2006-09-27	3
1	Иванов	Иван	Иванович	2007-03-15	1
2	Петров	Алексей	Сергеевич	2007-07-21	1
\.


--
-- TOC entry 4921 (class 0 OID 16526)
-- Dependencies: 224
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (teacher_id, last_name, first_name, department) FROM stdin;
1	Волков	Александр	Информационные технологии
2	Орлова	Мария	Общещбразовательные дисциплины
3	Фёдоров	Дмитрий	Программирование
\.


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 225
-- Name: disciplines_discipline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disciplines_discipline_id_seq', 4, true);


--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 219
-- Name: groups_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_group_id_seq', 5, true);


--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 227
-- Name: lessons_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lessons_lesson_id_seq', 5, true);


--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 221
-- Name: students_students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_students_id_seq', 8, true);


--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 223
-- Name: teachers_teacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_teacher_id_seq', 3, true);


--
-- TOC entry 4760 (class 2606 OID 16732)
-- Name: disciplines disciplines_discipline_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_discipline_name_key UNIQUE (discipline_name);


--
-- TOC entry 4762 (class 2606 OID 16730)
-- Name: disciplines disciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_pkey PRIMARY KEY (discipline_id);


--
-- TOC entry 4752 (class 2606 OID 16507)
-- Name: groups groups_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_group_name_key UNIQUE (group_name);


--
-- TOC entry 4754 (class 2606 OID 16505)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (group_id);


--
-- TOC entry 4764 (class 2606 OID 16745)
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (lesson_id);


--
-- TOC entry 4756 (class 2606 OID 16519)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (students_id);


--
-- TOC entry 4758 (class 2606 OID 16535)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (teacher_id);


--
-- TOC entry 4766 (class 2606 OID 16751)
-- Name: lessons fk_lessons_disciplines; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT fk_lessons_disciplines FOREIGN KEY (discipline_id) REFERENCES public.disciplines(discipline_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4767 (class 2606 OID 16746)
-- Name: lessons fk_lessons_groups; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT fk_lessons_groups FOREIGN KEY (group_id) REFERENCES public.groups(group_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4768 (class 2606 OID 16756)
-- Name: lessons fk_lessons_teachers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT fk_lessons_teachers FOREIGN KEY (teacher_id) REFERENCES public.teachers(teacher_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4765 (class 2606 OID 16520)
-- Name: students fk_students_groups; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT fk_students_groups FOREIGN KEY (group_id) REFERENCES public.groups(group_id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2026-10-14 16:41:14

--
-- PostgreSQL database dump complete
--

\unrestrict c3ji1OmswArj1BxLgUHTz9ellPNJW3Nms07jTPFHgIq6COeL3rUpeJAGJOv10ct

