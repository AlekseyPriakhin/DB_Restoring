--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.2

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
-- Name: course_completing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_completing (
    id integer NOT NULL,
    uid integer,
    cid integer,
    status integer DEFAULT 0
);


ALTER TABLE public.course_completing OWNER TO postgres;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    stages_count integer NOT NULL
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: stage_course_completing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stage_course_completing (
    sid integer NOT NULL,
    cid integer NOT NULL,
    progress integer DEFAULT 0
);


ALTER TABLE public.stage_course_completing OWNER TO postgres;

--
-- Name: stages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stages (
    id integer NOT NULL,
    cid integer,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    duration interval DEFAULT '00:00:00'::interval
);


ALTER TABLE public.stages OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: course_completing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_completing (id, uid, cid, status) FROM stdin;
1	1	1	2
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (id, name, stages_count) FROM stdin;
1	Course 1	2
\.


--
-- Data for Name: stage_course_completing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stage_course_completing (sid, cid, progress) FROM stdin;
1	1	100
2	1	98
\.


--
-- Data for Name: stages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stages (id, cid, name, type, duration) FROM stdin;
1	1	Stage 1	1	00:45:00
2	1	Stage 2	3	00:00:00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name) FROM stdin;
1	Alex
\.


--
-- Name: course_completing course_completing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_completing
    ADD CONSTRAINT course_completing_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: stage_course_completing stage_course_completing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stage_course_completing
    ADD CONSTRAINT stage_course_completing_pkey PRIMARY KEY (sid, cid);


--
-- Name: stages stages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stages
    ADD CONSTRAINT stages_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: course_completing course_completing_cid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_completing
    ADD CONSTRAINT course_completing_cid_fkey FOREIGN KEY (cid) REFERENCES public.courses(id);


--
-- Name: course_completing course_completing_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_completing
    ADD CONSTRAINT course_completing_uid_fkey FOREIGN KEY (uid) REFERENCES public.users(id);


--
-- Name: stage_course_completing stage_course_completing_cid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stage_course_completing
    ADD CONSTRAINT stage_course_completing_cid_fkey FOREIGN KEY (cid) REFERENCES public.course_completing(id);


--
-- Name: stage_course_completing stage_course_completing_sid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stage_course_completing
    ADD CONSTRAINT stage_course_completing_sid_fkey FOREIGN KEY (sid) REFERENCES public.stages(id);


--
-- Name: stages stages_cid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stages
    ADD CONSTRAINT stages_cid_fkey FOREIGN KEY (cid) REFERENCES public.courses(id);


--
-- PostgreSQL database dump complete
--

