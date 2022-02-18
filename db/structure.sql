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

--
-- Name: dict_int; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_int WITH SCHEMA public;


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: cv_en_intdict; Type: TEXT SEARCH DICTIONARY; Schema: public; Owner: -
--

CREATE TEXT SEARCH DICTIONARY public.cv_en_intdict (
    TEMPLATE = public.intdict_template,
    maxlen = 12, absval = 'true' );


--
-- Name: cv_it_intdict; Type: TEXT SEARCH DICTIONARY; Schema: public; Owner: -
--

CREATE TEXT SEARCH DICTIONARY public.cv_it_intdict (
    TEMPLATE = public.intdict_template,
    maxlen = 12, absval = 'true' );


--
-- Name: cv_en; Type: TEXT SEARCH CONFIGURATION; Schema: public; Owner: -
--

CREATE TEXT SEARCH CONFIGURATION public.cv_en (
    PARSER = pg_catalog."default" );

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR asciiword WITH english_stem;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR word WITH english_stem;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR numword WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR email WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR url WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR host WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR sfloat WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR version WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR hword_numpart WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR hword_part WITH english_stem;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR hword_asciipart WITH english_stem;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR numhword WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR asciihword WITH english_stem;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR hword WITH english_stem;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR url_path WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR file WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR "float" WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR "int" WITH public.cv_en_intdict;

ALTER TEXT SEARCH CONFIGURATION public.cv_en
    ADD MAPPING FOR uint WITH public.cv_en_intdict;


--
-- Name: cv_it; Type: TEXT SEARCH CONFIGURATION; Schema: public; Owner: -
--

CREATE TEXT SEARCH CONFIGURATION public.cv_it (
    PARSER = pg_catalog."default" );

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR asciiword WITH italian_stem;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR word WITH italian_stem;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR numword WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR email WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR url WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR host WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR sfloat WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR version WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR hword_numpart WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR hword_part WITH italian_stem;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR hword_asciipart WITH italian_stem;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR numhword WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR asciihword WITH italian_stem;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR hword WITH italian_stem;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR url_path WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR file WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR "float" WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR "int" WITH public.cv_it_intdict;

