--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 10.10

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cliente_comunic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente_comunic (
    nome_cliente character varying(50) NOT NULL,
    email_cliente character varying(50) NOT NULL,
    telefone_cliente character varying(20) NOT NULL,
    assunto character varying(50) NOT NULL,
    mensagem character varying(500) NOT NULL
);


ALTER TABLE public.cliente_comunic OWNER TO postgres;

--
-- Name: fav_cnpj; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fav_cnpj (
    cnpj_do_usuario character varying(50) NOT NULL,
    nome_produto character varying(50) NOT NULL,
    codigo_produto integer NOT NULL
);


ALTER TABLE public.fav_cnpj OWNER TO postgres;

--
-- Name: fav_cpf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fav_cpf (
    cpf_do_usuario character varying(20) NOT NULL,
    nome_produto character varying(50) NOT NULL,
    codigo_produto integer NOT NULL
);


ALTER TABLE public.fav_cpf OWNER TO postgres;

--
-- Name: pedido_cnpj; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido_cnpj (
    num_geral_pedido integer NOT NULL,
    cnpj_cliente character varying(50) NOT NULL,
    status_pedido character varying(100) NOT NULL,
    inf_extras character varying(100)
);


ALTER TABLE public.pedido_cnpj OWNER TO postgres;

--
-- Name: pedido_cpf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido_cpf (
    num_geral_pedido integer NOT NULL,
    cpf_cliente character varying(20) NOT NULL,
    status_pedido character varying(100) NOT NULL,
    inf_extras character varying(100)
);


ALTER TABLE public.pedido_cpf OWNER TO postgres;

--
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produto (
    codigo_produto integer NOT NULL,
    valor_produto real NOT NULL,
    codigo_tipo_prod integer NOT NULL,
    nome_produto character varying(50) NOT NULL
);


ALTER TABLE public.produto OWNER TO postgres;

--
-- Name: produtos_pedidos_cnpj; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos_pedidos_cnpj (
    ident integer NOT NULL,
    cnpj_cliente character varying(50) NOT NULL,
    numero_produto integer NOT NULL
);


ALTER TABLE public.produtos_pedidos_cnpj OWNER TO postgres;

--
-- Name: produtos_pedidos_cpf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos_pedidos_cpf (
    ident integer NOT NULL,
    cpf_cliente character varying(20) NOT NULL,
    numero_produto integer NOT NULL
);


ALTER TABLE public.produtos_pedidos_cpf OWNER TO postgres;

--
-- Name: tamanhogfem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tamanhogfem (
    codigo_tipo_prod integer NOT NULL,
    letra_tam character varying(1) NOT NULL,
    torax character varying(30) NOT NULL,
    quadril character varying(30) NOT NULL,
    cintura character varying(30) NOT NULL
);


ALTER TABLE public.tamanhogfem OWNER TO postgres;

--
-- Name: tamanhoggfem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tamanhoggfem (
    codigo_tipo_prod integer NOT NULL,
    letra_tam character varying(2) NOT NULL,
    torax character varying(30) NOT NULL,
    quadril character varying(30) NOT NULL,
    cintura character varying(30) NOT NULL
);


ALTER TABLE public.tamanhoggfem OWNER TO postgres;

--
-- Name: tamanhoggmasc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tamanhoggmasc (
    codigo_tipo_prod integer NOT NULL,
    letra_tam character varying(2) NOT NULL,
    torax character varying(30) NOT NULL,
    quadril character varying(30) NOT NULL,
    cintura character varying(30) NOT NULL
);


ALTER TABLE public.tamanhoggmasc OWNER TO postgres;

--
-- Name: tamanhogmasc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tamanhogmasc (
    codigo_tipo_prod integer NOT NULL,
    letra_tam character varying(1) NOT NULL,
    torax character varying(30) NOT NULL,
    quadril character varying(30) NOT NULL,
    cintura character varying(30) NOT NULL
);


ALTER TABLE public.tamanhogmasc OWNER TO postgres;

--
-- Name: tamanhomfem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tamanhomfem (
    codigo_tipo_prod integer NOT NULL,
    letra_tam character varying(1) NOT NULL,
    torax character varying(30) NOT NULL,
    quadril character varying(30) NOT NULL,
    cintura character varying(30) NOT NULL
);


ALTER TABLE public.tamanhomfem OWNER TO postgres;

