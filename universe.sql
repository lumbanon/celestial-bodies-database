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
    name character varying(50) NOT NULL,
    diameter_km integer NOT NULL,
    is_hazardous boolean
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
    name character varying(50) NOT NULL,
    distance_from_earth numeric NOT NULL,
    galaxy_types character varying(30) NOT NULL,
    age_in_million_of_years integer,
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
    name character varying(50) NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean,
    distance_from_earth numeric NOT NULL,
    description text,
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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    planet_types character varying(30) NOT NULL,
    distance_from_earth numeric NOT NULL,
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
    is_spherical boolean NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric NOT NULL,
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939, false);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, false);
INSERT INTO public.asteroid VALUES (3, 'Apophis', 0, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 'Barred Spiral', 13600, 'The galaxy containing our Solar System');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2500000, 'Spiral', 10000, 'A large neighboring galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 2730000, 'Spiral', 12000, 'A spiral galaxy in the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 53500000, 'Elliptical', 13000, 'A giant elliptical galaxy');
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 163000, 'Irregular', 13000, 'A satellite galaxy of the Milky Way');
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 200000, 'Irregular', 10000, 'A dwarf galaxy near the Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (44, 'Moon', true, 4510, NULL, 0.0000000406, 'Natural satellite of Earth', 7);
INSERT INTO public.moon VALUES (45, 'Phobos', false, NULL, NULL, 0.000008, 'Largest moon of Mars', 8);
INSERT INTO public.moon VALUES (46, 'Deimos', false, NULL, NULL, 0.000008, 'Smallest moon of Mars', 8);
INSERT INTO public.moon VALUES (47, 'Io', true, 4500, NULL, 0.000067, 'Volcanically active moon', 9);
INSERT INTO public.moon VALUES (48, 'Europa', true, 4500, NULL, 0.000067, 'Moon with a subsurface ocean', 9);
INSERT INTO public.moon VALUES (49, 'Ganymede', true, 4500, NULL, 0.000067, 'Largest moon in the Solar System', 9);
INSERT INTO public.moon VALUES (50, 'Callisto', true, 4500, NULL, 0.000067, 'Heavily cratered moon', 9);
INSERT INTO public.moon VALUES (51, 'Amalthea', false, NULL, NULL, 0.000067, 'Irregularly shaped moon of Jupiter', 9);
INSERT INTO public.moon VALUES (52, 'Titan', true, 4500, NULL, 0.000135, 'Largest moon of Saturn', 10);
INSERT INTO public.moon VALUES (53, 'Enceladus', true, NULL, NULL, 0.000135, 'Icy moon with water geysers', 10);
INSERT INTO public.moon VALUES (54, 'Mimas', true, NULL, NULL, 0.000135, 'Moon with a large impact crater', 10);
INSERT INTO public.moon VALUES (55, 'Tethys', true, NULL, NULL, 0.000135, 'Icy moon of Saturn', 10);
INSERT INTO public.moon VALUES (56, 'Dione', true, NULL, NULL, 0.000135, 'Moon with an icy surface', 10);
INSERT INTO public.moon VALUES (57, 'Rhea', true, NULL, NULL, 0.000135, 'Second-largest moon of Saturn', 10);
INSERT INTO public.moon VALUES (58, 'Iapetus', true, NULL, NULL, 0.000135, 'Moon with contrasting surface colors', 10);
INSERT INTO public.moon VALUES (59, 'Miranda', true, NULL, NULL, 0.00029, 'Moon with unusual geological features', 11);
INSERT INTO public.moon VALUES (60, 'Ariel', true, NULL, NULL, 0.00029, 'Bright icy moon of Uranus', 11);
INSERT INTO public.moon VALUES (61, 'Umbriel', true, NULL, NULL, 0.00029, 'Dark moon of Uranus', 11);
INSERT INTO public.moon VALUES (62, 'Titania', true, NULL, NULL, 0.00029, 'Largest moon of Uranus', 11);
INSERT INTO public.moon VALUES (63, 'Triton', true, NULL, NULL, 0.00045, 'Largest moon of Neptune', 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (5, 'Mercury', 'Closest planet to the Sun', false, true, 4500, 'Terrestrial', 0.000012, 1);
INSERT INTO public.planet VALUES (6, 'Venus', 'Hottest planet in the Solar System', NULL, true, 4500, 'Terrestrial', 0.000004, 1);
INSERT INTO public.planet VALUES (7, 'Earth', 'Our home planet', true, true, 4540, 'Terrestrial', 0, 1);
INSERT INTO public.planet VALUES (8, 'Mars', 'The Red Planet', NULL, true, 4600, 'Terrestrial', 0.000008, 1);
INSERT INTO public.planet VALUES (9, 'Jupiter', 'Largest planet', false, true, 4600, 'Gas Giant', 0.000067, 1);
INSERT INTO public.planet VALUES (10, 'Saturn', 'Planet with prominent rings', false, true, 4500, 'Gas Giant', 0.000135, 1);
INSERT INTO public.planet VALUES (11, 'Uranus', 'Ice giant with a tilted axis', false, true, 4500, 'Ice Giant', 0.00029, 1);
INSERT INTO public.planet VALUES (12, 'Neptune', 'Farthest major planet from the Sun', false, true, 4500, 'Ice Giant', 0.00045, 1);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri b', 'Nearby exoplanet', NULL, true, NULL, 'Terrestrial', 4.24, 2);
INSERT INTO public.planet VALUES (14, 'Proxima Centauri d', 'Small exoplanet', NULL, true, NULL, 'Terrestrial', 4.24, 2);
INSERT INTO public.planet VALUES (15, 'Sirius Planet A', 'Fictional sample planet', NULL, true, 200, 'Gas Giant', 8.6, 3);
INSERT INTO public.planet VALUES (16, 'Vega Planet A', 'Fictional sample planet', NULL, true, 400, 'Gas Giant', 25, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (true, 'The central star of our Solar System', 4600, 0.0000158, 1, 'Sun', 1);
INSERT INTO public.star VALUES (true, 'The closest star to the Sun', 4850, 4.24, 2, 'Proxima Centauri', 1);
INSERT INTO public.star VALUES (true, 'The brightest star in the night sky', 242, 8.6, 3, 'Sirius', 1);
INSERT INTO public.star VALUES (true, 'A red supergiant star', 10, 550, 4, 'Betelgeuse', 1);
INSERT INTO public.star VALUES (true, 'A blue supergiant star', 8, 860, 5, 'Rigel', 1);
INSERT INTO public.star VALUES (true, 'A bright star in the Lyra constellation', 455, 25, 6, 'Vega', 1);


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

SELECT pg_catalog.setval('public.moon_moon_id_seq', 63, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


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
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


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

