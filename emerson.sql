CREATE TABLE usuarios (
    -- id SERIAL UNIQUE NOT NULL PRIMARY KEY,
    id uuid DEFAULT uuid_generate_v4 () PRIMARY KEY,
    cpf character varying(11) UNIQUE NOT NULL,
    email character varying(255) UNIQUE NOT NULL ,
    nome_completo character varying(255) NOT NULL,
    nascimento character varying(8) NOT NULL,
    genero character varying(15) NOT NULL,
    telefone character varying(14) NOT NULL,
    senha character varying(255) NOT NULL,

    rua character varying(255) NOT NULL,
    num_endereco character varying(15) NOT NULL,
    bairro character varying(255) NOT NULL,
    cep character varying(10) NOT NULL,
    cidade character varying(50) NOT NULL,
    uf character varying(2) NOT NULL,

    nome_destinario character varying(255),
    referencia character varying(255),
    complemento character varying(255),
    instagram character varying(255) UNIQUE
);

-- problema com as imagens do produto
CREATE TABLE produtos (
  codigo character varying(255) UNIQUE NOT NULL PRIMARY KEY,
  nome character varying(255) NOT NULL,
  preco NUMERIC(15,6) NOT NULL,
  descricao TEXT,
  instrucoes TEXT,
  tipo character varying(255),
  fotos_url TEXT [],
  tamanhos TEXT []
);

-- centralizar os pagamentos
-- 1 pedido pode ter varios produtos
CREATE TABLE pedidos (
  id SERIAL UNIQUE NOT NULL PRIMARY KEY,
  usuario_id character varying(255) NOT NULL,
  produto_codigo character varying(255) NOT NULL,
  status_pedido character varying(255),
  tamanho character varying(2) NOT NULL,
  pedido_realizado BOOLEAN NOT NULL
);

-- ao inves de fazer um pedido coloca varios pedidos em um carrinho
-- e faz o checkout
CREATE TABLE carrinho (
  usuario_id character varying(255) NOT NULL,
  status_carrinho character varying(255),
  data_inicio DATE NOT NULL DEFAULT CURRENT_DATE,
  checkout BOOLEAN NOT NULL,
  aberto BOOLEAN NOT NULL,
  pedidos_id TEXT [] NOT NULL
);