--
-- Name: tamanhommasc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tamanhommasc (
    codigo_tipo_prod integer NOT NULL,
    letra_tam character varying(1) NOT NULL,
    torax character varying(30) NOT NULL,
    quadril character varying(30) NOT NULL,
    cintura character varying(30) NOT NULL
);


ALTER TABLE public.tamanhommasc OWNER TO postgres;

--
-- Name: tamanhopfem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tamanhopfem (
    codigo_tipo_prod integer NOT NULL,
    letra_tam character varying(1) NOT NULL,
    torax character varying(20) NOT NULL,
    quadril character varying(20) NOT NULL,
    cintura character varying(20) NOT NULL
);


ALTER TABLE public.tamanhopfem OWNER TO postgres;

--
-- Name: tamanhopmasc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tamanhopmasc (
    codigo_tipo_prod integer NOT NULL,
    letra_tam character varying(1) NOT NULL,
    torax character varying(20) NOT NULL,
    quadril character varying(20) NOT NULL,
    cintura character varying(20) NOT NULL
);


ALTER TABLE public.tamanhopmasc OWNER TO postgres;

--
-- Name: tipoprod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipoprod (
    codigo_tipo_prod integer NOT NULL,
    estilo_nome character varying(20) NOT NULL
);


ALTER TABLE public.tipoprod OWNER TO postgres;

--
-- Name: usuario_cad_cnpj; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_cad_cnpj (
    cnpj character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    razao_social character varying(50) NOT NULL,
    inscricao_estadual character varying(40) NOT NULL,
    num_telefone_principal character varying(20) NOT NULL,
    num_telefone_secundario character varying(20) NOT NULL,
    senha_usuario_cnpj character varying(50) NOT NULL,
    endereco character varying(100) NOT NULL,
    num_endereco integer NOT NULL,
    bairro character varying(50) NOT NULL,
    cep character varying(50) NOT NULL,
    cidade character varying(50) NOT NULL,
    uf character varying(2) NOT NULL
);


ALTER TABLE public.usuario_cad_cnpj OWNER TO postgres;

--
-- Name: usuario_cad_cpf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_cad_cpf (
    cpf character varying(20) NOT NULL,
    email character varying(50) NOT NULL,
    nome_completo character varying(100) NOT NULL,
    data_nasc character varying(30) NOT NULL,
    genero character varying(15) NOT NULL,
    num_telefone character varying(20) NOT NULL,
    senha_usuario_cpf character varying(50) NOT NULL,
    endereco character varying(100) NOT NULL,
    num_endereco integer NOT NULL,
    bairro character varying(50) NOT NULL,
    cep character varying(50) NOT NULL,
    cidade character varying(50) NOT NULL,
    uf character varying(2) NOT NULL
);


ALTER TABLE public.usuario_cad_cpf OWNER TO postgres;

--
-- Data for Name: cliente_comunic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente_comunic (nome_cliente, email_cliente, telefone_cliente, assunto, mensagem) FROM stdin;
\.


--
-- Data for Name: fav_cnpj; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fav_cnpj (cnpj_do_usuario, nome_produto, codigo_produto) FROM stdin;
12.345.678/1111-22	Nike Especial	123456
\.


--
-- Data for Name: fav_cpf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fav_cpf (cpf_do_usuario, nome_produto, codigo_produto) FROM stdin;
111.111.111-11	Nike Especial	123456
111.111.111-11	Adidas Casual	987654
222.222.222-22	Nike Especial	123456
\.


--
-- Data for Name: pedido_cnpj; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedido_cnpj (num_geral_pedido, cnpj_cliente, status_pedido, inf_extras) FROM stdin;
333	12.345.678/1111-22	Ok	Ok
444	12.345.678/1111-22	Ok	Ok
\.


--
-- Data for Name: pedido_cpf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedido_cpf (num_geral_pedido, cpf_cliente, status_pedido, inf_extras) FROM stdin;
123	111.111.111-11	Ok	Ok
999	111.111.111-11	Ok	Ok
888	222.222.222-22	Ok	Ok
777	222.222.222-22	Ok	Ok
\.


--
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produto (codigo_produto, valor_produto, codigo_tipo_prod, nome_produto) FROM stdin;
123456	123.120003	100	Nike Especial
987654	200.100006	200	Adidas Casual
112233	121.120003	100	Puma Luxo
\.


--
-- Data for Name: produtos_pedidos_cnpj; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos_pedidos_cnpj (ident, cnpj_cliente, numero_produto) FROM stdin;
333	12.345.678/1111-22	112233
333	12.345.678/1111-22	123456
444	12.345.678/1111-22	123456
\.


