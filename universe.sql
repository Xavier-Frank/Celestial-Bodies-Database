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
    name character varying(30) NOT NULL,
    description text,
    galaxy_type character varying(20) NOT NULL,
    age_in_billions_of_years numeric(5,3)
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
    age_in_millions_of_years numeric(5,2),
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
    name character varying(30) NOT NULL,
    description text,
    age_in_billions_of_years numeric(5,2),
    distance_from_earth_in_billions_km numeric(5,2),
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    is_spherical boolean,
    name character varying(30),
    has_life boolean NOT NULL,
    number_of_moons integer,
    orbiting_stars integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_billions_of_years numeric(3,2),
    distance_from_earth_in_light_years numeric(5,2),
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Has a linear, starry bar at its center', 'spiral', 13.600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'the nearest spiral galaxy to our Milky way', 'spiral', 10.100);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', 'it is an interacting grand-design spiral galaxy with a Seyfert 2 active galactic nucleus', 'spiral', 4.003);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel Galaxy', 'Its visual appearacnce is similaar to a spoked cartwheel', 'lenticular', 0.002);
INSERT INTO public.galaxy VALUES (5, 'NGC 6872', 'A Barred spiral galaxy in Pavo constellation and is 212 million light years away', 'spiral', 5.030);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'this is a satellite galaxy of the Milky way galaxy', 'Dwarf irregular', 6.500);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'exponentially large and spherical moon tidally locked and orbits earth', 4.50, 12);
INSERT INTO public.moon VALUES (2, 'Phobos', 'One of the two small moons orbiting Mars', 4.50, 3);
INSERT INTO public.moon VALUES (3, 'Deimos', 'One of the two small potato shaped moons orbiting Mars', 4.50, 3);
INSERT INTO public.moon VALUES (4, 'Calisto', 'One of the moon on the gas giant in the solar system', 4.60, 4);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'one of the moons orbiting the gast giant in the solar system', 4.50, 4);
INSERT INTO public.moon VALUES (6, 'Io', 'One of the spherical moons on the gas giant in the solar system', 4.50, 4);
INSERT INTO public.moon VALUES (7, 'Europa', 'One of the relatively large moons on orbiting the gas giant in the solar system', 4.50, 4);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'A dwarf potatoe shaped moon on orbiting the gas giant in the solar system', 4.60, 4);
INSERT INTO public.moon VALUES (9, 'Himilia', 'a small moon orbiting around the gas giant in the solar system', 4.50, 4);
INSERT INTO public.moon VALUES (10, 'Thebe', 'A small moon orbiting around the gas giant int he solar system', 4.50, 4);
INSERT INTO public.moon VALUES (11, 'Elara', 'a small moon orbiting around the gas giant inthe solar system', 4.10, 4);
INSERT INTO public.moon VALUES (12, 'Pasiphae', 'a small moon orbiting the gas giant inthe solar system', 4.50, 4);
INSERT INTO public.moon VALUES (13, 'Metis', ' a smalll moon orbiting the gas giant in the solar system', 4.50, 4);
INSERT INTO public.moon VALUES (14, 'Titan', 'A beautiful moon on the gas giant in the solar system', 4.50, 5);
INSERT INTO public.moon VALUES (15, 'Rhea', 'a large moon on orbiting a gas giant in the solar system with an icy surface', 4.60, 5);
INSERT INTO public.moon VALUES (16, 'Lapetus', 'A large moon orbiting the surface of a gas giant in the solar systme with an icy surface', 4.50, 5);
INSERT INTO public.moon VALUES (17, 'Dione', 'a large, round, and icy moon in the solar system orbitng a gas giant', 4.50, 5);
INSERT INTO public.moon VALUES (18, 'Tethys', 'a round moon with the surface covered in ice orbiting a gias giant in the solar system', 4.50, 5);
INSERT INTO public.moon VALUES (19, 'Titania', 'A beautiful moon on the seventh planet from the sun in the solar system', 4.50, 6);
INSERT INTO public.moon VALUES (20, 'Umbriel', 'a dark surface moon on the seventh planet in the solar system', 4.50, 6);
INSERT INTO public.moon VALUES (21, 'Triton', 'A beautiful moon on the eight planet from the sun in the solar system', 4.50, 7);
INSERT INTO public.moon VALUES (22, 'Proteaus', 'a dark surfaced and deformed  moon on the eighth planet in the solar system', 4.50, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The nearest planet to the sun in the solar system', 4.50, 13.64, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'The second nearest planet to the sun in the solar system', 4.50, 24.33, 1);
INSERT INTO public.planet VALUES (3, 'Mars', 'The fourth planet that orbits the sun after the earth in the solar system', 4.50, 14.90, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'The fifth planet from the sun in  solar system made of gases', 4.60, 61.10, 1);
INSERT INTO public.planet VALUES (5, 'Sarturn', 'The sixth planet from the sun in the solar system with asteriod rings', 4.50, 132.50, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 'The seventh planet from the sun in the solar system with an frozen surface', 4.50, 290.50, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'The eighth planet revolving around the sun in the solar system with frozen surface', 4.50, 433.80, 1);
INSERT INTO public.planet VALUES (8, 'HD 131399Ab', 'Found near the Scorpius constellation and has an orbit of 550 Earth years', 16.00, 320.00, 5);
INSERT INTO public.planet VALUES (9, 'HIP 13044b', 'Orbits the binary star system in adnromeda galxy and takes 55 earth years', 24.00, 520.00, 6);
INSERT INTO public.planet VALUES (10, 'Upsilon Andromedae b', 'Orbits the binary star system in andromeda galaxy', 18.00, 220.00, 2);
INSERT INTO public.planet VALUES (11, 'Pluto', 'a dwarf planet that Orbits the the sun in the solar system and is the furthest planet from the sun', 4.50, 598.00, 1);
INSERT INTO public.planet VALUES (12, 'Earth', 'a habitable planet in the solar system in the goldilock zone', 4.50, 0.00, 1);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, true, 'rocky', false, 0, 1, 1);
INSERT INTO public.planet_type VALUES (2, true, 'rocky', false, 0, 1, 2);
INSERT INTO public.planet_type VALUES (3, true, 'rocky', false, 2, 1, 3);
INSERT INTO public.planet_type VALUES (4, true, 'gaseous', false, 80, 1, 4);
INSERT INTO public.planet_type VALUES (5, true, 'gaseous', false, 83, 1, 5);
INSERT INTO public.planet_type VALUES (6, true, 'rocky', false, 27, 1, 6);
INSERT INTO public.planet_type VALUES (7, true, 'gaseous', false, 14, 1, 7);
INSERT INTO public.planet_type VALUES (8, true, 'rocky', false, 11, 1, 11);
INSERT INTO public.planet_type VALUES (9, true, 'rocky', true, 1, 1, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Closest star to earth at the center of the solar system', 4.60, 151.15, 1);
INSERT INTO public.star VALUES (2, 'Beta Andromedae', 'THis is a red giant star usually the brightest in the Andromeda galaxy', 4.60, 188.30, 1);
INSERT INTO public.star VALUES (3, 'Alpha Andromedae', 'THis is a red giant star usually the brightest in the Andromeda galaxy and is the head ot the galaxy', 0.06, 96.87, 2);
INSERT INTO public.star VALUES (4, 'Sirius', 'The brightest star in the night sky', 0.02, 8.60, 1);
INSERT INTO public.star VALUES (5, 'Antares', 'The brightest star in the constellation of Scopius', 0.15, 142.57, 2);
INSERT INTO public.star VALUES (6, 'Vega Star', 'The brightest star in the constellation of Lyra', 0.46, 152.57, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 9, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: planet_type planet_type_planet_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_planet_type_id_key UNIQUE (planet_type_id);


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
-- Name: planet_type planet_type_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

