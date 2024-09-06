--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Postgres.app)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: freshsolder_user
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO freshsolder_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_permissions OWNER TO freshsolder_user;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_id_seq OWNER TO freshsolder_user;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_links; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.admin_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);


ALTER TABLE public.admin_permissions_role_links OWNER TO freshsolder_user;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.admin_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNER TO freshsolder_user;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNED BY public.admin_permissions_role_links.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_roles OWNER TO freshsolder_user;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_roles_id_seq OWNER TO freshsolder_user;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_users OWNER TO freshsolder_user;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_id_seq OWNER TO freshsolder_user;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_links; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.admin_users_roles_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_order double precision,
    user_order double precision
);


ALTER TABLE public.admin_users_roles_links OWNER TO freshsolder_user;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.admin_users_roles_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNER TO freshsolder_user;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNED BY public.admin_users_roles_links.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255),
    color character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.categories OWNER TO freshsolder_user;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO freshsolder_user;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: components_ordered_item_order_items; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.components_ordered_item_order_items (
    id integer NOT NULL,
    quantity integer,
    total_price double precision
);


ALTER TABLE public.components_ordered_item_order_items OWNER TO freshsolder_user;

--
-- Name: components_ordered_item_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.components_ordered_item_order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_ordered_item_order_items_id_seq OWNER TO freshsolder_user;

--
-- Name: components_ordered_item_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.components_ordered_item_order_items_id_seq OWNED BY public.components_ordered_item_order_items.id;


--
-- Name: components_ordered_item_order_items_product_links; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.components_ordered_item_order_items_product_links (
    id integer NOT NULL,
    order_item_id integer,
    product_id integer
);


ALTER TABLE public.components_ordered_item_order_items_product_links OWNER TO freshsolder_user;

--
-- Name: components_ordered_item_order_items_product_links_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.components_ordered_item_order_items_product_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_ordered_item_order_items_product_links_id_seq OWNER TO freshsolder_user;

--
-- Name: components_ordered_item_order_items_product_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.components_ordered_item_order_items_product_links_id_seq OWNED BY public.components_ordered_item_order_items_product_links.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.files OWNER TO freshsolder_user;

--
-- Name: files_folder_links; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.files_folder_links (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_order double precision
);


ALTER TABLE public.files_folder_links OWNER TO freshsolder_user;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.files_folder_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_folder_links_id_seq OWNER TO freshsolder_user;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.files_folder_links_id_seq OWNED BY public.files_folder_links.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_id_seq OWNER TO freshsolder_user;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_morphs; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.files_related_morphs (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.files_related_morphs OWNER TO freshsolder_user;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.files_related_morphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_related_morphs_id_seq OWNER TO freshsolder_user;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.files_related_morphs_id_seq OWNED BY public.files_related_morphs.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.i18n_locale OWNER TO freshsolder_user;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.i18n_locale_id_seq OWNER TO freshsolder_user;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    costumer_name character varying(255),
    order_address text,
    costumer_email character varying(255),
    duration character varying(255),
    phone character varying(255),
    postcode character varying(255),
    total_price double precision,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    expect_day character varying(255),
    status character varying(255),
    user_id bigint,
    delivery_price double precision,
    gst double precision,
    subtotal double precision,
    cancel_time character varying(255),
    delivery_time character varying(255),
    picked_time character varying(255),
    paid_time character varying(255)
);


ALTER TABLE public.orders OWNER TO freshsolder_user;

--
-- Name: orders_components; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.orders_components (
    id integer NOT NULL,
    entity_id integer,
    component_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.orders_components OWNER TO freshsolder_user;

--
-- Name: orders_components_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.orders_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_components_id_seq OWNER TO freshsolder_user;

--
-- Name: orders_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.orders_components_id_seq OWNED BY public.orders_components.id;


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO freshsolder_user;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: orders_users_permissions_user_links; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.orders_users_permissions_user_links (
    id integer NOT NULL,
    order_id integer,
    user_id integer
);


ALTER TABLE public.orders_users_permissions_user_links OWNER TO freshsolder_user;

--
-- Name: orders_users_permissions_user_links_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.orders_users_permissions_user_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_users_permissions_user_links_id_seq OWNER TO freshsolder_user;

--
-- Name: orders_users_permissions_user_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.orders_users_permissions_user_links_id_seq OWNED BY public.orders_users_permissions_user_links.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255),
    describtion text,
    price numeric(10,2),
    mrp numeric(10,2),
    pid character varying(255),
    qt character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.products OWNER TO freshsolder_user;

--
-- Name: products_categories_links; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.products_categories_links (
    id integer NOT NULL,
    product_id integer,
    category_id integer,
    category_order double precision,
    product_order double precision
);


ALTER TABLE public.products_categories_links OWNER TO freshsolder_user;

--
-- Name: products_categories_links_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.products_categories_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_categories_links_id_seq OWNER TO freshsolder_user;