--
-- Data for Name: produtos_pedidos_cpf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos_pedidos_cpf (ident, cpf_cliente, numero_produto) FROM stdin;
123	111.111.111-11	112233
123	111.111.111-11	123456
999	111.111.111-11	112233
888	222.222.222-22	123456
888	222.222.222-22	112233
777	222.222.222-22	123456
\.


--
-- Data for Name: tamanhogfem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tamanhogfem (codigo_tipo_prod, letra_tam, torax, quadril, cintura) FROM stdin;
100	G	140-160	160-180	180-200
200	G	240-260	260-280	280-300
\.


--
-- Data for Name: tamanhoggfem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tamanhoggfem (codigo_tipo_prod, letra_tam, torax, quadril, cintura) FROM stdin;
100	GG	160-180	180-200	200-220
200	GG	260-280	280-300	300-320
\.


--
-- Data for Name: tamanhoggmasc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tamanhoggmasc (codigo_tipo_prod, letra_tam, torax, quadril, cintura) FROM stdin;
100	GG	160-180	180,200	200-220
200	GG	260-280	280,300	300-320
\.


--
-- Data for Name: tamanhogmasc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tamanhogmasc (codigo_tipo_prod, letra_tam, torax, quadril, cintura) FROM stdin;
100	G	140-160	160-180	180-200
200	G	240-260	260-280	280-300
\.


--
-- Data for Name: tamanhomfem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tamanhomfem (codigo_tipo_prod, letra_tam, torax, quadril, cintura) FROM stdin;
100	M	120-140	140-160	160-180
200	M	200-220	220-240	260-280
300	M	300-320	320-340	340-360
\.


--
-- Data for Name: tamanhommasc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tamanhommasc (codigo_tipo_prod, letra_tam, torax, quadril, cintura) FROM stdin;
100	M	120-140	140-160	160-180
200	M	220-240	240-260	260-280
\.


--
-- Data for Name: tamanhopfem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tamanhopfem (codigo_tipo_prod, letra_tam, torax, quadril, cintura) FROM stdin;
100	P	50-60	60-70	70-80
200	P	160-180	180-200	200-220
\.


--
-- Data for Name: tamanhopmasc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tamanhopmasc (codigo_tipo_prod, letra_tam, torax, quadril, cintura) FROM stdin;
100	P	100-120	120-140	140-160
200	P	200-220	220-240	240-260
\.


--
-- Data for Name: tipoprod; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipoprod (codigo_tipo_prod, estilo_nome) FROM stdin;
100	Esporte
200	Casual
300	Casamento
\.


--
-- Data for Name: usuario_cad_cnpj; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_cad_cnpj (cnpj, email, razao_social, inscricao_estadual, num_telefone_principal, num_telefone_secundario, senha_usuario_cnpj, endereco, num_endereco, bairro, cep, cidade, uf) FROM stdin;
12.345.678/1111-22	cocacola@gmail.com	Coca cola ltda	01.123.1234-5	38-91111-1111	38-92222-2222	oioioi123	Rua Flores	1000	Universo	13121-312	Salvador	BA
\.


--
-- Data for Name: usuario_cad_cpf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_cad_cpf (cpf, email, nome_completo, data_nasc, genero, num_telefone, senha_usuario_cpf, endereco, num_endereco, bairro, cep, cidade, uf) FROM stdin;
111.111.111-11	joao.joao@gmail.com	Joao Felipe Silva	01-01-2000	Masculino	38-99999-9999	olaolaola123	Rua Sao Paulo	100	Centro	12431-312	Montes Claros	MG
222.222.222-22	maria.maria@gmail.com	Maria Flores	02-02-1999	Feminino	38-98888-8888	aaaaaaaaa123	Rua Sao Francisco	200	Sol	43121-111	Matias	SP
\.


--
-- Name: pedido_cnpj pkpedido_cnpj; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_cnpj
    ADD CONSTRAINT pkpedido_cnpj PRIMARY KEY (num_geral_pedido);


--
-- Name: pedido_cpf pkpedido_cpf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_cpf
    ADD CONSTRAINT pkpedido_cpf PRIMARY KEY (num_geral_pedido);


--
-- Name: produto pkproduto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT pkproduto PRIMARY KEY (codigo_produto);


