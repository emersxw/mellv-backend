CREATE TABLE usuarios (
    id SERIAL UNIQUE NOT NULL PRIMARY KEY,
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
  descricao character varying(255),
  instrucoes character varying(255),
  tamanhos character varying(255),
  tipo character varying(255),
  foto_url character varying(255)
);

-- centralizar os pagamentos
CREATE TABLE pedidos (
  id SERIAL UNIQUE NOT NULL PRIMARY KEY,
  usuario_id character varying(255) NOT NULL,
  produto_codigo character varying(255) NOT NULL,
  data_pedido DATE NOT NULL DEFAULT CURRENT_DATE,
  status_pedido character varying(255)
);
