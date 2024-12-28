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

DROP DATABASE game_info;
--
-- Name: game_info; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE game_info WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE game_info OWNER TO freecodecamp;

\connect game_info

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
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES ('user_1735397965279', 0, 0);
INSERT INTO public.user_info VALUES ('user_1735397965278', 0, 0);
INSERT INTO public.user_info VALUES ('user_1735398005306', 0, 0);
INSERT INTO public.user_info VALUES ('user_1735398005305', 0, 0);
INSERT INTO public.user_info VALUES ('user_1735398043789', 0, 0);
INSERT INTO public.user_info VALUES ('user_1735398043788', 0, 0);
INSERT INTO public.user_info VALUES ('Lizzon', 0, 0);
INSERT INTO public.user_info VALUES ('user_1735398111991', 0, 0);
INSERT INTO public.user_info VALUES ('user_1735398111990', 0, 0);
INSERT INTO public.user_info VALUES ('user_1735398216703', 0, 0);
INSERT INTO public.user_info VALUES ('user_1735398216702', 0, 0);
INSERT INTO public.user_info VALUES ('user_1735398298141', 2, 267);
INSERT INTO public.user_info VALUES ('user_1735398298142', 5, 77);
INSERT INTO public.user_info VALUES ('user_1735398340501', 2, 245);
INSERT INTO public.user_info VALUES ('user_1735398340502', 5, 294);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

