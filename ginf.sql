--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2018-12-20 14:41:16 BRST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2181 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 33298)
-- Name: adm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE adm (
    nm_nome_real character varying(60),
    cd_email_adm integer,
    cd_senha_adm integer,
    cd_nickname_adm integer NOT NULL,
    ds_comentario_adm character varying(3000)
);


ALTER TABLE adm OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 33304)
-- Name: comentario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comentario (
    ds_comentario_adm text,
    ds_comentario_usuario text,
    nm_comentarista integer NOT NULL
);


ALTER TABLE comentario OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 33310)
-- Name: forum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE forum (
    nm_publicacao character varying(1000) NOT NULL,
    cd_publicador_discucao integer
);


ALTER TABLE forum OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 33355)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 33316)
-- Name: noticia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE noticia (
    ds_noticia text NOT NULL,
    nm_titulo_noticia character varying(80),
    cd_publicador integer NOT NULL
);


ALTER TABLE noticia OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 33322)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    cd_nickname_usuario integer NOT NULL,
    nickname character varying(50),
    cod_usuario numeric(1000,2),
    email character varying(100),
    senha character varying(100)
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 2168 (class 0 OID 33298)
-- Dependencies: 181
-- Data for Name: adm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY adm (nm_nome_real, cd_email_adm, cd_senha_adm, cd_nickname_adm, ds_comentario_adm) FROM stdin;
\.


--
-- TOC entry 2169 (class 0 OID 33304)
-- Dependencies: 182
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comentario (ds_comentario_adm, ds_comentario_usuario, nm_comentarista) FROM stdin;
\.


--
-- TOC entry 2170 (class 0 OID 33310)
-- Dependencies: 183
-- Data for Name: forum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY forum (nm_publicacao, cd_publicador_discucao) FROM stdin;
\.


--
-- TOC entry 2182 (class 0 OID 0)
-- Dependencies: 186
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 1, false);


--
-- TOC entry 2171 (class 0 OID 33316)
-- Dependencies: 184
-- Data for Name: noticia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY noticia (ds_noticia, nm_titulo_noticia, cd_publicador) FROM stdin;
\.


--
-- TOC entry 2172 (class 0 OID 33322)
-- Dependencies: 185
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (cd_nickname_usuario, nickname, cod_usuario, email, senha) FROM stdin;
\.


--
-- TOC entry 2043 (class 2606 OID 33329)
-- Name: pk_comentarista; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT pk_comentarista PRIMARY KEY (nm_comentarista);


--
-- TOC entry 2041 (class 2606 OID 33331)
-- Name: pk_nickname_adm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adm
    ADD CONSTRAINT pk_nickname_adm PRIMARY KEY (cd_nickname_adm);


--
-- TOC entry 2050 (class 2606 OID 33333)
-- Name: pk_nickname_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_nickname_usuario PRIMARY KEY (cd_nickname_usuario);


--
-- TOC entry 2046 (class 2606 OID 33335)
-- Name: pk_publicacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY forum
    ADD CONSTRAINT pk_publicacao PRIMARY KEY (nm_publicacao);


--
-- TOC entry 2048 (class 2606 OID 33337)
-- Name: pk_publicador_noticia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY noticia
    ADD CONSTRAINT pk_publicador_noticia PRIMARY KEY (cd_publicador);


--
-- TOC entry 2044 (class 1259 OID 33338)
-- Name: fki_pk_nick_adm_cometarista; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_pk_nick_adm_cometarista ON forum USING btree (cd_publicador_discucao);


--
-- TOC entry 2053 (class 2606 OID 33339)
-- Name: fk_publicador_noticia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY noticia
    ADD CONSTRAINT fk_publicador_noticia FOREIGN KEY (cd_publicador) REFERENCES adm(cd_nickname_adm);


--
-- TOC entry 2051 (class 2606 OID 33344)
-- Name: pk_nick_adm_cometarista; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY forum
    ADD CONSTRAINT pk_nick_adm_cometarista FOREIGN KEY (cd_publicador_discucao) REFERENCES adm(cd_nickname_adm);


--
-- TOC entry 2052 (class 2606 OID 33349)
-- Name: pk_nick_usuario_publicacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY forum
    ADD CONSTRAINT pk_nick_usuario_publicacao FOREIGN KEY (cd_publicador_discucao) REFERENCES usuario(cd_nickname_usuario);


--
-- TOC entry 2180 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-12-20 14:41:16 BRST

--
-- PostgreSQL database dump complete
--

