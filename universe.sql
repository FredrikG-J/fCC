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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    name character varying(255) NOT NULL,
    moon_id character varying(255) NOT NULL,
    size integer,
    asteroid_id integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: asteroid_name_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_name_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_name_seq OWNER TO freecodecamp;

--
-- Name: asteroid_name_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_name_seq OWNED BY public.asteroid.name;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    distance_from_earth_km integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    galaxy_id character varying(255) NOT NULL,
    nickname character varying(255),
    name character varying(255)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_name_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_name_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_name_seq OWNER TO freecodecamp;

--
-- Name: galaxy_name_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_name_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    distance_from_earth_km integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    moon_id character varying(255) NOT NULL,
    planet_id character varying(255),
    name character varying(255),
    nickname character varying(255)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_name_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_name_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_name_seq OWNER TO freecodecamp;

--
-- Name: moon_name_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_name_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    distance_from_earth_km integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    description text,
    has_life boolean,
    planet_id character varying(255) NOT NULL,
    star_id character varying(255),
    nickname character varying(255),
    name character varying(255)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_name_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_name_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_name_seq OWNER TO freecodecamp;

--
-- Name: planet_name_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_name_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    distance_from_earth_km integer,
    age_in_millions_of_years integer,
    size numeric,
    has_life boolean,
    galaxy_id character varying(255) NOT NULL,
    star_id character varying(255) NOT NULL,
    nickname character varying(255),
    name character varying(255)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_name_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_name_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_name_seq OWNER TO freecodecamp;

--
-- Name: star_name_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_name_seq OWNED BY public.star.star_id;


--
-- Name: asteroid name; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN name SET DEFAULT nextval('public.asteroid_name_seq'::regclass);


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_name_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_name_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_name_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_name_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES ('Ted', 'Moon', 5, 1);
INSERT INTO public.asteroid VALUES ('Red', 'Moon', 5, 2);
INSERT INTO public.asteroid VALUES ('Led', 'Moon', 5, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (100000, 1000, 'Milky Way', NULL, NULL);
INSERT INTO public.galaxy VALUES (5550, 50, 'Silly Way', NULL, NULL);
INSERT INTO public.galaxy VALUES (5550, 50, 'Willy Way', NULL, NULL);
INSERT INTO public.galaxy VALUES (5550, 50, 'Milly Way', NULL, NULL);
INSERT INTO public.galaxy VALUES (5550, 50, 'Nilly Way', NULL, NULL);
INSERT INTO public.galaxy VALUES (5550, 50, 'Xilly Way', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (550, 0, 'Moon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'Loon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'Spoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LQoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LWoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LEoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LRoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LToon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LYoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LUoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LIoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LAoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LSoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LDoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LFoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LGoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LHoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LJoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LKoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LLoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LZoon', 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (550, 0, 'LXoon', 'Earth', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (0, 1, 'home', true, 'Earth', 'Sun', NULL, NULL);
INSERT INTO public.planet VALUES (0, 1, 'home', true, 'Bearth', 'Wun', NULL, NULL);
INSERT INTO public.planet VALUES (0, 1, 'home', true, 'Kearth', 'Wun', NULL, NULL);
INSERT INTO public.planet VALUES (0, 1, 'home', true, 'Wearth', 'Wun', NULL, NULL);
INSERT INTO public.planet VALUES (0, 1, 'home', true, 'Rearth', 'Wun', NULL, NULL);
INSERT INTO public.planet VALUES (0, 1, 'home', true, 'Zearth', 'Wun', NULL, NULL);
INSERT INTO public.planet VALUES (0, 1, 'home', true, 'Cearth', 'Wun', NULL, NULL);
INSERT INTO public.planet VALUES (0, 1, 'home', true, 'Vearth', 'Wun', NULL, NULL);
INSERT INTO public.planet VALUES (0, 1, 'home', true, 'Hearth', 'Wun', NULL, NULL);
INSERT INTO public.planet VALUES (0, 1, 'home', true, 'Nearth', 'Wun', NULL, NULL);
INSERT INTO public.planet VALUES (0, 1, 'home', true, 'Mearth', 'Wun', NULL, NULL);
INSERT INTO public.planet VALUES (0, 1, 'home', true, 'Jearth', 'Wun', NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (5000, 500, 1.2, true, 'Milky Way', 'Sun', NULL, NULL);
INSERT INTO public.star VALUES (50, 500, 12, true, 'Milky Way', 'Wun', NULL, NULL);
INSERT INTO public.star VALUES (50, 500, 12, true, 'Milky Way', 'Pun', NULL, NULL);
INSERT INTO public.star VALUES (50, 500, 12, true, 'Milky Way', 'Zun', NULL, NULL);
INSERT INTO public.star VALUES (50, 500, 12, true, 'Milky Way', 'Aun', NULL, NULL);
INSERT INTO public.star VALUES (50, 500, 12, true, 'Milky Way', 'Iun', NULL, NULL);
INSERT INTO public.star VALUES (50, 500, 12, true, 'Milky Way', 'Lun', NULL, NULL);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: asteroid_name_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_name_seq', 1, false);


--
-- Name: galaxy_name_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_name_seq', 1, false);


--
-- Name: moon_name_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_name_seq', 1, false);


--
-- Name: planet_name_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_name_seq', 1, false);


--
-- Name: star_name_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_name_seq', 1, false);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (galaxy_id);


--
-- Name: asteroid unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_name2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name2 UNIQUE (planet_id);


--
-- Name: moon unique_name3; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name3 UNIQUE (moon_id);


--
-- Name: star unique_name4; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name4 UNIQUE (star_id);


--
-- Name: galaxy unique_name5; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name5 UNIQUE (galaxy_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: asteroid fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT fk_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

