--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: leaderboard; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.leaderboard (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.leaderboard OWNER TO freecodecamp;

--
-- Data for Name: leaderboard; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.leaderboard VALUES ('K', NULL, NULL);
INSERT INTO public.leaderboard VALUES ('L', NULL, NULL);
INSERT INTO public.leaderboard VALUES ('Main', NULL, NULL);
INSERT INTO public.leaderboard VALUES ('user_1734352851696', 2, 202);
INSERT INTO public.leaderboard VALUES ('user_1734352851697', 5, 253);
INSERT INTO public.leaderboard VALUES ('user_1734352891063', 2, 381);
INSERT INTO public.leaderboard VALUES ('user_1734352891064', 5, 754);
INSERT INTO public.leaderboard VALUES ('user_1734352950121', 2, 795);
INSERT INTO public.leaderboard VALUES ('user_1734352950122', 5, 7);
INSERT INTO public.leaderboard VALUES ('Bond', 5, 1);
INSERT INTO public.leaderboard VALUES ('user_1734353144759', 2, 104);
INSERT INTO public.leaderboard VALUES ('user_1734353144760', 5, 124);
INSERT INTO public.leaderboard VALUES ('Kain', 3, NULL);
INSERT INTO public.leaderboard VALUES ('user_1734353781016', 2, 47);
INSERT INTO public.leaderboard VALUES ('user_1734353781017', 5, 381);
INSERT INTO public.leaderboard VALUES ('user_1734353877287', 2, 51);
INSERT INTO public.leaderboard VALUES ('user_1734353877288', 5, 189);


--
-- Name: leaderboard leaderboard_username_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.leaderboard
    ADD CONSTRAINT leaderboard_username_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

