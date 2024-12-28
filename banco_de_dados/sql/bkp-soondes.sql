--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-1.pgdg22.04+1)

-- Started on 2024-08-26 16:04:06 EST

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

--- CREATE SCHEMA public;


--
-- TOC entry 3988 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 268 (class 1259 OID 197006)
-- Name: Announcements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Announcements" (
    id integer NOT NULL,
    priority integer,
    title character varying(255) NOT NULL,
    text text NOT NULL,
    "mediaPath" text,
    "mediaName" text,
    "companyId" integer NOT NULL,
    status boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 267 (class 1259 OID 197005)
-- Name: Announcements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Announcements_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3989 (class 0 OID 0)
-- Dependencies: 267
-- Name: Announcements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Announcements_id_seq" OWNED BY public."Announcements".id;


--
-- TOC entry 255 (class 1259 OID 196881)
-- Name: Baileys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Baileys" (
    id integer NOT NULL,
    "whatsappId" integer NOT NULL,
    contacts text,
    chats text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 280 (class 1259 OID 197116)
-- Name: BaileysChats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."BaileysChats" (
    id integer NOT NULL,
    "whatsappId" integer,
    jid character varying(255) NOT NULL,
    "conversationTimestamp" character varying(255) NOT NULL,
    "unreadCount" integer DEFAULT 0,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 279 (class 1259 OID 197115)
-- Name: BaileysChats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."BaileysChats_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3990 (class 0 OID 0)
-- Dependencies: 279
-- Name: BaileysChats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."BaileysChats_id_seq" OWNED BY public."BaileysChats".id;


--
-- TOC entry 282 (class 1259 OID 197131)
-- Name: BaileysMessages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."BaileysMessages" (
    id integer NOT NULL,
    "whatsappId" integer,
    "baileysChatId" integer,
    "jsonMessage" json NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 281 (class 1259 OID 197130)
-- Name: BaileysMessages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."BaileysMessages_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3991 (class 0 OID 0)
-- Dependencies: 281
-- Name: BaileysMessages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."BaileysMessages_id_seq" OWNED BY public."BaileysMessages".id;


--
-- TOC entry 254 (class 1259 OID 196880)
-- Name: Baileys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Baileys_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3992 (class 0 OID 0)
-- Dependencies: 254
-- Name: Baileys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Baileys_id_seq" OWNED BY public."Baileys".id;


--
-- TOC entry 263 (class 1259 OID 196957)
-- Name: CampaignSettings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."CampaignSettings" (
    id integer NOT NULL,
    key character varying(255) NOT NULL,
    value text,
    "companyId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 262 (class 1259 OID 196956)
-- Name: CampaignSettings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."CampaignSettings_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3993 (class 0 OID 0)
-- Dependencies: 262
-- Name: CampaignSettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."CampaignSettings_id_seq" OWNED BY public."CampaignSettings".id;


--
-- TOC entry 266 (class 1259 OID 196978)
-- Name: CampaignShipping; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."CampaignShipping" (
    id integer NOT NULL,
    "jobId" character varying(255),
    number character varying(255) NOT NULL,
    message text NOT NULL,
    "confirmationMessage" text,
    confirmation boolean,
    "contactId" integer,
    "campaignId" integer NOT NULL,
    "confirmationRequestedAt" timestamp with time zone,
    "confirmedAt" timestamp with time zone,
    "deliveredAt" timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 265 (class 1259 OID 196977)
-- Name: CampaignShipping_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."CampaignShipping_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3994 (class 0 OID 0)
-- Dependencies: 265
-- Name: CampaignShipping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."CampaignShipping_id_seq" OWNED BY public."CampaignShipping".id;


--
-- TOC entry 261 (class 1259 OID 196922)
-- Name: Campaigns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Campaigns" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    message1 text DEFAULT ''::text,
    message2 text DEFAULT ''::text,
    message3 text DEFAULT ''::text,
    message4 text DEFAULT ''::text,
    message5 text DEFAULT ''::text,
    "confirmationMessage1" text DEFAULT ''::text,
    "confirmationMessage2" text DEFAULT ''::text,
    "confirmationMessage3" text DEFAULT ''::text,
    "confirmationMessage4" text DEFAULT ''::text,
    "confirmationMessage5" text DEFAULT ''::text,
    status character varying(255),
    confirmation boolean DEFAULT false,
    "mediaPath" text,
    "mediaName" text,
    "companyId" integer NOT NULL,
    "contactListId" integer,
    "whatsappId" integer,
    "scheduledAt" timestamp with time zone,
    "completedAt" timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "fileListId" integer
);


--
-- TOC entry 260 (class 1259 OID 196921)
-- Name: Campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Campaigns_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3995 (class 0 OID 0)
-- Dependencies: 260
-- Name: Campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Campaigns_id_seq" OWNED BY public."Campaigns".id;


--
-- TOC entry 274 (class 1259 OID 197059)
-- Name: ChatMessages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ChatMessages" (
    id integer NOT NULL,
    "chatId" integer NOT NULL,
    "senderId" integer NOT NULL,
    message text DEFAULT ''::text,
    "mediaPath" text,
    "mediaName" text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 273 (class 1259 OID 197058)
-- Name: ChatMessages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ChatMessages_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3996 (class 0 OID 0)
-- Dependencies: 273
-- Name: ChatMessages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ChatMessages_id_seq" OWNED BY public."ChatMessages".id;


--
-- TOC entry 272 (class 1259 OID 197041)
-- Name: ChatUsers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ChatUsers" (
    id integer NOT NULL,
    "chatId" integer NOT NULL,
    "userId" integer NOT NULL,
    unreads integer DEFAULT 0,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 271 (class 1259 OID 197040)
-- Name: ChatUsers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ChatUsers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3997 (class 0 OID 0)
-- Dependencies: 271
-- Name: ChatUsers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ChatUsers_id_seq" OWNED BY public."ChatUsers".id;


--
-- TOC entry 270 (class 1259 OID 197020)
-- Name: Chats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Chats" (
    id integer NOT NULL,
    title text DEFAULT ''::text,
    uuid character varying(255) DEFAULT ''::character varying,
    "ownerId" integer NOT NULL,
    "lastMessage" text,
    "companyId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 269 (class 1259 OID 197019)
-- Name: Chats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Chats_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3998 (class 0 OID 0)
-- Dependencies: 269
-- Name: Chats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Chats_id_seq" OWNED BY public."Chats".id;


--
-- TOC entry 234 (class 1259 OID 196614)
-- Name: Companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Companies" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(255),
    email character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "planId" integer,
    status boolean DEFAULT true,
    schedules jsonb DEFAULT '[]'::jsonb,
    "dueDate" timestamp with time zone,
    recurrence character varying(255) DEFAULT ''::character varying
);


--
-- TOC entry 233 (class 1259 OID 196613)
-- Name: Companies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Companies_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3999 (class 0 OID 0)
-- Dependencies: 233
-- Name: Companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Companies_id_seq" OWNED BY public."Companies".id;


--
-- TOC entry 227 (class 1259 OID 196534)
-- Name: ContactCustomFields; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ContactCustomFields" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    "contactId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 196533)
-- Name: ContactCustomFields_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ContactCustomFields_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4000 (class 0 OID 0)
-- Dependencies: 226
-- Name: ContactCustomFields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ContactCustomFields_id_seq" OWNED BY public."ContactCustomFields".id;


--
-- TOC entry 259 (class 1259 OID 196902)
-- Name: ContactListItems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ContactListItems" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    number character varying(255) NOT NULL,
    email character varying(255),
    "contactListId" integer NOT NULL,
    "isWhatsappValid" boolean DEFAULT false,
    "companyId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 258 (class 1259 OID 196901)
-- Name: ContactListItems_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ContactListItems_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4001 (class 0 OID 0)
-- Dependencies: 258
-- Name: ContactListItems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ContactListItems_id_seq" OWNED BY public."ContactListItems".id;


--
-- TOC entry 257 (class 1259 OID 196890)
-- Name: ContactLists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ContactLists" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "companyId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 196889)
-- Name: ContactLists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ContactLists_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4002 (class 0 OID 0)
-- Dependencies: 256
-- Name: ContactLists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ContactLists_id_seq" OWNED BY public."ContactLists".id;


--
-- TOC entry 220 (class 1259 OID 196477)
-- Name: Contacts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Contacts" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    number character varying(255) NOT NULL,
    "profilePicUrl" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    "isGroup" boolean DEFAULT false NOT NULL,
    "companyId" integer,
    active boolean DEFAULT true,
    "whatsappId" integer
);


--
-- TOC entry 219 (class 1259 OID 196476)
-- Name: Contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Contacts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4003 (class 0 OID 0)
-- Dependencies: 219
-- Name: Contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Contacts_id_seq" OWNED BY public."Contacts".id;


--
-- TOC entry 286 (class 1259 OID 197180)
-- Name: Files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Files" (
    id integer NOT NULL,
    "companyId" integer NOT NULL,
    name character varying(255) NOT NULL,
    message text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 288 (class 1259 OID 197194)
-- Name: FilesOptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."FilesOptions" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    "fileId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "mediaType" character varying(255) DEFAULT ''::character varying
);


--
-- TOC entry 287 (class 1259 OID 197193)
-- Name: FilesOptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."FilesOptions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4004 (class 0 OID 0)
-- Dependencies: 287
-- Name: FilesOptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."FilesOptions_id_seq" OWNED BY public."FilesOptions".id;


--
-- TOC entry 285 (class 1259 OID 197179)
-- Name: Files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Files_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4005 (class 0 OID 0)
-- Dependencies: 285
-- Name: Files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Files_id_seq" OWNED BY public."Files".id;


