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
-- Name: cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cluster (
    cluster_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth_light_years numeric(12,2),
    number_of_galaxies integer
);


ALTER TABLE public.cluster OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cluster_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cluster_cluster_id_seq OWNED BY public.cluster.cluster_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_types character varying(30),
    description text,
    age_in_millions_of_years numeric(10,2),
    cluster_id integer
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
    description text,
    has_life boolean,
    distance_from_earth_light_years numeric(10,2),
    planet_id integer
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
    description text,
    planet_type character varying(30),
    has_life boolean,
    star_id integer,
    distance_from_earth_light_years integer
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
    description text,
    age_in_millions_of_years integer NOT NULL,
    galaxy_id integer
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
-- Name: cluster cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster ALTER COLUMN cluster_id SET DEFAULT nextval('public.cluster_cluster_id_seq'::regclass);


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
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cluster VALUES (1, 'Local Group', 'Galaxy group that includes the Milky Way and Andromeda.', 0.00, 3);
INSERT INTO public.cluster VALUES (2, 'Virgo Cluster', 'Large cluster containing many galaxies.', 65000000.00, 1300);
INSERT INTO public.cluster VALUES (3, 'Coma Cluster', 'Dense galaxy cluster.', 320000000.00, 1000);
INSERT INTO public.cluster VALUES (4, 'Perseus Cluster', 'Massive galaxy cluster with strong X-ray emissions.', 240000000.00, 500);
INSERT INTO public.cluster VALUES (5, 'Fornax Cluster', 'Nearby galaxy cluster in southern sky.', 62000000.00, 58);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 'The galaxy that contains our Solar System.', 13600.00, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', 'Nearest major galaxy to the Milky Way.', 10000.00, 1);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'spiral', 'Small spiral galaxy in the Local Group.', 10000.00, 1);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'spiral', 'Interacting spiral galaxy.', 400.00, 2);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'spiral', 'Bright bulge and dust lane galaxy.', 9000.00, 5);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'elliptical', 'Giant elliptical galaxy with black hole.', 13000.00, 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth moon.', false, 0.00, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars moon.', false, 0.00, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars moon.', false, 0.00, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanic moon.', false, 0.00, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Ice moon with ocean.', false, 0.00, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon.', false, 0.00, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Cratered moon.', false, 0.00, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Thick atmosphere moon.', false, 0.00, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Ice moon.', false, 0.00, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'Two-tone surface moon.', false, 0.00, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 'Ice moon.', false, 0.00, 6);
INSERT INTO public.moon VALUES (12, 'Triton', 'Neptune moon.', false, 0.00, 8);
INSERT INTO public.moon VALUES (13, 'Nereid', 'Irregular moon.', false, 0.00, 8);
INSERT INTO public.moon VALUES (14, 'Charon', 'Pluto system moon.', false, 0.00, 9);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Uranus moon.', false, 0.00, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Bright icy moon.', false, 0.00, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Dark moon.', false, 0.00, 7);
INSERT INTO public.moon VALUES (18, 'Titania', 'Largest Uranus moon.', false, 0.00, 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 'Outer moon.', false, 0.00, 7);
INSERT INTO public.moon VALUES (20, 'Enceladus', 'Geyser moon.', false, 0.00, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Home planet with life.', 'terrestrial', true, 1, 0);
INSERT INTO public.planet VALUES (2, 'Mars', 'Red planet.', 'terrestrial', false, 1, 0);
INSERT INTO public.planet VALUES (3, 'Venus', 'Hot planet.', 'terrestrial', false, 1, 0);
INSERT INTO public.planet VALUES (4, 'Mercury', 'Closest planet to Sun.', 'terrestrial', false, 1, 0);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas giant.', 'gas giant', false, 1, 0);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Ringed gas giant.', 'gas giant', false, 1, 0);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant.', 'ice giant', false, 1, 0);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Cold ice giant.', 'ice giant', false, 1, 0);
INSERT INTO public.planet VALUES (9, 'Kepler-442b', 'Habitable zone exoplanet.', 'super-Earth', false, 2, 1200);
INSERT INTO public.planet VALUES (10, 'Proxima b', 'Closest exoplanet.', 'terrestrial', false, 5, 4);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 'Rocky exoplanet.', 'terrestrial', false, 3, 40);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 'Hot Jupiter exoplanet.', 'gas giant', false, 2, 150);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Star at the center of Solar System.', 4600, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in night sky.', 300, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant star.', 10000, 1);
INSERT INTO public.star VALUES (4, 'Rigel', 'Blue supergiant star.', 8000, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Closest star to Earth.', 4500, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'Bright star in Lyra constellation.', 455, 1);


--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cluster_cluster_id_seq', 5, true);


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
-- Name: cluster cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_name_key UNIQUE (name);


--
-- Name: cluster cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_pkey PRIMARY KEY (cluster_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(cluster_id);


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