ALTER TEXT SEARCH CONFIGURATION public.cv_it
    ADD MAPPING FOR uint WITH public.cv_it_intdict;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp without time zone NOT NULL,
    service_name character varying NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attachments (
    id bigint NOT NULL,
    resource_type character varying,
    resource_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- Name: cvs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cvs (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    working_skills character varying(255),
    birth_date date,
    about text,
    skills character varying(255),
    future_plans character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    interests character varying(255),
    headshot_file_name character varying(255),
    headshot_content_type character varying(255),
    headshot_file_size bigint,
    headshot_updated_at timestamp without time zone,
    gender character varying(1) DEFAULT 'f'::character varying,
    birth_place character varying(255),
    birth_day character varying,
    birth_month character varying,
    birth_year character varying,
    published boolean DEFAULT false,
    learning_skills character varying,
    published_at timestamp without time zone,
    authorization_statement character varying(255),
    publish_last_name boolean DEFAULT false,
    custom_experience_sort boolean DEFAULT false,
    custom_education_sort boolean DEFAULT false,
    internship boolean DEFAULT false,
    temporary_contract boolean DEFAULT false,
    permanent_contract boolean DEFAULT false,
    freelance boolean DEFAULT false,
    part_time boolean DEFAULT false,
    full_time boolean DEFAULT false,
    in_person boolean DEFAULT false,
    remote_work boolean DEFAULT false,
    relocate boolean DEFAULT false,
    notice_period integer DEFAULT 0,
    expected_salary_cents integer DEFAULT 0 NOT NULL,
    expected_salary_currency character varying DEFAULT 'USD'::character varying NOT NULL
);


--
-- Name: cvs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cvs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cvs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cvs_id_seq OWNED BY public.cvs.id;


--
-- Name: educations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.educations (
    id bigint NOT NULL,
    cv_id bigint NOT NULL,
    started_on date,
    ended_on date,
    degree character varying(255),
    school character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer DEFAULT 0
);


--
-- Name: educations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.educations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: educations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.educations_id_seq OWNED BY public.educations.id;


--
-- Name: experiences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.experiences (
    id bigint NOT NULL,
    cv_id bigint NOT NULL,
    started_on date,
    ended_on date,
    company character varying(255) NOT NULL,
    location character varying(255),
    title character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    website_url character varying,
    "position" integer DEFAULT 0
);


--
-- Name: experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.experiences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.experiences_id_seq OWNED BY public.experiences.id;


--
-- Name: flags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flags (
    id bigint NOT NULL,
    user_id integer,
    cv_id integer,
    reason character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: flags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.flags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.flags_id_seq OWNED BY public.flags.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.languages (
    id bigint NOT NULL,
    cv_id bigint NOT NULL,
    language character varying(255) NOT NULL,
    level character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    latitude double precision,
    longitude double precision,
    radius integer,
    city character varying(255),
    country character varying(255),
    geocoded_address character varying(255),
    original_address character varying(255) NOT NULL,
    province_code character varying(255),
    region character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: mailkick_opt_outs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mailkick_opt_outs (
    id bigint NOT NULL,
    email character varying,
    user_type character varying,
    user_id bigint,
    active boolean DEFAULT true NOT NULL,
    reason character varying,
    list character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: mailkick_opt_outs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mailkick_opt_outs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mailkick_opt_outs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mailkick_opt_outs_id_seq OWNED BY public.mailkick_opt_outs.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.messages (
    id bigint NOT NULL,
    title character varying,
    name character varying,
    email character varying,
    phone character varying,
    content text,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status character varying DEFAULT 'new'::character varying NOT NULL
);


--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: newsletters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.newsletters (
    id bigint NOT NULL,
    name character varying,
    subject character varying,
    content text,
    recipient_ids character varying,
    sent_at timestamp without time zone,
    preference_type character varying,
    locale character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: newsletters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.newsletters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: newsletters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.newsletters_id_seq OWNED BY public.newsletters.id;


--
-- Name: passwordless_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.passwordless_sessions (
    id bigint NOT NULL,
    authenticatable_type character varying,
    authenticatable_id bigint,
    timeout_at timestamp without time zone NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    claimed_at timestamp without time zone,
    user_agent text NOT NULL,
    remote_addr character varying NOT NULL,
    token character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: passwordless_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.passwordless_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: passwordless_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.passwordless_sessions_id_seq OWNED BY public.passwordless_sessions.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: roles_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles_users (
    role_id bigint NOT NULL,
    user_id bigint NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: searches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.searches (
    id bigint NOT NULL,
    query character varying,
    slug character varying,
    locale character varying DEFAULT 'en'::character varying NOT NULL,
    views integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: searches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.searches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: searches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.searches_id_seq OWNED BY public.searches.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    encrypted_password character varying(255) NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tel character varying(255),
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    subdomain character varying,
    locale character varying,
    email_preference_online_updates boolean DEFAULT false
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- Name: cvs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cvs ALTER COLUMN id SET DEFAULT nextval('public.cvs_id_seq'::regclass);


--
-- Name: educations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.educations ALTER COLUMN id SET DEFAULT nextval('public.educations_id_seq'::regclass);


--
-- Name: experiences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experiences ALTER COLUMN id SET DEFAULT nextval('public.experiences_id_seq'::regclass);


--
-- Name: flags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flags ALTER COLUMN id SET DEFAULT nextval('public.flags_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: mailkick_opt_outs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mailkick_opt_outs ALTER COLUMN id SET DEFAULT nextval('public.mailkick_opt_outs_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: newsletters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.newsletters ALTER COLUMN id SET DEFAULT nextval('public.newsletters_id_seq'::regclass);


--
-- Name: passwordless_sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.passwordless_sessions ALTER COLUMN id SET DEFAULT nextval('public.passwordless_sessions_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: searches id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.searches ALTER COLUMN id SET DEFAULT nextval('public.searches_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: cvs cvs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cvs
    ADD CONSTRAINT cvs_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: searchable_cvs; Type: MATERIALIZED VIEW; Schema: public; Owner: -
--

CREATE MATERIALIZED VIEW public.searchable_cvs AS
 SELECT cvs.id AS cv_id,
    users.id AS user_id,
    users.subdomain,
    users.first_name,
    users.last_name,
    min(locations.latitude) AS latitude,
    min(locations.longitude) AS longitude,
    min((locations.original_address)::text) AS original_address,
    min((locations.city)::text) AS city,
    min((locations.region)::text) AS region,
    min((locations.country)::text) AS country,
    (((((((((setweight(to_tsvector('public.cv_en'::regconfig, COALESCE(cvs.about, ''::text)), 'B'::"char") || setweight(to_tsvector('public.cv_en'::regconfig, (COALESCE(cvs.skills, ''::character varying))::text), 'B'::"char")) || setweight(to_tsvector('public.cv_en'::regconfig, (COALESCE(cvs.working_skills, ''::character varying))::text), 'A'::"char")) || setweight(to_tsvector('public.cv_en'::regconfig, (COALESCE(users.first_name, ''::character varying))::text), 'A'::"char")) || setweight(to_tsvector('public.cv_en'::regconfig, (COALESCE(users.last_name, ''::character varying))::text), 'A'::"char")) || setweight(to_tsvector('public.cv_en'::regconfig, COALESCE(string_agg(((locations.city)::text || (locations.country)::text), ' '::text), ''::text)), 'B'::"char")) || setweight(to_tsvector('public.cv_en'::regconfig, COALESCE(string_agg(((locations.geocoded_address)::text || (locations.original_address)::text), ' '::text), ''::text)), 'D'::"char")) || setweight(to_tsvector('public.cv_en'::regconfig, COALESCE(string_agg((((educations.degree)::text || educations.description) || (educations.school)::text), ' '::text), ''::text)), 'D'::"char")) || setweight(to_tsvector('public.cv_en'::regconfig, COALESCE(string_agg(((languages.language)::text || (languages.level)::text), ' '::text), ''::text)), 'C'::"char")) || setweight(to_tsvector('public.cv_en'::regconfig, COALESCE(string_agg((((experiences.company)::text || experiences.description) || (experiences.title)::text), ' '::text), ''::text)), 'C'::"char")) AS search_en_content_tsvector,
    (((((((((setweight(to_tsvector('public.cv_it'::regconfig, COALESCE(cvs.about, ''::text)), 'B'::"char") || setweight(to_tsvector('public.cv_it'::regconfig, (COALESCE(cvs.skills, ''::character varying))::text), 'B'::"char")) || setweight(to_tsvector('public.cv_it'::regconfig, (COALESCE(cvs.working_skills, ''::character varying))::text), 'A'::"char")) || setweight(to_tsvector('public.cv_it'::regconfig, (COALESCE(users.first_name, ''::character varying))::text), 'A'::"char")) || setweight(to_tsvector('public.cv_it'::regconfig, (COALESCE(users.last_name, ''::character varying))::text), 'A'::"char")) || setweight(to_tsvector('public.cv_it'::regconfig, COALESCE(string_agg(((locations.city)::text || (locations.country)::text), ' '::text), ''::text)), 'B'::"char")) || setweight(to_tsvector('public.cv_it'::regconfig, COALESCE(string_agg(((locations.geocoded_address)::text || (locations.original_address)::text), ' '::text), ''::text)), 'D'::"char")) || setweight(to_tsvector('public.cv_it'::regconfig, COALESCE(string_agg((((educations.degree)::text || educations.description) || (educations.school)::text), ' '::text), ''::text)), 'D'::"char")) || setweight(to_tsvector('public.cv_it'::regconfig, COALESCE(string_agg(((languages.language)::text || (languages.level)::text), ' '::text), ''::text)), 'C'::"char")) || setweight(to_tsvector('public.cv_it'::regconfig, COALESCE(string_agg((((experiences.company)::text || experiences.description) || (experiences.title)::text), ' '::text), ''::text)), 'C'::"char")) AS search_it_content_tsvector
   FROM (((((public.cvs
     JOIN public.users ON ((users.id = cvs.user_id)))
     LEFT JOIN public.locations ON ((locations.user_id = users.id)))
     LEFT JOIN public.educations ON ((educations.cv_id = cvs.id)))
     LEFT JOIN public.languages ON ((languages.cv_id = cvs.id)))
     LEFT JOIN public.experiences ON ((experiences.cv_id = cvs.id)))
  WHERE (cvs.published = true)
  GROUP BY cvs.id, users.id
  WITH NO DATA;


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: educations educations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.educations
    ADD CONSTRAINT educations_pkey PRIMARY KEY (id);


--
-- Name: experiences experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experiences
    ADD CONSTRAINT experiences_pkey PRIMARY KEY (id);


--
-- Name: flags flags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flags
    ADD CONSTRAINT flags_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: mailkick_opt_outs mailkick_opt_outs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mailkick_opt_outs
    ADD CONSTRAINT mailkick_opt_outs_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: newsletters newsletters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.newsletters
    ADD CONSTRAINT newsletters_pkey PRIMARY KEY (id);


--
-- Name: passwordless_sessions passwordless_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.passwordless_sessions
    ADD CONSTRAINT passwordless_sessions_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: searches searches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.searches
    ADD CONSTRAINT searches_pkey PRIMARY KEY (id);


--
-- Name: authenticatable; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX authenticatable ON public.passwordless_sessions USING btree (authenticatable_type, authenticatable_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_attachments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attachments_on_resource_type_and_resource_id ON public.attachments USING btree (resource_type, resource_id);


--
-- Name: index_cvs_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cvs_on_user_id ON public.cvs USING btree (user_id);


--
-- Name: index_educations_on_cv_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_educations_on_cv_id ON public.educations USING btree (cv_id);


--
-- Name: index_experiences_on_cv_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_experiences_on_cv_id ON public.experiences USING btree (cv_id);


--
-- Name: index_languages_on_cv_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_languages_on_cv_id ON public.languages USING btree (cv_id);


--
-- Name: index_locations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_locations_on_user_id ON public.locations USING btree (user_id);


--
-- Name: index_mailkick_opt_outs_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_mailkick_opt_outs_on_email ON public.mailkick_opt_outs USING btree (email);


--
-- Name: index_mailkick_opt_outs_on_user_type_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_mailkick_opt_outs_on_user_type_and_user_id ON public.mailkick_opt_outs USING btree (user_type, user_id);


--
-- Name: index_messages_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_messages_on_user_id ON public.messages USING btree (user_id);


--
-- Name: index_roles_users_on_role_id_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_roles_users_on_role_id_and_user_id ON public.roles_users USING btree (role_id, user_id);


--
-- Name: index_roles_users_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_roles_users_on_user_id_and_role_id ON public.roles_users USING btree (user_id, role_id);


--
-- Name: index_searchable_cvs_on_cv_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_searchable_cvs_on_cv_id ON public.searchable_cvs USING btree (cv_id);


--
-- Name: index_searchable_cvs_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_searchable_cvs_on_user_id ON public.searchable_cvs USING btree (user_id);


--
-- Name: index_searches_on_query_and_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_searches_on_query_and_locale ON public.searches USING btree (query, locale);


--
-- Name: index_searches_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_searches_on_slug ON public.searches USING btree (slug);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: locations fk_rails_5e107925c6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT fk_rails_5e107925c6 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: languages fk_rails_680ef5e6f7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT fk_rails_680ef5e6f7 FOREIGN KEY (cv_id) REFERENCES public.cvs(id);


--
-- Name: educations fk_rails_78e65d20b6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.educations
    ADD CONSTRAINT fk_rails_78e65d20b6 FOREIGN KEY (cv_id) REFERENCES public.cvs(id);


--
-- Name: experiences fk_rails_94d57484f4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experiences
    ADD CONSTRAINT fk_rails_94d57484f4 FOREIGN KEY (cv_id) REFERENCES public.cvs(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: cvs fk_rails_f91a03fbe4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cvs
    ADD CONSTRAINT fk_rails_f91a03fbe4 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20190407182311'),
('20200418062532'),
('20200418101332'),
('20200418162800'),
('20200419121429'),
('20200419193022'),
('20200420081825'),
('20200422075822'),
('20200423152045'),
('20200427135356'),
('20200427161140'),
('20200508112642'),
('20200530095630'),
('20200703075518'),
('20200721174346'),
('20200920091803'),
('20210506190133'),
('20210506190331'),
('20210506193527'),
('20210518123101'),
('20210520081805'),
('20210530194229'),
('20210531115008'),
('20210531144530'),
('20210610104954'),
('20210903095035'),
('20210910055819'),
('20210923121737'),
('20211005060043'),
('20211005062200'),
('20211207100249'),
('20220104062550'),
('20220104062551'),
('20220104105826'),
('20220117095744'),
('20220218113712'):


