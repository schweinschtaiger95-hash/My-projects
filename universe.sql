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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    brightest_star text NOT NULL,
    area_sq_degrees integer,
    is_visible_northern_hemisphere boolean NOT NULL,
    is_zodiac boolean
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_types character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    has_massive_black_hole boolean,
    diameter_in_light_years integer NOT NULL
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    is_habitable boolean NOT NULL,
    has_water boolean,
    radius_in_km integer,
    orbital_period_days numeric(10,1),
    discovery_notes text
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_star numeric(10,2),
    number_of_moons integer,
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
    galaxy_id integer NOT NULL,
    temperature integer,
    mass numeric(10,2),
    has_planets boolean
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Rigel', 594, true, false);
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'Alioth', 1280, true, false);
INSERT INTO public.constellation VALUES (3, 'Leo', 'Regulus', 947, true, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our home galaxy', 13600, true, 200000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Closest galaxy', 10000, true, 400000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Flat', 'Third-largest member of the Local Group', 12000, false, 50000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Flat', 'Known for its bright nucleus', 13000, true, 300000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 'Classic spiral galaxy structure', 400, true, 100000);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Flat', 'Features a dark band of absorbing dust', 13000, true, 140000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, false, true, 1737, 27.3, 'The Earths only natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, false, 11, 0.3, 'Lumpy Martian moon');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, false, 6, 1.3, 'Smaller Martian moon');
INSERT INTO public.moon VALUES (4, 'Io', 5, false, false, 1821, 1.8, 'Most volcanic body in the solar system');
INSERT INTO public.moon VALUES (5, 'Europa', 5, false, true, 1560, 3.5, 'Subsurface ocean potential');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, false, true, 2634, 7.2, 'Largest moon in the solar system');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, false, true, 2410, 16.7, 'Heavily cratered');
INSERT INTO public.moon VALUES (8, 'Titan', 6, false, true, 2574, 15.9, 'Thick nitrogen atmosphere');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, false, true, 252, 1.4, 'Icy geysers');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, false, false, 198, 0.9, 'Resembles the Death Star');
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, false, false, 734, 79.3, 'Two-toned coloration');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, false, true, 763, 4.5, 'Second largest moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Miranda', 7, false, true, 235, 1.4, 'Extreme topography');
INSERT INTO public.moon VALUES (14, 'Ariel', 7, false, true, 578, 2.5, 'Brightest moon of Uranus');
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, false, false, 584, 4.1, 'Very dark surface');
INSERT INTO public.moon VALUES (16, 'Titania', 7, false, true, 788, 8.7, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (17, 'Oberon', 7, false, true, 761, 13.5, 'Old, cratered surface');
INSERT INTO public.moon VALUES (18, 'Triton', 8, false, true, 1353, 5.9, 'Retrograde orbit');
INSERT INTO public.moon VALUES (19, 'Proteus', 8, false, false, 210, 1.1, 'Irregularly shaped');
INSERT INTO public.moon VALUES (20, 'Nereid', 8, false, false, 170, 360.1, 'Highly eccentric orbit');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, true, 0.39, 0, 'Smallest planet');
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, true, 0.72, 0, 'Hottest planet');
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, true, 1.00, 1, 'Our home');
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, true, 1.52, 2, 'The red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, true, 5.20, 79, 'Gas giant');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, true, 9.54, 82, 'Ringed planet');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, true, 19.22, 27, 'Ice giant');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, true, 30.06, 14, 'Windiest planet');
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, false, true, 0.05, 0, 'Exoplanet in habitable zone');
INSERT INTO public.planet VALUES (10, 'Sirius Prime', 3, false, true, 2.50, 3, 'Massive rocky world');
INSERT INTO public.planet VALUES (11, 'Andromeda-P1', 4, false, true, 1.10, 5, 'Distant world');
INSERT INTO public.planet VALUES (12, 'Triangulum-P1', 5, false, true, 0.85, 0, 'Volcanic planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 1.00, true);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 5790, 1.10, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 9940, 2.06, false);
INSERT INTO public.star VALUES (4, 'Andromeda Alpha', 2, 9600, 3.60, true);
INSERT INTO public.star VALUES (5, 'M33-Star1', 3, 15000, 10.50, false);
INSERT INTO public.star VALUES (6, 'Sombrero-Star1', 4, 12000, 5.20, true);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


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
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