--
-- Name: products_categories_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.products_categories_links_id_seq OWNED BY public.products_categories_links.id;


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO freshsolder_user;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: sliders; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.sliders (
    id integer NOT NULL,
    s_name character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.sliders OWNER TO freshsolder_user;

--
-- Name: sliders_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.sliders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sliders_id_seq OWNER TO freshsolder_user;

--
-- Name: sliders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.sliders_id_seq OWNED BY public.sliders.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO freshsolder_user;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNER TO freshsolder_user;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_links; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.strapi_api_token_permissions_token_links (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_order double precision
);


ALTER TABLE public.strapi_api_token_permissions_token_links OWNER TO freshsolder_user;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNER TO freshsolder_user;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNED BY public.strapi_api_token_permissions_token_links.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_tokens OWNER TO freshsolder_user;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNER TO freshsolder_user;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO freshsolder_user;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNER TO freshsolder_user;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO freshsolder_user;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_database_schema_id_seq OWNER TO freshsolder_user;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO freshsolder_user;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_migrations_id_seq OWNER TO freshsolder_user;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_release_actions; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.strapi_release_actions (
    id integer NOT NULL,
    type character varying(255),
    target_id integer,
    target_type character varying(255),
    content_type character varying(255),
    locale character varying(255),
    is_entry_valid boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_release_actions OWNER TO freshsolder_user;

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.strapi_release_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_id_seq OWNER TO freshsolder_user;

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.strapi_release_actions_id_seq OWNED BY public.strapi_release_actions.id;


--
-- Name: strapi_release_actions_release_links; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.strapi_release_actions_release_links (
    id integer NOT NULL,
    release_action_id integer,
    release_id integer,
    release_action_order double precision
);


ALTER TABLE public.strapi_release_actions_release_links OWNER TO freshsolder_user;

--
-- Name: strapi_release_actions_release_links_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.strapi_release_actions_release_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_release_links_id_seq OWNER TO freshsolder_user;

--
-- Name: strapi_release_actions_release_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.strapi_release_actions_release_links_id_seq OWNED BY public.strapi_release_actions_release_links.id;


--
-- Name: strapi_releases; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.strapi_releases (
    id integer NOT NULL,
    name character varying(255),
    released_at timestamp(6) without time zone,
    scheduled_at timestamp(6) without time zone,
    timezone character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_releases OWNER TO freshsolder_user;

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.strapi_releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_releases_id_seq OWNER TO freshsolder_user;

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.strapi_releases_id_seq OWNED BY public.strapi_releases.id;


--
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_token_permissions OWNER TO freshsolder_user;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNER TO freshsolder_user;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- Name: strapi_transfer_token_permissions_token_links; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.strapi_transfer_token_permissions_token_links (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_order double precision
);


ALTER TABLE public.strapi_transfer_token_permissions_token_links OWNER TO freshsolder_user;

--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq OWNER TO freshsolder_user;

--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq OWNED BY public.strapi_transfer_token_permissions_token_links.id;


--
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_tokens OWNER TO freshsolder_user;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNER TO freshsolder_user;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO freshsolder_user;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_webhooks_id_seq OWNER TO freshsolder_user;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_permissions OWNER TO freshsolder_user;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_id_seq OWNER TO freshsolder_user;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_links; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.up_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);


ALTER TABLE public.up_permissions_role_links OWNER TO freshsolder_user;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.up_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNER TO freshsolder_user;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNED BY public.up_permissions_role_links.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_roles OWNER TO freshsolder_user;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_roles_id_seq OWNER TO freshsolder_user;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_users OWNER TO freshsolder_user;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_id_seq OWNER TO freshsolder_user;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_links; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.up_users_role_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_order double precision
);


ALTER TABLE public.up_users_role_links OWNER TO freshsolder_user;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.up_users_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_role_links_id_seq OWNER TO freshsolder_user;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.up_users_role_links_id_seq OWNED BY public.up_users_role_links.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.upload_folders OWNER TO freshsolder_user;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_id_seq OWNER TO freshsolder_user;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_links; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.upload_folders_parent_links (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_order double precision
);


ALTER TABLE public.upload_folders_parent_links OWNER TO freshsolder_user;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.upload_folders_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNER TO freshsolder_user;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNED BY public.upload_folders_parent_links.id;


--
-- Name: user_carts; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.user_carts (
    id integer NOT NULL,
    quantity integer,
    amount double precision,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    user_id bigint
);


ALTER TABLE public.user_carts OWNER TO freshsolder_user;

--
-- Name: user_carts_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.user_carts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_carts_id_seq OWNER TO freshsolder_user;

--
-- Name: user_carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.user_carts_id_seq OWNED BY public.user_carts.id;


--
-- Name: user_carts_product_links; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.user_carts_product_links (
    id integer NOT NULL,
    user_cart_id integer,
    product_id integer,
    user_cart_order double precision
);


ALTER TABLE public.user_carts_product_links OWNER TO freshsolder_user;

--
-- Name: user_carts_product_links_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.user_carts_product_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_carts_product_links_id_seq OWNER TO freshsolder_user;

--
-- Name: user_carts_product_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.user_carts_product_links_id_seq OWNED BY public.user_carts_product_links.id;


--
-- Name: user_carts_users_permissions_user_links; Type: TABLE; Schema: public; Owner: freshsolder_user
--

CREATE TABLE public.user_carts_users_permissions_user_links (
    id integer NOT NULL,
    user_cart_id integer,
    user_id integer
);


ALTER TABLE public.user_carts_users_permissions_user_links OWNER TO freshsolder_user;

--
-- Name: user_carts_users_permissions_user_links_id_seq; Type: SEQUENCE; Schema: public; Owner: freshsolder_user
--

CREATE SEQUENCE public.user_carts_users_permissions_user_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_carts_users_permissions_user_links_id_seq OWNER TO freshsolder_user;

--
-- Name: user_carts_users_permissions_user_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freshsolder_user
--

ALTER SEQUENCE public.user_carts_users_permissions_user_links_id_seq OWNED BY public.user_carts_users_permissions_user_links.id;


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_links_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_links id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_users_roles_links ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_links_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: components_ordered_item_order_items id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.components_ordered_item_order_items ALTER COLUMN id SET DEFAULT nextval('public.components_ordered_item_order_items_id_seq'::regclass);


--
-- Name: components_ordered_item_order_items_product_links id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.components_ordered_item_order_items_product_links ALTER COLUMN id SET DEFAULT nextval('public.components_ordered_item_order_items_product_links_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_links id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.files_folder_links ALTER COLUMN id SET DEFAULT nextval('public.files_folder_links_id_seq'::regclass);


--
-- Name: files_related_morphs id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.files_related_morphs ALTER COLUMN id SET DEFAULT nextval('public.files_related_morphs_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: orders_components id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.orders_components ALTER COLUMN id SET DEFAULT nextval('public.orders_components_id_seq'::regclass);


--
-- Name: orders_users_permissions_user_links id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.orders_users_permissions_user_links ALTER COLUMN id SET DEFAULT nextval('public.orders_users_permissions_user_links_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products_categories_links id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.products_categories_links ALTER COLUMN id SET DEFAULT nextval('public.products_categories_links_id_seq'::regclass);


--
-- Name: sliders id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.sliders ALTER COLUMN id SET DEFAULT nextval('public.sliders_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_release_actions id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_release_actions ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_id_seq'::regclass);


--
-- Name: strapi_release_actions_release_links id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_release_actions_release_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_release_links_id_seq'::regclass);


--
-- Name: strapi_releases id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_releases ALTER COLUMN id SET DEFAULT nextval('public.strapi_releases_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_links_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_links id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_users_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_links_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_links id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.upload_folders_parent_links ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_links_id_seq'::regclass);


--
-- Name: user_carts id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.user_carts ALTER COLUMN id SET DEFAULT nextval('public.user_carts_id_seq'::regclass);


--
-- Name: user_carts_product_links id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.user_carts_product_links ALTER COLUMN id SET DEFAULT nextval('public.user_carts_product_links_id_seq'::regclass);


--
-- Name: user_carts_users_permissions_user_links id; Type: DEFAULT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.user_carts_users_permissions_user_links ALTER COLUMN id SET DEFAULT nextval('public.user_carts_users_permissions_user_links_id_seq'::regclass);


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.admin_permissions (id, action, action_parameters, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::upload.read	{}	\N	{}	[]	2024-08-21 14:04:45.871	2024-08-21 14:04:45.871	\N	\N
2	plugin::upload.configure-view	{}	\N	{}	[]	2024-08-21 14:04:46.971	2024-08-21 14:04:46.971	\N	\N
3	plugin::upload.assets.create	{}	\N	{}	[]	2024-08-21 14:04:48.039	2024-08-21 14:04:48.039	\N	\N
4	plugin::upload.assets.update	{}	\N	{}	[]	2024-08-21 14:04:49.116	2024-08-21 14:04:49.116	\N	\N
5	plugin::upload.assets.download	{}	\N	{}	[]	2024-08-21 14:04:50.188	2024-08-21 14:04:50.188	\N	\N
6	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-08-21 14:04:51.381	2024-08-21 14:04:51.381	\N	\N
7	plugin::upload.read	{}	\N	{}	["admin::is-creator"]	2024-08-21 14:04:52.473	2024-08-21 14:04:52.473	\N	\N
8	plugin::upload.configure-view	{}	\N	{}	[]	2024-08-21 14:04:53.546	2024-08-21 14:04:53.546	\N	\N
9	plugin::upload.assets.create	{}	\N	{}	[]	2024-08-21 14:04:54.615	2024-08-21 14:04:54.615	\N	\N
10	plugin::upload.assets.update	{}	\N	{}	["admin::is-creator"]	2024-08-21 14:04:55.691	2024-08-21 14:04:55.691	\N	\N
11	plugin::upload.assets.download	{}	\N	{}	[]	2024-08-21 14:04:56.765	2024-08-21 14:04:56.765	\N	\N
12	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-08-21 14:04:57.839	2024-08-21 14:04:57.839	\N	\N
13	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2024-08-21 14:04:59.645	2024-08-21 14:04:59.645	\N	\N
14	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2024-08-21 14:05:00.724	2024-08-21 14:05:00.724	\N	\N
15	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2024-08-21 14:05:01.858	2024-08-21 14:05:01.858	\N	\N
16	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2024-08-21 14:05:02.936	2024-08-21 14:05:02.936	\N	\N
17	plugin::content-manager.single-types.configure-view	{}	\N	{}	[]	2024-08-21 14:05:04.724	2024-08-21 14:05:04.724	\N	\N
18	plugin::content-manager.collection-types.configure-view	{}	\N	{}	[]	2024-08-21 14:05:06.567	2024-08-21 14:05:06.567	\N	\N
19	plugin::content-manager.components.configure-layout	{}	\N	{}	[]	2024-08-21 14:05:07.719	2024-08-21 14:05:07.719	\N	\N
20	plugin::content-type-builder.read	{}	\N	{}	[]	2024-08-21 14:05:09.742	2024-08-21 14:05:09.742	\N	\N
21	plugin::email.settings.read	{}	\N	{}	[]	2024-08-21 14:05:11.011	2024-08-21 14:05:11.011	\N	\N
22	plugin::upload.read	{}	\N	{}	[]	2024-08-21 14:05:12.421	2024-08-21 14:05:12.421	\N	\N
23	plugin::upload.assets.create	{}	\N	{}	[]	2024-08-21 14:05:13.885	2024-08-21 14:05:13.885	\N	\N
24	plugin::upload.assets.update	{}	\N	{}	[]	2024-08-21 14:05:15.073	2024-08-21 14:05:15.073	\N	\N
25	plugin::upload.assets.download	{}	\N	{}	[]	2024-08-21 14:05:16.604	2024-08-21 14:05:16.604	\N	\N
26	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-08-21 14:05:17.714	2024-08-21 14:05:17.714	\N	\N
27	plugin::upload.configure-view	{}	\N	{}	[]	2024-08-21 14:05:18.781	2024-08-21 14:05:18.781	\N	\N
28	plugin::upload.settings.read	{}	\N	{}	[]	2024-08-21 14:05:19.865	2024-08-21 14:05:19.865	\N	\N
29	plugin::users-permissions.roles.create	{}	\N	{}	[]	2024-08-21 14:05:20.938	2024-08-21 14:05:20.938	\N	\N
30	plugin::users-permissions.roles.read	{}	\N	{}	[]	2024-08-21 14:05:22.046	2024-08-21 14:05:22.046	\N	\N
31	plugin::users-permissions.roles.update	{}	\N	{}	[]	2024-08-21 14:05:23.119	2024-08-21 14:05:23.119	\N	\N
32	plugin::users-permissions.roles.delete	{}	\N	{}	[]	2024-08-21 14:05:24.184	2024-08-21 14:05:24.184	\N	\N
33	plugin::users-permissions.providers.read	{}	\N	{}	[]	2024-08-21 14:05:25.261	2024-08-21 14:05:25.261	\N	\N
34	plugin::users-permissions.providers.update	{}	\N	{}	[]	2024-08-21 14:05:26.403	2024-08-21 14:05:26.403	\N	\N
35	plugin::users-permissions.email-templates.read	{}	\N	{}	[]	2024-08-21 14:05:27.488	2024-08-21 14:05:27.488	\N	\N
36	plugin::users-permissions.email-templates.update	{}	\N	{}	[]	2024-08-21 14:05:28.581	2024-08-21 14:05:28.581	\N	\N
37	plugin::users-permissions.advanced-settings.read	{}	\N	{}	[]	2024-08-21 14:05:29.676	2024-08-21 14:05:29.676	\N	\N
38	plugin::users-permissions.advanced-settings.update	{}	\N	{}	[]	2024-08-21 14:05:30.815	2024-08-21 14:05:30.815	\N	\N
39	plugin::i18n.locale.create	{}	\N	{}	[]	2024-08-21 14:05:31.997	2024-08-21 14:05:31.997	\N	\N
40	plugin::i18n.locale.read	{}	\N	{}	[]	2024-08-21 14:05:33.07	2024-08-21 14:05:33.07	\N	\N
41	plugin::i18n.locale.update	{}	\N	{}	[]	2024-08-21 14:05:34.148	2024-08-21 14:05:34.148	\N	\N
42	plugin::i18n.locale.delete	{}	\N	{}	[]	2024-08-21 14:05:35.236	2024-08-21 14:05:35.236	\N	\N
43	admin::marketplace.read	{}	\N	{}	[]	2024-08-21 14:05:36.403	2024-08-21 14:05:36.403	\N	\N
44	admin::webhooks.create	{}	\N	{}	[]	2024-08-21 14:05:37.552	2024-08-21 14:05:37.552	\N	\N
45	admin::webhooks.read	{}	\N	{}	[]	2024-08-21 14:05:38.639	2024-08-21 14:05:38.639	\N	\N
46	admin::webhooks.update	{}	\N	{}	[]	2024-08-21 14:05:39.731	2024-08-21 14:05:39.731	\N	\N
47	admin::webhooks.delete	{}	\N	{}	[]	2024-08-21 14:05:40.812	2024-08-21 14:05:40.812	\N	\N
48	admin::users.create	{}	\N	{}	[]	2024-08-21 14:05:41.892	2024-08-21 14:05:41.892	\N	\N
49	admin::users.read	{}	\N	{}	[]	2024-08-21 14:05:42.97	2024-08-21 14:05:42.97	\N	\N
50	admin::users.update	{}	\N	{}	[]	2024-08-21 14:05:44.053	2024-08-21 14:05:44.053	\N	\N
51	admin::users.delete	{}	\N	{}	[]	2024-08-21 14:05:45.124	2024-08-21 14:05:45.124	\N	\N
52	admin::roles.create	{}	\N	{}	[]	2024-08-21 14:05:46.332	2024-08-21 14:05:46.332	\N	\N
53	admin::roles.read	{}	\N	{}	[]	2024-08-21 14:05:47.405	2024-08-21 14:05:47.405	\N	\N
54	admin::roles.update	{}	\N	{}	[]	2024-08-21 14:05:48.474	2024-08-21 14:05:48.474	\N	\N
55	admin::roles.delete	{}	\N	{}	[]	2024-08-21 14:05:49.558	2024-08-21 14:05:49.558	\N	\N
56	admin::api-tokens.access	{}	\N	{}	[]	2024-08-21 14:05:50.649	2024-08-21 14:05:50.649	\N	\N
57	admin::api-tokens.create	{}	\N	{}	[]	2024-08-21 14:05:51.714	2024-08-21 14:05:51.714	\N	\N
58	admin::api-tokens.read	{}	\N	{}	[]	2024-08-21 14:05:52.786	2024-08-21 14:05:52.786	\N	\N
59	admin::api-tokens.update	{}	\N	{}	[]	2024-08-21 14:05:53.988	2024-08-21 14:05:53.988	\N	\N
60	admin::api-tokens.regenerate	{}	\N	{}	[]	2024-08-21 14:05:55.055	2024-08-21 14:05:55.055	\N	\N
61	admin::api-tokens.delete	{}	\N	{}	[]	2024-08-21 14:05:56.12	2024-08-21 14:05:56.12	\N	\N
62	admin::project-settings.update	{}	\N	{}	[]	2024-08-21 14:05:57.206	2024-08-21 14:05:57.206	\N	\N
63	admin::project-settings.read	{}	\N	{}	[]	2024-08-21 14:05:58.297	2024-08-21 14:05:58.297	\N	\N
64	admin::transfer.tokens.access	{}	\N	{}	[]	2024-08-21 14:05:59.38	2024-08-21 14:05:59.38	\N	\N
65	admin::transfer.tokens.create	{}	\N	{}	[]	2024-08-21 14:06:00.476	2024-08-21 14:06:00.476	\N	\N
66	admin::transfer.tokens.read	{}	\N	{}	[]	2024-08-21 14:06:01.561	2024-08-21 14:06:01.561	\N	\N
67	admin::transfer.tokens.update	{}	\N	{}	[]	2024-08-21 14:06:02.638	2024-08-21 14:06:02.638	\N	\N
68	admin::transfer.tokens.regenerate	{}	\N	{}	[]	2024-08-21 14:06:03.707	2024-08-21 14:06:03.707	\N	\N
69	admin::transfer.tokens.delete	{}	\N	{}	[]	2024-08-21 14:06:04.782	2024-08-21 14:06:04.782	\N	\N
73	plugin::content-manager.explorer.delete	{}	api::category.category	{}	[]	2024-08-21 14:14:24.302	2024-08-21 14:14:24.302	\N	\N
74	plugin::content-manager.explorer.publish	{}	api::category.category	{}	[]	2024-08-21 14:14:25.385	2024-08-21 14:14:25.385	\N	\N
75	plugin::content-manager.explorer.create	{}	api::slider.slider	{"fields": ["SName", "Image", "Type"]}	[]	2024-08-21 19:32:53.644	2024-08-21 19:32:53.644	\N	\N
76	plugin::content-manager.explorer.read	{}	api::slider.slider	{"fields": ["SName", "Image", "Type"]}	[]	2024-08-21 19:32:54.702	2024-08-21 19:32:54.702	\N	\N
77	plugin::content-manager.explorer.update	{}	api::slider.slider	{"fields": ["SName", "Image", "Type"]}	[]	2024-08-21 19:32:55.794	2024-08-21 19:32:55.794	\N	\N
78	plugin::content-manager.explorer.delete	{}	api::slider.slider	{}	[]	2024-08-21 19:32:56.826	2024-08-21 19:32:56.826	\N	\N
79	plugin::content-manager.explorer.publish	{}	api::slider.slider	{}	[]	2024-08-21 19:32:57.865	2024-08-21 19:32:57.865	\N	\N
80	plugin::content-manager.explorer.create	{}	api::category.category	{"fields": ["icon", "name", "color", "products"]}	[]	2024-08-22 00:09:21.983	2024-08-22 00:09:21.983	\N	\N
82	plugin::content-manager.explorer.read	{}	api::category.category	{"fields": ["icon", "name", "color", "products"]}	[]	2024-08-22 00:09:24.223	2024-08-22 00:09:24.223	\N	\N
84	plugin::content-manager.explorer.update	{}	api::category.category	{"fields": ["icon", "name", "color", "products"]}	[]	2024-08-22 00:09:26.86	2024-08-22 00:09:26.86	\N	\N
86	plugin::content-manager.explorer.delete	{}	api::product.product	{}	[]	2024-08-22 00:09:29.07	2024-08-22 00:09:29.07	\N	\N
87	plugin::content-manager.explorer.publish	{}	api::product.product	{}	[]	2024-08-22 00:09:31.089	2024-08-22 00:09:31.089	\N	\N
91	plugin::content-manager.explorer.delete	{}	api::user-cart.user-cart	{}	[]	2024-08-24 17:18:54.43	2024-08-24 17:18:54.43	\N	\N
92	plugin::content-manager.explorer.publish	{}	api::user-cart.user-cart	{}	[]	2024-08-24 17:18:55.423	2024-08-24 17:18:55.423	\N	\N
111	plugin::content-manager.explorer.create	{}	api::product.product	{"fields": ["name", "describtion", "Price", "mrp", "PID", "Images", "QT", "categories", "user_carts"]}	[]	2024-08-25 01:55:06.213	2024-08-25 01:55:06.213	\N	\N
113	plugin::content-manager.explorer.read	{}	api::product.product	{"fields": ["name", "describtion", "Price", "mrp", "PID", "Images", "QT", "categories", "user_carts"]}	[]	2024-08-25 01:55:08.276	2024-08-25 01:55:08.276	\N	\N
115	plugin::content-manager.explorer.update	{}	api::product.product	{"fields": ["name", "describtion", "Price", "mrp", "PID", "Images", "QT", "categories", "user_carts"]}	[]	2024-08-25 01:55:10.367	2024-08-25 01:55:10.367	\N	\N
117	plugin::content-manager.explorer.create	{}	api::user-cart.user-cart	{"fields": ["quantity", "amount", "users_permissions_user", "product", "UserId"]}	[]	2024-08-25 12:03:29.6	2024-08-25 12:03:29.6	\N	\N
118	plugin::content-manager.explorer.read	{}	api::user-cart.user-cart	{"fields": ["quantity", "amount", "users_permissions_user", "product", "UserId"]}	[]	2024-08-25 12:03:30.868	2024-08-25 12:03:30.868	\N	\N
119	plugin::content-manager.explorer.update	{}	api::user-cart.user-cart	{"fields": ["quantity", "amount", "users_permissions_user", "product", "UserId"]}	[]	2024-08-25 12:03:32.2	2024-08-25 12:03:32.2	\N	\N
123	plugin::content-manager.explorer.delete	{}	api::order.order	{}	[]	2024-08-29 00:15:40.184	2024-08-29 00:15:40.184	\N	\N
124	plugin::content-manager.explorer.publish	{}	api::order.order	{}	[]	2024-08-29 00:15:41.395	2024-08-29 00:15:41.395	\N	\N
154	plugin::content-manager.explorer.create	{}	api::order.order	{"fields": ["CostumerName", "users_permissions_user", "OrderAddress", "CostumerEmail", "Duration", "Phone", "Postcode", "TotalPrice", "ExpectDay", "OrderItemList.quantity", "OrderItemList.TotalPrice", "OrderItemList.product", "status", "UserId", "DeliveryPrice", "GST", "Subtotal", "CancelTime", "DeliveryTime", "PickedTime", "PaidTime"]}	[]	2024-08-31 16:41:03.01	2024-08-31 16:41:03.01	\N	\N
155	plugin::content-manager.explorer.read	{}	api::order.order	{"fields": ["CostumerName", "users_permissions_user", "OrderAddress", "CostumerEmail", "Duration", "Phone", "Postcode", "TotalPrice", "ExpectDay", "OrderItemList.quantity", "OrderItemList.TotalPrice", "OrderItemList.product", "status", "UserId", "DeliveryPrice", "GST", "Subtotal", "CancelTime", "DeliveryTime", "PickedTime", "PaidTime"]}	[]	2024-08-31 16:41:03.993	2024-08-31 16:41:03.993	\N	\N
156	plugin::content-manager.explorer.update	{}	api::order.order	{"fields": ["CostumerName", "users_permissions_user", "OrderAddress", "CostumerEmail", "Duration", "Phone", "Postcode", "TotalPrice", "ExpectDay", "OrderItemList.quantity", "OrderItemList.TotalPrice", "OrderItemList.product", "status", "UserId", "DeliveryPrice", "GST", "Subtotal", "CancelTime", "DeliveryTime", "PickedTime", "PaidTime"]}	[]	2024-08-31 16:41:04.975	2024-08-31 16:41:04.975	\N	\N
\.


--
-- Data for Name: admin_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.admin_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
1	1	2	1
2	2	2	2
3	3	2	3
4	4	2	4
5	5	2	5
6	6	2	6
7	7	3	1
8	8	3	2
9	9	3	3
10	10	3	4
11	11	3	5
12	12	3	6
13	13	1	1
14	14	1	2
15	15	1	3
16	16	1	4
17	17	1	5
18	18	1	6
19	19	1	7
20	20	1	8
21	21	1	9
22	22	1	10
23	23	1	11
24	24	1	12
25	25	1	13
26	26	1	14
27	27	1	15
28	28	1	16
29	29	1	17
30	30	1	18
31	31	1	19
32	32	1	20
33	33	1	21
34	34	1	22
35	35	1	23
36	36	1	24
37	37	1	25
38	38	1	26
39	39	1	27
40	40	1	28
41	41	1	29
42	42	1	30
43	43	1	31
44	44	1	32
45	45	1	33
46	46	1	34
47	47	1	35
48	48	1	36
49	49	1	37
50	50	1	38
51	51	1	39
52	52	1	40
53	53	1	41
54	54	1	42
55	55	1	43
56	56	1	44
57	57	1	45
58	58	1	46
59	59	1	47
60	60	1	48
61	61	1	49
62	62	1	50
63	63	1	51
64	64	1	52
65	65	1	53
66	66	1	54
67	67	1	55
68	68	1	56
69	69	1	57
73	73	1	61
74	74	1	62
75	75	1	63
76	76	1	64
77	77	1	65
78	78	1	66
79	79	1	67
80	80	1	68
82	82	1	70
84	84	1	72
86	86	1	74
87	87	1	75
91	91	1	79
92	92	1	80
111	111	1	81
113	113	1	83
115	115	1	85
117	117	1	86
118	118	1	87
119	119	1	88
123	123	1	92
124	124	1	93
154	154	1	108
155	155	1	109
156	156	1	110
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2024-08-21 14:04:43.194	2024-08-21 14:04:43.194	\N	\N
2	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2024-08-21 14:04:44.265	2024-08-21 14:04:44.265	\N	\N
3	Author	strapi-author	Authors can manage the content they have created.	2024-08-21 14:04:45.157	2024-08-21 14:04:45.157	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Boyang	Yu	\N	boyangyby@gmail.com	$2a$10$Vk/.emm1TxGLeNmiUP531.0EJtRkXj.jSBhIVLhVhxIcVNtZVKXTO	\N	\N	t	f	\N	2024-08-21 14:09:05.32	2024-08-21 14:09:05.32	\N	\N
\.


--
-- Data for Name: admin_users_roles_links; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.admin_users_roles_links (id, user_id, role_id, role_order, user_order) FROM stdin;
1	1	1	1	1
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.categories (id, name, color, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
5	Breads	purple	2024-08-21 15:40:25.168	2024-09-03 02:52:42.662	2024-08-21 15:41:06.592	1	1
8	Eggs	brown	2024-08-21 15:45:06.572	2024-09-03 02:53:14.145	2024-08-21 15:45:20.134	1	1
1	Fruits	green	2024-08-21 14:21:21.483	2024-09-03 02:53:48.904	2024-08-21 14:49:37.472	1	1
4	Grains	yellow	2024-08-21 15:07:39.7	2024-09-03 02:54:30.581	2024-08-21 15:41:21.725	1	1
6	Personal Care	black	2024-08-21 15:42:32.784	2024-09-03 02:56:34.717	2024-08-21 15:42:40.37	1	1
2	Vegetables	red	2024-08-21 14:22:57.583	2024-09-03 02:57:03.357	2024-08-21 14:49:59.194	1	1
3	Meats	blue	2024-08-21 14:23:31.581	2024-09-07 01:36:28.601	2024-08-21 14:49:48.028	1	1
7	MilkJuice	orange	2024-08-21 15:44:13.3	2024-09-07 01:42:30.238	2024-08-21 15:44:21.608	1	1
\.


--
-- Data for Name: components_ordered_item_order_items; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.components_ordered_item_order_items (id, quantity, total_price) FROM stdin;
143	4	47.84
144	4	79.84
145	1	2.99
146	4	47.84
147	4	79.84
148	12	430.56000000000006
149	3	35.910000000000004
150	3	35.910000000000004
151	12	430.56000000000006
152	12	430.56000000000006
153	3	35.910000000000004
154	4	160
155	12	430.56000000000006
156	12	430.56000000000006
157	4	160
158	4	63.84
159	4	160
160	4	47.84
161	4	160
162	4	63.84
163	3	90
164	5	74.75
165	1	3.99
166	3	90
167	4	63.84
169	2	40
170	1	3.99
171	1	10
168	4	63.84
172	4	63.84
173	2	11.96
174	4	63.84
175	4	15.96
176	4	15.96
177	4	15.96
178	4	15.96
179	4	15.96
180	4	15.96
181	3	8.97
\.


--
-- Data for Name: components_ordered_item_order_items_product_links; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.components_ordered_item_order_items_product_links (id, order_item_id, product_id) FROM stdin;
142	143	2
143	144	4
144	145	2
145	147	4
146	146	2
147	148	2
148	149	1
149	150	1
150	151	2
151	152	2
152	153	1
153	155	2
154	154	5
155	156	2
156	157	5
157	158	1
158	159	5
159	160	2
160	161	5
161	162	3
162	164	2
163	163	5
164	165	3
165	166	5
166	167	1
167	168	1
168	169	5
169	170	1
170	171	5
171	172	1
172	173	2
173	174	1
174	175	1
175	176	3
176	177	3
177	178	3
178	179	1
179	180	1
180	181	15
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
115	pexels-pixabay-162712.jpg	\N	\N	5566	3716	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725295977/thumbnail_pexels_pixabay_162712_3f700f471e.jpg", "hash": "thumbnail_pexels_pixabay_162712_3f700f471e", "mime": "image/jpeg", "name": "thumbnail_pexels-pixabay-162712.jpg", "path": null, "size": 4.54, "width": 234, "height": 156, "sizeInBytes": 4544, "provider_metadata": {"public_id": "thumbnail_pexels_pixabay_162712_3f700f471e", "resource_type": "image"}}}	pexels_pixabay_162712_3f700f471e	.jpg	image/jpeg	957.36	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725295979/pexels_pixabay_162712_3f700f471e.jpg	\N	cloudinary	{"public_id": "pexels_pixabay_162712_3f700f471e", "resource_type": "image"}	/	2024-09-03 02:52:59.879	2024-09-03 02:52:59.879	1	1
114	pexels-pixabay-461060.jpg	\N	\N	5760	3840	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725295950/thumbnail_pexels_pixabay_461060_4273fce927.jpg", "hash": "thumbnail_pexels_pixabay_461060_4273fce927", "mime": "image/jpeg", "name": "thumbnail_pexels-pixabay-461060.jpg", "path": null, "size": 7.64, "width": 234, "height": 156, "sizeInBytes": 7637, "provider_metadata": {"public_id": "thumbnail_pexels_pixabay_461060_4273fce927", "resource_type": "image"}}}	pexels_pixabay_461060_4273fce927	.jpg	image/jpeg	1114.43	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725295952/pexels_pixabay_461060_4273fce927.jpg	\N	cloudinary	{"public_id": "pexels_pixabay_461060_4273fce927", "resource_type": "image"}	/	2024-09-03 02:52:33.068	2024-09-03 02:52:33.068	1	1
116	pexels-janetrangdoan-1132047.jpg	\N	\N	2049	1537	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296015/thumbnail_pexels_janetrangdoan_1132047_64dad5de5a.jpg", "hash": "thumbnail_pexels_janetrangdoan_1132047_64dad5de5a", "mime": "image/jpeg", "name": "thumbnail_pexels-janetrangdoan-1132047.jpg", "path": null, "size": 12.06, "width": 208, "height": 156, "sizeInBytes": 12062, "provider_metadata": {"public_id": "thumbnail_pexels_janetrangdoan_1132047_64dad5de5a", "resource_type": "image"}}}	pexels_janetrangdoan_1132047_64dad5de5a	.jpg	image/jpeg	393.99	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296017/pexels_janetrangdoan_1132047_64dad5de5a.jpg	\N	cloudinary	{"public_id": "pexels_janetrangdoan_1132047_64dad5de5a", "resource_type": "image"}	/	2024-09-03 02:53:37.947	2024-09-03 02:53:37.947	1	1
117	pexels-suzyhazelwood-1311771.jpg	\N	\N	5821	3376	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296059/thumbnail_pexels_suzyhazelwood_1311771_dc978d602b.jpg", "hash": "thumbnail_pexels_suzyhazelwood_1311771_dc978d602b", "mime": "image/jpeg", "name": "thumbnail_pexels-suzyhazelwood-1311771.jpg", "path": null, "size": 9.18, "width": 245, "height": 142, "sizeInBytes": 9176, "provider_metadata": {"public_id": "thumbnail_pexels_suzyhazelwood_1311771_dc978d602b", "resource_type": "image"}}}	pexels_suzyhazelwood_1311771_dc978d602b	.jpg	image/jpeg	2142.72	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296061/pexels_suzyhazelwood_1311771_dc978d602b.jpg	\N	cloudinary	{"public_id": "pexels_suzyhazelwood_1311771_dc978d602b", "resource_type": "image"}	/	2024-09-03 02:54:22.957	2024-09-03 02:54:22.957	1	1
118	pexels-osmanarabaciart-26699311.jpg	\N	\N	7728	5152	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296092/thumbnail_pexels_osmanarabaciart_26699311_c7f8c7844f.jpg", "hash": "thumbnail_pexels_osmanarabaciart_26699311_c7f8c7844f", "mime": "image/jpeg", "name": "thumbnail_pexels-osmanarabaciart-26699311.jpg", "path": null, "size": 9.95, "width": 234, "height": 156, "sizeInBytes": 9946, "provider_metadata": {"public_id": "thumbnail_pexels_osmanarabaciart_26699311_c7f8c7844f", "resource_type": "image"}}}	pexels_osmanarabaciart_26699311_c7f8c7844f	.jpg	image/jpeg	4848.94	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296096/pexels_osmanarabaciart_26699311_c7f8c7844f.jpg	\N	cloudinary	{"public_id": "pexels_osmanarabaciart_26699311_c7f8c7844f", "resource_type": "image"}	/	2024-09-03 02:54:57.123	2024-09-03 02:54:57.123	1	1
119	pexels-lephotographs-26570988.jpg	\N	\N	6000	4000	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296138/thumbnail_pexels_lephotographs_26570988_fcac0b18d2.jpg", "hash": "thumbnail_pexels_lephotographs_26570988_fcac0b18d2", "mime": "image/jpeg", "name": "thumbnail_pexels-lephotographs-26570988.jpg", "path": null, "size": 5.36, "width": 234, "height": 156, "sizeInBytes": 5362, "provider_metadata": {"public_id": "thumbnail_pexels_lephotographs_26570988_fcac0b18d2", "resource_type": "image"}}}	pexels_lephotographs_26570988_fcac0b18d2	.jpg	image/jpeg	727.70	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296139/pexels_lephotographs_26570988_fcac0b18d2.jpg	\N	cloudinary	{"public_id": "pexels_lephotographs_26570988_fcac0b18d2", "resource_type": "image"}	/	2024-09-03 02:55:40.345	2024-09-03 02:55:40.345	1	1
120	pexels-karolina-grabowska-4202926.jpg	\N	\N	6720	4480	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296159/thumbnail_pexels_karolina_grabowska_4202926_58457ab795.jpg", "hash": "thumbnail_pexels_karolina_grabowska_4202926_58457ab795", "mime": "image/jpeg", "name": "thumbnail_pexels-karolina-grabowska-4202926.jpg", "path": null, "size": 4.07, "width": 234, "height": 156, "sizeInBytes": 4068, "provider_metadata": {"public_id": "thumbnail_pexels_karolina_grabowska_4202926_58457ab795", "resource_type": "image"}}}	pexels_karolina_grabowska_4202926_58457ab795	.jpg	image/jpeg	1459.27	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296161/pexels_karolina_grabowska_4202926_58457ab795.jpg	\N	cloudinary	{"public_id": "pexels_karolina_grabowska_4202926_58457ab795", "resource_type": "image"}	/	2024-09-03 02:56:02.307	2024-09-03 02:56:02.307	1	1
121	pexels-enginakyurt-1435904.jpg	\N	\N	7477	4987	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296212/thumbnail_pexels_enginakyurt_1435904_aa2b5cc736.jpg", "hash": "thumbnail_pexels_enginakyurt_1435904_aa2b5cc736", "mime": "image/jpeg", "name": "thumbnail_pexels-enginakyurt-1435904.jpg", "path": null, "size": 13.03, "width": 234, "height": 156, "sizeInBytes": 13031, "provider_metadata": {"public_id": "thumbnail_pexels_enginakyurt_1435904_aa2b5cc736", "resource_type": "image"}}}	pexels_enginakyurt_1435904_aa2b5cc736	.jpg	image/jpeg	3208.83	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296215/pexels_enginakyurt_1435904_aa2b5cc736.jpg	\N	cloudinary	{"public_id": "pexels_enginakyurt_1435904_aa2b5cc736", "resource_type": "image"}	/	2024-09-03 02:56:56.116	2024-09-03 02:56:56.116	1	1
123	pexels-qjpioneer-708777.jpg	\N	\N	4001	2667	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296305/thumbnail_pexels_qjpioneer_708777_1f4181230b.jpg", "hash": "thumbnail_pexels_qjpioneer_708777_1f4181230b", "mime": "image/jpeg", "name": "thumbnail_pexels-qjpioneer-708777.jpg", "path": null, "size": 10.76, "width": 234, "height": 156, "sizeInBytes": 10764, "provider_metadata": {"public_id": "thumbnail_pexels_qjpioneer_708777_1f4181230b", "resource_type": "image"}}}	pexels_qjpioneer_708777_1f4181230b	.jpg	image/jpeg	1001.23	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296307/pexels_qjpioneer_708777_1f4181230b.jpg	\N	cloudinary	{"public_id": "pexels_qjpioneer_708777_1f4181230b", "resource_type": "image"}	/	2024-09-03 02:58:28.489	2024-09-03 02:58:28.489	1	1
124	pexels-rpphotography-693794.jpg	\N	\N	4017	2796	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296355/thumbnail_pexels_rpphotography_693794_22a65037e9.jpg", "hash": "thumbnail_pexels_rpphotography_693794_22a65037e9", "mime": "image/jpeg", "name": "thumbnail_pexels-rpphotography-693794.jpg", "path": null, "size": 9.17, "width": 224, "height": 156, "sizeInBytes": 9172, "provider_metadata": {"public_id": "thumbnail_pexels_rpphotography_693794_22a65037e9", "resource_type": "image"}}}	pexels_rpphotography_693794_22a65037e9	.jpg	image/jpeg	866.93	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296357/pexels_rpphotography_693794_22a65037e9.jpg	\N	cloudinary	{"public_id": "pexels_rpphotography_693794_22a65037e9", "resource_type": "image"}	/	2024-09-03 02:59:17.796	2024-09-03 02:59:17.796	1	1
125	pexels-suzyhazelwood-1937743.jpg	\N	\N	5280	3376	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296387/thumbnail_pexels_suzyhazelwood_1937743_ec88594002.jpg", "hash": "thumbnail_pexels_suzyhazelwood_1937743_ec88594002", "mime": "image/jpeg", "name": "thumbnail_pexels-suzyhazelwood-1937743.jpg", "path": null, "size": 10.39, "width": 244, "height": 156, "sizeInBytes": 10387, "provider_metadata": {"public_id": "thumbnail_pexels_suzyhazelwood_1937743_ec88594002", "resource_type": "image"}}}	pexels_suzyhazelwood_1937743_ec88594002	.jpg	image/jpeg	2508.19	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296390/pexels_suzyhazelwood_1937743_ec88594002.jpg	\N	cloudinary	{"public_id": "pexels_suzyhazelwood_1937743_ec88594002", "resource_type": "image"}	/	2024-09-03 02:59:52.192	2024-09-03 02:59:52.192	1	1
126	wiki.jpg	\N	\N	3008	2000	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296418/thumbnail_wiki_89e9b03701.jpg", "hash": "thumbnail_wiki_89e9b03701", "mime": "image/jpeg", "name": "thumbnail_wiki.jpg", "path": null, "size": 3.68, "width": 235, "height": 156, "sizeInBytes": 3676, "provider_metadata": {"public_id": "thumbnail_wiki_89e9b03701", "resource_type": "image"}}}	wiki_89e9b03701	.jpg	image/jpeg	221.32	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296419/wiki_89e9b03701.jpg	\N	cloudinary	{"public_id": "wiki_89e9b03701", "resource_type": "image"}	/	2024-09-03 03:00:20.349	2024-09-03 03:00:20.349	1	1
127	pexels-any-lane-5946081.jpg	\N	\N	4253	2801	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296449/thumbnail_pexels_any_lane_5946081_7eb67cb735.jpg", "hash": "thumbnail_pexels_any_lane_5946081_7eb67cb735", "mime": "image/jpeg", "name": "thumbnail_pexels-any-lane-5946081.jpg", "path": null, "size": 10.04, "width": 237, "height": 156, "sizeInBytes": 10035, "provider_metadata": {"public_id": "thumbnail_pexels_any_lane_5946081_7eb67cb735", "resource_type": "image"}}}	pexels_any_lane_5946081_7eb67cb735	.jpg	image/jpeg	1608.30	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296451/pexels_any_lane_5946081_7eb67cb735.jpg	\N	cloudinary	{"public_id": "pexels_any_lane_5946081_7eb67cb735", "resource_type": "image"}	/	2024-09-03 03:00:52.403	2024-09-03 03:00:52.403	1	1
129	tomato.jpg	\N	\N	5472	3648	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296525/thumbnail_tomato_894e2bf38b.jpg", "hash": "thumbnail_tomato_894e2bf38b", "mime": "image/jpeg", "name": "thumbnail_tomato.jpg", "path": null, "size": 10.4, "width": 234, "height": 156, "sizeInBytes": 10399, "provider_metadata": {"public_id": "thumbnail_tomato_894e2bf38b", "resource_type": "image"}}}	tomato_894e2bf38b	.jpg	image/jpeg	1637.92	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296528/tomato_894e2bf38b.jpg	\N	cloudinary	{"public_id": "tomato_894e2bf38b", "resource_type": "image"}	/	2024-09-03 03:02:09.432	2024-09-03 03:02:09.432	1	1
130	pexels-bo-ss-586337898-17201892.jpg	\N	\N	6716	4800	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296559/thumbnail_pexels_bo_ss_586337898_17201892_0fc2dd036e.jpg", "hash": "thumbnail_pexels_bo_ss_586337898_17201892_0fc2dd036e", "mime": "image/jpeg", "name": "thumbnail_pexels-bo-ss-586337898-17201892.jpg", "path": null, "size": 10.86, "width": 218, "height": 156, "sizeInBytes": 10856, "provider_metadata": {"public_id": "thumbnail_pexels_bo_ss_586337898_17201892_0fc2dd036e", "resource_type": "image"}}}	pexels_bo_ss_586337898_17201892_0fc2dd036e	.jpg	image/jpeg	9010.93	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296571/pexels_bo_ss_586337898_17201892_0fc2dd036e.jpg	\N	cloudinary	{"public_id": "pexels_bo_ss_586337898_17201892_0fc2dd036e", "resource_type": "image"}	/	2024-09-03 03:02:52.578	2024-09-03 03:02:52.578	1	1
131	pexels-goumbik-618775.jpg	\N	\N	4928	3264	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296661/thumbnail_pexels_goumbik_618775_d245df2eae.jpg", "hash": "thumbnail_pexels_goumbik_618775_d245df2eae", "mime": "image/jpeg", "name": "thumbnail_pexels-goumbik-618775.jpg", "path": null, "size": 8.7, "width": 236, "height": 156, "sizeInBytes": 8698, "provider_metadata": {"public_id": "thumbnail_pexels_goumbik_618775_d245df2eae", "resource_type": "image"}}}	pexels_goumbik_618775_d245df2eae	.jpg	image/jpeg	2176.98	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296664/pexels_goumbik_618775_d245df2eae.jpg	\N	cloudinary	{"public_id": "pexels_goumbik_618775_d245df2eae", "resource_type": "image"}	/	2024-09-03 03:04:25.152	2024-09-03 03:04:25.152	1	1
132	pexels-jill-wellington-1638660-39351.jpg	\N	\N	4297	2865	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296732/thumbnail_pexels_jill_wellington_1638660_39351_c5f9dd0f71.jpg", "hash": "thumbnail_pexels_jill_wellington_1638660_39351_c5f9dd0f71", "mime": "image/jpeg", "name": "thumbnail_pexels-jill-wellington-1638660-39351.jpg", "path": null, "size": 11.39, "width": 234, "height": 156, "sizeInBytes": 11388, "provider_metadata": {"public_id": "thumbnail_pexels_jill_wellington_1638660_39351_c5f9dd0f71", "resource_type": "image"}}}	pexels_jill_wellington_1638660_39351_c5f9dd0f71	.jpg	image/jpeg	833.36	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296733/pexels_jill_wellington_1638660_39351_c5f9dd0f71.jpg	\N	cloudinary	{"public_id": "pexels_jill_wellington_1638660_39351_c5f9dd0f71", "resource_type": "image"}	/	2024-09-03 03:05:34.726	2024-09-03 03:05:34.726	1	1
133	pexels-bo-ss-586337898-17201892.jpg	\N	\N	6716	4800	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296950/thumbnail_pexels_bo_ss_586337898_17201892_2e5e945af7.jpg", "hash": "thumbnail_pexels_bo_ss_586337898_17201892_2e5e945af7", "mime": "image/jpeg", "name": "thumbnail_pexels-bo-ss-586337898-17201892.jpg", "path": null, "size": 10.86, "width": 218, "height": 156, "sizeInBytes": 10856, "provider_metadata": {"public_id": "thumbnail_pexels_bo_ss_586337898_17201892_2e5e945af7", "resource_type": "image"}}}	pexels_bo_ss_586337898_17201892_2e5e945af7	.jpg	image/jpeg	9010.93	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725296959/pexels_bo_ss_586337898_17201892_2e5e945af7.jpg	\N	cloudinary	{"public_id": "pexels_bo_ss_586337898_17201892_2e5e945af7", "resource_type": "image"}	/	2024-09-03 03:09:20.784	2024-09-03 03:09:20.784	1	1
134	pexels-kindelmedia-6868789.jpg	\N	\N	5184	2920	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297021/thumbnail_pexels_kindelmedia_6868789_9ff2e3649e.jpg", "hash": "thumbnail_pexels_kindelmedia_6868789_9ff2e3649e", "mime": "image/jpeg", "name": "thumbnail_pexels-kindelmedia-6868789.jpg", "path": null, "size": 8.9, "width": 245, "height": 138, "sizeInBytes": 8897, "provider_metadata": {"public_id": "thumbnail_pexels_kindelmedia_6868789_9ff2e3649e", "resource_type": "image"}}}	pexels_kindelmedia_6868789_9ff2e3649e	.jpg	image/jpeg	1104.76	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297023/pexels_kindelmedia_6868789_9ff2e3649e.jpg	\N	cloudinary	{"public_id": "pexels_kindelmedia_6868789_9ff2e3649e", "resource_type": "image"}	/	2024-09-03 03:10:24.369	2024-09-03 03:10:24.369	1	1
135	pexels-kampus-7843985.jpg	\N	\N	5862	3913	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297058/thumbnail_pexels_kampus_7843985_023cad3894.jpg", "hash": "thumbnail_pexels_kampus_7843985_023cad3894", "mime": "image/jpeg", "name": "thumbnail_pexels-kampus-7843985.jpg", "path": null, "size": 9.3, "width": 234, "height": 156, "sizeInBytes": 9301, "provider_metadata": {"public_id": "thumbnail_pexels_kampus_7843985_023cad3894", "resource_type": "image"}}}	pexels_kampus_7843985_023cad3894	.jpg	image/jpeg	1672.21	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297061/pexels_kampus_7843985_023cad3894.jpg	\N	cloudinary	{"public_id": "pexels_kampus_7843985_023cad3894", "resource_type": "image"}	/	2024-09-03 03:11:02.275	2024-09-03 03:11:02.275	1	1
136	pexels-kampus-7843989.jpg	\N	\N	6016	4016	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297113/thumbnail_pexels_kampus_7843989_bb2a8b2aec.jpg", "hash": "thumbnail_pexels_kampus_7843989_bb2a8b2aec", "mime": "image/jpeg", "name": "thumbnail_pexels-kampus-7843989.jpg", "path": null, "size": 8.07, "width": 234, "height": 156, "sizeInBytes": 8067, "provider_metadata": {"public_id": "thumbnail_pexels_kampus_7843989_bb2a8b2aec", "resource_type": "image"}}}	pexels_kampus_7843989_bb2a8b2aec	.jpg	image/jpeg	1685.71	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297115/pexels_kampus_7843989_bb2a8b2aec.jpg	\N	cloudinary	{"public_id": "pexels_kampus_7843989_bb2a8b2aec", "resource_type": "image"}	/	2024-09-03 03:11:56.225	2024-09-03 03:11:56.225	1	1
137	pexels-pixabay-209482.jpg	\N	\N	6000	4000	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297154/thumbnail_pexels_pixabay_209482_c823a39ede.jpg", "hash": "thumbnail_pexels_pixabay_209482_c823a39ede", "mime": "image/jpeg", "name": "thumbnail_pexels-pixabay-209482.jpg", "path": null, "size": 13.52, "width": 234, "height": 156, "sizeInBytes": 13516, "provider_metadata": {"public_id": "thumbnail_pexels_pixabay_209482_c823a39ede", "resource_type": "image"}}}	pexels_pixabay_209482_c823a39ede	.jpg	image/jpeg	2501.88	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297158/pexels_pixabay_209482_c823a39ede.jpg	\N	cloudinary	{"public_id": "pexels_pixabay_209482_c823a39ede", "resource_type": "image"}	/	2024-09-03 03:12:38.632	2024-09-03 03:12:38.632	1	1
138	pexels-bo-ss-586337898-17201892.jpg	\N	\N	6716	4800	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297200/thumbnail_pexels_bo_ss_586337898_17201892_c5e32a018f.jpg", "hash": "thumbnail_pexels_bo_ss_586337898_17201892_c5e32a018f", "mime": "image/jpeg", "name": "thumbnail_pexels-bo-ss-586337898-17201892.jpg", "path": null, "size": 10.86, "width": 218, "height": 156, "sizeInBytes": 10856, "provider_metadata": {"public_id": "thumbnail_pexels_bo_ss_586337898_17201892_c5e32a018f", "resource_type": "image"}}}	pexels_bo_ss_586337898_17201892_c5e32a018f	.jpg	image/jpeg	9010.93	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297208/pexels_bo_ss_586337898_17201892_c5e32a018f.jpg	\N	cloudinary	{"public_id": "pexels_bo_ss_586337898_17201892_c5e32a018f", "resource_type": "image"}	/	2024-09-03 03:13:29.894	2024-09-03 03:13:29.894	1	1
139	pexels-rajesh-tp-749235-2098110.jpg	\N	\N	5344	4008	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297239/thumbnail_pexels_rajesh_tp_749235_2098110_0491d48f39.jpg", "hash": "thumbnail_pexels_rajesh_tp_749235_2098110_0491d48f39", "mime": "image/jpeg", "name": "thumbnail_pexels-rajesh-tp-749235-2098110.jpg", "path": null, "size": 9.63, "width": 208, "height": 156, "sizeInBytes": 9630, "provider_metadata": {"public_id": "thumbnail_pexels_rajesh_tp_749235_2098110_0491d48f39", "resource_type": "image"}}}	pexels_rajesh_tp_749235_2098110_0491d48f39	.jpg	image/jpeg	1614.89	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297263/pexels_rajesh_tp_749235_2098110_0491d48f39.jpg	\N	cloudinary	{"public_id": "pexels_rajesh_tp_749235_2098110_0491d48f39", "resource_type": "image"}	/	2024-09-03 03:14:23.936	2024-09-03 03:14:23.936	1	1
140	pexels-osmanarabaciart-26699311.jpg	\N	\N	7728	5152	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297315/thumbnail_pexels_osmanarabaciart_26699311_58b59c7050.jpg", "hash": "thumbnail_pexels_osmanarabaciart_26699311_58b59c7050", "mime": "image/jpeg", "name": "thumbnail_pexels-osmanarabaciart-26699311.jpg", "path": null, "size": 9.95, "width": 234, "height": 156, "sizeInBytes": 9946, "provider_metadata": {"public_id": "thumbnail_pexels_osmanarabaciart_26699311_58b59c7050", "resource_type": "image"}}}	pexels_osmanarabaciart_26699311_58b59c7050	.jpg	image/jpeg	4848.94	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297325/pexels_osmanarabaciart_26699311_58b59c7050.jpg	\N	cloudinary	{"public_id": "pexels_osmanarabaciart_26699311_58b59c7050", "resource_type": "image"}	/	2024-09-03 03:15:26.145	2024-09-03 03:15:26.145	1	1
141	pexels-brandon-randolph-1059875-2042161.jpg	\N	\N	4240	2832	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297385/thumbnail_pexels_brandon_randolph_1059875_2042161_bfc3efccae.jpg", "hash": "thumbnail_pexels_brandon_randolph_1059875_2042161_bfc3efccae", "mime": "image/jpeg", "name": "thumbnail_pexels-brandon-randolph-1059875-2042161.jpg", "path": null, "size": 6.06, "width": 234, "height": 156, "sizeInBytes": 6061, "provider_metadata": {"public_id": "thumbnail_pexels_brandon_randolph_1059875_2042161_bfc3efccae", "resource_type": "image"}}}	pexels_brandon_randolph_1059875_2042161_bfc3efccae	.jpg	image/jpeg	1223.74	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297387/pexels_brandon_randolph_1059875_2042161_bfc3efccae.jpg	\N	cloudinary	{"public_id": "pexels_brandon_randolph_1059875_2042161_bfc3efccae", "resource_type": "image"}	/	2024-09-03 03:16:28.262	2024-09-03 03:16:28.262	1	1
142	pexels-jk04-2933243.jpg	\N	\N	6240	4160	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297430/thumbnail_pexels_jk04_2933243_c71b6fd094.jpg", "hash": "thumbnail_pexels_jk04_2933243_c71b6fd094", "mime": "image/jpeg", "name": "thumbnail_pexels-jk04-2933243.jpg", "path": null, "size": 9.2, "width": 234, "height": 156, "sizeInBytes": 9202, "provider_metadata": {"public_id": "thumbnail_pexels_jk04_2933243_c71b6fd094", "resource_type": "image"}}}	pexels_jk04_2933243_c71b6fd094	.jpg	image/jpeg	2247.15	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725297439/pexels_jk04_2933243_c71b6fd094.jpg	\N	cloudinary	{"public_id": "pexels_jk04_2933243_c71b6fd094", "resource_type": "image"}	/	2024-09-03 03:17:19.859	2024-09-03 03:17:19.859	1	1
143	pexels-pixabay-209439.jpg	\N	\N	6000	4000	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725632348/thumbnail_pexels_pixabay_209439_d3fe689c60.jpg", "hash": "thumbnail_pexels_pixabay_209439_d3fe689c60", "mime": "image/jpeg", "name": "thumbnail_pexels-pixabay-209439.jpg", "path": null, "size": 6.06, "width": 234, "height": 156, "sizeInBytes": 6061, "provider_metadata": {"public_id": "thumbnail_pexels_pixabay_209439_d3fe689c60", "resource_type": "image"}}}	pexels_pixabay_209439_d3fe689c60	.jpg	image/jpeg	1857.61	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725632351/pexels_pixabay_209439_d3fe689c60.jpg	\N	cloudinary	{"public_id": "pexels_pixabay_209439_d3fe689c60", "resource_type": "image"}	/	2024-09-07 00:19:12.043	2024-09-07 00:19:12.043	1	1
144	pexels-anadragon-2959303.jpg	\N	\N	5184	3456	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725634482/thumbnail_pexels_anadragon_2959303_685b7bb4e6.jpg", "hash": "thumbnail_pexels_anadragon_2959303_685b7bb4e6", "mime": "image/jpeg", "name": "thumbnail_pexels-anadragon-2959303.jpg", "path": null, "size": 6.63, "width": 234, "height": 156, "sizeInBytes": 6630, "provider_metadata": {"public_id": "thumbnail_pexels_anadragon_2959303_685b7bb4e6", "resource_type": "image"}}}	pexels_anadragon_2959303_685b7bb4e6	.jpg	image/jpeg	752.87	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725634484/pexels_anadragon_2959303_685b7bb4e6.jpg	\N	cloudinary	{"public_id": "pexels_anadragon_2959303_685b7bb4e6", "resource_type": "image"}	/	2024-09-07 00:54:44.659	2024-09-07 00:54:44.659	1	1
146	pexels-boris-manev-371032-998708.jpg	\N	\N	5184	3456	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725634515/thumbnail_pexels_boris_manev_371032_998708_17cf965fc9.jpg", "hash": "thumbnail_pexels_boris_manev_371032_998708_17cf965fc9", "mime": "image/jpeg", "name": "thumbnail_pexels-boris-manev-371032-998708.jpg", "path": null, "size": 7.65, "width": 234, "height": 156, "sizeInBytes": 7645, "provider_metadata": {"public_id": "thumbnail_pexels_boris_manev_371032_998708_17cf965fc9", "resource_type": "image"}}}	pexels_boris_manev_371032_998708_17cf965fc9	.jpg	image/jpeg	1047.68	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725634517/pexels_boris_manev_371032_998708_17cf965fc9.jpg	\N	cloudinary	{"public_id": "pexels_boris_manev_371032_998708_17cf965fc9", "resource_type": "image"}	/	2024-09-07 00:55:18.087	2024-09-07 00:55:18.087	1	1
145	pexels-kseniachernaya-3980617.jpg	\N	\N	2403	3600	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725634515/thumbnail_pexels_kseniachernaya_3980617_5f886be6e7.jpg", "hash": "thumbnail_pexels_kseniachernaya_3980617_5f886be6e7", "mime": "image/jpeg", "name": "thumbnail_pexels-kseniachernaya-3980617.jpg", "path": null, "size": 4.84, "width": 104, "height": 156, "sizeInBytes": 4835, "provider_metadata": {"public_id": "thumbnail_pexels_kseniachernaya_3980617_5f886be6e7", "resource_type": "image"}}}	pexels_kseniachernaya_3980617_5f886be6e7	.jpg	image/jpeg	488.07	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725634517/pexels_kseniachernaya_3980617_5f886be6e7.jpg	\N	cloudinary	{"public_id": "pexels_kseniachernaya_3980617_5f886be6e7", "resource_type": "image"}	/	2024-09-07 00:55:17.877	2024-09-07 00:58:28.504	1	1
147	pexels-karolina-grabowska-4040549.jpg	\N	\N	4480	6720	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725634933/thumbnail_pexels_karolina_grabowska_4040549_2a832baddc.jpg", "hash": "thumbnail_pexels_karolina_grabowska_4040549_2a832baddc", "mime": "image/jpeg", "name": "thumbnail_pexels-karolina-grabowska-4040549.jpg", "path": null, "size": 4.56, "width": 104, "height": 156, "sizeInBytes": 4558, "provider_metadata": {"public_id": "thumbnail_pexels_karolina_grabowska_4040549_2a832baddc", "resource_type": "image"}}}	pexels_karolina_grabowska_4040549_2a832baddc	.jpg	image/jpeg	1487.39	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725634935/pexels_karolina_grabowska_4040549_2a832baddc.jpg	\N	cloudinary	{"public_id": "pexels_karolina_grabowska_4040549_2a832baddc", "resource_type": "image"}	/	2024-09-07 01:02:16.015	2024-09-07 01:02:16.015	1	1
148	pexels-alexasfotos-2198626.jpg	\N	\N	4874	3588	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725635317/thumbnail_pexels_alexasfotos_2198626_a496247c52.jpg", "hash": "thumbnail_pexels_alexasfotos_2198626_a496247c52", "mime": "image/jpeg", "name": "thumbnail_pexels-alexasfotos-2198626.jpg", "path": null, "size": 2.49, "width": 212, "height": 156, "sizeInBytes": 2485, "provider_metadata": {"public_id": "thumbnail_pexels_alexasfotos_2198626_a496247c52", "resource_type": "image"}}}	pexels_alexasfotos_2198626_a496247c52	.jpg	image/jpeg	248.52	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725635317/pexels_alexasfotos_2198626_a496247c52.jpg	\N	cloudinary	{"public_id": "pexels_alexasfotos_2198626_a496247c52", "resource_type": "image"}	/	2024-09-07 01:08:38.344	2024-09-07 01:08:38.344	1	1
149	pexels-brunoscramgnon-1337825.jpg	\N	\N	3264	4928	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725635317/thumbnail_pexels_brunoscramgnon_1337825_c7c260d05a.jpg", "hash": "thumbnail_pexels_brunoscramgnon_1337825_c7c260d05a", "mime": "image/jpeg", "name": "thumbnail_pexels-brunoscramgnon-1337825.jpg", "path": null, "size": 2.47, "width": 103, "height": 156, "sizeInBytes": 2473, "provider_metadata": {"public_id": "thumbnail_pexels_brunoscramgnon_1337825_c7c260d05a", "resource_type": "image"}}}	pexels_brunoscramgnon_1337825_c7c260d05a	.jpg	image/jpeg	722.69	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725635318/pexels_brunoscramgnon_1337825_c7c260d05a.jpg	\N	cloudinary	{"public_id": "pexels_brunoscramgnon_1337825_c7c260d05a", "resource_type": "image"}	/	2024-09-07 01:08:39.929	2024-09-07 01:08:39.929	1	1
150	pexels-pixabay-158053.jpg	\N	\N	5472	3648	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725635317/thumbnail_pexels_pixabay_158053_804e3f8e4f.jpg", "hash": "thumbnail_pexels_pixabay_158053_804e3f8e4f", "mime": "image/jpeg", "name": "thumbnail_pexels-pixabay-158053.jpg", "path": null, "size": 9.57, "width": 234, "height": 156, "sizeInBytes": 9568, "provider_metadata": {"public_id": "thumbnail_pexels_pixabay_158053_804e3f8e4f", "resource_type": "image"}}}	pexels_pixabay_158053_804e3f8e4f	.jpg	image/jpeg	1085.13	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725635319/pexels_pixabay_158053_804e3f8e4f.jpg	\N	cloudinary	{"public_id": "pexels_pixabay_158053_804e3f8e4f", "resource_type": "image"}	/	2024-09-07 01:08:40.036	2024-09-07 01:08:40.036	1	1
151	pexels-pixabay-248412.jpg	\N	\N	3749	5243	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725635317/thumbnail_pexels_pixabay_248412_e6f655682c.jpg", "hash": "thumbnail_pexels_pixabay_248412_e6f655682c", "mime": "image/jpeg", "name": "thumbnail_pexels-pixabay-248412.jpg", "path": null, "size": 2.68, "width": 111, "height": 156, "sizeInBytes": 2684, "provider_metadata": {"public_id": "thumbnail_pexels_pixabay_248412_e6f655682c", "resource_type": "image"}}}	pexels_pixabay_248412_e6f655682c	.jpg	image/jpeg	770.86	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725635320/pexels_pixabay_248412_e6f655682c.jpg	\N	cloudinary	{"public_id": "pexels_pixabay_248412_e6f655682c", "resource_type": "image"}	/	2024-09-07 01:08:41.052	2024-09-07 01:08:41.052	1	1
152	pexels-myburgh-2082617.jpg	\N	\N	5167	3445	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725635317/thumbnail_pexels_myburgh_2082617_90d6e652b6.jpg", "hash": "thumbnail_pexels_myburgh_2082617_90d6e652b6", "mime": "image/jpeg", "name": "thumbnail_pexels-myburgh-2082617.jpg", "path": null, "size": 6.92, "width": 234, "height": 156, "sizeInBytes": 6922, "provider_metadata": {"public_id": "thumbnail_pexels_myburgh_2082617_90d6e652b6", "resource_type": "image"}}}	pexels_myburgh_2082617_90d6e652b6	.jpg	image/jpeg	1674.34	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725635338/pexels_myburgh_2082617_90d6e652b6.jpg	\N	cloudinary	{"public_id": "pexels_myburgh_2082617_90d6e652b6", "resource_type": "image"}	/	2024-09-07 01:08:59.212	2024-09-07 01:08:59.212	1	1
154	pexels-mali-65175.jpg	\N	\N	1920	1278	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725636611/thumbnail_pexels_mali_65175_4b26c42ea0.jpg", "hash": "thumbnail_pexels_mali_65175_4b26c42ea0", "mime": "image/jpeg", "name": "thumbnail_pexels-mali-65175.jpg", "path": null, "size": 10.91, "width": 235, "height": 156, "sizeInBytes": 10912, "provider_metadata": {"public_id": "thumbnail_pexels_mali_65175_4b26c42ea0", "resource_type": "image"}}}	pexels_mali_65175_4b26c42ea0	.jpg	image/jpeg	254.62	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725636613/pexels_mali_65175_4b26c42ea0.jpg	\N	cloudinary	{"public_id": "pexels_mali_65175_4b26c42ea0", "resource_type": "image"}	/	2024-09-07 01:30:15.075	2024-09-07 01:30:15.075	1	1
155	pexels-castorlystock-3654607.jpg	\N	\N	6000	4000	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725637495/thumbnail_pexels_castorlystock_3654607_1f43d9ca7e.jpg", "hash": "thumbnail_pexels_castorlystock_3654607_1f43d9ca7e", "mime": "image/jpeg", "name": "thumbnail_pexels-castorlystock-3654607.jpg", "path": null, "size": 4.88, "width": 234, "height": 156, "sizeInBytes": 4881, "provider_metadata": {"public_id": "thumbnail_pexels_castorlystock_3654607_1f43d9ca7e", "resource_type": "image"}}}	pexels_castorlystock_3654607_1f43d9ca7e	.jpg	image/jpeg	1279.95	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725637497/pexels_castorlystock_3654607_1f43d9ca7e.jpg	\N	cloudinary	{"public_id": "pexels_castorlystock_3654607_1f43d9ca7e", "resource_type": "image"}	/	2024-09-07 01:44:58.295	2024-09-07 01:44:58.295	1	1
156	pexels-karolina-grabowska-4202463.jpg	\N	\N	3901	5851	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725637495/thumbnail_pexels_karolina_grabowska_4202463_1ff372c9bc.jpg", "hash": "thumbnail_pexels_karolina_grabowska_4202463_1ff372c9bc", "mime": "image/jpeg", "name": "thumbnail_pexels-karolina-grabowska-4202463.jpg", "path": null, "size": 3.05, "width": 104, "height": 156, "sizeInBytes": 3048, "provider_metadata": {"public_id": "thumbnail_pexels_karolina_grabowska_4202463_1ff372c9bc", "resource_type": "image"}}}	pexels_karolina_grabowska_4202463_1ff372c9bc	.jpg	image/jpeg	1878.78	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725637500/pexels_karolina_grabowska_4202463_1ff372c9bc.jpg	\N	cloudinary	{"public_id": "pexels_karolina_grabowska_4202463_1ff372c9bc", "resource_type": "image"}	/	2024-09-07 01:45:00.816	2024-09-07 01:45:00.816	1	1
157	pexels-polina-tankilevitch-4110251.jpg	\N	\N	3000	2000	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725637842/thumbnail_pexels_polina_tankilevitch_4110251_df1654932b.jpg", "hash": "thumbnail_pexels_polina_tankilevitch_4110251_df1654932b", "mime": "image/jpeg", "name": "thumbnail_pexels-polina-tankilevitch-4110251.jpg", "path": null, "size": 5.91, "width": 234, "height": 156, "sizeInBytes": 5906, "provider_metadata": {"public_id": "thumbnail_pexels_polina_tankilevitch_4110251_df1654932b", "resource_type": "image"}}}	pexels_polina_tankilevitch_4110251_df1654932b	.jpg	image/jpeg	210.46	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725637843/pexels_polina_tankilevitch_4110251_df1654932b.jpg	\N	cloudinary	{"public_id": "pexels_polina_tankilevitch_4110251_df1654932b", "resource_type": "image"}	/	2024-09-07 01:50:44.58	2024-09-07 01:50:44.58	1	1
158	pexels-pixabay-54084.jpg	\N	\N	6015	3999	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725637843/thumbnail_pexels_pixabay_54084_c618863aaa.jpg", "hash": "thumbnail_pexels_pixabay_54084_c618863aaa", "mime": "image/jpeg", "name": "thumbnail_pexels-pixabay-54084.jpg", "path": null, "size": 16.05, "width": 235, "height": 156, "sizeInBytes": 16053, "provider_metadata": {"public_id": "thumbnail_pexels_pixabay_54084_c618863aaa", "resource_type": "image"}}}	pexels_pixabay_54084_c618863aaa	.jpg	image/jpeg	2604.39	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725637846/pexels_pixabay_54084_c618863aaa.jpg	\N	cloudinary	{"public_id": "pexels_pixabay_54084_c618863aaa", "resource_type": "image"}	/	2024-09-07 01:50:47.166	2024-09-07 01:50:47.166	1	1
159	pexels-ellis-1448665.jpg	\N	\N	5380	3586	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725638075/thumbnail_pexels_ellis_1448665_6ebf31d3b8.jpg", "hash": "thumbnail_pexels_ellis_1448665_6ebf31d3b8", "mime": "image/jpeg", "name": "thumbnail_pexels-ellis-1448665.jpg", "path": null, "size": 5.63, "width": 234, "height": 156, "sizeInBytes": 5632, "provider_metadata": {"public_id": "thumbnail_pexels_ellis_1448665_6ebf31d3b8", "resource_type": "image"}}}	pexels_ellis_1448665_6ebf31d3b8	.jpg	image/jpeg	1649.17	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725638078/pexels_ellis_1448665_6ebf31d3b8.jpg	\N	cloudinary	{"public_id": "pexels_ellis_1448665_6ebf31d3b8", "resource_type": "image"}	/	2024-09-07 01:54:38.768	2024-09-07 01:54:38.768	1	1
160	pexels-ivan-j-long-578165-1387075.jpg	\N	\N	3454	2303	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725638075/thumbnail_pexels_ivan_j_long_578165_1387075_27ac7f09ca.jpg", "hash": "thumbnail_pexels_ivan_j_long_578165_1387075_27ac7f09ca", "mime": "image/jpeg", "name": "thumbnail_pexels-ivan-j-long-578165-1387075.jpg", "path": null, "size": 11.38, "width": 234, "height": 156, "sizeInBytes": 11375, "provider_metadata": {"public_id": "thumbnail_pexels_ivan_j_long_578165_1387075_27ac7f09ca", "resource_type": "image"}}}	pexels_ivan_j_long_578165_1387075_27ac7f09ca	.jpg	image/jpeg	1324.40	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725638079/pexels_ivan_j_long_578165_1387075_27ac7f09ca.jpg	\N	cloudinary	{"public_id": "pexels_ivan_j_long_578165_1387075_27ac7f09ca", "resource_type": "image"}	/	2024-09-07 01:54:39.896	2024-09-07 01:54:39.896	1	1
153	pexels-pascal-claivaz-66964-410648.jpg	\N	\N	3031	2274	{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dmzqtnazm/image/upload/v1725636611/thumbnail_pexels_pascal_claivaz_66964_410648_fb261165e5.jpg", "hash": "thumbnail_pexels_pascal_claivaz_66964_410648_fb261165e5", "mime": "image/jpeg", "name": "thumbnail_pexels-pascal-claivaz-66964-410648.jpg", "path": null, "size": 10.03, "width": 208, "height": 156, "sizeInBytes": 10033, "provider_metadata": {"public_id": "thumbnail_pexels_pascal_claivaz_66964_410648_fb261165e5", "resource_type": "image"}}}	pexels_pascal_claivaz_66964_410648_fb261165e5	.jpg	image/jpeg	1119.30	https://res.cloudinary.com/dmzqtnazm/image/upload/v1725636613/pexels_pascal_claivaz_66964_410648_fb261165e5.jpg	\N	cloudinary	{"public_id": "pexels_pascal_claivaz_66964_410648_fb261165e5", "resource_type": "image"}	/	2024-09-07 01:30:13.875	2024-09-07 02:08:12.495	1	1
\.


--
-- Data for Name: files_folder_links; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.files_folder_links (id, file_id, folder_id, file_order) FROM stdin;
\.


--
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.files_related_morphs (id, file_id, related_id, related_type, field, "order") FROM stdin;
40	114	5	api::category.category	icon	1
41	115	8	api::category.category	icon	1
42	116	1	api::category.category	icon	1
43	117	4	api::category.category	icon	1
46	120	6	api::category.category	icon	1
47	121	2	api::category.category	icon	1
49	123	5	api::product.product	Images	1
50	124	2	api::product.product	Images	1
51	125	4	api::product.product	Images	1
52	126	6	api::product.product	Images	1
53	127	3	api::product.product	Images	1
58	132	1	api::slider.slider	Image	1
59	134	7	api::slider.slider	Image	1
60	135	8	api::slider.slider	Image	1
61	136	9	api::slider.slider	Image	1
62	137	10	api::slider.slider	Image	1
63	138	2	api::slider.slider	Image	1
64	139	3	api::slider.slider	Image	1
65	140	4	api::slider.slider	Image	1
66	141	5	api::slider.slider	Image	1
67	142	6	api::slider.slider	Image	1
68	143	1	api::product.product	Images	1
69	144	7	api::product.product	Images	1
70	145	7	api::product.product	Images	2
71	146	7	api::product.product	Images	3
72	145	8	api::product.product	Images	1
73	146	9	api::product.product	Images	1
74	147	10	api::product.product	Images	1
75	148	11	api::product.product	Images	1
76	151	12	api::product.product	Images	1
78	154	14	api::product.product	Images	1
79	129	13	api::product.product	Images	1
80	118	3	api::category.category	icon	1
81	119	7	api::category.category	icon	1
82	156	15	api::product.product	Images	1
83	155	16	api::product.product	Images	1
84	157	17	api::product.product	Images	1
86	159	19	api::product.product	Images	1
87	158	18	api::product.product	Images	1
88	160	20	api::product.product	Images	1
89	149	21	api::product.product	Images	1
92	153	22	api::product.product	Images	1
93	150	23	api::product.product	Images	1
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	English (en)	en	2024-08-21 14:04:41.2	2024-08-21 14:04:41.2	\N	\N
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.orders (id, costumer_name, order_address, costumer_email, duration, phone, postcode, total_price, created_at, updated_at, published_at, created_by_id, updated_by_id, expect_day, status, user_id, delivery_price, gst, subtotal, cancel_time, delivery_time, picked_time, paid_time) FROM stdin;
89	Boyang Yu	105-109 Anzac Parade, Kensington	yuby0404_qd@163.com	O	0466293361	2018	17.56	2024-09-07 00:37:59.441	2024-09-07 00:38:01.35	2024-09-07 00:38:01.179	\N	\N	2024-09-13	Unpaid	15	0	1.596	15.96	\N	\N	\N	\N
71	Boyang Yu2344222	105-109 Anzac Parade, Kensington New South Wales 2033, Australia	boyangyby@gmail.com	M	1231212222	2052	35.112	2024-09-02 17:29:32.235	2024-09-02 17:37:36.992	2024-09-02 17:29:32.482	\N	\N	2024-09-27	Cancelled	14	0	3.192	31.92	03/Sep/2024 03:37	\N	\N	\N
90	Boyang Yu	105-109 Anzac Parade, Kensington	yuby0404_qd@163.com	O	0466293361	2018	17.56	2024-09-07 00:39:28.876	2024-09-07 00:39:30.424	2024-09-07 00:39:30.217	\N	\N	2024-09-13	Unpaid	15	0	1.596	15.96	\N	\N	\N	\N
82	ayusd	67000, Strasbourg, Bas-Rhin, France	uusy@87.com	N	9187262633	2309	22	2024-09-05 12:34:54.722	2024-09-06 23:31:03.271	2024-09-05 12:34:56.051	\N	\N	2024-09-13	Ordered	15	0	2	20	\N	\N	\N	06/Sep/2024 11:31
83	BOYANG YU	50th District, Ozamis City, Misamis Occidental, Philippines	yuby0404_qd@163.com	M	7821234422	2018	15.389	2024-09-05 13:11:03.841	2024-09-06 23:53:47.804	2024-09-05 13:11:05.462	\N	\N	2024-09-27	Ordered	15	0	1.399	13.99	\N	\N	\N	06/Sep/2024 11:53
81	Byssd	Iribarren, Lara, 30, Venezuela	yyuusd@ui.com	O	0198278782	2033	17.55	2024-09-05 12:33:31.54	2024-09-06 23:56:04.464	2024-09-05 12:33:32.874	\N	1	2024-09-21	Unpaid	15	0	1.596	15.96	\N	\N	\N	\N
76	Boyang Yu	66 Rothschild Avenue, Rosebery New South Wales 2018, Australia	yuby0404_qd@163.com	O	0466293361	2018	158.18	2024-09-02 18:12:22.479	2024-09-02 18:19:49.398	2024-09-02 18:12:22.619	\N	\N	2024-09-19	Cancelled	10	0	14.380000000000003	143.8	03/Sep/2024 04:19	\N	\N	\N
74	Boyang Yu	Manhattan, Kansas 66502, United States	yuby0404_qd@163.com	O	0466293361	2018	52.635000000000005	2024-09-03 03:49:26.715	2024-09-02 18:20:01.626	2024-09-03 03:49:28.036	\N	\N	2024-09-11	Cancelled	10	0	4.785	47.85	03/Sep/2024 04:20	\N	\N	\N
73	Boyang Yu2344222	Kensington	boyangyby@gmail.com	O	2222123121	2052	52.635000000000005	2024-09-03 03:44:48.52	2024-09-02 18:20:06.981	2024-09-03 03:44:49.946	\N	\N	2024-09-04	Cancelled	10	0	4.785	47.85	03/Sep/2024 04:20	\N	\N	\N
72	Boyang Yu	66 Rothschild Avenue, Rosebery New South Wales 2018, Australia	yuby0404_qd@163.com	O	0466293361	2018	52.635000000000005	2024-09-02 17:44:00.717	2024-09-02 18:20:12.324	2024-09-02 17:44:00.862	\N	\N	2024-09-30	Cancelled	10	0	4.785	47.85	03/Sep/2024 04:20	\N	\N	\N
75	Boyang Yu	SDS Bisiklet, Gençlik M., Antalya, Antalya 07100, Türkiye	boyangyby@gmail.com	O	1231212323	2052	83.46799999999999	2024-09-02 18:02:01.762	2024-09-04 03:36:43.958	2024-09-02 18:02:01.945	\N	\N	2024-10-04	Cancelled	10	0	7.588	75.88	04/Sep/2024 01:36	\N	\N	\N
93	Boyang Yu	Virginia Beach, Virginia 23451, United States	yuby0404_qd@163.com	M	0466293361	2018	9.867	2024-09-06 16:04:58.858	2024-09-06 16:04:59.035	2024-09-06 16:04:59.008	\N	\N	2024-09-21	Unpaid	10	0	0.8970000000000001	8.97	\N	\N	\N	\N
80	Byssd	66 Rothschild Avenue, Rosebery New South Wales 2018, Australia	yyuusd@ui.com	A	0198278787	2033	17.556	2024-09-05 12:31:42.376	2024-09-07 00:11:58.498	2024-09-05 12:31:43.793	\N	\N	2024-09-20	Unpaid	15	0	1.596	15.96	\N	\N	\N	\N
69	Boyang Yu	223333, Huaiyin Qu, Huai'an Shi, Jiangsu, China	yuby0404_qd@163.com	O	0466293361	2018	35.112	2024-08-31 17:37:27.668	2024-08-31 17:38:33.463	2024-08-31 17:37:29.02	\N	\N	2024-09-03	Cancelled	10	0	3.192	31.92	31/Aug/2024 05:38	\N	\N	31/Aug/2024 05:37
70	BOYANG YU	66 Prince, 135-25 40th Rd, New York, New York 11354, United States	yuby0404_qd@163.com	O	7821234422	2018	3.289	2024-08-31 17:39:29.214	2024-08-31 17:40:06.428	2024-08-31 17:39:30.543	\N	\N	2024-09-06	Cancelled	10	0	0.29900000000000004	2.99	31/Aug/2024 05:40	\N	\N	31/Aug/2024 05:39
79	Boyang Yu	66 Rothschild Avenue, Rosebery New South Wales 2018, Australia	yuby0404_qd@163.com	O	0466293361	2018	33	2024-09-04 14:36:38.522	2024-09-05 00:42:17.628	2024-09-04 14:36:38.708	\N	\N	2024-09-06	Cancelled	15	0	3	30	05/Sep/2024 12:42	\N	\N	05/Sep/2024 12:36
84	BOYANG YU	Hampton, Virginia 23666, United States	yuby0404_qd@163.com	O	7821234423	2018	17.56	2024-09-07 00:16:18.66	2024-09-07 00:16:20.168	2024-09-07 00:16:19.997	\N	\N	2024-09-14	Unpaid	15	0	1.596	15.96	\N	\N	\N	\N
85	Boyang Yu	105-109 Anzac Parade, Kensington	yuby0404_qd@163.com	O	0466293361	2018	6.58	2024-09-07 00:22:25.304	2024-09-07 00:22:27.243	2024-09-07 00:22:26.999	\N	\N	2024-09-13	Unpaid	15	0	0.5980000000000001	5.98	\N	\N	\N	\N
86	Boyang Yu	105-109 Anzac Parade, Kensington	yuby0404_qd@163.com	M	0466293361	2018	17.56	2024-09-07 00:23:13.329	2024-09-07 00:23:15.2	2024-09-07 00:23:15.03	\N	\N	2024-09-20	Unpaid	15	0	1.596	15.96	\N	\N	\N	\N
88	Boyang Yu	50th District, Ozamis City, Misamis Occidental, Philippines	yuby0404_qd@163.com	A	0466293361	2018	17.56	2024-09-07 00:33:44.337	2024-09-07 00:48:29.869	2024-09-07 00:33:45.643	\N	\N	2024-09-12	Ordered	15	0	1.596	15.96	\N	\N	\N	07/Sep/2024 12:48
87	Boyang Yu	105-109 Anzac Parade, Kensington	yuby0404_qd@163.com	M	0466293361	2018	17.56	2024-09-07 00:27:10.473	2024-09-07 00:30:23.991	2024-09-07 00:27:11.857	\N	1	2024-09-20	Unpaid	15	0	1.596	15.96	\N	\N	\N	\N
78	BOYANG YU	Valparaíso, Valparaíso, 2340000, Chile	yuby0404_qd@163.com	O	7821234422	2018	53.834	2024-09-04 13:51:25.576	2024-09-06 23:30:32.675	2024-09-04 13:51:25.734	\N	\N	2024-09-19	Ordered	15	0	4.894000000000001	48.940000000000005	\N	\N	\N	05/Sep/2024 12:36
92	Boyang Yu	Richmond, Virginia 23220, United States	yuby0404_qd@163.com	N	0466293361	2018	17.556	2024-09-07 00:45:42.16	2024-09-07 00:47:03.817	2024-09-07 00:45:43.539	\N	\N	2024-09-28	Ordered	15	0	1.596	15.96	\N	\N	\N	07/Sep/2024 12:47
91	Boyang Yu	105-109 Anzac Parade, Kensington	yuby0404_qd@163.com	M	0466293361	2018	17.56	2024-09-07 00:42:22.034	2024-09-07 00:47:43.243	2024-09-07 00:42:23.743	\N	\N	2024-09-21	Ordered	15	0	1.596	15.96	\N	\N	\N	07/Sep/2024 12:47
77	Boyang Yu	West Java, Indonesia	yuby0404_qd@163.com	O	0466293361	2018	61.556	2024-09-04 13:39:12.406	2024-09-06 16:03:18.721	2024-09-04 13:39:14.569	\N	\N	2024-09-27	Cancelled	10	0	5.596	55.96	07/Sep/2024 02:03	\N	\N	07/Sep/2024 02:02
\.


--
-- Data for Name: orders_components; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.orders_components (id, entity_id, component_id, component_type, field, "order") FROM stdin;
186	91	179	ordered-item.order-item	OrderItemList	1
187	92	180	ordered-item.order-item	OrderItemList	1
188	93	181	ordered-item.order-item	OrderItemList	1
148	69	143	ordered-item.order-item	OrderItemList	1
149	69	144	ordered-item.order-item	OrderItemList	2
150	70	145	ordered-item.order-item	OrderItemList	1
151	71	147	ordered-item.order-item	OrderItemList	1
152	71	146	ordered-item.order-item	OrderItemList	2
153	72	149	ordered-item.order-item	OrderItemList	1
154	72	148	ordered-item.order-item	OrderItemList	2
155	73	150	ordered-item.order-item	OrderItemList	1
156	73	151	ordered-item.order-item	OrderItemList	2
157	74	153	ordered-item.order-item	OrderItemList	1
158	74	152	ordered-item.order-item	OrderItemList	2
159	75	155	ordered-item.order-item	OrderItemList	1
160	75	154	ordered-item.order-item	OrderItemList	2
161	76	156	ordered-item.order-item	OrderItemList	1
162	76	157	ordered-item.order-item	OrderItemList	2
163	76	158	ordered-item.order-item	OrderItemList	3
164	76	159	ordered-item.order-item	OrderItemList	4
165	76	160	ordered-item.order-item	OrderItemList	5
166	77	161	ordered-item.order-item	OrderItemList	1
167	77	162	ordered-item.order-item	OrderItemList	2
168	78	163	ordered-item.order-item	OrderItemList	1
169	78	164	ordered-item.order-item	OrderItemList	2
170	78	165	ordered-item.order-item	OrderItemList	3
171	79	166	ordered-item.order-item	OrderItemList	1
172	80	167	ordered-item.order-item	OrderItemList	1
174	82	169	ordered-item.order-item	OrderItemList	1
175	83	171	ordered-item.order-item	OrderItemList	1
176	83	170	ordered-item.order-item	OrderItemList	2
173	81	168	ordered-item.order-item	OrderItemList	1
178	84	172	ordered-item.order-item	OrderItemList	1
179	85	173	ordered-item.order-item	OrderItemList	1
180	86	174	ordered-item.order-item	OrderItemList	1
181	87	175	ordered-item.order-item	OrderItemList	1
183	88	176	ordered-item.order-item	OrderItemList	1
184	89	177	ordered-item.order-item	OrderItemList	1
185	90	178	ordered-item.order-item	OrderItemList	1
\.


--
-- Data for Name: orders_users_permissions_user_links; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.orders_users_permissions_user_links (id, order_id, user_id) FROM stdin;
69	69	10
70	70	10
71	71	14
72	72	10
73	73	10
74	74	10
75	75	10
76	76	10
77	77	10
78	78	15
79	79	15
80	80	15
81	81	15
82	82	15
83	83	15
84	84	15
85	85	15
86	86	15
87	87	15
88	88	15
89	89	15
90	90	15
91	91	15
92	92	15
93	93	10
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.products (id, name, describtion, price, mrp, pid, qt, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
15	Wood ToothBrush	Eco-friendly wood toothbrush with biodegradable bristles for a sustainable oral care routine. Stylish, effective, and gentle on the environment.	2.99	5.00	TOO-1	2pc	2024-09-07 01:46:10.342	2024-09-07 01:46:46.543	2024-09-07 01:46:46.206	1	1
16	BestBrush	BestBrush: Premium toothbrush designed for superior cleaning and comfort. Features ergonomic handle, soft bristles, and advanced plaque removal technology.	10.00	12.00	TT-2	2pc	2024-09-07 01:47:35.596	2024-09-07 01:47:44.416	2024-09-07 01:47:44.084	1	1
17	Australia Rice	Australia Rice: Premium quality, fragrant and fluffy grains. Perfectly grown in Australia's rich soils, ideal for a variety of dishes.	10.00	14.00	R-1	500g	2024-09-07 01:51:07.115	2024-09-07 01:51:23.858	2024-09-07 01:51:23.458	1	1
19	White Bread	Soft and fluffy with a light, airy texture. Perfect for sandwiches, toast, and all your favorite bread-based dishes.	5.00	7.00	read-1	500g	2024-09-07 01:55:23.745	2024-09-07 01:56:01.065	2024-09-07 01:56:00.672	1	1
5	 Australia Grape	Experience the juicy, sweet flavor of Australia's fresh grapes. Perfect for snacking, salads, or desserts. Enjoy the crisp taste of nature's finest, handpicked and delivered fresh to you.	10.00	11.99	G-1	1kg	2024-08-22 03:00:15.934	2024-09-03 02:58:36.742	2024-08-22 03:00:37.208	1	1
2	Australia Green Apple	Australia green apple, with full of energy.	2.99	10.00	A-2	500g	2024-08-22 00:20:36.993	2024-09-03 02:59:24.103	2024-08-22 00:34:28.846	1	1
4	Australia Orange	\N	4.99	5.55	O-1	1kg	2024-08-22 02:58:55.77	2024-09-03 02:59:58.477	2024-08-22 02:59:02.814	1	1
6	Kiwi China	\N	8.00	11.00	K-1	500g	2024-08-22 03:01:38.036	2024-09-03 03:00:30.973	2024-08-22 03:01:45.058	1	1
3	Watermalen cut	Australia local watermalen, assure the fresh	3.99	6.99	W-1	1kg	2024-08-22 02:57:48.661	2024-09-03 03:01:01.106	2024-08-22 02:57:56.254	1	1
1	Apple China Hongfushi	Chinese Most Popular Apple with spuer sweet.	3.99	10.00	A-1	4pc	2024-08-22 00:17:52	2024-09-07 00:19:55.369	2024-08-22 00:18:00.375	1	1
7	Australia Egg	Premium Australian eggs, known for their rich flavor and high quality. Freshly sourced, nutritious, and perfect for any recipe.	6.00	3.99	E-1	6pc	2024-09-07 00:57:25.11	2024-09-07 00:57:34.556	2024-09-07 00:57:34.092	1	1
8	Australia White Egg	Fresh Australian white eggs with a smooth, clean shell. Rich in protein and flavor, ideal for cooking and baking.	7.00	4.00	E-2	8pc	2024-09-07 00:58:48.017	2024-09-07 00:58:57.433	2024-09-07 00:58:57.069	1	1
9	Australia Color Egg	Premium Australian color eggs with vibrant, natural hues. Perfect for adding a touch of farm-fresh flavor and visual appeal to your dishes.	4.99	10.00	E-3	10pc	2024-09-07 01:00:07.422	2024-09-07 01:00:25.337	2024-09-07 01:00:25.003	1	1
10	Australia Quail eggs	Delicate and nutritious quail eggs with a rich, creamy flavor. Ideal for gourmet dishes or a unique, bite-sized protein boost.	10.00	5.00	E-4	500g	2024-09-07 01:02:49.482	2024-09-07 01:03:25.732	2024-09-07 01:03:25.386	1	1
11	Australia Gold Milk	Rich and creamy Australia Gold Milk offers a luxurious taste with a smooth, full-bodied flavor, perfect for daily indulgence or gourmet recipes.	5.00	3.99	M-1	1L	2024-09-07 01:09:39.99	2024-09-07 01:13:01.56	2024-09-07 01:13:01.178	1	1
12	Australia Milk	Australia Full Milk delivers a rich, creamy texture and a naturally sweet flavor, ideal for a nourishing drink or enhancing your favorite recipes.	6.00	4.00	M-2	1.5L	2024-09-07 01:15:22.354	2024-09-07 01:15:33.101	2024-09-07 01:15:32.729	1	1
18	peanuts	Peanuts: Nutritious and crunchy, these versatile legumes are perfect for snacking, cooking, or making creamy butter. Packed with protein and flavor.	10.00	14.00	P-1	500G	2024-09-07 01:52:05.207	2024-09-07 01:56:24.07	2024-09-07 01:52:15.808	1	1
14	Australia Beef	Australia Beef offers premium, grass-fed cuts with robust flavor and tenderness, ideal for hearty meals and gourmet dishes.	20.00	10.00	B-1	1 kg	2024-09-07 01:33:19.607	2024-09-07 01:33:35.319	2024-09-07 01:33:34.982	1	1
13	Australia Tomato	Australia Tomato offers a vibrant, juicy flavor with a perfect balance of sweetness and acidity, great for fresh salads, sauces, and cooking.	9.99	12.00	T-1	500g	2024-09-07 01:20:56.113	2024-09-07 01:34:43.798	2024-09-07 01:23:42.124	1	1
20	Hard Bread	Crisp and crunchy with a robust, chewy texture. Ideal for hearty sandwiches, toasting, or dipping in soups and stews.	10.00	12.00	Bread-2	500g	2024-09-07 02:00:04.453	2024-09-07 02:00:14.451	2024-09-07 02:00:13.948	1	1
21	WaterMalen Juice	Watermelon Juice: Refreshingly sweet and hydrating, this juice bursts with the pure flavor of ripe watermelons. Perfect for a summer day or a revitalizing drink anytime.	6.80	10.00	product	500 ml	2024-09-07 02:07:40.356	2024-09-07 02:07:50.981	2024-09-07 02:07:50.507	1	1
23	Orange Juice	Fresh and tangy orange juice, bursting with natural sweetness and vibrant citrus flavor. Perfectly refreshing and packed with vitamin C.	4.00	6.00	product-2	1 L	2024-09-07 02:11:04.788	2024-09-07 02:11:13.408	2024-09-07 02:11:13.054	1	1
22	Australia Lamb	Premium, tender cuts of lamb from Australia, known for their rich flavor and succulent texture. Ideal for grilling, roasting, or stews.	10.00	12.00	product-1	500g	2024-09-07 02:09:19.666	2024-09-07 02:09:47.321	2024-09-07 02:09:28.73	1	1
\.


--
-- Data for Name: products_categories_links; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.products_categories_links (id, product_id, category_id, category_order, product_order) FROM stdin;
1	1	1	0	1
2	2	1	0	2
3	3	1	0	3
4	4	1	0	4
5	5	1	0	5
6	6	1	0	6
7	7	8	0	1
8	8	8	0	2
9	9	8	0	3
10	10	8	0	4
11	11	7	0	1
12	12	7	0	2
13	13	2	0	1
14	14	3	0	1
15	15	6	0	1
16	16	6	0	2
17	17	4	0	1
18	19	5	0	1
19	18	4	1	2
20	20	5	0	2
21	21	7	0	3
22	22	3	0	2
23	23	7	0	4
\.


--
-- Data for Name: sliders; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.sliders (id, s_name, type, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
1	Slider1	Home	2024-08-21 19:41:36.261	2024-09-03 03:08:42.602	2024-08-21 19:41:42.837	1	1
7	Banner1	Banner	2024-08-22 03:24:46.756	2024-09-03 03:10:32.034	2024-08-22 03:24:53.115	1	1
8	Banner2	Banner	2024-08-22 03:25:16.451	2024-09-03 03:11:12.108	2024-08-22 03:25:24.211	1	1
9	Banner3	Banner	2024-08-22 03:27:55.958	2024-09-03 03:12:02.613	2024-08-22 03:28:08.382	1	1
10	Banner4	Banner	2024-08-22 03:28:30.346	2024-09-03 03:12:58.61	2024-08-22 03:28:38.927	1	1
2	Slider2	Home	2024-08-21 19:42:07.676	2024-09-03 03:13:41.72	2024-08-21 19:42:14.734	1	1
3	Slider3	Home	2024-08-21 19:42:36.215	2024-09-03 03:14:50.32	2024-08-21 19:42:55.82	1	1
4	Slider4	Home	2024-08-21 19:43:26.137	2024-09-03 03:15:32.955	2024-08-21 19:43:32.644	1	1
5	Slider5	Home	2024-08-21 19:43:59.184	2024-09-03 03:16:35.25	2024-08-21 19:44:07.903	1	1
6	Slider6	Home	2024-08-21 19:44:42.947	2024-09-03 03:18:35.725	2024-08-21 19:44:49.498	1	1
\.


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.strapi_api_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.strapi_api_token_permissions_token_links (id, api_token_permission_id, api_token_id, api_token_permission_order) FROM stdin;
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.strapi_api_tokens (id, name, description, type, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
2	plugin_content_manager_configuration_content_types::admin::permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6}],[{"name":"actionParameters","size":12}],[{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]},"uid":"admin::permission"}	object	\N	\N
3	plugin_content_manager_configuration_content_types::admin::role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]},"uid":"admin::role"}	object	\N	\N
4	plugin_content_manager_configuration_content_types::admin::user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]},"uid":"admin::user"}	object	\N	\N
5	plugin_content_manager_configuration_content_types::admin::api-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"permissions","size":6}],[{"name":"expiresAt","size":6},{"name":"lifespan","size":4}]]},"uid":"admin::api-token"}	object	\N	\N
6	plugin_content_manager_configuration_content_types::admin::transfer-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::transfer-token"}	object	\N	\N
7	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::api-token-permission"}	object	\N	\N
8	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::transfer-token-permission"}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::upload.file	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]},"uid":"plugin::upload.file"}	object	\N	\N
23	plugin_i18n_default_locale	"en"	string	\N	\N
18	plugin_upload_view_configuration	{"pageSize":50,"sort":"createdAt:DESC"}	object	\N	\N
1	strapi_content_types_schema	{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token-permission","connection":"default","uid":"admin::api-token-permission","plugin":"admin","globalId":"AdminApiTokenPermission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token","connection":"default","uid":"admin::transfer-token","plugin":"admin","globalId":"AdminTransferToken"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token-permission","connection":"default","uid":"admin::transfer-token-permission","plugin":"admin","globalId":"AdminTransferTokenPermission"},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"folder","connection":"default","uid":"plugin::upload.folder","plugin":"upload","globalId":"UploadFolder"},"plugin::content-releases.release":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"}},"kind":"collectionType"},"modelType":"contentType","modelName":"release","connection":"default","uid":"plugin::content-releases.release","plugin":"content-releases","globalId":"ContentReleasesRelease"},"plugin::content-releases.release-action":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"entry":{"type":"relation","relation":"morphToOne","configurable":false},"contentType":{"type":"string","required":true},"locale":{"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"entry":{"type":"relation","relation":"morphToOne","configurable":false},"contentType":{"type":"string","required":true},"locale":{"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"}},"kind":"collectionType"},"modelType":"contentType","modelName":"release-action","connection":"default","uid":"plugin::content-releases.release-action","plugin":"content-releases","globalId":"ContentReleasesReleaseAction"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"},"api::category.category":{"kind":"collectionType","collectionName":"categories","info":{"singularName":"category","pluralName":"categories","displayName":"Category","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"icon":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"]},"name":{"type":"string"},"color":{"type":"string"},"products":{"type":"relation","relation":"manyToMany","target":"api::product.product","mappedBy":"categories"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"categories","info":{"singularName":"category","pluralName":"categories","displayName":"Category","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"icon":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"]},"name":{"type":"string"},"color":{"type":"string"},"products":{"type":"relation","relation":"manyToMany","target":"api::product.product","mappedBy":"categories"}},"kind":"collectionType"},"modelType":"contentType","modelName":"category","connection":"default","uid":"api::category.category","apiName":"category","globalId":"Category","actions":{},"lifecycles":{}},"api::order.order":{"kind":"collectionType","collectionName":"orders","info":{"singularName":"order","pluralName":"orders","displayName":"Order","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"CostumerName":{"type":"string"},"users_permissions_user":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"OrderAddress":{"type":"text"},"CostumerEmail":{"type":"email"},"Duration":{"type":"enumeration","enum":["O","M","A","N"]},"Phone":{"type":"string"},"Postcode":{"type":"string"},"TotalPrice":{"type":"float"},"ExpectDay":{"type":"string"},"OrderItemList":{"type":"component","repeatable":true,"component":"ordered-item.order-item"},"status":{"type":"enumeration","enum":["Unpaid","Ordered","Delivering","Delivered","Finished","Cancelled"]},"UserId":{"type":"biginteger"},"DeliveryPrice":{"type":"float"},"GST":{"type":"float"},"Subtotal":{"type":"float"},"CancelTime":{"type":"string"},"DeliveryTime":{"type":"string"},"PickedTime":{"type":"string"},"PaidTime":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"orders","info":{"singularName":"order","pluralName":"orders","displayName":"Order","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"CostumerName":{"type":"string"},"users_permissions_user":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"OrderAddress":{"type":"text"},"CostumerEmail":{"type":"email"},"Duration":{"type":"enumeration","enum":["O","M","A","N"]},"Phone":{"type":"string"},"Postcode":{"type":"string"},"TotalPrice":{"type":"float"},"ExpectDay":{"type":"string"},"OrderItemList":{"type":"component","repeatable":true,"component":"ordered-item.order-item"},"status":{"type":"enumeration","enum":["Unpaid","Ordered","Delivering","Delivered","Finished","Cancelled"]},"UserId":{"type":"biginteger"},"DeliveryPrice":{"type":"float"},"GST":{"type":"float"},"Subtotal":{"type":"float"},"CancelTime":{"type":"string"},"DeliveryTime":{"type":"string"},"PickedTime":{"type":"string"},"PaidTime":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"order","connection":"default","uid":"api::order.order","apiName":"order","globalId":"Order","actions":{},"lifecycles":{}},"api::product.product":{"kind":"collectionType","collectionName":"products","info":{"singularName":"product","pluralName":"products","displayName":"Product"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"describtion":{"type":"text"},"Price":{"type":"decimal"},"mrp":{"type":"decimal"},"PID":{"type":"uid"},"Images":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":true},"QT":{"type":"string"},"categories":{"type":"relation","relation":"manyToMany","target":"api::category.category","inversedBy":"products"},"user_carts":{"type":"relation","relation":"oneToMany","target":"api::user-cart.user-cart","mappedBy":"product"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"products","info":{"singularName":"product","pluralName":"products","displayName":"Product"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"describtion":{"type":"text"},"Price":{"type":"decimal"},"mrp":{"type":"decimal"},"PID":{"type":"uid"},"Images":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":true},"QT":{"type":"string"},"categories":{"type":"relation","relation":"manyToMany","target":"api::category.category","inversedBy":"products"},"user_carts":{"type":"relation","relation":"oneToMany","target":"api::user-cart.user-cart","mappedBy":"product"}},"kind":"collectionType"},"modelType":"contentType","modelName":"product","connection":"default","uid":"api::product.product","apiName":"product","globalId":"Product","actions":{},"lifecycles":{}},"api::slider.slider":{"kind":"collectionType","collectionName":"sliders","info":{"singularName":"slider","pluralName":"sliders","displayName":"Slider"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"SName":{"type":"string"},"Image":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false},"Type":{"type":"enumeration","enum":["Home","Banner"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"sliders","info":{"singularName":"slider","pluralName":"sliders","displayName":"Slider"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"SName":{"type":"string"},"Image":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false},"Type":{"type":"enumeration","enum":["Home","Banner"]}},"kind":"collectionType"},"modelType":"contentType","modelName":"slider","connection":"default","uid":"api::slider.slider","apiName":"slider","globalId":"Slider","actions":{},"lifecycles":{}},"api::user-cart.user-cart":{"kind":"collectionType","collectionName":"user_carts","info":{"singularName":"user-cart","pluralName":"user-carts","displayName":"UserCart","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"quantity":{"type":"integer"},"amount":{"type":"float"},"users_permissions_user":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"product":{"type":"relation","relation":"manyToOne","target":"api::product.product","inversedBy":"user_carts"},"UserId":{"type":"biginteger"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"user_carts","info":{"singularName":"user-cart","pluralName":"user-carts","displayName":"UserCart","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"quantity":{"type":"integer"},"amount":{"type":"float"},"users_permissions_user":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"product":{"type":"relation","relation":"manyToOne","target":"api::product.product","inversedBy":"user_carts"},"UserId":{"type":"biginteger"}},"kind":"collectionType"},"modelType":"contentType","modelName":"user-cart","connection":"default","uid":"api::user-cart.user-cart","apiName":"user-cart","globalId":"UserCart","actions":{},"lifecycles":{}}}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]},"uid":"plugin::upload.folder"}	object	\N	\N
11	plugin_content_manager_configuration_content_types::plugin::content-releases.release	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"releasedAt":{"edit":{"label":"releasedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"releasedAt","searchable":true,"sortable":true}},"scheduledAt":{"edit":{"label":"scheduledAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"scheduledAt","searchable":true,"sortable":true}},"timezone":{"edit":{"label":"timezone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"timezone","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"actions":{"edit":{"label":"actions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"contentType"},"list":{"label":"actions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","releasedAt","scheduledAt"],"edit":[[{"name":"name","size":6},{"name":"releasedAt","size":6}],[{"name":"scheduledAt","size":6},{"name":"timezone","size":6}],[{"name":"status","size":6},{"name":"actions","size":6}]]},"uid":"plugin::content-releases.release"}	object	\N	\N
12	plugin_content_manager_configuration_content_types::plugin::content-releases.release-action	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"contentType","defaultSortBy":"contentType","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"contentType":{"edit":{"label":"contentType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentType","searchable":true,"sortable":true}},"locale":{"edit":{"label":"locale","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"locale","searchable":true,"sortable":true}},"release":{"edit":{"label":"release","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"release","searchable":true,"sortable":true}},"isEntryValid":{"edit":{"label":"isEntryValid","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isEntryValid","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","contentType","locale"],"edit":[[{"name":"type","size":6},{"name":"contentType","size":6}],[{"name":"locale","size":6},{"name":"release","size":6}],[{"name":"isEntryValid","size":4}]]},"uid":"plugin::content-releases.release-action"}	object	\N	\N
13	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.permission"}	object	\N	\N
14	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]},"uid":"plugin::users-permissions.role"}	object	\N	\N
15	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.user"}	object	\N	\N
16	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]},"uid":"plugin::i18n.locale"}	object	\N	\N
20	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"enabled":false,"icon":"","key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]},"keycloak":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"myKeycloakProvider.com/realms/myrealm","callback":"api/auth/keycloak/callback","scope":["openid","email","profile"]}}	object	\N	\N
22	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":"http://localhost:3000/Reset","email_confirmation_redirection":"","default_role":"authenticated"}	object	\N	\N
21	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"FreshSolder Group","email":"boyangyby@gmail.com"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<a href=\\"<%= URL %>?code=<%= TOKEN %>\\">Reset Password Link</a>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"FreshSolder Group","email":"boyangyby@gmail.com"},"response_email":"boyangyby@gmail.com","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<a href='<%= URL %>?confirmation=<%= CODE %>'>Confirmation link</a>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
27	plugin_content_manager_configuration_content_types::api::product.product	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"describtion":{"edit":{"label":"describtion","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"describtion","searchable":true,"sortable":true}},"Price":{"edit":{"label":"Price","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Price","searchable":true,"sortable":true}},"mrp":{"edit":{"label":"mrp","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mrp","searchable":true,"sortable":true}},"PID":{"edit":{"label":"PID","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"PID","searchable":true,"sortable":true}},"Images":{"edit":{"label":"Images","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Images","searchable":false,"sortable":false}},"QT":{"edit":{"label":"QT","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"QT","searchable":true,"sortable":true}},"categories":{"edit":{"label":"categories","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"categories","searchable":false,"sortable":false}},"user_carts":{"edit":{"label":"user_carts","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"user_carts","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","describtion","Price"],"edit":[[{"name":"name","size":6},{"name":"describtion","size":6}],[{"name":"Price","size":4},{"name":"mrp","size":4}],[{"name":"PID","size":6},{"name":"Images","size":6}],[{"name":"QT","size":6},{"name":"categories","size":6}],[{"name":"user_carts","size":6}]]},"uid":"api::product.product"}	object	\N	\N
28	plugin_content_manager_configuration_content_types::api::user-cart.user-cart	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"quantity":{"edit":{"label":"quantity","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"quantity","searchable":true,"sortable":true}},"amount":{"edit":{"label":"amount","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"amount","searchable":true,"sortable":true}},"users_permissions_user":{"edit":{"label":"users_permissions_user","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users_permissions_user","searchable":true,"sortable":true}},"product":{"edit":{"label":"product","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"product","searchable":true,"sortable":true}},"UserId":{"edit":{"label":"UserId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"UserId","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","quantity","amount","product"],"edit":[[{"name":"quantity","size":4},{"name":"amount","size":4}],[{"name":"users_permissions_user","size":6},{"name":"product","size":6}],[{"name":"UserId","size":4}]]},"uid":"api::user-cart.user-cart"}	object	\N	\N
26	plugin_content_manager_configuration_content_types::api::slider.slider	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"SName","defaultSortBy":"SName","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"SName":{"edit":{"label":"SName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"SName","searchable":true,"sortable":true}},"Image":{"edit":{"label":"Image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Image","searchable":false,"sortable":false}},"Type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","SName","Image","Type"],"edit":[[{"name":"SName","size":6},{"name":"Image","size":6}],[{"name":"Type","size":6}]]},"uid":"api::slider.slider"}	object	\N	\N
29	plugin_content_manager_configuration_content_types::api::order.order	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"CostumerName","defaultSortBy":"CostumerName","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"CostumerName":{"edit":{"label":"CostumerName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"CostumerName","searchable":true,"sortable":true}},"users_permissions_user":{"edit":{"label":"users_permissions_user","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users_permissions_user","searchable":true,"sortable":true}},"OrderAddress":{"edit":{"label":"OrderAddress","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"OrderAddress","searchable":true,"sortable":true}},"CostumerEmail":{"edit":{"label":"CostumerEmail","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"CostumerEmail","searchable":true,"sortable":true}},"Duration":{"edit":{"label":"Duration","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Duration","searchable":true,"sortable":true}},"Phone":{"edit":{"label":"Phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Phone","searchable":true,"sortable":true}},"Postcode":{"edit":{"label":"Postcode","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Postcode","searchable":true,"sortable":true}},"TotalPrice":{"edit":{"label":"TotalPrice","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"TotalPrice","searchable":true,"sortable":true}},"ExpectDay":{"edit":{"label":"ExpectDay","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ExpectDay","searchable":true,"sortable":true}},"OrderItemList":{"edit":{"label":"OrderItemList","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"OrderItemList","searchable":false,"sortable":false}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"UserId":{"edit":{"label":"UserId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"UserId","searchable":true,"sortable":true}},"DeliveryPrice":{"edit":{"label":"DeliveryPrice","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"DeliveryPrice","searchable":true,"sortable":true}},"GST":{"edit":{"label":"GST","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"GST","searchable":true,"sortable":true}},"Subtotal":{"edit":{"label":"Subtotal","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Subtotal","searchable":true,"sortable":true}},"CancelTime":{"edit":{"label":"CancelTime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"CancelTime","searchable":true,"sortable":true}},"DeliveryTime":{"edit":{"label":"DeliveryTime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"DeliveryTime","searchable":true,"sortable":true}},"PickedTime":{"edit":{"label":"PickedTime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"PickedTime","searchable":true,"sortable":true}},"PaidTime":{"edit":{"label":"PaidTime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"PaidTime","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","CostumerName","users_permissions_user","OrderAddress"],"edit":[[{"name":"CostumerName","size":6},{"name":"users_permissions_user","size":6}],[{"name":"OrderAddress","size":6},{"name":"CostumerEmail","size":6}],[{"name":"Duration","size":6}],[{"name":"Phone","size":6},{"name":"Postcode","size":6}],[{"name":"TotalPrice","size":4}],[{"name":"ExpectDay","size":6}],[{"name":"OrderItemList","size":12}],[{"name":"status","size":6},{"name":"UserId","size":4}],[{"name":"DeliveryPrice","size":4},{"name":"GST","size":4},{"name":"Subtotal","size":4}],[{"name":"CancelTime","size":6},{"name":"DeliveryTime","size":6}],[{"name":"PickedTime","size":6},{"name":"PaidTime","size":6}]]},"uid":"api::order.order"}	object	\N	\N
25	plugin_content_manager_configuration_content_types::api::category.category	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"icon":{"edit":{"label":"icon","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"icon","searchable":false,"sortable":false}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"color":{"edit":{"label":"color","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"color","searchable":true,"sortable":true}},"products":{"edit":{"label":"products","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"products","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","icon","name","color"],"edit":[[{"name":"icon","size":6},{"name":"name","size":6}],[{"name":"color","size":6},{"name":"products","size":6}]]},"uid":"api::category.category"}	object	\N	\N
19	plugin_upload_metrics	{"weeklySchedule":"28 47 23 * * 3","lastWeeklyUpdate":1725493648251}	object	\N	\N
24	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}	object	\N	\N
31	plugin_content_manager_configuration_components::ordered-item.order-item	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"quantity":{"edit":{"label":"quantity","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"quantity","searchable":true,"sortable":true}},"TotalPrice":{"edit":{"label":"TotalPrice","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"TotalPrice","searchable":true,"sortable":true}},"product":{"edit":{"label":"product","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"product","searchable":true,"sortable":true}}},"layouts":{"list":["id","quantity","TotalPrice","product"],"edit":[[{"name":"quantity","size":4},{"name":"TotalPrice","size":4}],[{"name":"product","size":6}]]},"uid":"ordered-item.order-item","isComponent":true}	object	\N	\N
17	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":false,"autoOrientation":false}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
24	{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_releases","indexes":[{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"released_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"scheduled_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"timezone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_release_actions","indexes":[{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"target_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"target_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_entry_valid","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"categories","indexes":[{"name":"categories_created_by_id_fk","columns":["created_by_id"]},{"name":"categories_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"categories_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"categories_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"orders","indexes":[{"name":"orders_created_by_id_fk","columns":["created_by_id"]},{"name":"orders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"orders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"orders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"costumer_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order_address","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"costumer_email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"duration","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"postcode","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"total_price","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expect_day","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"user_id","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"delivery_price","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"gst","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subtotal","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"cancel_time","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"delivery_time","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"picked_time","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"paid_time","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"products","indexes":[{"type":"unique","name":"products_pid_unique","columns":["pid"]},{"name":"products_created_by_id_fk","columns":["created_by_id"]},{"name":"products_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"products_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"products_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"describtion","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"price","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mrp","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"pid","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"qt","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"sliders","indexes":[{"name":"sliders_created_by_id_fk","columns":["created_by_id"]},{"name":"sliders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"sliders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"sliders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"s_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"user_carts","indexes":[{"name":"user_carts_created_by_id_fk","columns":["created_by_id"]},{"name":"user_carts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"user_carts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"user_carts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"quantity","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"amount","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"user_id","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_ordered_item_order_items","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"quantity","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"total_price","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"admin_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]},{"name":"admin_users_roles_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_links_order_fk","columns":["role_order"]},{"name":"admin_users_roles_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_links","indexes":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_links_unique","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_links_order_inv_fk","columns":["api_token_permission_order"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_links","indexes":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_links_unique","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_links_order_inv_fk","columns":["transfer_token_permission_order"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]},{"name":"files_related_morphs_order_index","columns":["order"]},{"name":"files_related_morphs_id_column_index","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_links","indexes":[{"name":"files_folder_links_fk","columns":["file_id"]},{"name":"files_folder_links_inv_fk","columns":["folder_id"]},{"name":"files_folder_links_unique","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_links_order_inv_fk","columns":["file_order"]}],"foreignKeys":[{"name":"files_folder_links_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_links_inv_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_links","indexes":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"]},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_links_unique","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_links_order_inv_fk","columns":["folder_order"]}],"foreignKeys":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_release_actions_release_links","indexes":[{"name":"strapi_release_actions_release_links_fk","columns":["release_action_id"]},{"name":"strapi_release_actions_release_links_inv_fk","columns":["release_id"]},{"name":"strapi_release_actions_release_links_unique","columns":["release_action_id","release_id"],"type":"unique"},{"name":"strapi_release_actions_release_links_order_inv_fk","columns":["release_action_order"]}],"foreignKeys":[{"name":"strapi_release_actions_release_links_fk","columns":["release_action_id"],"referencedColumns":["id"],"referencedTable":"strapi_release_actions","onDelete":"CASCADE"},{"name":"strapi_release_actions_release_links_inv_fk","columns":["release_id"],"referencedColumns":["id"],"referencedTable":"strapi_releases","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"release_action_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_action_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"up_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]},{"name":"up_users_role_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"orders_components","indexes":[{"name":"orders_field_index","columns":["field"]},{"name":"orders_component_type_index","columns":["component_type"]},{"name":"orders_entity_fk","columns":["entity_id"]},{"name":"orders_unique","columns":["entity_id","component_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"orders_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"orders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"orders_users_permissions_user_links","indexes":[{"name":"orders_users_permissions_user_links_fk","columns":["order_id"]},{"name":"orders_users_permissions_user_links_inv_fk","columns":["user_id"]},{"name":"orders_users_permissions_user_links_unique","columns":["order_id","user_id"],"type":"unique"}],"foreignKeys":[{"name":"orders_users_permissions_user_links_fk","columns":["order_id"],"referencedColumns":["id"],"referencedTable":"orders","onDelete":"CASCADE"},{"name":"orders_users_permissions_user_links_inv_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"order_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"products_categories_links","indexes":[{"name":"products_categories_links_fk","columns":["product_id"]},{"name":"products_categories_links_inv_fk","columns":["category_id"]},{"name":"products_categories_links_unique","columns":["product_id","category_id"],"type":"unique"},{"name":"products_categories_links_order_fk","columns":["category_order"]},{"name":"products_categories_links_order_inv_fk","columns":["product_order"]}],"foreignKeys":[{"name":"products_categories_links_fk","columns":["product_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"},{"name":"products_categories_links_inv_fk","columns":["category_id"],"referencedColumns":["id"],"referencedTable":"categories","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"category_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"user_carts_users_permissions_user_links","indexes":[{"name":"user_carts_users_permissions_user_links_fk","columns":["user_cart_id"]},{"name":"user_carts_users_permissions_user_links_inv_fk","columns":["user_id"]},{"name":"user_carts_users_permissions_user_links_unique","columns":["user_cart_id","user_id"],"type":"unique"}],"foreignKeys":[{"name":"user_carts_users_permissions_user_links_fk","columns":["user_cart_id"],"referencedColumns":["id"],"referencedTable":"user_carts","onDelete":"CASCADE"},{"name":"user_carts_users_permissions_user_links_inv_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_cart_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"user_carts_product_links","indexes":[{"name":"user_carts_product_links_fk","columns":["user_cart_id"]},{"name":"user_carts_product_links_inv_fk","columns":["product_id"]},{"name":"user_carts_product_links_unique","columns":["user_cart_id","product_id"],"type":"unique"},{"name":"user_carts_product_links_order_inv_fk","columns":["user_cart_order"]}],"foreignKeys":[{"name":"user_carts_product_links_fk","columns":["user_cart_id"],"referencedColumns":["id"],"referencedTable":"user_carts","onDelete":"CASCADE"},{"name":"user_carts_product_links_inv_fk","columns":["product_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_cart_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_cart_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_ordered_item_order_items_product_links","indexes":[{"name":"components_ordered_item_order_items_product_links_fk","columns":["order_item_id"]},{"name":"components_ordered_item_order_items_product_links_inv_fk","columns":["product_id"]},{"name":"components_ordered_item_order_items_product_links_unique","columns":["order_item_id","product_id"],"type":"unique"}],"foreignKeys":[{"name":"components_ordered_item_order_items_product_links_fk","columns":["order_item_id"],"referencedColumns":["id"],"referencedTable":"components_ordered_item_order_items","onDelete":"CASCADE"},{"name":"components_ordered_item_order_items_product_links_inv_fk","columns":["product_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"order_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2024-09-07 02:54:23.698	77ba6f50f12c6649feda7af94001e32b
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_release_actions; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.strapi_release_actions (id, type, target_id, target_type, content_type, locale, is_entry_valid, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_release_actions_release_links; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.strapi_release_actions_release_links (id, release_action_id, release_id, release_action_order) FROM stdin;
\.


--
-- Data for Name: strapi_releases; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.strapi_releases (id, name, released_at, scheduled_at, timezone, status, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.strapi_transfer_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.strapi_transfer_token_permissions_token_links (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_order) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.strapi_transfer_tokens (id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::users-permissions.auth.changePassword	2024-08-21 14:04:38.844	2024-08-21 14:04:38.844	\N	\N
2	plugin::users-permissions.user.me	2024-08-21 14:04:38.844	2024-08-21 14:04:38.844	\N	\N
3	plugin::users-permissions.auth.emailConfirmation	2024-08-21 14:04:39.922	2024-08-21 14:04:39.922	\N	\N
4	plugin::users-permissions.auth.resetPassword	2024-08-21 14:04:39.922	2024-08-21 14:04:39.922	\N	\N
5	plugin::users-permissions.auth.forgotPassword	2024-08-21 14:04:39.922	2024-08-21 14:04:39.922	\N	\N
6	plugin::users-permissions.auth.register	2024-08-21 14:04:39.922	2024-08-21 14:04:39.922	\N	\N
7	plugin::users-permissions.auth.sendEmailConfirmation	2024-08-21 14:04:39.922	2024-08-21 14:04:39.922	\N	\N
8	plugin::users-permissions.auth.connect	2024-08-21 14:04:39.922	2024-08-21 14:04:39.922	\N	\N
9	plugin::users-permissions.auth.callback	2024-08-21 14:04:39.922	2024-08-21 14:04:39.922	\N	\N
10	api::category.category.findOne	2024-08-21 14:34:17.627	2024-08-21 14:34:17.627	\N	\N
11	api::category.category.find	2024-08-21 14:34:17.627	2024-08-21 14:34:17.627	\N	\N
12	api::slider.slider.findOne	2024-08-21 19:45:50.103	2024-08-21 19:45:50.103	\N	\N
13	api::slider.slider.find	2024-08-21 19:45:50.102	2024-08-21 19:45:50.102	\N	\N
15	api::product.product.find	2024-08-22 00:21:41.411	2024-08-22 00:21:41.411	\N	\N
14	api::product.product.findOne	2024-08-22 00:21:41.411	2024-08-22 00:21:41.411	\N	\N
16	api::user-cart.user-cart.find	2024-08-24 17:20:28.431	2024-08-24 17:20:28.431	\N	\N
17	api::user-cart.user-cart.create	2024-08-24 17:20:28.431	2024-08-24 17:20:28.431	\N	\N
18	api::user-cart.user-cart.findOne	2024-08-24 17:20:28.431	2024-08-24 17:20:28.431	\N	\N
19	api::user-cart.user-cart.update	2024-08-24 17:20:28.431	2024-08-24 17:20:28.431	\N	\N
20	api::user-cart.user-cart.delete	2024-08-24 17:20:28.431	2024-08-24 17:20:28.431	\N	\N
21	plugin::users-permissions.user.create	2024-08-24 17:22:04.884	2024-08-24 17:22:04.884	\N	\N
22	plugin::users-permissions.user.update	2024-08-24 17:22:04.884	2024-08-24 17:22:04.884	\N	\N
23	plugin::users-permissions.user.find	2024-08-24 17:22:04.884	2024-08-24 17:22:04.884	\N	\N
24	plugin::users-permissions.user.findOne	2024-08-24 17:22:04.884	2024-08-24 17:22:04.884	\N	\N
25	plugin::users-permissions.user.count	2024-08-24 17:22:04.884	2024-08-24 17:22:04.884	\N	\N
26	plugin::users-permissions.user.destroy	2024-08-24 17:22:04.884	2024-08-24 17:22:04.884	\N	\N
28	api::user-cart.user-cart.find	2024-08-25 12:07:57.11	2024-08-25 12:07:57.11	\N	\N
29	api::user-cart.user-cart.findOne	2024-08-25 12:07:57.11	2024-08-25 12:07:57.11	\N	\N
30	api::order.order.find	2024-08-29 00:22:16.529	2024-08-29 00:22:16.529	\N	\N
31	api::order.order.findOne	2024-08-29 00:22:16.529	2024-08-29 00:22:16.529	\N	\N
32	api::order.order.create	2024-08-29 00:22:16.529	2024-08-29 00:22:16.529	\N	\N
36	api::order.order.createPaymentSession	2024-08-29 23:34:34.326	2024-08-29 23:34:34.326	\N	\N
37	api::order.order.update	2024-08-30 04:47:10.542	2024-08-30 04:47:10.542	\N	\N
38	api::order.order.find	2024-08-30 14:48:02.49	2024-08-30 14:48:02.49	\N	\N
39	api::product.product.find	2024-08-31 00:52:08.714	2024-08-31 00:52:08.714	\N	\N
40	api::product.product.findOne	2024-08-31 00:52:08.714	2024-08-31 00:52:08.714	\N	\N
42	api::category.category.findOne	2024-08-31 00:52:58.833	2024-08-31 00:52:58.833	\N	\N
41	api::category.category.find	2024-08-31 00:52:58.832	2024-08-31 00:52:58.832	\N	\N
43	api::slider.slider.find	2024-08-31 00:52:58.833	2024-08-31 00:52:58.833	\N	\N
44	api::slider.slider.findOne	2024-08-31 00:52:58.833	2024-08-31 00:52:58.833	\N	\N
45	api::category.category.find	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
46	api::category.category.findOne	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
47	api::category.category.create	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
48	api::category.category.update	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
49	api::category.category.delete	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
50	api::order.order.update	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
51	api::order.order.find	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
52	api::order-product.order-product.create	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
53	api::order-product.order-product.find	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
54	api::order-product.order-product.findOne	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
57	api::product.product.find	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
58	api::product.product.findOne	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
59	api::product.product.create	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
60	api::product.product.delete	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
61	api::product.product.update	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
62	api::slider.slider.find	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
63	api::slider.slider.update	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
64	api::slider.slider.create	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
65	api::slider.slider.findOne	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
66	api::slider.slider.delete	2024-08-31 19:03:43.296	2024-08-31 19:03:43.296	\N	\N
67	plugin::users-permissions.auth.callback	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
68	plugin::users-permissions.auth.changePassword	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
69	plugin::users-permissions.auth.resetPassword	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
70	plugin::users-permissions.auth.connect	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
71	plugin::users-permissions.auth.register	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
72	plugin::users-permissions.auth.forgotPassword	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
73	plugin::users-permissions.auth.emailConfirmation	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
74	plugin::users-permissions.auth.sendEmailConfirmation	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
75	plugin::users-permissions.user.create	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
76	plugin::users-permissions.user.update	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
77	plugin::users-permissions.user.find	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
78	plugin::users-permissions.user.findOne	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
79	plugin::users-permissions.user.count	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
80	plugin::users-permissions.user.destroy	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
81	plugin::users-permissions.user.me	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
82	plugin::users-permissions.role.createRole	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
83	plugin::users-permissions.role.findOne	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
84	plugin::users-permissions.role.find	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
85	plugin::users-permissions.role.deleteRole	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
86	plugin::users-permissions.role.updateRole	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
87	plugin::users-permissions.permissions.getPermissions	2024-08-31 19:04:51.93	2024-08-31 19:04:51.93	\N	\N
88	plugin::users-permissions.auth.changePassword	2024-09-02 02:13:11.989	2024-09-02 02:13:11.989	\N	\N
89	plugin::upload.content-api.upload	2024-09-03 02:28:44.861	2024-09-03 02:28:44.861	\N	\N
90	plugin::upload.content-api.upload	2024-09-03 02:28:58.073	2024-09-03 02:28:58.073	\N	\N
91	plugin::upload.content-api.upload	2024-09-03 02:29:10.036	2024-09-03 02:29:10.036	\N	\N
92	plugin::upload.content-api.find	2024-09-03 02:29:48.94	2024-09-03 02:29:48.94	\N	\N
93	plugin::upload.content-api.destroy	2024-09-03 02:29:48.94	2024-09-03 02:29:48.94	\N	\N
94	plugin::upload.content-api.findOne	2024-09-03 02:29:48.94	2024-09-03 02:29:48.94	\N	\N
95	plugin::upload.content-api.destroy	2024-09-03 02:31:12.456	2024-09-03 02:31:12.456	\N	\N
96	plugin::upload.content-api.findOne	2024-09-03 02:31:12.456	2024-09-03 02:31:12.456	\N	\N
99	plugin::upload.content-api.find	2024-09-03 02:31:27.944	2024-09-03 02:31:27.944	\N	\N
97	plugin::upload.content-api.find	2024-09-03 02:31:12.456	2024-09-03 02:31:12.456	\N	\N
98	plugin::upload.content-api.findOne	2024-09-03 02:31:27.944	2024-09-03 02:31:27.944	\N	\N
100	plugin::users-permissions.user.create	2024-09-03 23:39:18.772	2024-09-03 23:39:18.772	\N	\N
101	plugin::users-permissions.user.findOne	2024-09-03 23:41:13.848	2024-09-03 23:41:13.848	\N	\N
102	plugin::users-permissions.user.find	2024-09-03 23:41:13.848	2024-09-03 23:41:13.848	\N	\N
\.


--
-- Data for Name: up_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.up_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
1	1	1	1
2	2	1	1
3	5	2	1
4	8	2	1
5	4	2	1
6	7	2	1
7	6	2	1
8	3	2	1
9	9	2	1
10	10	2	2
11	11	2	2
12	12	2	3
13	13	2	3
14	15	2	4
15	14	2	4
16	16	1	2
17	17	1	2
18	18	1	2
19	19	1	3
20	20	1	3
21	21	1	4
22	22	1	4
23	23	1	5
24	24	1	5
25	25	1	5
26	26	1	5
28	29	2	5
29	28	2	5
30	30	1	7
31	31	1	7
32	32	1	8
36	36	1	9
37	37	1	10
38	38	2	6
39	39	1	11
40	40	1	11
41	42	1	12
42	41	1	12
43	44	1	13
44	43	1	13
45	46	3	1
46	45	3	1
47	47	3	1
48	49	3	1
49	48	3	1
50	51	3	1
51	50	3	1
52	53	3	1
53	52	3	1
54	54	3	1
55	59	3	2
57	57	3	2
59	61	3	2
60	58	3	2
61	60	3	2
62	62	3	2
63	65	3	2
64	64	3	2
65	66	3	3
66	63	3	3
67	67	3	4
68	68	3	4
69	69	3	4
70	70	3	4
71	71	3	4
72	72	3	4
73	73	3	4
74	74	3	4
75	75	3	4
76	76	3	4
77	77	3	5
78	78	3	5
79	79	3	5
80	80	3	5
81	81	3	5
82	82	3	5
83	83	3	5
84	84	3	5
85	85	3	5
86	87	3	5
87	86	3	6
88	88	2	7
89	89	2	8
90	90	3	7
91	91	1	14
92	92	1	15
93	93	1	15
94	94	1	15
95	95	3	8
96	96	3	8
97	97	3	8
98	98	2	9
99	99	2	9
100	100	2	10
101	102	2	11
102	101	2	11
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
3	Manager	The provider	manager	2024-08-31 19:03:42.621	2024-09-03 02:31:11.553	\N	\N
2	Public	Default role given to unauthenticated user.	public	2024-08-21 14:04:37.77	2024-09-03 23:41:22.679	\N	\N
1	Authenticated	Default role given to authenticated user.	authenticated	2024-08-21 14:04:37.056	2024-09-04 13:48:44.304	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.up_users (id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
12	uisi	8@gmail.com	local	$2a$10$9vnGkocPWyFkybjekO.vReUUa5PAii1lzC0eLtQhX0s69TcVBet7u	\N	\N	t	f	2024-08-31 19:08:37.349	2024-08-31 19:08:37.349	\N	\N
13	8@iu.com	8@ui.com	local	$2a$10$wftnhNsWEXuRB1vE7J/NKOoZ.jgxaam3p67PGZuW1UB2IVqmnHWGa	\N	\N	t	f	2024-08-31 19:16:48.976	2024-08-31 19:16:48.976	\N	\N
16	BoyangYu-2	boyangyby@outlookl.com	local	$2a$10$tP9Z/qr3K7TQqdNpQjd0h.5y2zov0D4u4B8m/7MuP1xGQDq79hx8q	\N	\N	t	f	2024-09-03 23:59:52.876	2024-09-03 23:59:52.876	\N	\N
15	YBY-44	boyangyby@outlook.com	local	$2a$10$d55qEZ.h7A3sQ82RWR5SxOAM/R2imveEFM09cBln8yvqJEuB.7S/.	ec4017b07c5f4a128456a52c796176d9bc255f208839aa950c28aeee800213bb7d6bf417de92b470c84bcd34ff86afc1f28381d2d4e01bff0c882852040e9c6d	\N	t	f	2024-09-03 13:42:15.686	2024-09-04 01:40:52.293	\N	1
14	BoyangYu	yushan3520@gmail.com	local	$2a$10$trC7o65qB2YUQVJm8r7/1ev/FsP.JfX8jLy347JQrFsxX/WvOcQJq	3e7ceac199d3f404e73af35dbfad418d8f5b4af57430ba71d426eb20a53ebaaa4e95d50c3d5ecb25bdf3a6060d5173320b18e15157a85325a785d3fa05a9bee4	\N	t	f	2024-09-02 17:25:26.365	2024-09-04 01:50:20.494	\N	\N
11	Admin	yuby0404_qd@163.com	local	$2a$10$uPpjNeJKlXza5q1rLp3dS.fgHjveDPSyLKD9Gvw/nw2WT5egIYtJG	2bfb68e85dc182d920f821ffb049fe5632ad531a099c265bc52fc94fd93c5f2613dddeb3f3ab891381fa69a2a1ab9d2fdcd99b44980d89d833499534fb48fea2	\N	t	f	2024-08-31 19:06:21.877	2024-09-04 04:21:15.555	1	1
10	Boyang Yu	boyangyby@gmail.com	local	$2a$10$Rt/1imYzk0QV7efbMupaw.Zmq5GiGURmcfv2kWrltjw//1/Cw5ZG6	84656920193b5cbfa21b222ff9d2c97af9cf4b3df731731c07338c5e2062f2a1525939ae6c663ff7c1012a503edb850f474a604a94c47ae0659cc575b152f4f7	\N	t	f	2024-08-24 01:09:02.021	2024-09-06 16:03:39.058	\N	\N
\.


--
-- Data for Name: up_users_role_links; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.up_users_role_links (id, user_id, role_id, user_order) FROM stdin;
10	10	1	1
11	11	3	1
12	12	1	2
13	13	1	3
14	14	1	4
15	15	1	5
16	16	1	6
\.


--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: upload_folders_parent_links; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.upload_folders_parent_links (id, folder_id, inv_folder_id, folder_order) FROM stdin;
\.


--
-- Data for Name: user_carts; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.user_carts (id, quantity, amount, created_at, updated_at, published_at, created_by_id, updated_by_id, user_id) FROM stdin;
114	4	19.96	2024-09-02 17:25:55.657	2024-09-02 17:25:55.845	2024-09-02 17:25:55.825	\N	\N	14
115	4	11.96	2024-09-02 17:26:02.448	2024-09-02 17:26:02.622	2024-09-02 17:26:02.602	\N	\N	14
143	3	8.97	2024-09-06 16:04:40.689	2024-09-06 16:04:40.866	2024-09-06 16:04:40.843	\N	\N	10
\.


--
-- Data for Name: user_carts_product_links; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.user_carts_product_links (id, user_cart_id, product_id, user_cart_order) FROM stdin;
76	114	4	1
77	115	2	1
105	143	15	1
\.


--
-- Data for Name: user_carts_users_permissions_user_links; Type: TABLE DATA; Schema: public; Owner: freshsolder_user
--

COPY public.user_carts_users_permissions_user_links (id, user_cart_id, user_id) FROM stdin;
124	143	10
95	114	14
96	115	14
\.


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 156, true);


--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 156, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.admin_users_roles_links_id_seq', 1, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.categories_id_seq', 8, true);


--
-- Name: components_ordered_item_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.components_ordered_item_order_items_id_seq', 181, true);


--
-- Name: components_ordered_item_order_items_product_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.components_ordered_item_order_items_product_links_id_seq', 180, true);


--
-- Name: files_folder_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.files_folder_links_id_seq', 1, false);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.files_id_seq', 160, true);


--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 93, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- Name: orders_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.orders_components_id_seq', 188, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.orders_id_seq', 93, true);


--
-- Name: orders_users_permissions_user_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.orders_users_permissions_user_links_id_seq', 93, true);


--
-- Name: products_categories_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.products_categories_links_id_seq', 23, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.products_id_seq', 23, true);


--
-- Name: sliders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.sliders_id_seq', 10, true);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_links_id_seq', 1, false);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, false);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 31, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 24, true);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.strapi_release_actions_id_seq', 1, false);


--
-- Name: strapi_release_actions_release_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.strapi_release_actions_release_links_id_seq', 1, false);


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.strapi_releases_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_links_id_seq', 1, false);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 102, true);


--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 102, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 3, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.up_users_id_seq', 16, true);


--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.up_users_role_links_id_seq', 16, true);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);


--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);


--
-- Name: user_carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.user_carts_id_seq', 143, true);


--
-- Name: user_carts_product_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.user_carts_product_links_id_seq', 105, true);


--
-- Name: user_carts_users_permissions_user_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freshsolder_user
--

SELECT pg_catalog.setval('public.user_carts_users_permissions_user_links_id_seq', 124, true);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_unique; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_unique UNIQUE (user_id, role_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: components_ordered_item_order_items components_ordered_item_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.components_ordered_item_order_items
    ADD CONSTRAINT components_ordered_item_order_items_pkey PRIMARY KEY (id);


--
-- Name: components_ordered_item_order_items_product_links components_ordered_item_order_items_product_links_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.components_ordered_item_order_items_product_links
    ADD CONSTRAINT components_ordered_item_order_items_product_links_pkey PRIMARY KEY (id);


--
-- Name: components_ordered_item_order_items_product_links components_ordered_item_order_items_product_links_unique; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.components_ordered_item_order_items_product_links
    ADD CONSTRAINT components_ordered_item_order_items_product_links_unique UNIQUE (order_item_id, product_id);


--
-- Name: files_folder_links files_folder_links_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_pkey PRIMARY KEY (id);


--
-- Name: files_folder_links files_folder_links_unique; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_unique UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_morphs files_related_morphs_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: orders_components orders_components_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.orders_components
    ADD CONSTRAINT orders_components_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: orders_components orders_unique; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.orders_components
    ADD CONSTRAINT orders_unique UNIQUE (entity_id, component_id, field, component_type);


--
-- Name: orders_users_permissions_user_links orders_users_permissions_user_links_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.orders_users_permissions_user_links
    ADD CONSTRAINT orders_users_permissions_user_links_pkey PRIMARY KEY (id);


--
-- Name: orders_users_permissions_user_links orders_users_permissions_user_links_unique; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.orders_users_permissions_user_links
    ADD CONSTRAINT orders_users_permissions_user_links_unique UNIQUE (order_id, user_id);


--
-- Name: products_categories_links products_categories_links_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.products_categories_links
    ADD CONSTRAINT products_categories_links_pkey PRIMARY KEY (id);


--
-- Name: products_categories_links products_categories_links_unique; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.products_categories_links
    ADD CONSTRAINT products_categories_links_unique UNIQUE (product_id, category_id);


--
-- Name: products products_pid_unique; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pid_unique UNIQUE (pid);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: sliders sliders_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.sliders
    ADD CONSTRAINT sliders_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_unique UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions strapi_release_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_links strapi_release_actions_release_links_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_release_actions_release_links
    ADD CONSTRAINT strapi_release_actions_release_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_links strapi_release_actions_release_links_unique; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_release_actions_release_links
    ADD CONSTRAINT strapi_release_actions_release_links_unique UNIQUE (release_action_id, release_id);


--
-- Name: strapi_releases strapi_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_unique UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_unique UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_unique; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_unique UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: user_carts user_carts_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.user_carts
    ADD CONSTRAINT user_carts_pkey PRIMARY KEY (id);


--
-- Name: user_carts_product_links user_carts_product_links_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.user_carts_product_links
    ADD CONSTRAINT user_carts_product_links_pkey PRIMARY KEY (id);


--
-- Name: user_carts_product_links user_carts_product_links_unique; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.user_carts_product_links
    ADD CONSTRAINT user_carts_product_links_unique UNIQUE (user_cart_id, product_id);


--
-- Name: user_carts_users_permissions_user_links user_carts_users_permissions_user_links_pkey; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.user_carts_users_permissions_user_links
    ADD CONSTRAINT user_carts_users_permissions_user_links_pkey PRIMARY KEY (id);


--
-- Name: user_carts_users_permissions_user_links user_carts_users_permissions_user_links_unique; Type: CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.user_carts_users_permissions_user_links
    ADD CONSTRAINT user_carts_users_permissions_user_links_unique UNIQUE (user_cart_id, user_id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);


--
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);


--
-- Name: admin_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX admin_permissions_role_links_order_inv_fk ON public.admin_permissions_role_links USING btree (permission_order);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);


--
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);


--
-- Name: admin_users_roles_links_order_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX admin_users_roles_links_order_fk ON public.admin_users_roles_links USING btree (role_order);


--
-- Name: admin_users_roles_links_order_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX admin_users_roles_links_order_inv_fk ON public.admin_users_roles_links USING btree (user_order);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: categories_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX categories_created_by_id_fk ON public.categories USING btree (created_by_id);


--
-- Name: categories_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX categories_updated_by_id_fk ON public.categories USING btree (updated_by_id);


--
-- Name: components_ordered_item_order_items_product_links_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX components_ordered_item_order_items_product_links_fk ON public.components_ordered_item_order_items_product_links USING btree (order_item_id);


--
-- Name: components_ordered_item_order_items_product_links_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX components_ordered_item_order_items_product_links_inv_fk ON public.components_ordered_item_order_items_product_links USING btree (product_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_folder_links_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX files_folder_links_fk ON public.files_folder_links USING btree (file_id);


--
-- Name: files_folder_links_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX files_folder_links_inv_fk ON public.files_folder_links USING btree (folder_id);


--
-- Name: files_folder_links_order_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX files_folder_links_order_inv_fk ON public.files_folder_links USING btree (file_order);


--
-- Name: files_related_morphs_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);


--
-- Name: files_related_morphs_id_column_index; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX files_related_morphs_id_column_index ON public.files_related_morphs USING btree (related_id);


--
-- Name: files_related_morphs_order_index; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX files_related_morphs_order_index ON public.files_related_morphs USING btree ("order");


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: orders_component_type_index; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX orders_component_type_index ON public.orders_components USING btree (component_type);


--
-- Name: orders_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX orders_created_by_id_fk ON public.orders USING btree (created_by_id);


--
-- Name: orders_entity_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX orders_entity_fk ON public.orders_components USING btree (entity_id);


--
-- Name: orders_field_index; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX orders_field_index ON public.orders_components USING btree (field);


--
-- Name: orders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX orders_updated_by_id_fk ON public.orders USING btree (updated_by_id);


--
-- Name: orders_users_permissions_user_links_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX orders_users_permissions_user_links_fk ON public.orders_users_permissions_user_links USING btree (order_id);


--
-- Name: orders_users_permissions_user_links_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX orders_users_permissions_user_links_inv_fk ON public.orders_users_permissions_user_links USING btree (user_id);


--
-- Name: products_categories_links_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX products_categories_links_fk ON public.products_categories_links USING btree (product_id);


--
-- Name: products_categories_links_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX products_categories_links_inv_fk ON public.products_categories_links USING btree (category_id);


--
-- Name: products_categories_links_order_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX products_categories_links_order_fk ON public.products_categories_links USING btree (category_order);


--
-- Name: products_categories_links_order_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX products_categories_links_order_inv_fk ON public.products_categories_links USING btree (product_order);


--
-- Name: products_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX products_created_by_id_fk ON public.products USING btree (created_by_id);


--
-- Name: products_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX products_updated_by_id_fk ON public.products USING btree (updated_by_id);


--
-- Name: sliders_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX sliders_created_by_id_fk ON public.sliders USING btree (created_by_id);


--
-- Name: sliders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX sliders_updated_by_id_fk ON public.sliders USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_api_token_permissions_token_links_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_api_token_permissions_token_links_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_api_token_permissions_token_links_order_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_order);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_release_actions_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_release_actions_created_by_id_fk ON public.strapi_release_actions USING btree (created_by_id);


--
-- Name: strapi_release_actions_release_links_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_release_actions_release_links_fk ON public.strapi_release_actions_release_links USING btree (release_action_id);


--
-- Name: strapi_release_actions_release_links_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_release_actions_release_links_inv_fk ON public.strapi_release_actions_release_links USING btree (release_id);


--
-- Name: strapi_release_actions_release_links_order_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_release_actions_release_links_order_inv_fk ON public.strapi_release_actions_release_links USING btree (release_action_order);


--
-- Name: strapi_release_actions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_release_actions_updated_by_id_fk ON public.strapi_release_actions USING btree (updated_by_id);


--
-- Name: strapi_releases_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_releases_created_by_id_fk ON public.strapi_releases USING btree (created_by_id);


--
-- Name: strapi_releases_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_releases_updated_by_id_fk ON public.strapi_releases USING btree (updated_by_id);


--
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- Name: strapi_transfer_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_transfer_token_permissions_token_links_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_id);


--
-- Name: strapi_transfer_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_transfer_token_permissions_token_links_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_id);


--
-- Name: strapi_transfer_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_transfer_token_permissions_token_links_order_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_order);


--
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);


--
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);


--
-- Name: up_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX up_permissions_role_links_order_inv_fk ON public.up_permissions_role_links USING btree (permission_order);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_role_links_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);


--
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);


--
-- Name: up_users_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX up_users_role_links_order_inv_fk ON public.up_users_role_links USING btree (user_order);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_parent_links_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX upload_folders_parent_links_fk ON public.upload_folders_parent_links USING btree (folder_id);


--
-- Name: upload_folders_parent_links_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX upload_folders_parent_links_inv_fk ON public.upload_folders_parent_links USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_links_order_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX upload_folders_parent_links_order_inv_fk ON public.upload_folders_parent_links USING btree (folder_order);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: user_carts_created_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX user_carts_created_by_id_fk ON public.user_carts USING btree (created_by_id);


--
-- Name: user_carts_product_links_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX user_carts_product_links_fk ON public.user_carts_product_links USING btree (user_cart_id);


--
-- Name: user_carts_product_links_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX user_carts_product_links_inv_fk ON public.user_carts_product_links USING btree (product_id);


--
-- Name: user_carts_product_links_order_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX user_carts_product_links_order_inv_fk ON public.user_carts_product_links USING btree (user_cart_order);


--
-- Name: user_carts_updated_by_id_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX user_carts_updated_by_id_fk ON public.user_carts USING btree (updated_by_id);


--
-- Name: user_carts_users_permissions_user_links_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX user_carts_users_permissions_user_links_fk ON public.user_carts_users_permissions_user_links USING btree (user_cart_id);


--
-- Name: user_carts_users_permissions_user_links_inv_fk; Type: INDEX; Schema: public; Owner: freshsolder_user
--

CREATE INDEX user_carts_users_permissions_user_links_inv_fk ON public.user_carts_users_permissions_user_links USING btree (user_id);


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: categories categories_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: categories categories_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: components_ordered_item_order_items_product_links components_ordered_item_order_items_product_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.components_ordered_item_order_items_product_links
    ADD CONSTRAINT components_ordered_item_order_items_product_links_fk FOREIGN KEY (order_item_id) REFERENCES public.components_ordered_item_order_items(id) ON DELETE CASCADE;


--
-- Name: components_ordered_item_order_items_product_links components_ordered_item_order_items_product_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.components_ordered_item_order_items_product_links
    ADD CONSTRAINT components_ordered_item_order_items_product_links_inv_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_links files_folder_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_links files_folder_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_inv_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: orders orders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: orders_components orders_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.orders_components
    ADD CONSTRAINT orders_entity_fk FOREIGN KEY (entity_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: orders orders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: orders_users_permissions_user_links orders_users_permissions_user_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.orders_users_permissions_user_links
    ADD CONSTRAINT orders_users_permissions_user_links_fk FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: orders_users_permissions_user_links orders_users_permissions_user_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.orders_users_permissions_user_links
    ADD CONSTRAINT orders_users_permissions_user_links_inv_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: products_categories_links products_categories_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.products_categories_links
    ADD CONSTRAINT products_categories_links_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_categories_links products_categories_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.products_categories_links
    ADD CONSTRAINT products_categories_links_inv_fk FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: products products_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: products products_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: sliders sliders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.sliders
    ADD CONSTRAINT sliders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: sliders sliders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.sliders
    ADD CONSTRAINT sliders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_inv_fk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions strapi_release_actions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions_release_links strapi_release_actions_release_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_release_actions_release_links
    ADD CONSTRAINT strapi_release_actions_release_links_fk FOREIGN KEY (release_action_id) REFERENCES public.strapi_release_actions(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions_release_links strapi_release_actions_release_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_release_actions_release_links
    ADD CONSTRAINT strapi_release_actions_release_links_inv_fk FOREIGN KEY (release_id) REFERENCES public.strapi_releases(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions strapi_release_actions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_inv_fk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_inv_fk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: user_carts user_carts_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.user_carts
    ADD CONSTRAINT user_carts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: user_carts_product_links user_carts_product_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.user_carts_product_links
    ADD CONSTRAINT user_carts_product_links_fk FOREIGN KEY (user_cart_id) REFERENCES public.user_carts(id) ON DELETE CASCADE;


--
-- Name: user_carts_product_links user_carts_product_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.user_carts_product_links
    ADD CONSTRAINT user_carts_product_links_inv_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: user_carts user_carts_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.user_carts
    ADD CONSTRAINT user_carts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: user_carts_users_permissions_user_links user_carts_users_permissions_user_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.user_carts_users_permissions_user_links
    ADD CONSTRAINT user_carts_users_permissions_user_links_fk FOREIGN KEY (user_cart_id) REFERENCES public.user_carts(id) ON DELETE CASCADE;


--
-- Name: user_carts_users_permissions_user_links user_carts_users_permissions_user_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: freshsolder_user
--

ALTER TABLE ONLY public.user_carts_users_permissions_user_links
    ADD CONSTRAINT user_carts_users_permissions_user_links_inv_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES TO freshsolder_user;


--
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES TO freshsolder_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS TO freshsolder_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES TO freshsolder_user;


--
-- PostgreSQL database dump complete
--

