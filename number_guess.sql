--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'test01', 0, NULL);
INSERT INTO public.users VALUES (2, 'test02', 0, 10);
INSERT INTO public.users VALUES (3, 'test03', 0, NULL);
INSERT INTO public.users VALUES (4, 'user_1681348295174', 0, NULL);
INSERT INTO public.users VALUES (5, 'user_1681348295173', 0, NULL);
INSERT INTO public.users VALUES (6, 'test09', 1, 9);
INSERT INTO public.users VALUES (7, 'user_1681362630515', 2, 319);
INSERT INTO public.users VALUES (8, 'user_1681362630514', 2, 24);
INSERT INTO public.users VALUES (9, 'user_1681362830143', 1, 156);
INSERT INTO public.users VALUES (10, 'user_1681362830142', 1, 120);
INSERT INTO public.users VALUES (11, 'test00', 0, NULL);
INSERT INTO public.users VALUES (12, 'user_1681362875665', 2, 244);
INSERT INTO public.users VALUES (13, 'user_1681362875664', 1, 780);
INSERT INTO public.users VALUES (15, 'user_1681362979163', 2, 885);
INSERT INTO public.users VALUES (14, 'user_1681362979164', 2, 168);
INSERT INTO public.users VALUES (16, 'user_1681363035953', 2, 30);
INSERT INTO public.users VALUES (17, 'user_1681363035952', 1, 211);
INSERT INTO public.users VALUES (18, 'user_1681363056801', 1, 147);
INSERT INTO public.users VALUES (19, 'user_1681363056800', 2, 352);
INSERT INTO public.users VALUES (21, 'user_1681363086885', 2, 119);
INSERT INTO public.users VALUES (20, 'user_1681363086886', 2, 15);
INSERT INTO public.users VALUES (22, 'user_1681363105029', 1, 62);
INSERT INTO public.users VALUES (23, 'user_1681363105028', 1, 130);
INSERT INTO public.users VALUES (24, 'user_1681363247414', 1, 302);
INSERT INTO public.users VALUES (25, 'user_1681363247413', 2, 144);
INSERT INTO public.users VALUES (27, 'user_1681363295733', 1, 436);
INSERT INTO public.users VALUES (26, 'user_1681363295734', 4, 454);
INSERT INTO public.users VALUES (28, 'test05', 0, NULL);
INSERT INTO public.users VALUES (29, 'user_1681363404275', 2, 38);
INSERT INTO public.users VALUES (30, 'user_1681363404274', 2, 678);
INSERT INTO public.users VALUES (32, 'user_1681363713022', 1, 202);
INSERT INTO public.users VALUES (31, 'user_1681363713023', 3, 593);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 32, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

