--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 10.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: articles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE articles (
    id bigint NOT NULL,
    name character varying,
    url character varying,
    thumbnail character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE articles_id_seq OWNED BY articles.id;


--
-- Name: lexicons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE lexicons (
    id bigint NOT NULL,
    word character varying,
    definition character varying,
    note_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: lexicons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lexicons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lexicons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE lexicons_id_seq OWNED BY lexicons.id;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE notes (
    id bigint NOT NULL,
    user_id integer,
    article_id integer,
    content character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE notes_id_seq OWNED BY notes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: lexicons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY lexicons ALTER COLUMN id SET DEFAULT nextval('lexicons_id_seq'::regclass);


--
-- Name: notes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY notes ALTER COLUMN id SET DEFAULT nextval('notes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-10-11 17:17:51.892924	2017-10-11 17:17:51.892924
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, name, url, thumbnail, created_at, updated_at) FROM stdin;
3	NASA Has Big Plans for the Moon — and Big Competition	https://www.bing.com/cr?IG=4DB62C38D8084C42A608E15121EEB976&CID=21D2B19712FB601502A6BA8E13FD6195&rd=1&h=021ClMjEwJzrw71W9zT2bUNRn8HERlcofvWmMVdNke8&v=1&r=https%3a%2f%2fwww.nbcnews.com%2fmach%2fscience%2fnasa-has-big-plans-moon-it-s-not-only-one-ncna806646&p=DevEx,5009.1	https://www.bing.com/th?id=ON.779929F69BE47A2C16595E28F60E3289&pid=News	2017-10-12 12:40:55.003069	2017-10-12 12:40:55.003069
8	The air quality in the Bay Area right now is as bad as Beijing	http://www.bing.com/cr?IG=361E73B9A6CA42168DD35A9B28825BDE&CID=2CEFB1C640136A491264BADC41156BC7&rd=1&h=x02CNWqJojR7TMg7--_YyfJ7BymM98vAkBeMYagDn8M&v=1&r=http%3a%2f%2fwww.sfgate.com%2fnews%2farticle%2fair-quality-San-Francisco-Bay-Area-Beijing-12272792.php&p=DevEx,5011.1	https://www.bing.com/th?id=ON.EE376F4B0578D8C3AE867BD9B66081C4&pid=News	2017-10-13 18:14:26.813809	2017-10-13 18:14:26.813809
9	Mass die-off of Antarctic penguin chicks alarms researchers	https://www.bing.com/cr?IG=FE908F31FD564355A55A838D92652194&CID=308DD2F2724A68262279D9EF734C6927&rd=1&h=hVvAfahNY-5wUXegxVCWT7gLpZOwRZXH9RF80OTgF4Y&v=1&r=https%3a%2f%2fwww.usatoday.com%2fstory%2fnews%2fworld%2f2017%2f10%2f16%2fmass-die-off-antarctic-penguin-chicks-alarms-researchers%2f766973001%2f&p=DevEx,5009.1	https://www.bing.com/th?id=ON.0844EB88033E9C361E7B6E008A433A6C&pid=News	2017-10-16 12:46:26.489567	2017-10-16 12:46:26.489567
13	Ancient sea turtle reveals pigment-based survival trait at least 54 million years old	https://www.bing.com/cr?IG=EE5FF007C7FF47F5856E03D77F5BCB5E&CID=3280C9818DF06E280605C29E8CF66FD2&rd=1&h=1OXx1pwxfUT0_89YnmvD-yyug0qFBlgvCOY9ixNaMzI&v=1&r=https%3a%2f%2fwww.upi.com%2fScience_News%2f2017%2f10%2f17%2fAncient-sea-turtle-reveals-pigment-based-survival-trait-at-least-54-million-years-old%2f8681508243585%2f&p=DevEx,5011.1	https://www.bing.com/th?id=ON.A93CECD6CE64D8DE25F31213CA70AC02&pid=News	2017-10-18 12:55:00.870732	2017-10-18 12:55:00.870732
14	China's first space station is doomed — but objects inside of it may reach the ground unharmed	http://www.bing.com/cr?IG=31F68DD878854BB4AFEC1817C5F52700&CID=10E873DAF1416D451EE778FAF0476C3C&rd=1&h=U4UIDMY9sCEXjPAINBRie5O15VZXrnCUMc0tMCNMbBU&v=1&r=http%3a%2f%2fwww.businessinsider.com%2fchinese-space-station-when-it-will-crash-2017-10&p=DevEx,5009.1	https://www.bing.com/th?id=ON.3D8DDCBD32A6A01AEF9B9C3070ED732E&pid=News	2017-10-19 13:08:38.922324	2017-10-19 13:08:38.922324
15	Scientists Warn of Insect ‘Armageddon’ After Dramatic Drop in Populations	https://www.bing.com/cr?IG=38720BDECBD647EBB4788E5C183B8DDF&CID=0C94765F5A876F1805687D7E5B816E0E&rd=1&h=iZrqabbu280-iE2W322rNMM82REo4aT-RFZE3fOTk5Q&v=1&r=https%3a%2f%2fwww.nbcnews.com%2fnews%2fworld%2fscientists-warn-insect-armageddon-after-dramatic-drop-populations-n812401&p=DevEx,5011.1	https://www.bing.com/th?id=ON.9913CCEFEB901E90451582C407FFA73E&pid=News	2017-10-20 16:30:08.624909	2017-10-20 16:30:08.624909
16	Nuclear war: What is 'nuclear winter,' and how likely is it?	https://www.bing.com/cr?IG=E2746A3CE8F046818C92BE3C8B18DA1E&CID=1706A48374AA65D91556AFA175AC64FE&rd=1&h=o_neGRIdb1duyh50ci7Z3fTkRrHUljLRWjXI8bTFTmA&v=1&r=https%3a%2f%2fwww.usatoday.com%2fstory%2fnews%2fworld%2f2017%2f10%2f21%2fnuclear-war-what-nuclear-winter-and-how-likely-it%2f787175001%2f&p=DevEx,5009.1	https://www.bing.com/th?id=ON.F0640C793E604C5EA5592AA65BB05EB8&pid=News	2017-10-21 17:42:36.99687	2017-10-21 17:42:36.99687
17	NASA Details Its Plans for Sending Humans to Mars	https://www.bing.com/cr?IG=D92687567C574C599CACAC7ADFB0B374&CID=3DDB05C604286967058D0EE5052E68C4&rd=1&h=sQ7KiKkvDYXy2TrDpQxewXVO5hKLT1JmrYSuqOlbznw&v=1&r=https%3a%2f%2fwww.nbcnews.com%2fmach%2fscience%2fnasa-details-its-plans-sending-humans-mars-ncna810531&p=DevEx,5011.1	https://www.bing.com/th?id=ON.49621288B7816A422424B99878BACAF7&pid=News	2017-10-22 19:32:40.354822	2017-10-22 19:32:40.354822
18	Researchers bring optical communication onto silicon chips	https://www.bing.com/cr?IG=158319A971324580BEC04E810490FC64&CID=256544682CBA631C076F4F4C2DBC62E2&rd=1&h=btSSQrxwsSQdzDmz6fAsGu4FzSCLptezEiaxYqUJMq0&v=1&r=https%3a%2f%2fphys.org%2fnews%2f2017-10-optical-silicon-chips.html&p=DevEx,5011.1	https://www.bing.com/th?id=ON.DA3BE5AEB2B6D6D402FA310788D6848F&pid=News	2017-10-23 15:23:12.632719	2017-10-23 15:23:12.632719
19	Commander of 1st flight of space shuttle Challenger dies	http://www.bing.com/cr?IG=264553F9EF7F4A58B2BB549630CDB3AC&CID=33FC0F1F011C6C7F0EB3043A001A6D56&rd=1&h=UyAvyFlYeU6eb3gV4szoU3IRKEVZ2V-rb-DAvzhfRC8&v=1&r=http%3a%2f%2fabcnews.go.com%2fTechnology%2fwireStory%2fcommander-1st-flight-space-shuttle-challenger-dies-50678042&p=DevEx,5009.1	https://www.bing.com/th?id=ON.4EA0892593D6E76BDEA89CE1F03CCC9A&pid=News	2017-10-24 15:47:14.685035	2017-10-24 15:47:14.685035
21	See-Through Solar Panels Will Put Untapped Energy to Work	https://www.bing.com/cr?IG=F621720B890C4365BFFBF9CB7AB1E987&CID=186182FBC7CD618C19DF89DDC6CB60E3&rd=1&h=Oh4QowjXxePY5jTqyJR6NlBqDKhqE8u1UOS8xTQoW7c&v=1&r=https%3a%2f%2fwww.nbcnews.com%2fmach%2fscience%2fsee-through-solar-panels-will-put-untapped-energy-work-ncna813836&p=DevEx,5011.1	https://www.bing.com/th?id=ON.8529C91D4BACFF155CED0E23153D6601&pid=News	2017-10-25 13:55:29.797507	2017-10-25 13:55:29.797507
22	This Gigantic Lava Tube Could Be Home for Moon Colonists	https://www.bing.com/cr?IG=0A8E74B7396A4A9C846156E4A270A2CF&CID=3652BF68538266841325B44F528467C0&rd=1&h=uOJsmGOmp2Oo_IohPCswJPXYaMApsK_bj8NMN-KQsW8&v=1&r=https%3a%2f%2fwww.nbcnews.com%2fmach%2fscience%2fgigantic-lava-tube-could-be-home-moon-colonists-ncna813396&p=DevEx,5011.1	https://www.bing.com/th?id=ON.438C244ECC923702B741EA39DED4D273&pid=News	2017-10-26 13:46:08.769042	2017-10-26 13:46:08.769042
23	Watch NASA Test New Rocket Engine for Deep-Space Missions	https://www.bing.com/cr?IG=1112085AE99D446F91F8E7825453A4BC&CID=01BB625DA2176F5D3C926974A3116EFF&rd=1&h=DDEHyBM2nDA32ZKfm9RHcXEnvWtaxjH8Xlwk_8GeSfs&v=1&r=https%3a%2f%2fwww.nbcnews.com%2fmach%2fscience%2fwatch-nasa-test-new-rocket-engine-deep-space-missions-ncna815081&p=DevEx,5011.1	https://www.bing.com/th?id=ON.3570BDCE9E7449C994BF36538661098B&pid=News	2017-10-28 15:48:16.716208	2017-10-28 15:48:16.716208
25	For Scientists Predicting Sea Level Rise, Wind Is the Biggest Unknown	https://www.bing.com/cr?IG=EE6DDB733A7E472F8FD2F75116ADC8DA&CID=063FDD59BF6465773A83D674BE6264C5&rd=1&h=hNsIgtZ1RKnV0mk9GlICFhjGh2Yfysktq0njtw-Mzro&v=1&r=https%3a%2f%2fwww.wired.com%2fstory%2fwind-is-driving-rapid-melt-in-antarcticas-biggest-glacier%2f&p=DevEx,5011.1	https://www.bing.com/th?id=ON.71D07F65A6602D34F59043B792A2F488&pid=News	2017-11-01 21:56:30.689285	2017-11-01 21:56:30.689285
26	Cosmic-ray imaging reveals mysterious 'void' in Great Pyramid of Giza	https://www.bing.com/cr?IG=6BD67FE0C5D24CD4A281B2512906FB16&CID=16111647371E6AAB0DB51D6936186B45&rd=1&h=iGob8_iM0HrqMbRztOliWr4MiOwqvA5yQ1QQKRhrSG4&v=1&r=https%3a%2f%2fwww.usatoday.com%2fstory%2ftech%2fscience%2f2017%2f11%2f02%2fhidden-area-discovered-great-pyramid-giza%2f822293001%2f&p=DevEx,5011.1	https://www.bing.com/th?id=ON.C42629AE1F6EEA01191EE14E254BEAF6&pid=News	2017-11-02 14:38:05.154606	2017-11-02 14:38:05.154606
27	Humans to blame for global warming, massive federal government report says	https://www.bing.com/cr?IG=319659EC487C42118689F407B25A0076&CID=1D58CE48240B6FB03E11C567250D6E37&rd=1&h=d7Ho9Z-DKttEBk7UsukfC4zbuj3-LQeX-IVRvDuMzZM&v=1&r=https%3a%2f%2fwww.usatoday.com%2fstory%2fnews%2fnation%2f2017%2f11%2f03%2fhumans-blame-global-warming-massive-federal-government-report-says%2f829783001%2f&p=DevEx,5009.1	https://www.bing.com/th?id=ON.3518530B15473053466A826B9DA120B8&pid=News	2017-11-03 21:30:30.761322	2017-11-03 21:30:30.761322
28	Cosmic Rays Reveal Big ‘Void’ in Egypt’s Great Pyramid	https://www.bing.com/cr?IG=84E66EDF1B884AD099BBEC1276350916&CID=039E78845656683D0B9573B457506979&rd=1&h=mPcoUJEeCjyp0l8wQtUNk1PZf1IItbFqo1zy-grqxaI&v=1&r=https%3a%2f%2fwww.nbcnews.com%2fscience%2fscience-news%2fcosmic-rays-reveal-big-void-great-pyramid-n816916&p=DevEx,5009.1	https://www.bing.com/th?id=ON.55C5F520F622AB901C47F90E0BE43A39&pid=News	2017-11-04 16:33:32.820439	2017-11-04 16:33:32.820439
\.


--
-- Data for Name: lexicons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lexicons (id, word, definition, note_id, created_at, updated_at) FROM stdin;
1	lexicon	collection of vocabulary words	1	2017-10-11 17:27:20.121306	2017-10-11 17:27:20.121306
6	pollution	n. problems with program	3	2017-10-18 18:42:09.183516	2017-10-18 18:42:09.183516
8	bugs	n. problems with program	2	2017-10-18 18:47:19.056705	2017-10-18 18:47:19.056705
9	word	n. a command	4	2017-10-18 19:18:42.322606	2017-10-18 19:18:42.322606
10	dictionary	Niel's way of finding out a definiton	54	2017-10-18 20:27:22.881781	2017-10-18 20:27:22.881781
11	ruby	n. precious stone	56	2017-10-18 23:02:42.232157	2017-10-18 23:02:42.232157
54	lunar	adjective - of, determined by, or resembling the moon.	176	2017-10-26 21:29:20.76171	2017-10-26 21:29:20.76171
2	redux	tricky yet simple store idea	3	2017-10-13 21:41:08.583256	2017-10-19 16:03:20.371225
15	dreams	defining new words	62	2017-10-20 13:18:11.598379	2017-10-20 13:18:11.598379
19	typing	to type something	62	2017-10-20 16:28:32.73224	2017-10-20 16:28:32.73224
21	armageddon	n. last battle between good and evil	63	2017-10-20 16:31:00.934468	2017-10-20 16:31:00.934468
52	commander	n. someone who commands and stuff	187	2017-10-26 21:22:11.003579	2017-10-26 21:54:06.991524
56	harbor	noun - a place on the coast where ships may moor in shelter, especially one protected from rough water by piers, jetties, and other artificial structures.	176	2017-10-26 21:57:02.068648	2017-10-26 21:57:02.068648
57	exploration	noun - the action of exploring an unfamiliar area.	138	2017-10-26 22:05:02.413668	2017-10-26 22:05:02.413668
28	dictionary	book with a few more woards and wordswoards and wordswoards and wordswoards and wordswoards and wordswoards and wordswoards and wordswoards and wordswoards and wordswoards and wordswoards and words	113	2017-10-24 16:14:58.198974	2017-10-24 17:58:54.664106
46	penguin	noun - a large flightless seabird of the southern hemisphere, with black upper parts and white underparts and wings developed into flippers for swimming under water. sometimes they're on land	185	2017-10-26 20:55:43.210473	2017-10-26 22:05:46.620319
58	dictionary	noun - a book or electronic resource that lists the words of a language (typically in alphabetical order) and gives their meaning, or gives the equivalent words in a different language, often also providing information about pronunciation, origin, and usage.	176	2017-10-26 22:14:59.06426	2017-10-26 22:14:59.06426
29	hardy	tripping hardy check one two	112	2017-10-24 17:42:17.673488	2017-10-24 18:13:42.705289
55	magnet	noun - a piece of iron or other material which has its component atoms so ordered that the material exhibits properties of magnetism, such as attracting other iron-containing objects or aligning itself in an external magnetic field. magnets are really cool	176	2017-10-26 21:53:22.164704	2017-10-26 22:15:18.995111
24	yes	n. it will be saved\n	109	2017-10-22 21:48:34.547902	2017-10-25 17:32:46.37776
31	new word	newer word	113	2017-10-25 17:51:55.5737	2017-10-25 17:51:55.5737
27	what do	you mean change the definition here\n	109	2017-10-22 21:49:07.520343	2017-10-25 17:52:27.451578
32	friendships	n. a relationship with someone else	108	2017-10-25 19:08:44.559891	2017-10-25 19:08:44.559891
33	untapped	never used before	114	2017-10-25 19:34:48.042155	2017-10-25 19:34:48.042155
34	testing	v. an assessment situation to gauge how well an individual understands a topic	114	2017-10-25 19:43:30.256996	2017-10-25 19:43:30.256996
36	Beijing	n. city in China	142	2017-10-26 03:08:29.557179	2017-10-26 13:54:19.812668
40	gigantic	adj. pretty big	146	2017-10-26 13:56:18.476676	2017-10-26 13:56:18.476676
41	checking	v. to check something	165	2017-10-26 20:06:09.396995	2017-10-26 20:06:09.396995
42	moon	noun - the natural satellite of the earth, visible (chiefly at night) by reflected light from the sun.	176	2017-10-26 20:45:14.860202	2017-10-26 20:45:14.860202
43	quality	noun - the standard of something as measured against other things of a similar kind; the degree of excellence of something	109	2017-10-26 20:47:29.500582	2017-10-26 20:47:29.500582
44	gigantic	adjective - of very great size or extent; huge or enormous.	176	2017-10-26 20:50:35.16457	2017-10-26 20:50:35.16457
45	word	exclamation - used to express agreement or affirmation.	109	2017-10-26 20:52:22.040207	2017-10-26 20:52:22.040207
47	colonist	noun - a settler in or inhabitant of a colony.	176	2017-10-26 20:58:43.694052	2017-10-26 20:58:43.694052
48	unharmed	adjective - not harmed; uninjured.	186	2017-10-26 21:05:48.760783	2017-10-26 21:05:48.760783
49	astronauts	noun - a person who is trained to travel in a spacecraft.	176	2017-10-26 21:12:43.01153	2017-10-26 21:12:43.01153
50	swallow	verb - cause or allow (something, especially food or drink) to pass down the throat.	176	2017-10-26 21:15:42.362489	2017-10-26 21:15:42.362489
51	researcher	- A <b>researcher</b> is someone who conducts <b>research</b>, i.e., an organized and systematic investigation into something. Scientists are often described as <b>researchers</b>.	176	2017-10-26 21:20:38.23706	2017-10-26 21:20:38.23706
53	tubes	noun - a long, hollow cylinder of metal, plastic, glass, etc. for holding or transporting something, chiefly liquids or gases.	176	2017-10-26 21:24:08.247481	2017-10-26 21:24:08.247481
59	nuclear	adjective - relating to the nucleus of an atom. it's not nooclear 	108	2017-10-26 22:20:47.088181	2017-10-26 22:21:03.130763
64	polluted	verb - contaminate (water, the air, etc.) with harmful or poisonous substances. dirtified	109	2017-10-26 23:03:30.841958	2017-10-26 23:03:46.397194
62	energy	noun - the strength and vitality required for sustained physical or mental activity.	188	2017-10-26 22:49:47.09821	2017-10-26 22:49:47.09821
60	solar	adjective - relating to or determined by the sun. and it;s blazing glory and is really hot	188	2017-10-26 22:23:18.425512	2017-10-26 22:50:39.585862
63	commerical	adjective - (of television or radio) funded by the revenue from broadcast advertisements.\nand they tell me about butterfingers	138	2017-10-26 22:58:54.917108	2017-10-26 22:59:08.804757
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY notes (id, user_id, article_id, content, created_at, updated_at) FROM stdin;
1	1	1	i learned so much	2017-10-11 17:25:29.039939	2017-10-11 17:25:29.039939
31	17	13	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-18 14:31:28.232519	2017-10-18 14:37:54.099624
49	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 19:17:28.53296	2017-10-18 19:17:28.53296
34	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:38:42.063568	2017-10-18 14:38:42.063568
35	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:38:47.920692	2017-10-18 14:38:47.920692
32	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:33:08.361056	2017-10-18 14:33:08.361056
33	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:33:49.363765	2017-10-18 14:33:49.363765
36	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:38:51.979673	2017-10-18 14:38:51.979673
37	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:40:17.827995	2017-10-18 14:40:17.827995
39	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:41:11.121096	2017-10-18 14:41:11.121096
40	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:42:09.147408	2017-10-18 14:42:09.147408
41	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:43:24.253628	2017-10-18 14:43:24.253628
42	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:46:01.170542	2017-10-18 14:46:01.170542
43	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:46:57.777992	2017-10-18 14:46:57.777992
44	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:47:01.98175	2017-10-18 14:47:01.98175
45	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:48:15.120726	2017-10-18 14:48:15.120726
46	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:48:41.622281	2017-10-18 14:48:41.622281
47	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:48:59.967827	2017-10-18 14:48:59.967827
48	17	13	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-18 14:49:05.096334	2017-10-18 14:49:06.437798
16	17	9	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-17 22:29:53.952211	2017-10-18 15:12:33.426691
50	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 19:38:54.460723	2017-10-18 19:38:54.460723
51	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 20:17:59.540103	2017-10-18 20:17:59.540103
52	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 20:18:19.814703	2017-10-18 20:18:19.814703
53	17	13	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-18 20:19:07.78373	2017-10-18 20:46:54.944207
4	17	8	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-15 19:00:36.477339	2017-10-18 20:47:44.981556
143	29	3	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-26 03:18:55.624109	2017-10-26 03:18:57.266927
144	29	13	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-26 03:19:10.013466	2017-10-26 03:19:11.228654
145	29	21	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[{"offset"=>10, "length"=>5, "style"=>"BOLD"}, {"offset"=>10, "length"=>5, "style"=>"ITALIC"}, {"offset"=>10, "length"=>5, "style"=>"UNDERLINE"}], "entityRanges"=>[], "data"=>{}}]}	2017-10-26 03:20:24.582671	2017-10-26 03:21:42.778147
5	17	9	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-17 21:57:52.364873	2017-10-17 21:58:35.3545
6	17	9	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-17 22:01:31.058926	2017-10-17 22:01:31.058926
7	17	9	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-17 22:12:29.120619	2017-10-17 22:12:29.120619
8	17	9	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-17 22:13:53.502991	2017-10-17 22:13:53.502991
11	17	9	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-17 22:21:34.598523	2017-10-17 22:21:34.598523
9	17	9	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-17 22:14:13.666637	2017-10-17 22:21:39.480482
12	17	9	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-17 22:21:43.800008	2017-10-17 22:21:46.769938
10	17	9	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-17 22:17:49.399158	2017-10-17 22:24:31.112684
14	17	9	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-17 22:27:20.22245	2017-10-17 22:27:20.22245
17	17	9	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-17 22:31:30.290368	2017-10-17 22:31:30.290368
18	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 12:56:59.302925	2017-10-18 12:56:59.302925
13	17	9	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-17 22:24:17.539602	2017-10-18 12:57:00.896028
19	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 12:57:20.526829	2017-10-18 12:57:20.526829
20	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 13:00:31.814222	2017-10-18 13:00:31.814222
21	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 13:15:13.319377	2017-10-18 13:15:13.319377
22	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 13:16:41.331627	2017-10-18 13:16:41.331627
23	17	13	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-18 13:18:07.593503	2017-10-18 13:27:01.90689
25	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:24:35.361502	2017-10-18 14:24:35.361502
26	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:26:09.068987	2017-10-18 14:26:09.068987
27	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:26:49.005152	2017-10-18 14:26:49.005152
28	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:27:24.748054	2017-10-18 14:27:24.748054
29	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:29:25.073539	2017-10-18 14:29:25.073539
30	17	13	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-10-18 14:30:22.629676	2017-10-18 14:30:22.629676
38	17	13	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-18 14:40:51.69088	2017-10-18 19:12:12.723001
24	17	13	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-18 13:27:08.00356	2017-10-18 19:20:24.396834
205	28	26	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-11-02 17:18:58.418441	2017-11-02 17:19:00.799343
158	28	16	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-26 19:58:05.750807	2017-10-26 20:04:34.223537
164	28	14	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-26 20:03:46.031718	2017-10-26 20:04:41.531903
56	17	13	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"   I learned about... what it means to be a programmer.... ", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-18 23:02:16.431351	2017-10-18 23:03:03.646117
2	17	8	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"aajst", "text"=>"", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"b66t9", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-13 19:53:33.141992	2017-10-18 20:18:00.374112
54	17	13	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-18 20:21:57.152033	2017-10-18 23:03:11.579922
55	17	13	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"      ", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"b83lo", "text"=>"", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"9ei3l", "text"=>"     Hi Neil ", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[{"offset"=>8, "length"=>4, "style"=>"UNDERLINE"}, {"offset"=>8, "length"=>4, "style"=>"BOLD"}, {"offset"=>8, "length"=>4, "style"=>"ITALIC"}], "entityRanges"=>[], "data"=>{}}]}	2017-10-18 20:23:54.799208	2017-10-18 23:03:18.604162
57	17	14	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-19 13:09:06.860498	2017-10-19 13:09:09.525202
15	17	9	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-17 22:28:19.975504	2017-10-18 20:47:23.239537
3	17	8	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"3p51k", "text"=>"    So, alex, your computer is dying. I'm sorry.", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[{"offset"=>42, "length"=>5, "style"=>"UNDERLINE"}], "entityRanges"=>[], "data"=>{}}, {"key"=>"389u4", "text"=>"", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"eu5m3", "text"=>"", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-13 19:54:01.761408	2017-10-18 20:47:54.736808
167	28	17	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-26 20:04:59.636996	2017-11-03 04:16:11.942475
198	19	21	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about... \\"solar panels\\"", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-11-01 22:11:37.852787	2017-11-01 22:13:43.580316
202	28	23	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-11-02 01:49:52.358244	2017-11-02 01:49:53.494489
211	32	8	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-11-04 17:17:24.167808	2017-11-04 17:17:25.357587
148	28	13	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"ancient turtles", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"a1jis", "text"=>"", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-26 18:05:10.375393	2017-10-26 19:57:11.386494
184	30	22	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-26 20:33:42.214682	2017-10-26 20:33:44.028195
140	28	21	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"SOLAR PANELS AND WHAT NOT", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-26 03:01:20.618903	2017-10-26 19:40:29.776357
166	28	19	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-26 20:04:46.266807	2017-10-26 20:04:54.299925
210	32	28	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about... this and that and that this cannot nore will not really be any longer than ", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"b7k4s", "text"=>"", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-11-04 17:17:13.451098	2017-11-04 18:33:59.234796
142	28	8	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"BAY AREA", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-26 03:08:14.916348	2017-10-26 19:41:08.26967
196	19	9	{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}	2017-11-01 22:09:48.533058	2017-11-01 22:09:48.533058
197	19	17	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-11-01 22:11:00.992537	2017-11-01 22:11:02.131432
200	19	25	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-11-01 22:12:14.921849	2017-11-01 22:12:16.577243
195	19	3	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-11-01 22:07:40.461613	2017-11-01 22:13:21.992805
203	28	25	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-11-02 02:19:13.674711	2017-11-02 02:19:14.955228
204	28	15	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-11-02 02:19:53.843699	2017-11-02 02:19:55.163304
212	32	15	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-11-04 17:17:34.203773	2017-11-04 17:17:35.307729
213	32	25	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-11-04 17:17:44.066182	2017-11-04 17:17:45.758305
109	19	8	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about... how the bay area air === bad ", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[{"offset"=>31, "length"=>4, "style"=>"UNDERLINE"}], "entityRanges"=>[], "data"=>{}}, {"key"=>"e75f0", "text"=>"but so is beijing air ", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"c3b97", "text"=>"", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"6uouu", "text"=>"it just saves", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"ej8in", "text"=>"exactly!!! ", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"6kuu7", "text"=>"San Fran is a city", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[{"offset"=>4, "length"=>4, "style"=>"UNDERLINE"}], "entityRanges"=>[], "data"=>{}}]}	2017-10-21 20:10:23.924088	2017-10-26 23:04:02.978658
207	32	3	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about...I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... ", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"86j53", "text"=>"I learned about...I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... ", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"6iom6", "text"=>"I learned about...I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... I learned about... ", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"1emhq", "text"=>"", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-11-03 21:39:10.521721	2017-11-04 17:06:04.810135
206	32	18	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical communications I learned about... OPtical ", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"eb1jj", "text"=>"", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"8658o", "text"=>"", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-11-03 21:37:57.824222	2017-11-04 18:36:57.888036
187	19	19	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about... commanders ", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"9h7ji", "text"=>"<object src=\\"whatever this url is\\"></object> == iframe", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"fd7im", "text"=>"", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}, {"key"=>"fk4pa", "text"=>"yea it's kinda like google docs", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-26 20:35:08.130459	2017-10-26 22:46:35.246857
162	28	3	{"entityMap"=>{}, "blocks"=>[{"key"=>"ctf9b", "text"=>"I learned about... BIG MOONS", "type"=>"unstyled", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}}]}	2017-10-26 20:00:01.936646	2017-11-03 21:36:31.833325
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY schema_migrations (version) FROM stdin;
20171011170730
20171011171441
20171011171538
20171011171611
20171016225159
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (id, first_name, last_name, email, password_digest, created_at, updated_at) FROM stdin;
2	Dean	Something	Dean@dean.com	$2a$10$ijwx5aWbxkZkkubs78vejeYraXcESRvMday2nbU2kMpHMmnKFns5O	2017-10-12 13:29:18.006785	2017-10-12 13:29:18.006785
3	Dean	Something	Dean@dean.com	$2a$10$JHOmMgMYZLTnnn.vcHfE9uPGuPJq8BRBdGMxgki8JXseJIhGedNgu	2017-10-12 13:29:49.581308	2017-10-12 13:29:49.581308
4	Dean	Something	Dean@dean.com	$2a$10$0o1n45c7EIUcTgn2GfhZP.i9fx3mnbY8m63h2tUA7LCYzjvu/k3pe	2017-10-12 13:30:33.822289	2017-10-12 13:30:33.822289
5	hi	hello	email@email.com	$2a$10$XHr1cgw0Y5ry4gkCxRkuROwmURU7YkIjUAhvt7Dkf78q5OcteLoUq	2017-10-12 14:50:56.302193	2017-10-12 14:50:56.302193
6	hi	hello	email@email.com	$2a$10$kWEUJ67Fgffn.MH0UemtiODyiti/Jst0XUsiMe.x8rI4LPvK8jXAW	2017-10-12 14:50:58.085851	2017-10-12 14:50:58.085851
7	hi	hi	hello	$2a$10$2J4SrcuSve6/OFMMBsg65uYrVwg/B2EmfkMAatsUEG//HpPK6PSxm	2017-10-12 14:51:57.05872	2017-10-12 14:51:57.05872
8	hi	hi	hello	$2a$10$pGKC75BeNvlpL3TPK6n9AeZN48QxNs6b3x2wMkxl3S.MSTRE4x0mu	2017-10-12 14:51:58.803407	2017-10-12 14:51:58.803407
9	hi	hi	hello	$2a$10$7HykIj4y.vXiY2R.MgjCuen3CArj8f4DiPaZg05WnBXipW5J6uQ6.	2017-10-12 14:53:47.24272	2017-10-12 14:53:47.24272
10	hi	hi	hello	$2a$10$orx/vEt307kj.MONVQgQMeNU.Xacx3n8YeB20NMEtrieK9Xo10YY.	2017-10-12 14:53:48.677402	2017-10-12 14:53:48.677402
11	testing	testing	hello	$2a$10$uze1k6ZHYbnWY0wqhemUMevIvRhkXERQcX/o9nwQSvBo0oZovT2S6	2017-10-12 14:54:28.018723	2017-10-12 14:54:28.018723
12	check	checking	123	$2a$10$VIyW8s2OunsHBo5N1KFS8.GX4.TcL65F54IVgzvMQPrCERmkwLsue	2017-10-12 14:55:43.674353	2017-10-12 14:55:43.674353
13	check	checking	123	$2a$10$YUZBV4iXUTd8RHDb9AyWhuY6e/mC91OFDOJwZyKTfjNOv4HBbEt46	2017-10-12 14:55:45.125933	2017-10-12 14:55:45.125933
14	one	two	three	$2a$10$sFZIHmpdI/wuf70198.foOnweRCQZF9A40PY4COWV/KOvOo4OdWLK	2017-10-12 15:27:59.887249	2017-10-12 15:27:59.887249
15	one	two	three	$2a$10$9zfnzkc8Efk5qxSSpQ.ic.BZVBW2oDdjbftkX2H6Wff/x.KizNcFu	2017-10-12 15:28:01.62595	2017-10-12 15:28:01.62595
16	fas	ifeoaw	123	$2a$10$SbzlMU4gWHzgFk4GsszDruu4cnR5OgylyeHQ/b0JfkxZm6wiSG1Ba	2017-10-12 15:33:36.644342	2017-10-12 15:33:36.644342
17	Kenny	L	kenny@kenny.com	$2a$10$podsN0e.AK1PdMsqbI5aKO2kf4jz8VAFpYbxMAAoALD9lIEs83eX2	2017-10-12 16:57:34.603736	2017-10-12 16:57:34.603736
18	Luke	Something	Luke@luke.com	$2a$10$80ueiqZxxT4YB0fHbRj9e.8mT9Sg4bxFVOzo9qIrAB694mic8oLPi	2017-10-12 20:22:46.625333	2017-10-12 20:22:46.625333
19	ken	lin	ken@ken.com	$2a$10$oCguaeedKLI/B9CSoglMl.3eGxyfCdIB7HunVSbG1/7aoUaMlKoXC	2017-10-19 19:05:42.801026	2017-10-19 19:05:42.801026
20	k	l	k@l.com	$2a$10$M7Ko.lclQnRbtXLnb4FhDu7Vryp.Vvryx7n8voG2c7UhxpmmbQ2ZG	2017-10-22 19:18:05.717238	2017-10-22 19:18:05.717238
21	k	k	ken@ken.com	$2a$10$SiExmF2Uo8dHQbz6JMjB4ultikX7IWqvP39fZKDYzHtuZ1BdVfKle	2017-10-23 22:14:41.090253	2017-10-23 22:14:41.090253
22	k	k	ken@ken.com	$2a$10$k4rEiks7IMsiqqalKIBPjuAfD9c1q3IjQBikVf3EoUX3mv8frtwHu	2017-10-23 22:14:41.33935	2017-10-23 22:14:41.33935
23	k	l	ken@ken.com	$2a$10$ogiORQyAsNkviUKvF2vrT.bKogBiyxy1WEFxEXeV4yV/xt07KIv82	2017-10-23 22:15:55.399918	2017-10-23 22:15:55.399918
24	Kesean	Woodhouse	kesean@kesean.com	$2a$10$S6ji7GmLWRcr/IqaJeaXruzu8yw724bkdnJHBrR8Tmibj0vB0.Lda	2017-10-24 13:58:35.524927	2017-10-24 13:58:35.524927
25	Hui	Wang	hui@hui.com	$2a$10$HHGk2kO5cMIafufHJs5HeO.SBFgRFTmKUGobNTXqEmzS8iTH9918S	2017-10-24 14:10:45.81173	2017-10-24 14:10:45.81173
26	j	k	j@k.com	$2a$10$lCqs.ql4g09LoXGntoYko.bzEWdcXHcMC6bJIr.WJ8ImD2NnJ1qmO	2017-10-24 14:12:51.185489	2017-10-24 14:12:51.185489
27	j	k	j	$2a$10$Ho8HxzlQG19FeoBVooLt7ehYa0n0ye4Je8p1aHDL9.BWkHySITMja	2017-10-24 14:16:05.783093	2017-10-24 14:16:05.783093
28	Steve	Jobs	steve@steve.com	$2a$10$Awlf7pZwzYTAIlmE5YMNdeqM5aFFvoQc.rnmyRV/775.t7dGpANkK	2017-10-26 03:01:14.839427	2017-10-26 03:01:14.839427
29	demo	demo	demo@demo.com	$2a$10$38tmAUEoj2fzsaA9Q96xcOiIhtV2Jt/bLx9Qyp5uGeX7ae6IVh8rC	2017-10-26 03:16:53.971338	2017-10-26 03:16:53.971338
30	user	user	user@user.com	$2a$10$y3EBVdVwopWOePCcxugBs.L.7yFl7phEBTX4ipMl3qYSLxRnBOJHW	2017-10-26 20:33:38.933689	2017-10-26 20:33:38.933689
31	test	checking	test@checking.com	$2a$10$I6YMBgd7H4YMQtIMENz3CO01xT95.X4.w7ZUbXjZYPwwHEN2yJwSy	2017-11-01 22:13:59.379766	2017-11-01 22:13:59.379766
32	sarah	sarah	sarah@sarah.com	$2a$10$OV/CrDJqJ5ing7WtjrwZ9eZoJXGwHvfz2Rbn.rZ8WFpgIjwqH5cUC	2017-11-03 21:37:40.794281	2017-11-03 21:37:40.794281
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 28, true);


--
-- Name: lexicons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lexicons_id_seq', 64, true);


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('notes_id_seq', 213, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 32, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: lexicons lexicons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lexicons
    ADD CONSTRAINT lexicons_pkey PRIMARY KEY (id);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