--
-- Name: produtos_pedidos_cnpj pkprodutos_pedidos_cnpj; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos_pedidos_cnpj
    ADD CONSTRAINT pkprodutos_pedidos_cnpj PRIMARY KEY (ident, cnpj_cliente, numero_produto);


--
-- Name: produtos_pedidos_cpf pkprodutos_pedidos_cpf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos_pedidos_cpf
    ADD CONSTRAINT pkprodutos_pedidos_cpf PRIMARY KEY (ident, cpf_cliente, numero_produto);


--
-- Name: tamanhogfem pktamanhogfem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamanhogfem
    ADD CONSTRAINT pktamanhogfem PRIMARY KEY (codigo_tipo_prod);


--
-- Name: tamanhoggfem pktamanhoggfem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamanhoggfem
    ADD CONSTRAINT pktamanhoggfem PRIMARY KEY (codigo_tipo_prod);


--
-- Name: tamanhoggmasc pktamanhoggmasc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamanhoggmasc
    ADD CONSTRAINT pktamanhoggmasc PRIMARY KEY (codigo_tipo_prod);


--
-- Name: tamanhogmasc pktamanhogmasc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamanhogmasc
    ADD CONSTRAINT pktamanhogmasc PRIMARY KEY (codigo_tipo_prod);


--
-- Name: tamanhomfem pktamanhomfem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamanhomfem
    ADD CONSTRAINT pktamanhomfem PRIMARY KEY (codigo_tipo_prod);


--
-- Name: tamanhommasc pktamanhommasc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamanhommasc
    ADD CONSTRAINT pktamanhommasc PRIMARY KEY (codigo_tipo_prod);


--
-- Name: tamanhopfem pktamanhopfem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamanhopfem
    ADD CONSTRAINT pktamanhopfem PRIMARY KEY (codigo_tipo_prod);


--
-- Name: tamanhopmasc pktamanhopmasc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamanhopmasc
    ADD CONSTRAINT pktamanhopmasc PRIMARY KEY (codigo_tipo_prod);


--
-- Name: tipoprod pktipoprod; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipoprod
    ADD CONSTRAINT pktipoprod PRIMARY KEY (codigo_tipo_prod);


--
-- Name: usuario_cad_cnpj pkusuario_cad_cnpj; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_cad_cnpj
    ADD CONSTRAINT pkusuario_cad_cnpj PRIMARY KEY (cnpj);


--
-- Name: usuario_cad_cpf pkusuario_cad_cpf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_cad_cpf
    ADD CONSTRAINT pkusuario_cad_cpf PRIMARY KEY (cpf);


