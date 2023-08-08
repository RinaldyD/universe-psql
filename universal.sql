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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    total integer NOT NULL,
    distance numeric(4,1) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: is_spherical; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.is_spherical (
    is_spherical_id integer NOT NULL,
    distance numeric(4,1) NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.is_spherical OWNER TO freecodecamp;

--
-- Name: is_spherical_spherical_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.is_spherical_spherical_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.is_spherical_spherical_id_seq OWNER TO freecodecamp;

--
-- Name: is_spherical_spherical_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.is_spherical_spherical_id_seq OWNED BY public.is_spherical.is_spherical_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    total integer NOT NULL,
    distance numeric(4,1) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    total integer NOT NULL,
    distance numeric(4,1) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    total integer NOT NULL,
    distance numeric(4,1) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: is_spherical is_spherical_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.is_spherical ALTER COLUMN is_spherical_id SET DEFAULT nextval('public.is_spherical_spherical_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'bumi', 1, 203.5, 'ini galaxy bumi', true);
INSERT INTO public.galaxy VALUES (2, 'mars', 4, 155.6, 'ini galaxy mars', false);
INSERT INTO public.galaxy VALUES (3, 'merkurius', 3, 402.5, 'ini galaxy merkurius', false);
INSERT INTO public.galaxy VALUES (4, 'venus', 2, 332.1, 'ini galaxy venus', false);
INSERT INTO public.galaxy VALUES (5, 'jupiter', 4, 111.3, 'ini galaxy jupiter', true);
INSERT INTO public.galaxy VALUES (6, 'neptunus', 6, 884.2, 'ini galaxy neptunus', true);


--
-- Data for Name: is_spherical; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.is_spherical VALUES (4, 112.4, 'yes', 2);
INSERT INTO public.is_spherical VALUES (5, 245.3, 'no', 5);
INSERT INTO public.is_spherical VALUES (6, 934.5, 'both', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', 1, 111.1, 'ini moon1', true, 1);
INSERT INTO public.moon VALUES (2, 'moon2', 2, 222.1, 'ini moon2', false, 2);
INSERT INTO public.moon VALUES (3, 'moon3', 3, 333.1, 'ini moon3', true, 3);
INSERT INTO public.moon VALUES (5, 'moon4', 4, 444.1, 'ini moon4', true, 5);
INSERT INTO public.moon VALUES (6, 'moon5', 4, 444.1, 'ini moon5', true, 6);
INSERT INTO public.moon VALUES (7, 'moon6', 4, 444.1, 'ini moon6', true, 6);
INSERT INTO public.moon VALUES (8, 'moon7', 4, 444.1, 'ini moon7', true, 6);
INSERT INTO public.moon VALUES (9, 'moon8', 8, 888.1, 'ini moon8', false, 2);
INSERT INTO public.moon VALUES (10, 'moon9', 8, 999.1, 'ini moon9', false, 3);
INSERT INTO public.moon VALUES (11, 'moon10', 4, 999.1, 'ini moon10', true, 6);
INSERT INTO public.moon VALUES (12, 'moon11', 4, 999.1, 'ini moon11', true, 1);
INSERT INTO public.moon VALUES (13, 'moon12', 4, 999.1, 'ini moon12', true, 1);
INSERT INTO public.moon VALUES (14, 'moon13', 4, 999.1, 'ini moon13', true, 2);
INSERT INTO public.moon VALUES (15, 'moon14', 4, 999.1, 'ini moon14', true, 3);
INSERT INTO public.moon VALUES (16, 'moon15', 4, 999.1, 'ini moon15', true, 5);
INSERT INTO public.moon VALUES (17, 'moon16', 4, 999.1, 'ini moon16', true, 5);
INSERT INTO public.moon VALUES (18, 'moon17', 4, 999.1, 'ini moon17', true, 5);
INSERT INTO public.moon VALUES (19, 'moon18', 4, 999.1, 'ini moon18', true, 5);
INSERT INTO public.moon VALUES (20, 'moon19', 4, 999.1, 'ini moon19', true, 6);
INSERT INTO public.moon VALUES (21, 'moon20', 4, 999.1, 'ini moon20', true, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet1', 2, 110.1, 'ini planet1', true, 2);
INSERT INTO public.planet VALUES (2, 'planet2', 4, 110.4, 'ini planet2', true, 3);
INSERT INTO public.planet VALUES (3, 'planet3', 1, 110.5, 'ini planet3', false, 5);
INSERT INTO public.planet VALUES (5, 'planet4', 1, 110.5, 'ini planet4', false, 6);
INSERT INTO public.planet VALUES (6, 'planet5', 5, 110.9, 'ini planet5', true, 2);
INSERT INTO public.planet VALUES (7, 'planet6', 2, 115.4, 'ini planet6', true, 7);
INSERT INTO public.planet VALUES (8, 'planet7', 4, 115.4, 'ini planet7', false, 7);
INSERT INTO public.planet VALUES (9, 'planet8', 4, 115.4, 'ini planet8', false, 7);
INSERT INTO public.planet VALUES (10, 'planet9', 4, 115.4, 'ini planet9', false, 7);
INSERT INTO public.planet VALUES (11, 'planet10', 4, 115.4, 'ini planet10', false, 7);
INSERT INTO public.planet VALUES (12, 'planet11', 8, 135.4, 'ini planet11', false, 6);
INSERT INTO public.planet VALUES (13, 'planet12', 9, 535.4, 'ini planet12', true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'matahari', 1, 342.6, 'ini bintang matahari', false, 1);
INSERT INTO public.star VALUES (3, 'sirius', 3, 883.3, 'ini bintang sirius', false, 2);
INSERT INTO public.star VALUES (5, 'vega', 6, 224.5, 'ini bintang vega', false, 1);
INSERT INTO public.star VALUES (6, 'aldebaran', 2, 298.4, 'ini bintang aldebaran', false, 1);
INSERT INTO public.star VALUES (7, 'altair', 2, 298.4, 'ini bintang altair', false, 4);
INSERT INTO public.star VALUES (8, 'canopus', 5, 883.1, 'ini bintang canopus', true, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: is_spherical_spherical_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.is_spherical_spherical_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: is_spherical is_spherical_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.is_spherical
    ADD CONSTRAINT is_spherical_name_key UNIQUE (name);


--
-- Name: is_spherical is_spherical_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.is_spherical
    ADD CONSTRAINT is_spherical_pkey PRIMARY KEY (is_spherical_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