--
-- TOC entry 242 (class 1259 OID 196717)
-- Name: Helps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Helps" (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    video character varying(255),
    link text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 196716)
-- Name: Helps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Helps_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4006 (class 0 OID 0)
-- Dependencies: 241
-- Name: Helps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Helps_id_seq" OWNED BY public."Helps".id;


--
-- TOC entry 278 (class 1259 OID 197100)
-- Name: Invoices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Invoices" (
    id integer NOT NULL,
    detail character varying(255),
    status character varying(255),
    value double precision,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "dueDate" character varying(255),
    "companyId" integer
);


--
-- TOC entry 277 (class 1259 OID 197099)
-- Name: Invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Invoices_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4007 (class 0 OID 0)
-- Dependencies: 277
-- Name: Invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Invoices_id_seq" OWNED BY public."Invoices".id;


--
-- TOC entry 223 (class 1259 OID 196505)
-- Name: Messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Messages" (
    id character varying(255) NOT NULL,
    body text NOT NULL,
    ack integer DEFAULT 0 NOT NULL,
    read boolean DEFAULT false NOT NULL,
    "mediaType" character varying(255),
    "mediaUrl" character varying(255),
    "ticketId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "fromMe" boolean DEFAULT false NOT NULL,
    "isDeleted" boolean DEFAULT false NOT NULL,
    "contactId" integer,
    "quotedMsgId" character varying(255),
    "companyId" integer,
    "remoteJid" text,
    "dataJson" text,
    participant text,
    "queueId" integer,
    "isEdited" boolean DEFAULT false NOT NULL
);


--
-- TOC entry 236 (class 1259 OID 196660)
-- Name: Plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Plans" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    users integer DEFAULT 0,
    connections integer DEFAULT 0,
    queues integer DEFAULT 0,
    value double precision DEFAULT '0'::double precision,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "useCampaigns" boolean DEFAULT true,
    "useExternalApi" boolean DEFAULT true,
    "useInternalChat" boolean DEFAULT true,
    "useSchedules" boolean DEFAULT true,
    "useInternal" boolean DEFAULT true,
    "useKanban" boolean DEFAULT true,
    "useOpenAi" boolean DEFAULT true,
    "useIntegrations" boolean DEFAULT true
);


--
-- TOC entry 235 (class 1259 OID 196659)
-- Name: Plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Plans_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4008 (class 0 OID 0)
-- Dependencies: 235
-- Name: Plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Plans_id_seq" OWNED BY public."Plans".id;


--
-- TOC entry 290 (class 1259 OID 197219)
-- Name: Prompts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Prompts" (
    id integer NOT NULL,
    name text NOT NULL,
    "apiKey" text NOT NULL,
    prompt text NOT NULL,
    "maxTokens" integer DEFAULT 100 NOT NULL,
    "maxMessages" integer DEFAULT 10 NOT NULL,
    temperature integer DEFAULT 1 NOT NULL,
    "promptTokens" integer DEFAULT 0 NOT NULL,
    "completionTokens" integer DEFAULT 0 NOT NULL,
    "totalTokens" integer DEFAULT 0 NOT NULL,
    voice text,
    "voiceKey" text,
    "voiceRegion" text,
    "queueId" integer NOT NULL,
    "companyId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 289 (class 1259 OID 197218)
-- Name: Prompts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Prompts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4009 (class 0 OID 0)
-- Dependencies: 289
-- Name: Prompts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Prompts_id_seq" OWNED BY public."Prompts".id;


--
-- TOC entry 284 (class 1259 OID 197156)
-- Name: QueueIntegrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."QueueIntegrations" (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "projectName" character varying(255) NOT NULL,
    "jsonContent" text NOT NULL,
    language character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "urlN8N" character varying(255) DEFAULT true NOT NULL,
    "companyId" integer,
    "typebotSlug" character varying(255) DEFAULT ''::character varying NOT NULL,
    "typebotExpires" integer DEFAULT 0 NOT NULL,
    "typebotKeywordFinish" character varying(255) DEFAULT ''::character varying NOT NULL,
    "typebotUnknownMessage" character varying(255) DEFAULT ''::character varying NOT NULL,
    "typebotDelayMessage" integer DEFAULT 1000 NOT NULL,
    "typebotKeywordRestart" character varying(255) DEFAULT ''::character varying,
    "typebotRestartMessage" character varying(255) DEFAULT ''::character varying
);


--
-- TOC entry 283 (class 1259 OID 197155)
-- Name: QueueIntegrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."QueueIntegrations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4010 (class 0 OID 0)
-- Dependencies: 283
-- Name: QueueIntegrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."QueueIntegrations_id_seq" OWNED BY public."QueueIntegrations".id;


--
-- TOC entry 248 (class 1259 OID 196794)
-- Name: QueueOptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."QueueOptions" (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    message text,
    option text,
    "queueId" integer,
    "parentId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "mediaName" text DEFAULT ''::text,
    "mediaPath" text DEFAULT ''::text
);


--
-- TOC entry 247 (class 1259 OID 196793)
-- Name: QueueOptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."QueueOptions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4011 (class 0 OID 0)
-- Dependencies: 247
-- Name: QueueOptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."QueueOptions_id_seq" OWNED BY public."QueueOptions".id;


--
-- TOC entry 230 (class 1259 OID 196586)
-- Name: Queues; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Queues" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    color character varying(255) NOT NULL,
    "greetingMessage" text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "companyId" integer,
    schedules jsonb DEFAULT '[]'::jsonb,
    "outOfHoursMessage" text,
    "orderQueue" integer,
    "mediaName" text DEFAULT ''::text,
    "mediaPath" text DEFAULT ''::text,
    "integrationId" integer,
    "promptId" integer
);


--
-- TOC entry 229 (class 1259 OID 196585)
-- Name: Queues_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Queues_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4012 (class 0 OID 0)
-- Dependencies: 229
-- Name: Queues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Queues_id_seq" OWNED BY public."Queues".id;


--
-- TOC entry 240 (class 1259 OID 196702)
-- Name: QuickMessages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."QuickMessages" (
    id integer NOT NULL,
    shortcode character varying(255) NOT NULL,
    message text,
    "companyId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer,
    "mediaPath" character varying(255) DEFAULT NULL::character varying,
    "mediaName" character varying(255) DEFAULT NULL::character varying,
    geral boolean DEFAULT false NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 196701)
-- Name: QuickMessages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."QuickMessages_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4013 (class 0 OID 0)
-- Dependencies: 239
-- Name: QuickMessages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."QuickMessages_id_seq" OWNED BY public."QuickMessages".id;


--
-- TOC entry 250 (class 1259 OID 196819)
-- Name: Schedules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Schedules" (
    id integer NOT NULL,
    body text NOT NULL,
    "sendAt" timestamp with time zone,
    "sentAt" timestamp with time zone,
    "contactId" integer,
    "ticketId" integer,
    "userId" integer,
    "companyId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    status character varying(255),
    "mediaName" character varying(255) DEFAULT NULL::character varying,
    "mediaPath" character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 249 (class 1259 OID 196818)
-- Name: Schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Schedules_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4014 (class 0 OID 0)
-- Dependencies: 249
-- Name: Schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Schedules_id_seq" OWNED BY public."Schedules".id;


--
-- TOC entry 216 (class 1259 OID 196449)
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 196550)
-- Name: Settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Settings" (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "companyId" integer,
    id integer NOT NULL
);


--
-- TOC entry 264 (class 1259 OID 196970)
-- Name: Settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Settings_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4015 (class 0 OID 0)
-- Dependencies: 264
-- Name: Settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Settings_id_seq" OWNED BY public."Settings".id;


--
-- TOC entry 276 (class 1259 OID 197085)
-- Name: Subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Subscriptions" (
    id integer NOT NULL,
    "isActive" boolean DEFAULT false,
    "expiresAt" timestamp with time zone NOT NULL,
    "userPriceCents" integer,
    "whatsPriceCents" integer,
    "lastInvoiceUrl" character varying(255),
    "lastPlanChange" timestamp with time zone,
    "companyId" integer,
    "providerSubscriptionId" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 275 (class 1259 OID 197084)
-- Name: Subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Subscriptions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4016 (class 0 OID 0)
-- Dependencies: 275
-- Name: Subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Subscriptions_id_seq" OWNED BY public."Subscriptions".id;


--
-- TOC entry 252 (class 1259 OID 196853)
-- Name: Tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Tags" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    color character varying(255),
    "companyId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    kanban integer
);


--
-- TOC entry 251 (class 1259 OID 196852)
-- Name: Tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Tags_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4017 (class 0 OID 0)
-- Dependencies: 251
-- Name: Tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Tags_id_seq" OWNED BY public."Tags".id;