--
-- Name: fav_cnpj fkfav_cnpj1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fav_cnpj
    ADD CONSTRAINT fkfav_cnpj1 FOREIGN KEY (cnpj_do_usuario) REFERENCES public.usuario_cad_cnpj(cnpj) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fav_cnpj fkfav_cnpj2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fav_cnpj
    ADD CONSTRAINT fkfav_cnpj2 FOREIGN KEY (codigo_produto) REFERENCES public.produto(codigo_produto) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fav_cpf fkfav_cpf1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fav_cpf
    ADD CONSTRAINT fkfav_cpf1 FOREIGN KEY (cpf_do_usuario) REFERENCES public.usuario_cad_cpf(cpf) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fav_cpf fkfav_cpf2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fav_cpf
    ADD CONSTRAINT fkfav_cpf2 FOREIGN KEY (codigo_produto) REFERENCES public.produto(codigo_produto) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pedido_cnpj fkpedido_cnpj1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_cnpj
    ADD CONSTRAINT fkpedido_cnpj1 FOREIGN KEY (cnpj_cliente) REFERENCES public.usuario_cad_cnpj(cnpj) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pedido_cpf fkpedido_cpf1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_cpf
    ADD CONSTRAINT fkpedido_cpf1 FOREIGN KEY (cpf_cliente) REFERENCES public.usuario_cad_cpf(cpf) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: produto fkproduto1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fkproduto1 FOREIGN KEY (codigo_tipo_prod) REFERENCES public.tipoprod(codigo_tipo_prod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: produto fkproduto2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fkproduto2 FOREIGN KEY (codigo_tipo_prod) REFERENCES public.tamanhopmasc(codigo_tipo_prod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: produto fkproduto3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fkproduto3 FOREIGN KEY (codigo_tipo_prod) REFERENCES public.tamanhommasc(codigo_tipo_prod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: produto fkproduto4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fkproduto4 FOREIGN KEY (codigo_tipo_prod) REFERENCES public.tamanhogmasc(codigo_tipo_prod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: produto fkproduto5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fkproduto5 FOREIGN KEY (codigo_tipo_prod) REFERENCES public.tamanhoggmasc(codigo_tipo_prod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: produto fkproduto6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fkproduto6 FOREIGN KEY (codigo_tipo_prod) REFERENCES public.tamanhopfem(codigo_tipo_prod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: produto fkproduto7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fkproduto7 FOREIGN KEY (codigo_tipo_prod) REFERENCES public.tamanhomfem(codigo_tipo_prod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: produto fkproduto8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fkproduto8 FOREIGN KEY (codigo_tipo_prod) REFERENCES public.tamanhogfem(codigo_tipo_prod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: produto fkproduto9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fkproduto9 FOREIGN KEY (codigo_tipo_prod) REFERENCES public.tamanhoggfem(codigo_tipo_prod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: produtos_pedidos_cnpj fkprodutos_pedidos_cnpj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos_pedidos_cnpj
    ADD CONSTRAINT fkprodutos_pedidos_cnpj FOREIGN KEY (cnpj_cliente) REFERENCES public.usuario_cad_cnpj(cnpj) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: produtos_pedidos_cnpj fkprodutos_pedidos_cnpj1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos_pedidos_cnpj
    ADD CONSTRAINT fkprodutos_pedidos_cnpj1 FOREIGN KEY (numero_produto) REFERENCES public.produto(codigo_produto) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: produtos_pedidos_cnpj fkprodutos_pedidos_cnpj2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos_pedidos_cnpj
    ADD CONSTRAINT fkprodutos_pedidos_cnpj2 FOREIGN KEY (ident) REFERENCES public.pedido_cnpj(num_geral_pedido) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: produtos_pedidos_cpf fkprodutos_pedidos_cpf1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos_pedidos_cpf
    ADD CONSTRAINT fkprodutos_pedidos_cpf1 FOREIGN KEY (numero_produto) REFERENCES public.produto(codigo_produto) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: produtos_pedidos_cpf fkprodutos_pedidos_cpf2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos_pedidos_cpf
    ADD CONSTRAINT fkprodutos_pedidos_cpf2 FOREIGN KEY (cpf_cliente) REFERENCES public.usuario_cad_cpf(cpf) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: produtos_pedidos_cpf fkprodutos_pedidos_cpf3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos_pedidos_cpf
    ADD CONSTRAINT fkprodutos_pedidos_cpf3 FOREIGN KEY (ident) REFERENCES public.pedido_cpf(num_geral_pedido) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tamanhogfem fktamanhogfem1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamanhogfem
    ADD CONSTRAINT fktamanhogfem1 FOREIGN KEY (codigo_tipo_prod) REFERENCES public.tipoprod(codigo_tipo_prod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tamanhoggfem fktamanhoggfem1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamanhoggfem
    ADD CONSTRAINT fktamanhoggfem1 FOREIGN KEY (codigo_tipo_prod) REFERENCES public.tipoprod(codigo_tipo_prod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tamanhoggmasc fktamanhoggmasc1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamanhoggmasc
    ADD CONSTRAINT fktamanhoggmasc1 FOREIGN KEY (codigo_tipo_prod) REFERENCES public.tipoprod(codigo_tipo_prod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tamanhogmasc fktamanhogmasc1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamanhogmasc
    ADD CONSTRAINT fktamanhogmasc1 FOREIGN KEY (codigo_tipo_prod) REFERENCES public.tipoprod(codigo_tipo_prod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tamanhomfem fktamanhomfem1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamanhomfem
    ADD CONSTRAINT fktamanhomfem1 FOREIGN KEY (codigo_tipo_prod) REFERENCES public.tipoprod(codigo_tipo_prod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tamanhommasc fktamanhommasc1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamanhommasc
    ADD CONSTRAINT fktamanhommasc1 FOREIGN KEY (codigo_tipo_prod) REFERENCES public.tipoprod(codigo_tipo_prod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tamanhopfem fktamanhopfem1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamanhopfem
    ADD CONSTRAINT fktamanhopfem1 FOREIGN KEY (codigo_tipo_prod) REFERENCES public.tipoprod(codigo_tipo_prod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tamanhopmasc fktamanhopmasc1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamanhopmasc
    ADD CONSTRAINT fktamanhopmasc1 FOREIGN KEY (codigo_tipo_prod) REFERENCES public.tipoprod(codigo_tipo_prod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

