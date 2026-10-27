--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    description text
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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_types character varying(30),
    distance_from_earth numeric,
    description text
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    age_in_millions_of_years numeric,
    is_spherical boolean,
    distance_from_earth numeric,
    description text
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
    name character varying(30) NOT NULL,
    star_id integer,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    planet_types character varying(30),
    distance_from_earth numeric,
    description text
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    distance_from_earth numeric,
    description text,
    number_of_planets integer,
    age_in_millions_of_years integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1, 'A dwarf planet and asteroid');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 1, 'One of the largest objects in the asteroid belt');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 1, 'A large asteroid in the asteroid belt');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 'Galaksi tempat tata surya berada');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, 'Galaksi besar terdekat');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2730000, 'Galaksi di Grup Lokal');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000000, 'A spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 29000000, 'A bright galaxy with a large central bulge');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 53500000, 'A giant elliptical galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 4500, true, 384400, 'Satelit alami Bumi');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 4500, false, 9376, 'Satelit Mars');
INSERT INTO public.moon VALUES (3, 'Europa', 3, 4500, true, 628300000, 'Satelit alami Jupiter');
INSERT INTO public.moon VALUES (4, 'Deimos', 2, 4500, false, 23460, 'A small moon of Mars');
INSERT INTO public.moon VALUES (5, 'Io', 3, 4500, true, 628300000, 'A volcanic moon of Jupiter');
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 4500, true, 628300000, 'The largest moon in the Solar System');
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4500, true, 628300000, 'A heavily cratered moon of Jupiter');
INSERT INTO public.moon VALUES (8, 'Mimas', 4, 4500, true, 1270000000, 'A small moon of Saturn');
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 4500, true, 1270000000, 'An icy moon of Saturn');
INSERT INTO public.moon VALUES (10, 'Tethys', 4, 4500, true, 1270000000, 'A moon of Saturn');
INSERT INTO public.moon VALUES (11, 'Dione', 4, 4500, true, 1270000000, 'An icy moon of Saturn');
INSERT INTO public.moon VALUES (12, 'Rhea', 4, 4500, true, 1270000000, 'A moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Titan', 4, 4500, true, 1270000000, 'A moon with a thick atmosphere');
INSERT INTO public.moon VALUES (14, 'Iapetus', 4, 4500, true, 1270000000, 'A moon of Saturn');
INSERT INTO public.moon VALUES (15, 'Miranda', 5, 4500, true, 2600000000, 'A moon of Uranus');
INSERT INTO public.moon VALUES (16, 'Ariel', 5, 4500, true, 2600000000, 'A moon of Uranus');
INSERT INTO public.moon VALUES (17, 'Umbriel', 5, 4500, true, 2600000000, 'A moon of Uranus');
INSERT INTO public.moon VALUES (18, 'Titania', 5, 4500, true, 2600000000, 'The largest moon of Uranus');
INSERT INTO public.moon VALUES (19, 'Oberon', 5, 4500, true, 2600000000, 'A moon of Uranus');
INSERT INTO public.moon VALUES (20, 'Triton', 6, 4500, true, 4300000000, 'The largest moon of Neptune');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, true, 4540, 'Terrestrial', 0, 'Planet tempat manusia hidup');
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, true, 4500, 'Terrestrial', 0.000012, 'Planet merah');
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, false, true, 4600, 'Gas Giant', 0.0006, 'Planet terbesar di tata surya');
INSERT INTO public.planet VALUES (4, 'Mercury', 1, false, true, 4500, 'Terrestrial', 0.000006, 'The smallest planet in the Solar System');
INSERT INTO public.planet VALUES (5, 'Venus', 1, false, true, 4500, 'Terrestrial', 0.000004, 'A hot planet with a thick atmosphere');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, true, 4500, 'Gas Giant', 0.0009, 'A gas giant known for its rings');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, true, 4500, 'Ice Giant', 0.001, 'An ice giant with a tilted axis');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, true, 4500, 'Ice Giant', 0.001, 'The farthest major planet from the Sun');
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 2, false, true, 4000, 'Exoplanet', 600, 'An exoplanet orbiting another star');
INSERT INTO public.planet VALUES (10, 'Proxima b', 3, false, true, 4800, 'Exoplanet', 4.24, 'An exoplanet orbiting Proxima Centauri');
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 2, false, true, 4600, 'Exoplanet', 1400, 'An exoplanet orbiting a Sun-like star');
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1b', 3, false, true, 7600, 'Exoplanet', 39, 'A rocky exoplanet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 0, 'Bintang pusat tata surya', 8, 4600);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 8.6, 'Bintang terang di langit malam', 0, 242);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 4.24, 'Bintang terdekat dari Matahari', 0, 4850);
INSERT INTO public.star VALUES (4, 'Vega', 2, 25, 'A bright blue-white star', 0, 455);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 642, 'A red supergiant star', 0, 10);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 860, 'A blue supergiant star', 0, 8);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