--
-- TOC entry 238 (class 1259 OID 196680)
-- Name: TicketNotes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."TicketNotes" (
    id integer NOT NULL,
    note character varying(255) NOT NULL,
    "userId" integer,
    "contactId" integer NOT NULL,
    "ticketId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 196679)
-- Name: TicketNotes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."TicketNotes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4018 (class 0 OID 0)
-- Dependencies: 237
-- Name: TicketNotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."TicketNotes_id_seq" OWNED BY public."TicketNotes".id;


--
-- TOC entry 253 (class 1259 OID 196866)
-- Name: TicketTags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."TicketTags" (
    "ticketId" integer NOT NULL,
    "tagId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 196728)
-- Name: TicketTraking; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."TicketTraking" (
    id integer NOT NULL,
    "ticketId" integer,
    "companyId" integer,
    "whatsappId" integer,
    "userId" integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "queuedAt" timestamp with time zone,
    "startedAt" timestamp with time zone,
    "finishedAt" timestamp with time zone,
    "ratingAt" timestamp with time zone,
    rated boolean DEFAULT false,
    "chatbotAt" timestamp with time zone
);


--
-- TOC entry 243 (class 1259 OID 196727)
-- Name: TicketTraking_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."TicketTraking_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4019 (class 0 OID 0)
-- Dependencies: 243
-- Name: TicketTraking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."TicketTraking_id_seq" OWNED BY public."TicketTraking".id;


--
-- TOC entry 222 (class 1259 OID 196486)
-- Name: Tickets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Tickets" (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    "lastMessage" text DEFAULT ''::text,
    "contactId" integer,
    "userId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "whatsappId" integer,
    "isGroup" boolean DEFAULT false NOT NULL,
    "unreadMessages" integer,
    "queueId" integer,
    "companyId" integer,
    uuid uuid DEFAULT public.uuid_generate_v4(),
    chatbot boolean DEFAULT false,
    "queueOptionId" integer,
    "amountUsedBotQueues" integer,
    "fromMe" boolean DEFAULT false NOT NULL,
    "useIntegration" boolean DEFAULT false,
    "integrationId" integer,
    "typebotSessionId" character varying(255) DEFAULT NULL::character varying,
    "typebotStatus" boolean DEFAULT false NOT NULL,
    "promptId" character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 196485)
-- Name: Tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Tickets_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4020 (class 0 OID 0)
-- Dependencies: 221
-- Name: Tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Tickets_id_seq" OWNED BY public."Tickets".id;


--
-- TOC entry 232 (class 1259 OID 196608)
-- Name: UserQueues; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."UserQueues" (
    "userId" integer NOT NULL,
    "queueId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 246 (class 1259 OID 196756)
-- Name: UserRatings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."UserRatings" (
    id integer NOT NULL,
    "ticketId" integer,
    "companyId" integer,
    "userId" integer,
    rate integer DEFAULT 0,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


--
-- TOC entry 245 (class 1259 OID 196755)
-- Name: UserRatings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."UserRatings_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4021 (class 0 OID 0)
-- Dependencies: 245
-- Name: UserRatings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."UserRatings_id_seq" OWNED BY public."UserRatings".id;


--
-- TOC entry 218 (class 1259 OID 196466)
-- Name: Users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    "passwordHash" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    profile character varying(255) DEFAULT 'admin'::character varying NOT NULL,
    "tokenVersion" integer DEFAULT 0 NOT NULL,
    "companyId" integer,
    super boolean DEFAULT false,
    online boolean DEFAULT false,
    "allTicket" character varying(255) DEFAULT 'desabled'::character varying NOT NULL,
    "whatsappId" integer,
    "resetPassword" character varying(255)
);


--
-- TOC entry 217 (class 1259 OID 196465)
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4022 (class 0 OID 0)
-- Dependencies: 217
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- TOC entry 231 (class 1259 OID 196603)
-- Name: WhatsappQueues; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WhatsappQueues" (
    "whatsappId" integer NOT NULL,
    "queueId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 196525)
-- Name: Whatsapps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Whatsapps" (
    id integer NOT NULL,
    session text,
    qrcode text,
    status character varying(255),
    battery character varying(255),
    plugged boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    "isDefault" boolean DEFAULT false NOT NULL,
    retries integer DEFAULT 0 NOT NULL,
    "greetingMessage" text,
    "companyId" integer,
    "complationMessage" text,
    "outOfHoursMessage" text,
    "ratingMessage" text,
    token text,
    "farewellMessage" text,
    provider text DEFAULT 'stable'::text,
    number text,
    "sendIdQueue" integer,
    "promptId" integer,
    "integrationId" integer,
    "maxUseBotQueues" integer DEFAULT 3,
    "expiresTicket" integer DEFAULT 0,
    "expiresInactiveMessage" character varying(255) DEFAULT ''::character varying,
    "timeUseBotQueues" integer DEFAULT 0,
    "transferQueueId" integer,
    "timeToTransfer" integer
);


--
-- TOC entry 224 (class 1259 OID 196524)
-- Name: Whatsapps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Whatsapps_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4023 (class 0 OID 0)
-- Dependencies: 224
-- Name: Whatsapps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Whatsapps_id_seq" OWNED BY public."Whatsapps".id;


--
-- TOC entry 3557 (class 2604 OID 197009)
-- Name: Announcements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Announcements" ALTER COLUMN id SET DEFAULT nextval('public."Announcements_id_seq"'::regclass);


--
-- TOC entry 3539 (class 2604 OID 196884)
-- Name: Baileys id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Baileys" ALTER COLUMN id SET DEFAULT nextval('public."Baileys_id_seq"'::regclass);


--
-- TOC entry 3568 (class 2604 OID 197119)
-- Name: BaileysChats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."BaileysChats" ALTER COLUMN id SET DEFAULT nextval('public."BaileysChats_id_seq"'::regclass);


--
-- TOC entry 3570 (class 2604 OID 197134)
-- Name: BaileysMessages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."BaileysMessages" ALTER COLUMN id SET DEFAULT nextval('public."BaileysMessages_id_seq"'::regclass);


--
-- TOC entry 3555 (class 2604 OID 196960)
-- Name: CampaignSettings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."CampaignSettings" ALTER COLUMN id SET DEFAULT nextval('public."CampaignSettings_id_seq"'::regclass);


--
-- TOC entry 3556 (class 2604 OID 196981)
-- Name: CampaignShipping id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."CampaignShipping" ALTER COLUMN id SET DEFAULT nextval('public."CampaignShipping_id_seq"'::regclass);


--
-- TOC entry 3543 (class 2604 OID 196925)
-- Name: Campaigns id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Campaigns" ALTER COLUMN id SET DEFAULT nextval('public."Campaigns_id_seq"'::regclass);


--
-- TOC entry 3563 (class 2604 OID 197062)
-- Name: ChatMessages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ChatMessages" ALTER COLUMN id SET DEFAULT nextval('public."ChatMessages_id_seq"'::regclass);


--
-- TOC entry 3561 (class 2604 OID 197044)
-- Name: ChatUsers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ChatUsers" ALTER COLUMN id SET DEFAULT nextval('public."ChatUsers_id_seq"'::regclass);


--
-- TOC entry 3558 (class 2604 OID 197023)
-- Name: Chats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Chats" ALTER COLUMN id SET DEFAULT nextval('public."Chats_id_seq"'::regclass);


--
-- TOC entry 3505 (class 2604 OID 196617)
-- Name: Companies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Companies" ALTER COLUMN id SET DEFAULT nextval('public."Companies_id_seq"'::regclass);


--
-- TOC entry 3499 (class 2604 OID 196537)
-- Name: ContactCustomFields id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ContactCustomFields" ALTER COLUMN id SET DEFAULT nextval('public."ContactCustomFields_id_seq"'::regclass);


--
-- TOC entry 3541 (class 2604 OID 196905)
-- Name: ContactListItems id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ContactListItems" ALTER COLUMN id SET DEFAULT nextval('public."ContactListItems_id_seq"'::regclass);


--
-- TOC entry 3540 (class 2604 OID 196893)
-- Name: ContactLists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ContactLists" ALTER COLUMN id SET DEFAULT nextval('public."ContactLists_id_seq"'::regclass);


--
-- TOC entry 3471 (class 2604 OID 196480)
-- Name: Contacts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Contacts" ALTER COLUMN id SET DEFAULT nextval('public."Contacts_id_seq"'::regclass);


--
-- TOC entry 3580 (class 2604 OID 197183)
-- Name: Files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Files" ALTER COLUMN id SET DEFAULT nextval('public."Files_id_seq"'::regclass);


--
-- TOC entry 3581 (class 2604 OID 197197)
-- Name: FilesOptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."FilesOptions" ALTER COLUMN id SET DEFAULT nextval('public."FilesOptions_id_seq"'::regclass);


--
-- TOC entry 3527 (class 2604 OID 196720)
-- Name: Helps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Helps" ALTER COLUMN id SET DEFAULT nextval('public."Helps_id_seq"'::regclass);


--
-- TOC entry 3567 (class 2604 OID 197103)
-- Name: Invoices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Invoices" ALTER COLUMN id SET DEFAULT nextval('public."Invoices_id_seq"'::regclass);


--
-- TOC entry 3509 (class 2604 OID 196663)
-- Name: Plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Plans" ALTER COLUMN id SET DEFAULT nextval('public."Plans_id_seq"'::regclass);


--
-- TOC entry 3583 (class 2604 OID 197222)
-- Name: Prompts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Prompts" ALTER COLUMN id SET DEFAULT nextval('public."Prompts_id_seq"'::regclass);


--
-- TOC entry 3571 (class 2604 OID 197159)
-- Name: QueueIntegrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."QueueIntegrations" ALTER COLUMN id SET DEFAULT nextval('public."QueueIntegrations_id_seq"'::regclass);


--
-- TOC entry 3532 (class 2604 OID 196797)
-- Name: QueueOptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."QueueOptions" ALTER COLUMN id SET DEFAULT nextval('public."QueueOptions_id_seq"'::regclass);


--
-- TOC entry 3501 (class 2604 OID 196589)
-- Name: Queues id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Queues" ALTER COLUMN id SET DEFAULT nextval('public."Queues_id_seq"'::regclass);


--
-- TOC entry 3523 (class 2604 OID 196705)
-- Name: QuickMessages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."QuickMessages" ALTER COLUMN id SET DEFAULT nextval('public."QuickMessages_id_seq"'::regclass);


--
-- TOC entry 3535 (class 2604 OID 196822)
-- Name: Schedules id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Schedules" ALTER COLUMN id SET DEFAULT nextval('public."Schedules_id_seq"'::regclass);


--
-- TOC entry 3500 (class 2604 OID 196971)
-- Name: Settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Settings" ALTER COLUMN id SET DEFAULT nextval('public."Settings_id_seq"'::regclass);


--
-- TOC entry 3565 (class 2604 OID 197088)
-- Name: Subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subscriptions" ALTER COLUMN id SET DEFAULT nextval('public."Subscriptions_id_seq"'::regclass);


--
-- TOC entry 3538 (class 2604 OID 196856)
-- Name: Tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tags" ALTER COLUMN id SET DEFAULT nextval('public."Tags_id_seq"'::regclass);


--
-- TOC entry 3522 (class 2604 OID 196683)
-- Name: TicketNotes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TicketNotes" ALTER COLUMN id SET DEFAULT nextval('public."TicketNotes_id_seq"'::regclass);


--
-- TOC entry 3528 (class 2604 OID 196731)
-- Name: TicketTraking id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TicketTraking" ALTER COLUMN id SET DEFAULT nextval('public."TicketTraking_id_seq"'::regclass);


--
-- TOC entry 3475 (class 2604 OID 196489)
-- Name: Tickets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tickets" ALTER COLUMN id SET DEFAULT nextval('public."Tickets_id_seq"'::regclass);


--
-- TOC entry 3530 (class 2604 OID 196759)
-- Name: UserRatings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UserRatings" ALTER COLUMN id SET DEFAULT nextval('public."UserRatings_id_seq"'::regclass);


--
-- TOC entry 3465 (class 2604 OID 196469)
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- TOC entry 3491 (class 2604 OID 196528)
-- Name: Whatsapps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Whatsapps" ALTER COLUMN id SET DEFAULT nextval('public."Whatsapps_id_seq"'::regclass);


--
-- TOC entry 3960 (class 0 OID 197006)
-- Dependencies: 268
-- Data for Name: Announcements; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3947 (class 0 OID 196881)
-- Dependencies: 255
-- Data for Name: Baileys; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3972 (class 0 OID 197116)
-- Dependencies: 280
-- Data for Name: BaileysChats; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3974 (class 0 OID 197131)
-- Dependencies: 282
-- Data for Name: BaileysMessages; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3955 (class 0 OID 196957)
-- Dependencies: 263
-- Data for Name: CampaignSettings; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3958 (class 0 OID 196978)
-- Dependencies: 266
-- Data for Name: CampaignShipping; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3953 (class 0 OID 196922)
-- Dependencies: 261
-- Data for Name: Campaigns; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3966 (class 0 OID 197059)
-- Dependencies: 274
-- Data for Name: ChatMessages; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3964 (class 0 OID 197041)
-- Dependencies: 272
-- Data for Name: ChatUsers; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3962 (class 0 OID 197020)
-- Dependencies: 270
-- Data for Name: Chats; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3926 (class 0 OID 196614)
-- Dependencies: 234
-- Data for Name: Companies; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Companies" VALUES (1, 'Empresa 1', NULL, NULL, '2024-08-26 14:23:02.889-05', '2024-08-26 14:23:02.889-05', 1, true, '[]', '2093-03-13 22:00:00-05', '');


--
-- TOC entry 3919 (class 0 OID 196534)
-- Dependencies: 227
-- Data for Name: ContactCustomFields; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3951 (class 0 OID 196902)
-- Dependencies: 259
-- Data for Name: ContactListItems; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3949 (class 0 OID 196890)
-- Dependencies: 257
-- Data for Name: ContactLists; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3912 (class 0 OID 196477)
-- Dependencies: 220
-- Data for Name: Contacts; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3978 (class 0 OID 197180)
-- Dependencies: 286
-- Data for Name: Files; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3980 (class 0 OID 197194)
-- Dependencies: 288
-- Data for Name: FilesOptions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3934 (class 0 OID 196717)
-- Dependencies: 242
-- Data for Name: Helps; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3970 (class 0 OID 197100)
-- Dependencies: 278
-- Data for Name: Invoices; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3915 (class 0 OID 196505)
-- Dependencies: 223
-- Data for Name: Messages; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3928 (class 0 OID 196660)
-- Dependencies: 236
-- Data for Name: Plans; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Plans" VALUES (1, 'Plano 1', 10, 10, 10, 30, '2024-08-26 14:23:02.883-05', '2024-08-26 14:23:02.883-05', true, true, true, true, true, true, true, true);


--
-- TOC entry 3982 (class 0 OID 197219)
-- Dependencies: 290
-- Data for Name: Prompts; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3976 (class 0 OID 197156)
-- Dependencies: 284
-- Data for Name: QueueIntegrations; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3940 (class 0 OID 196794)
-- Dependencies: 248
-- Data for Name: QueueOptions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3922 (class 0 OID 196586)
-- Dependencies: 230
-- Data for Name: Queues; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3932 (class 0 OID 196702)
-- Dependencies: 240
-- Data for Name: QuickMessages; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3942 (class 0 OID 196819)
-- Dependencies: 250
-- Data for Name: Schedules; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3908 (class 0 OID 196449)
-- Dependencies: 216
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."SequelizeMeta" VALUES ('20200717133431-add-uuid-ossp.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200717133438-create-users.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200717144403-create-contacts.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200717145643-create-tickets.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200717151645-create-messages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200717170223-create-whatsapps.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200723200315-create-contacts-custom-fields.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200723202116-add-email-field-to-contacts.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200730153237-remove-user-association-from-messages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200730153545-add-fromMe-to-messages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200813114236-change-ticket-lastMessage-column-type.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200901235509-add-profile-column-to-users.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200903215941-create-settings.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200904220257-add-name-to-whatsapp.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200906122228-add-name-default-field-to-whatsapp.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200906155658-add-whatsapp-field-to-tickets.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200919124112-update-default-column-name-on-whatsappp.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200927220708-add-isDeleted-column-to-messages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200929145451-add-user-tokenVersion-column.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200930162323-add-isGroup-column-to-tickets.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200930194808-add-isGroup-column-to-contacts.js');
INSERT INTO public."SequelizeMeta" VALUES ('20201004150008-add-contactId-column-to-messages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20201004155719-add-vcardContactId-column-to-messages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20201004955719-remove-vcardContactId-column-to-messages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20201026215410-add-retries-to-whatsapps.js');
INSERT INTO public."SequelizeMeta" VALUES ('20201028124427-add-quoted-msg-to-messages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210108001431-add-unreadMessages-to-tickets.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210108164404-create-queues.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210108164504-add-queueId-to-tickets.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210108174594-associate-whatsapp-queue.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210108204708-associate-users-queue.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192513-add-greetingMessage-to-whatsapp.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192514-create-companies-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192515-add-column-companyId-to-Settings-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192516-add-column-companyId-to-Users-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192517-add-column-companyId-to-Contacts-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192518-add-column-companyId-to-Messages-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192519-add-column-companyId-to-Queues-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192520-add-column-companyId-to-Whatsapps-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192521-add-column-companyId-to-Tickets-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192522-create-plans-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192523-add-column-planId-to-Companies.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192523-add-column-status-and-schedules-to-Companies.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192523-create-ticket-notes.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192524-create-quick-messages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192525-add-column-complationMessage-to-whatsapp.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192526-add-column-outOfHoursMessage-to-whatsapp .js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192527-add-column-super-to-Users-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192528-change-column-message-to-quick-messages-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192529-create-helps.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192530-add-unique-constraint-to-Contacts-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192531-create-TicketTracking-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192532-add-column-online-to-Users-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192533-create-UserRatings-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192534-add-rated-to-TicketTraking.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192535-add-column-ratingMessage-to-whatsapp.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210109192536-add-unique-constraint-to-Tickets-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210818102606-add-uuid-to-tickets.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210818102607-remove-unique-indexes-to-Queues-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210818102608-add-unique-indexes-to-Queues-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20210818102609-add-token-to-Whatsapps.js');
INSERT INTO public."SequelizeMeta" VALUES ('20211205164404-create-queue-options.js');
INSERT INTO public."SequelizeMeta" VALUES ('20211212125704-add-chatbot-to-tickets.js');
INSERT INTO public."SequelizeMeta" VALUES ('20211227010200-create-schedules.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220115114088-add-column-userId-to-QuickMessages-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220117130000-create-tags.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220117134400-associate-tickets-tags.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220122160900-add-status-to-schedules.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220220014719-add-farewellMessage-to-whatsapp.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220221014717-add-provider-whatsapp.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220221014718-add-remoteJid-messages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220221014719-add-jsonMessage-messages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220221014720-add-participant-messages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220221014721-create-baileys.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220315110000-create-ContactLists-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220315110001-create-ContactListItems-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220315110002-create-Campaigns-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220315110004-create-CampaignSettings-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220315110005-remove-constraint-to-Settings.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220321130000-create-CampaignShipping.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220404000000-add-column-queueId-to-Messages-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220406000000-add-column-dueDate-to-Companies.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220406000001-add-column-recurrence-to-Companies.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220411000000-add-column-startTime-and-endTime-to-Queues.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220411000001-remove-column-startTime-and-endTime-to-Queues.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220411000002-add-column-schedules-and-outOfHoursMessage-to-Queues.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220411000003-create-table-Announcements.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220425000000-create-table-Chats.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220425000001-create-table-ChatUsers.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220425000002-create-table-ChatMessages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220512000001-create-Indexes.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220512000002-create-subscriptions.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220512000003-create-invoices.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220723000001-add-mediaPath-to-quickmessages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20220723000002-add-mediaName-to-quickemessages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20221229000000-add-column-number-to-Whatsapps.js');
INSERT INTO public."SequelizeMeta" VALUES ('20222016014720-create-baileys-chats.js');
INSERT INTO public."SequelizeMeta" VALUES ('20222016014721-create-baileys-chats Messages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230106164900-add-useCampaigns-Plans.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230106164900-add-useExternalApi-Plans.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230106164900-add-useInternalChat-Plans.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230106164900-add-useSchedules-Plans.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230127091500-add-column-active-to-Contacts.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230303223001-add-amountUsedBotQueues-to-tickets.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230417203900-add-allTickets-user.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230603212335-create-QueueIntegrations.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230603212337-add-urlN8N-QueueIntegrations.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230623095932-add-whatsapp-to-user.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230623133903-add-chatbotAt-ticket-tracking.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230628134807-add-orderQueue-Queue.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230711094417-add-column-companyId-to-QueueIntegrations-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230711111701-add-sendIdQueue-to-whatsapp.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230714113901-create-Files.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230714113902-create-fileOptions.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230723301001-add-kanban-to-Tags.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230801081907-add-collumns-Ticket.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230805555699-add-useInternal-Plans.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230813114236-change-ticket-lastMessage-column-type.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230824082607-add-mediaType-FilesOptions.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230828143411-add-Integrations-to-tickets.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230828144000-create-prompts.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230828144100-add-column-promptid-into-whatsapps.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230831093000-add-useKanban-Plans.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230918122800-add-media-to-Queues.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230918142800-add-media-to-QueueOptions.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230922212337-add-integrationId-Queues.js');
INSERT INTO public."SequelizeMeta" VALUES ('20230924212337-add-fileListId-Campaigns.js');
INSERT INTO public."SequelizeMeta" VALUES ('20231111185822-add_reset_password_column.js');
INSERT INTO public."SequelizeMeta" VALUES ('20231117000001-add-mediaName-to-schedules.js');
INSERT INTO public."SequelizeMeta" VALUES ('20231117000001-add-mediaPath-to-schedules.js');
INSERT INTO public."SequelizeMeta" VALUES ('20231127113000-add-columns-Plans.js');
INSERT INTO public."SequelizeMeta" VALUES ('20231214143411-add-columns-to-whatsapps.js');
INSERT INTO public."SequelizeMeta" VALUES ('20231214143411-add-promptId-to-tickets.js');
INSERT INTO public."SequelizeMeta" VALUES ('20231218160937-add-columns-QueueIntegrations.js');
INSERT INTO public."SequelizeMeta" VALUES ('20231219153800-add-isEdited-column-to-messages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20231220192536-add-unique-constraint-to-tickets-table.js');
INSERT INTO public."SequelizeMeta" VALUES ('20231220223517-add-column-whatsappId-to-Contacts.js');
INSERT INTO public."SequelizeMeta" VALUES ('20232016014719-add-transferTime-and-queueIdTransfer.js');
INSERT INTO public."SequelizeMeta" VALUES ('20240723000002-add-geral-to-quickemessages.js');
INSERT INTO public."SequelizeMeta" VALUES ('20231128123537-add-typebot-QueueIntegrations.js');
INSERT INTO public."SequelizeMeta" VALUES ('20231202143411-add-typebotSessionId-to-tickets.js');
INSERT INTO public."SequelizeMeta" VALUES ('20231207080337-add-typebotDelayMessage-QueueIntegrations.js');
INSERT INTO public."SequelizeMeta" VALUES ('20231207085011-add-typebotStatus-to-tickets.js');
INSERT INTO public."SequelizeMeta" VALUES ('20231214092337-add-promptId-Queues.js');


--
-- TOC entry 3920 (class 0 OID 196550)
-- Dependencies: 228
-- Data for Name: Settings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Settings" VALUES ('chatBotType', 'text', '2024-08-26 14:23:02.955-05', '2024-08-26 14:23:02.955-05', 1, 1);
INSERT INTO public."Settings" VALUES ('sendGreetingAccepted', 'disabled', '2024-08-26 14:23:02.955-05', '2024-08-26 14:23:02.955-05', 1, 2);
INSERT INTO public."Settings" VALUES ('sendMsgTransfTicket', 'disabled', '2024-08-26 14:23:02.956-05', '2024-08-26 14:23:02.956-05', 1, 3);
INSERT INTO public."Settings" VALUES ('sendGreetingMessageOneQueues', 'disabled', '2024-08-26 14:23:02.956-05', '2024-08-26 14:23:02.956-05', 1, 4);
INSERT INTO public."Settings" VALUES ('userRating', 'disabled', '2024-08-26 14:23:02.956-05', '2024-08-26 14:23:02.956-05', 1, 5);
INSERT INTO public."Settings" VALUES ('scheduleType', 'queue', '2024-08-26 14:23:02.956-05', '2024-08-26 14:23:02.956-05', 1, 6);
INSERT INTO public."Settings" VALUES ('CheckMsgIsGroup', 'enabled', '2024-08-26 14:23:02.956-05', '2024-08-26 14:23:02.956-05', 1, 7);
INSERT INTO public."Settings" VALUES ('call', 'disabled', '2024-08-26 14:23:02.956-05', '2024-08-26 14:23:02.956-05', 1, 8);
INSERT INTO public."Settings" VALUES ('ipixc', '', '2024-08-26 14:23:02.956-05', '2024-08-26 14:23:02.956-05', 1, 9);
INSERT INTO public."Settings" VALUES ('tokenixc', '', '2024-08-26 14:23:02.956-05', '2024-08-26 14:23:02.956-05', 1, 10);
INSERT INTO public."Settings" VALUES ('ipmkauth', '', '2024-08-26 14:23:02.956-05', '2024-08-26 14:23:02.956-05', 1, 11);
INSERT INTO public."Settings" VALUES ('clientidmkauth', '', '2024-08-26 14:23:02.956-05', '2024-08-26 14:23:02.956-05', 1, 12);
INSERT INTO public."Settings" VALUES ('clientsecretmkauth', '', '2024-08-26 14:23:02.956-05', '2024-08-26 14:23:02.956-05', 1, 13);
INSERT INTO public."Settings" VALUES ('asaas', '', '2024-08-26 14:23:02.956-05', '2024-08-26 14:23:02.956-05', 1, 14);
INSERT INTO public."Settings" VALUES ('allTicket', 'disabled', '2024-08-26 14:23:02.965-05', '2024-08-26 14:23:02.965-05', NULL, 15);


--
-- TOC entry 3968 (class 0 OID 197085)
-- Dependencies: 276
-- Data for Name: Subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3944 (class 0 OID 196853)
-- Dependencies: 252
-- Data for Name: Tags; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3930 (class 0 OID 196680)
-- Dependencies: 238
-- Data for Name: TicketNotes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3945 (class 0 OID 196866)
-- Dependencies: 253
-- Data for Name: TicketTags; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3936 (class 0 OID 196728)
-- Dependencies: 244
-- Data for Name: TicketTraking; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3914 (class 0 OID 196486)
-- Dependencies: 222
-- Data for Name: Tickets; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3924 (class 0 OID 196608)
-- Dependencies: 232
-- Data for Name: UserQueues; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3938 (class 0 OID 196756)
-- Dependencies: 246
-- Data for Name: UserRatings; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3910 (class 0 OID 196466)
-- Dependencies: 218
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Users" VALUES (1, 'Admin', 'admin@admin.com', '$2a$08$ptmRaV.ODFha6UZTb4ogiu4Cxi6i2FqVal4HG9xnZ9Lg8Ysg4Vtru', '2024-08-26 14:23:02.947-05', '2024-08-26 15:42:00.04-05', 'admin', 0, 1, true, false, 'desabled', NULL, NULL);


--
-- TOC entry 3923 (class 0 OID 196603)
-- Dependencies: 231
-- Data for Name: WhatsappQueues; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3917 (class 0 OID 196525)
-- Dependencies: 225
-- Data for Name: Whatsapps; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4024 (class 0 OID 0)
-- Dependencies: 267
-- Name: Announcements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Announcements_id_seq"', 1, false);


--
-- TOC entry 4025 (class 0 OID 0)
-- Dependencies: 279
-- Name: BaileysChats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."BaileysChats_id_seq"', 1, false);


--
-- TOC entry 4026 (class 0 OID 0)
-- Dependencies: 281
-- Name: BaileysMessages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."BaileysMessages_id_seq"', 1, false);


--
-- TOC entry 4027 (class 0 OID 0)
-- Dependencies: 254
-- Name: Baileys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Baileys_id_seq"', 1, false);


--
-- TOC entry 4028 (class 0 OID 0)
-- Dependencies: 262
-- Name: CampaignSettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."CampaignSettings_id_seq"', 1, false);


--
-- TOC entry 4029 (class 0 OID 0)
-- Dependencies: 265
-- Name: CampaignShipping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."CampaignShipping_id_seq"', 1, false);


--
-- TOC entry 4030 (class 0 OID 0)
-- Dependencies: 260
-- Name: Campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Campaigns_id_seq"', 1, false);


--
-- TOC entry 4031 (class 0 OID 0)
-- Dependencies: 273
-- Name: ChatMessages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ChatMessages_id_seq"', 1, false);


--
-- TOC entry 4032 (class 0 OID 0)
-- Dependencies: 271
-- Name: ChatUsers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ChatUsers_id_seq"', 1, false);


--
-- TOC entry 4033 (class 0 OID 0)
-- Dependencies: 269
-- Name: Chats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Chats_id_seq"', 1, false);


--
-- TOC entry 4034 (class 0 OID 0)
-- Dependencies: 233
-- Name: Companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Companies_id_seq"', 1, true);


--
-- TOC entry 4035 (class 0 OID 0)
-- Dependencies: 226
-- Name: ContactCustomFields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ContactCustomFields_id_seq"', 1, false);


--
-- TOC entry 4036 (class 0 OID 0)
-- Dependencies: 258
-- Name: ContactListItems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ContactListItems_id_seq"', 1, false);


--
-- TOC entry 4037 (class 0 OID 0)
-- Dependencies: 256
-- Name: ContactLists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ContactLists_id_seq"', 1, false);


--
-- TOC entry 4038 (class 0 OID 0)
-- Dependencies: 219
-- Name: Contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Contacts_id_seq"', 1, false);


--
-- TOC entry 4039 (class 0 OID 0)
-- Dependencies: 287
-- Name: FilesOptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."FilesOptions_id_seq"', 1, false);


--
-- TOC entry 4040 (class 0 OID 0)
-- Dependencies: 285
-- Name: Files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Files_id_seq"', 1, false);


--
-- TOC entry 4041 (class 0 OID 0)
-- Dependencies: 241
-- Name: Helps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Helps_id_seq"', 1, false);


--
-- TOC entry 4042 (class 0 OID 0)
-- Dependencies: 277
-- Name: Invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Invoices_id_seq"', 1, false);


--
-- TOC entry 4043 (class 0 OID 0)
-- Dependencies: 235
-- Name: Plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Plans_id_seq"', 1, true);


--
-- TOC entry 4044 (class 0 OID 0)
-- Dependencies: 289
-- Name: Prompts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Prompts_id_seq"', 1, false);


--
-- TOC entry 4045 (class 0 OID 0)
-- Dependencies: 283
-- Name: QueueIntegrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."QueueIntegrations_id_seq"', 1, false);


--
-- TOC entry 4046 (class 0 OID 0)
-- Dependencies: 247
-- Name: QueueOptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."QueueOptions_id_seq"', 1, false);


--
-- TOC entry 4047 (class 0 OID 0)
-- Dependencies: 229
-- Name: Queues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Queues_id_seq"', 1, false);


--
-- TOC entry 4048 (class 0 OID 0)
-- Dependencies: 239
-- Name: QuickMessages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."QuickMessages_id_seq"', 1, false);


--
-- TOC entry 4049 (class 0 OID 0)
-- Dependencies: 249
-- Name: Schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Schedules_id_seq"', 1, false);


--
-- TOC entry 4050 (class 0 OID 0)
-- Dependencies: 264
-- Name: Settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Settings_id_seq"', 15, true);


--
-- TOC entry 4051 (class 0 OID 0)
-- Dependencies: 275
-- Name: Subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Subscriptions_id_seq"', 1, false);


--
-- TOC entry 4052 (class 0 OID 0)
-- Dependencies: 251
-- Name: Tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Tags_id_seq"', 1, false);


--
-- TOC entry 4053 (class 0 OID 0)
-- Dependencies: 237
-- Name: TicketNotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."TicketNotes_id_seq"', 1, false);


--
-- TOC entry 4054 (class 0 OID 0)
-- Dependencies: 243
-- Name: TicketTraking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."TicketTraking_id_seq"', 1, false);


--
-- TOC entry 4055 (class 0 OID 0)
-- Dependencies: 221
-- Name: Tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Tickets_id_seq"', 1, false);


--
-- TOC entry 4056 (class 0 OID 0)
-- Dependencies: 245
-- Name: UserRatings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."UserRatings_id_seq"', 1, false);


--
-- TOC entry 4057 (class 0 OID 0)
-- Dependencies: 217
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Users_id_seq"', 1, true);


--
-- TOC entry 4058 (class 0 OID 0)
-- Dependencies: 224
-- Name: Whatsapps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Whatsapps_id_seq"', 1, false);


--
-- TOC entry 3665 (class 2606 OID 197013)
-- Name: Announcements Announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Announcements"
    ADD CONSTRAINT "Announcements_pkey" PRIMARY KEY (id);


--
-- TOC entry 3677 (class 2606 OID 197124)
-- Name: BaileysChats BaileysChats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."BaileysChats"
    ADD CONSTRAINT "BaileysChats_pkey" PRIMARY KEY (id);


--
-- TOC entry 3679 (class 2606 OID 197138)
-- Name: BaileysMessages BaileysMessages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."BaileysMessages"
    ADD CONSTRAINT "BaileysMessages_pkey" PRIMARY KEY (id);


--
-- TOC entry 3651 (class 2606 OID 196888)
-- Name: Baileys Baileys_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Baileys"
    ADD CONSTRAINT "Baileys_pkey" PRIMARY KEY (id, "whatsappId");


--
-- TOC entry 3660 (class 2606 OID 196964)
-- Name: CampaignSettings CampaignSettings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."CampaignSettings"
    ADD CONSTRAINT "CampaignSettings_pkey" PRIMARY KEY (id);


--
-- TOC entry 3662 (class 2606 OID 196985)
-- Name: CampaignShipping CampaignShipping_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."CampaignShipping"
    ADD CONSTRAINT "CampaignShipping_pkey" PRIMARY KEY (id);


--
-- TOC entry 3658 (class 2606 OID 196940)
-- Name: Campaigns Campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Campaigns"
    ADD CONSTRAINT "Campaigns_pkey" PRIMARY KEY (id);


--
-- TOC entry 3671 (class 2606 OID 197067)
-- Name: ChatMessages ChatMessages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ChatMessages"
    ADD CONSTRAINT "ChatMessages_pkey" PRIMARY KEY (id);


--
-- TOC entry 3669 (class 2606 OID 197047)
-- Name: ChatUsers ChatUsers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ChatUsers"
    ADD CONSTRAINT "ChatUsers_pkey" PRIMARY KEY (id);


--
-- TOC entry 3667 (class 2606 OID 197029)
-- Name: Chats Chats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Chats"
    ADD CONSTRAINT "Chats_pkey" PRIMARY KEY (id);


--
-- TOC entry 3625 (class 2606 OID 196623)
-- Name: Companies Companies_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Companies"
    ADD CONSTRAINT "Companies_name_key" UNIQUE (name);


--
-- TOC entry 3627 (class 2606 OID 196621)
-- Name: Companies Companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Companies"
    ADD CONSTRAINT "Companies_pkey" PRIMARY KEY (id);


--
-- TOC entry 3613 (class 2606 OID 196541)
-- Name: ContactCustomFields ContactCustomFields_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ContactCustomFields"
    ADD CONSTRAINT "ContactCustomFields_pkey" PRIMARY KEY (id);


--
-- TOC entry 3655 (class 2606 OID 196910)
-- Name: ContactListItems ContactListItems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ContactListItems"
    ADD CONSTRAINT "ContactListItems_pkey" PRIMARY KEY (id);


--
-- TOC entry 3653 (class 2606 OID 196895)
-- Name: ContactLists ContactLists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ContactLists"
    ADD CONSTRAINT "ContactLists_pkey" PRIMARY KEY (id);


--
-- TOC entry 3597 (class 2606 OID 196484)
-- Name: Contacts Contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Contacts"
    ADD CONSTRAINT "Contacts_pkey" PRIMARY KEY (id);


--
-- TOC entry 3689 (class 2606 OID 197201)
-- Name: FilesOptions FilesOptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."FilesOptions"
    ADD CONSTRAINT "FilesOptions_pkey" PRIMARY KEY (id);


--
-- TOC entry 3687 (class 2606 OID 197187)
-- Name: Files Files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Files"
    ADD CONSTRAINT "Files_pkey" PRIMARY KEY (id);


--
-- TOC entry 3637 (class 2606 OID 196724)
-- Name: Helps Helps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Helps"
    ADD CONSTRAINT "Helps_pkey" PRIMARY KEY (id);


--
-- TOC entry 3675 (class 2606 OID 197107)
-- Name: Invoices Invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Invoices"
    ADD CONSTRAINT "Invoices_pkey" PRIMARY KEY (id);


--
-- TOC entry 3606 (class 2606 OID 196513)
-- Name: Messages Messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Messages"
    ADD CONSTRAINT "Messages_pkey" PRIMARY KEY (id);


--
-- TOC entry 3629 (class 2606 OID 196671)
-- Name: Plans Plans_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Plans"
    ADD CONSTRAINT "Plans_name_key" UNIQUE (name);


--
-- TOC entry 3631 (class 2606 OID 196669)
-- Name: Plans Plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Plans"
    ADD CONSTRAINT "Plans_pkey" PRIMARY KEY (id);


--
-- TOC entry 3691 (class 2606 OID 197232)
-- Name: Prompts Prompts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Prompts"
    ADD CONSTRAINT "Prompts_pkey" PRIMARY KEY (id);


--
-- TOC entry 3681 (class 2606 OID 197165)
-- Name: QueueIntegrations QueueIntegrations_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."QueueIntegrations"
    ADD CONSTRAINT "QueueIntegrations_name_key" UNIQUE (name);


--
-- TOC entry 3683 (class 2606 OID 197163)
-- Name: QueueIntegrations QueueIntegrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."QueueIntegrations"
    ADD CONSTRAINT "QueueIntegrations_pkey" PRIMARY KEY (id);


--
-- TOC entry 3685 (class 2606 OID 197167)
-- Name: QueueIntegrations QueueIntegrations_projectName_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."QueueIntegrations"
    ADD CONSTRAINT "QueueIntegrations_projectName_key" UNIQUE ("projectName");


--
-- TOC entry 3643 (class 2606 OID 196801)
-- Name: QueueOptions QueueOptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."QueueOptions"
    ADD CONSTRAINT "QueueOptions_pkey" PRIMARY KEY (id);


--
-- TOC entry 3615 (class 2606 OID 196790)
-- Name: Queues Queues_color_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Queues"
    ADD CONSTRAINT "Queues_color_key" UNIQUE (color, "companyId");


--
-- TOC entry 3617 (class 2606 OID 196792)
-- Name: Queues Queues_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Queues"
    ADD CONSTRAINT "Queues_name_key" UNIQUE (name, "companyId");


--
-- TOC entry 3619 (class 2606 OID 196593)
-- Name: Queues Queues_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Queues"
    ADD CONSTRAINT "Queues_pkey" PRIMARY KEY (id);


--
-- TOC entry 3635 (class 2606 OID 196709)
-- Name: QuickMessages QuickMessages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."QuickMessages"
    ADD CONSTRAINT "QuickMessages_pkey" PRIMARY KEY (id);


--
-- TOC entry 3645 (class 2606 OID 196826)
-- Name: Schedules Schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Schedules"
    ADD CONSTRAINT "Schedules_pkey" PRIMARY KEY (id);


--
-- TOC entry 3591 (class 2606 OID 196453)
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- TOC entry 3673 (class 2606 OID 197093)
-- Name: Subscriptions Subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subscriptions"
    ADD CONSTRAINT "Subscriptions_pkey" PRIMARY KEY (id);


--
-- TOC entry 3648 (class 2606 OID 196860)
-- Name: Tags Tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tags"
    ADD CONSTRAINT "Tags_pkey" PRIMARY KEY (id);


--
-- TOC entry 3633 (class 2606 OID 196685)
-- Name: TicketNotes TicketNotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TicketNotes"
    ADD CONSTRAINT "TicketNotes_pkey" PRIMARY KEY (id);


--
-- TOC entry 3639 (class 2606 OID 196733)
-- Name: TicketTraking TicketTraking_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TicketTraking"
    ADD CONSTRAINT "TicketTraking_pkey" PRIMARY KEY (id);


--
-- TOC entry 3602 (class 2606 OID 196494)
-- Name: Tickets Tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tickets"
    ADD CONSTRAINT "Tickets_pkey" PRIMARY KEY (id);


--
-- TOC entry 3623 (class 2606 OID 196612)
-- Name: UserQueues UserQueues_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UserQueues"
    ADD CONSTRAINT "UserQueues_pkey" PRIMARY KEY ("userId", "queueId");


--
-- TOC entry 3641 (class 2606 OID 196762)
-- Name: UserRatings UserRatings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UserRatings"
    ADD CONSTRAINT "UserRatings_pkey" PRIMARY KEY (id);


--
-- TOC entry 3593 (class 2606 OID 196475)
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- TOC entry 3595 (class 2606 OID 196473)
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- TOC entry 3621 (class 2606 OID 196607)
-- Name: WhatsappQueues WhatsappQueues_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WhatsappQueues"
    ADD CONSTRAINT "WhatsappQueues_pkey" PRIMARY KEY ("whatsappId", "queueId");


--
-- TOC entry 3609 (class 2606 OID 196558)
-- Name: Whatsapps Whatsapps_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Whatsapps"
    ADD CONSTRAINT "Whatsapps_name_key" UNIQUE (name);


--
-- TOC entry 3611 (class 2606 OID 196532)
-- Name: Whatsapps Whatsapps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Whatsapps"
    ADD CONSTRAINT "Whatsapps_pkey" PRIMARY KEY (id);


--
-- TOC entry 3604 (class 2606 OID 197293)
-- Name: Tickets contactid_companyid_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tickets"
    ADD CONSTRAINT contactid_companyid_unique UNIQUE ("contactId", "companyId", "whatsappId");


--
-- TOC entry 3600 (class 2606 OID 196726)
-- Name: Contacts number_companyid_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Contacts"
    ADD CONSTRAINT number_companyid_unique UNIQUE (number, "companyId");


--
-- TOC entry 3598 (class 1259 OID 197079)
-- Name: idx_cont_company_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cont_company_id ON public."Contacts" USING btree ("companyId");


--
-- TOC entry 3663 (class 1259 OID 197082)
-- Name: idx_cpsh_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cpsh_campaign_id ON public."CampaignShipping" USING btree ("campaignId");


--
-- TOC entry 3656 (class 1259 OID 197083)
-- Name: idx_ctli_contact_list_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ctli_contact_list_id ON public."ContactListItems" USING btree ("contactListId");


--
-- TOC entry 3607 (class 1259 OID 197081)
-- Name: idx_ms_company_id_ticket_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ms_company_id_ticket_id ON public."Messages" USING btree ("companyId", "ticketId");


--
-- TOC entry 3646 (class 1259 OID 197078)
-- Name: idx_sched_company_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_sched_company_id ON public."Schedules" USING btree ("companyId");


--
-- TOC entry 3649 (class 1259 OID 197080)
-- Name: idx_tg_company_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tg_company_id ON public."Tags" USING btree ("companyId");


--
-- TOC entry 3748 (class 2606 OID 197014)
-- Name: Announcements Announcements_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Announcements"
    ADD CONSTRAINT "Announcements_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3757 (class 2606 OID 197125)
-- Name: BaileysChats BaileysChats_whatsappId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."BaileysChats"
    ADD CONSTRAINT "BaileysChats_whatsappId_fkey" FOREIGN KEY ("whatsappId") REFERENCES public."Whatsapps"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3758 (class 2606 OID 197144)
-- Name: BaileysMessages BaileysMessages_baileysChatId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."BaileysMessages"
    ADD CONSTRAINT "BaileysMessages_baileysChatId_fkey" FOREIGN KEY ("baileysChatId") REFERENCES public."BaileysChats"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3759 (class 2606 OID 197139)
-- Name: BaileysMessages BaileysMessages_whatsappId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."BaileysMessages"
    ADD CONSTRAINT "BaileysMessages_whatsappId_fkey" FOREIGN KEY ("whatsappId") REFERENCES public."Whatsapps"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3745 (class 2606 OID 196965)
-- Name: CampaignSettings CampaignSettings_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."CampaignSettings"
    ADD CONSTRAINT "CampaignSettings_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3746 (class 2606 OID 196991)
-- Name: CampaignShipping CampaignShipping_campaignId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."CampaignShipping"
    ADD CONSTRAINT "CampaignShipping_campaignId_fkey" FOREIGN KEY ("campaignId") REFERENCES public."Campaigns"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3747 (class 2606 OID 196986)
-- Name: CampaignShipping CampaignShipping_contactId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."CampaignShipping"
    ADD CONSTRAINT "CampaignShipping_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES public."ContactListItems"(id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- TOC entry 3741 (class 2606 OID 196941)
-- Name: Campaigns Campaigns_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Campaigns"
    ADD CONSTRAINT "Campaigns_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3742 (class 2606 OID 196946)
-- Name: Campaigns Campaigns_contactListId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Campaigns"
    ADD CONSTRAINT "Campaigns_contactListId_fkey" FOREIGN KEY ("contactListId") REFERENCES public."ContactLists"(id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- TOC entry 3743 (class 2606 OID 197263)
-- Name: Campaigns Campaigns_fileListId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Campaigns"
    ADD CONSTRAINT "Campaigns_fileListId_fkey" FOREIGN KEY ("fileListId") REFERENCES public."Files"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3744 (class 2606 OID 196951)
-- Name: Campaigns Campaigns_whatsappId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Campaigns"
    ADD CONSTRAINT "Campaigns_whatsappId_fkey" FOREIGN KEY ("whatsappId") REFERENCES public."Whatsapps"(id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- TOC entry 3753 (class 2606 OID 197068)
-- Name: ChatMessages ChatMessages_chatId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ChatMessages"
    ADD CONSTRAINT "ChatMessages_chatId_fkey" FOREIGN KEY ("chatId") REFERENCES public."Chats"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3754 (class 2606 OID 197073)
-- Name: ChatMessages ChatMessages_senderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ChatMessages"
    ADD CONSTRAINT "ChatMessages_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3751 (class 2606 OID 197048)
-- Name: ChatUsers ChatUsers_chatId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ChatUsers"
    ADD CONSTRAINT "ChatUsers_chatId_fkey" FOREIGN KEY ("chatId") REFERENCES public."Chats"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3752 (class 2606 OID 197053)
-- Name: ChatUsers ChatUsers_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ChatUsers"
    ADD CONSTRAINT "ChatUsers_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3749 (class 2606 OID 197035)
-- Name: Chats Chats_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Chats"
    ADD CONSTRAINT "Chats_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3750 (class 2606 OID 197030)
-- Name: Chats Chats_ownerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Chats"
    ADD CONSTRAINT "Chats_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3716 (class 2606 OID 196672)
-- Name: Companies Companies_planId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Companies"
    ADD CONSTRAINT "Companies_planId_fkey" FOREIGN KEY ("planId") REFERENCES public."Plans"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3711 (class 2606 OID 196542)
-- Name: ContactCustomFields ContactCustomFields_contactId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ContactCustomFields"
    ADD CONSTRAINT "ContactCustomFields_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES public."Contacts"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3739 (class 2606 OID 196916)
-- Name: ContactListItems ContactListItems_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ContactListItems"
    ADD CONSTRAINT "ContactListItems_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3740 (class 2606 OID 196911)
-- Name: ContactListItems ContactListItems_contactListId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ContactListItems"
    ADD CONSTRAINT "ContactListItems_contactListId_fkey" FOREIGN KEY ("contactListId") REFERENCES public."ContactLists"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3738 (class 2606 OID 196896)
-- Name: ContactLists ContactLists_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ContactLists"
    ADD CONSTRAINT "ContactLists_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3694 (class 2606 OID 196634)
-- Name: Contacts Contacts_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Contacts"
    ADD CONSTRAINT "Contacts_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3695 (class 2606 OID 197294)
-- Name: Contacts Contacts_whatsappId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Contacts"
    ADD CONSTRAINT "Contacts_whatsappId_fkey" FOREIGN KEY ("whatsappId") REFERENCES public."Whatsapps"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3762 (class 2606 OID 197202)
-- Name: FilesOptions FilesOptions_fileId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."FilesOptions"
    ADD CONSTRAINT "FilesOptions_fileId_fkey" FOREIGN KEY ("fileId") REFERENCES public."Files"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3761 (class 2606 OID 197188)
-- Name: Files Files_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Files"
    ADD CONSTRAINT "Files_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3756 (class 2606 OID 197108)
-- Name: Invoices Invoices_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Invoices"
    ADD CONSTRAINT "Invoices_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3703 (class 2606 OID 196639)
-- Name: Messages Messages_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Messages"
    ADD CONSTRAINT "Messages_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3704 (class 2606 OID 196569)
-- Name: Messages Messages_contactId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Messages"
    ADD CONSTRAINT "Messages_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES public."Contacts"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3705 (class 2606 OID 196996)
-- Name: Messages Messages_queueId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Messages"
    ADD CONSTRAINT "Messages_queueId_fkey" FOREIGN KEY ("queueId") REFERENCES public."Queues"(id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- TOC entry 3706 (class 2606 OID 196580)
-- Name: Messages Messages_quotedMsgId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Messages"
    ADD CONSTRAINT "Messages_quotedMsgId_fkey" FOREIGN KEY ("quotedMsgId") REFERENCES public."Messages"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3707 (class 2606 OID 196519)
-- Name: Messages Messages_ticketId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Messages"
    ADD CONSTRAINT "Messages_ticketId_fkey" FOREIGN KEY ("ticketId") REFERENCES public."Tickets"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3763 (class 2606 OID 197238)
-- Name: Prompts Prompts_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Prompts"
    ADD CONSTRAINT "Prompts_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id);


--
-- TOC entry 3764 (class 2606 OID 197233)
-- Name: Prompts Prompts_queueId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Prompts"
    ADD CONSTRAINT "Prompts_queueId_fkey" FOREIGN KEY ("queueId") REFERENCES public."Queues"(id);


--
-- TOC entry 3760 (class 2606 OID 197174)
-- Name: QueueIntegrations QueueIntegrations_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."QueueIntegrations"
    ADD CONSTRAINT "QueueIntegrations_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3729 (class 2606 OID 196807)
-- Name: QueueOptions QueueOptions_parentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."QueueOptions"
    ADD CONSTRAINT "QueueOptions_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES public."QueueOptions"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3730 (class 2606 OID 196802)
-- Name: QueueOptions QueueOptions_queueId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."QueueOptions"
    ADD CONSTRAINT "QueueOptions_queueId_fkey" FOREIGN KEY ("queueId") REFERENCES public."Queues"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3713 (class 2606 OID 196644)
-- Name: Queues Queues_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Queues"
    ADD CONSTRAINT "Queues_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3714 (class 2606 OID 197253)
-- Name: Queues Queues_integrationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Queues"
    ADD CONSTRAINT "Queues_integrationId_fkey" FOREIGN KEY ("integrationId") REFERENCES public."QueueIntegrations"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3715 (class 2606 OID 197279)
-- Name: Queues Queues_promptId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Queues"
    ADD CONSTRAINT "Queues_promptId_fkey" FOREIGN KEY ("promptId") REFERENCES public."Prompts"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3720 (class 2606 OID 196710)
-- Name: QuickMessages QuickMessages_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."QuickMessages"
    ADD CONSTRAINT "QuickMessages_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3721 (class 2606 OID 196847)
-- Name: QuickMessages QuickMessages_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."QuickMessages"
    ADD CONSTRAINT "QuickMessages_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3731 (class 2606 OID 196842)
-- Name: Schedules Schedules_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Schedules"
    ADD CONSTRAINT "Schedules_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3732 (class 2606 OID 196827)
-- Name: Schedules Schedules_contactId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Schedules"
    ADD CONSTRAINT "Schedules_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES public."Contacts"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3733 (class 2606 OID 196832)
-- Name: Schedules Schedules_ticketId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Schedules"
    ADD CONSTRAINT "Schedules_ticketId_fkey" FOREIGN KEY ("ticketId") REFERENCES public."Tickets"(id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- TOC entry 3734 (class 2606 OID 196837)
-- Name: Schedules Schedules_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Schedules"
    ADD CONSTRAINT "Schedules_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- TOC entry 3712 (class 2606 OID 196624)
-- Name: Settings Settings_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Settings"
    ADD CONSTRAINT "Settings_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3755 (class 2606 OID 197094)
-- Name: Subscriptions Subscriptions_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subscriptions"
    ADD CONSTRAINT "Subscriptions_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3735 (class 2606 OID 196861)
-- Name: Tags Tags_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tags"
    ADD CONSTRAINT "Tags_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3717 (class 2606 OID 196691)
-- Name: TicketNotes TicketNotes_contactId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TicketNotes"
    ADD CONSTRAINT "TicketNotes_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES public."Contacts"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3718 (class 2606 OID 196696)
-- Name: TicketNotes TicketNotes_ticketId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TicketNotes"
    ADD CONSTRAINT "TicketNotes_ticketId_fkey" FOREIGN KEY ("ticketId") REFERENCES public."Tickets"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3719 (class 2606 OID 196686)
-- Name: TicketNotes TicketNotes_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TicketNotes"
    ADD CONSTRAINT "TicketNotes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3736 (class 2606 OID 196874)
-- Name: TicketTags TicketTags_tagId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TicketTags"
    ADD CONSTRAINT "TicketTags_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES public."Tags"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3737 (class 2606 OID 196869)
-- Name: TicketTags TicketTags_ticketId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TicketTags"
    ADD CONSTRAINT "TicketTags_ticketId_fkey" FOREIGN KEY ("ticketId") REFERENCES public."Tickets"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3722 (class 2606 OID 196739)
-- Name: TicketTraking TicketTraking_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TicketTraking"
    ADD CONSTRAINT "TicketTraking_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON DELETE SET NULL;


--
-- TOC entry 3723 (class 2606 OID 196734)
-- Name: TicketTraking TicketTraking_ticketId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TicketTraking"
    ADD CONSTRAINT "TicketTraking_ticketId_fkey" FOREIGN KEY ("ticketId") REFERENCES public."Tickets"(id) ON DELETE SET NULL;


--
-- TOC entry 3724 (class 2606 OID 196749)
-- Name: TicketTraking TicketTraking_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TicketTraking"
    ADD CONSTRAINT "TicketTraking_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON DELETE SET NULL;


--
-- TOC entry 3725 (class 2606 OID 196744)
-- Name: TicketTraking TicketTraking_whatsappId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TicketTraking"
    ADD CONSTRAINT "TicketTraking_whatsappId_fkey" FOREIGN KEY ("whatsappId") REFERENCES public."Whatsapps"(id) ON DELETE SET NULL;


--
-- TOC entry 3696 (class 2606 OID 196654)
-- Name: Tickets Tickets_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tickets"
    ADD CONSTRAINT "Tickets_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3697 (class 2606 OID 196495)
-- Name: Tickets Tickets_contactId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tickets"
    ADD CONSTRAINT "Tickets_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES public."Contacts"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3698 (class 2606 OID 197213)
-- Name: Tickets Tickets_integrationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tickets"
    ADD CONSTRAINT "Tickets_integrationId_fkey" FOREIGN KEY ("integrationId") REFERENCES public."QueueIntegrations"(id);


--
-- TOC entry 3699 (class 2606 OID 196598)
-- Name: Tickets Tickets_queueId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tickets"
    ADD CONSTRAINT "Tickets_queueId_fkey" FOREIGN KEY ("queueId") REFERENCES public."Queues"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3700 (class 2606 OID 196813)
-- Name: Tickets Tickets_queueOptionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tickets"
    ADD CONSTRAINT "Tickets_queueOptionId_fkey" FOREIGN KEY ("queueOptionId") REFERENCES public."QueueOptions"(id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- TOC entry 3701 (class 2606 OID 196500)
-- Name: Tickets Tickets_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tickets"
    ADD CONSTRAINT "Tickets_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3702 (class 2606 OID 196560)
-- Name: Tickets Tickets_whatsappId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tickets"
    ADD CONSTRAINT "Tickets_whatsappId_fkey" FOREIGN KEY ("whatsappId") REFERENCES public."Whatsapps"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3726 (class 2606 OID 196768)
-- Name: UserRatings UserRatings_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UserRatings"
    ADD CONSTRAINT "UserRatings_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON DELETE SET NULL;


--
-- TOC entry 3727 (class 2606 OID 196763)
-- Name: UserRatings UserRatings_ticketId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UserRatings"
    ADD CONSTRAINT "UserRatings_ticketId_fkey" FOREIGN KEY ("ticketId") REFERENCES public."Tickets"(id) ON DELETE SET NULL;


--
-- TOC entry 3728 (class 2606 OID 196773)
-- Name: UserRatings UserRatings_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UserRatings"
    ADD CONSTRAINT "UserRatings_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON DELETE SET NULL;


--
-- TOC entry 3692 (class 2606 OID 196629)
-- Name: Users Users_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3693 (class 2606 OID 197169)
-- Name: Users Users_whatsappId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_whatsappId_fkey" FOREIGN KEY ("whatsappId") REFERENCES public."Whatsapps"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3708 (class 2606 OID 196649)
-- Name: Whatsapps Whatsapps_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Whatsapps"
    ADD CONSTRAINT "Whatsapps_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3709 (class 2606 OID 197258)
-- Name: Whatsapps Whatsapps_integrationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Whatsapps"
    ADD CONSTRAINT "Whatsapps_integrationId_fkey" FOREIGN KEY ("integrationId") REFERENCES public."QueueIntegrations"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3710 (class 2606 OID 197243)
-- Name: Whatsapps Whatsapps_promptId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Whatsapps"
    ADD CONSTRAINT "Whatsapps_promptId_fkey" FOREIGN KEY ("promptId") REFERENCES public."Prompts"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2024-08-26 16:04:06 EST

--
-- PostgreSQL database dump complete
--

