CREATE TABLE "admin" (
  "data" varchar(250), 
  "hora" varchar(250), 
  "ip" varchar(250),
  "host" varchar(250)


CREATE TABLE "representantes" (
  "id" int IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL,
  "usuario" varchar(250),
  "senha" varchar(50),
  "codigo" varchar(250),
  "nocliente" varchar(250),
  "nofantasia" varchar(250),
  "endereco" varchar(250),
  "numero" varchar(20),
  "complemento" varchar(250),
  "bairro" varchar(50),
  "cidade" varchar(250),
  "estado" varchar(50),
  "cep" varchar(30),
  "cnpj" varchar(100),
  "pessoa" varchar(250),
  "inestadual" varchar(100),
  "identidade" varchar(100),
  "nomepai" varchar(250),
  "nomemae" varchar(250),
  "telefone" varchar(60),
  "fax" varchar(60),
  "celular" varchar(60),
  "pecontato" varchar(250),
  "email2" varchar(150),
  "homepage" varchar(250),
  "produtor" varchar(250),
  "nascimento" varchar(250),
  "datacadastro" varchar(250),
  "limite" varchar(250),
  "vendedor" varchar(250),
  "banco" varchar(250),
  "agencia" varchar(250),
  "conta" varchar(100),
  "data" varchar(50),
  "hora" varchar(50),
  "foto" varchar(250),
  "msg" varchar(800)
  PRIMARY KEY ("id"));










CREATE TABLE "clientes" (
  "clienteid" int IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL,
  "email" varchar(250),
  "senha" varchar(50),
  "codigo" varchar(250),
  "nocliente" varchar(250),
  "nofantasia" varchar(250),
  "endereco" varchar(250),
  "numero" varchar(20),
  "complemento" varchar(250),
  "bairro" varchar(50),
  "cidade" varchar(250),
  "estado" varchar(50),
  "cep" varchar(30),
  "cnpj" varchar(100),
  "pessoa" varchar(250),
  "inestadual" varchar(100),
  "identidade" varchar(100),
  "nomepai" varchar(250),
  "nomemae" varchar(250),
  "telefone" varchar(60),
  "fax" varchar(60),
  "celular" varchar(60),
  "pecontato" varchar(250),
  "email2" varchar(150),
  "homepage" varchar(250),
  "produtor" varchar(250),
  "nascimento" varchar(250),
  "datacadastro" varchar(250),
  "limite" varchar(250),
  "vendedor" varchar(250),
  "banco" varchar(250),
  "agencia" varchar(250),
  "conta" varchar(100),
  "data" varchar(50),
  "hora" varchar(50),
  "foto" varchar(250),
  "datacad" varchar(250),
  "nome" varchar(250),
  "cpf" varchar(250),
  "rg" varchar(250),
  "pais" varchar(250),
  "tel" varchar(250),
  "status" varchar(250),
  "msg" varchar(800)
  PRIMARY KEY ("clienteid"));

CREATE TABLE "compras" (
  "pedido" "int" IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL,
  "idcompra" "int",
  "datacompra" varchar(50) NOT NULL,
  "clienteid" varchar(50),
  "frete" varchar(250),
  "totalcompra" varchar(250),
  "dataentrega" varchar(250),
  "endentrega" varchar(250),
  "bairroentrega" varchar(250),
  "cidadeentrega" varchar(250),
  "estadoentrega" varchar(250),
  "cepentrega" varchar(250),
  "paisentrega" varchar(250),
  "telentrega" varchar(250),
  "pagamentovia" varchar(250),
  "status" varchar(250),
  "presente" varchar(250),
  "msgpresente" varchar(250),
  "numero" varchar(250),
  "vencimento" varchar(250),
  "titular" varchar(250),
  PRIMARY KEY  ("pedido"));

CREATE TABLE "email" (
  "email" varchar(250)
);

CREATE TABLE "boleto" (
  "nosso" varchar(250)
);

CREATE TABLE "fretes" (
  "localidade" varchar(250),
  "re0" varchar(250),
  "re1" varchar(250),
  "re2" varchar(250),
  "re3" varchar(250),
  "re4" varchar(250),
  "re5" varchar(250),
  "re6" varchar(250),
  "re7" varchar(250),
  "re8" varchar(250),
  "re9" varchar(250)
);

INSERT INTO fretes (localidade, re0, re1, re2, re3, re4, re5, re6, re7, re8, re9) VALUES('capital', '6,10', '9,10', '12,60', '15,30', '16,60', '18,70', '21,40', '24,50', '25,80', '27,70');
INSERT INTO fretes (localidade, re0, re1, re2, re3, re4, re5, re6, re7, re8, re9) VALUES('interior', '6,10', '13,90', '16,40', '19,80', '20,40', '22,40', '25,30', '28,00', '29,40', '31,50');
INSERT INTO fretes (localidade, re0, re1, re2, re3, re4, re5, re6, re7, re8, re9) VALUES('pesocapital', '0,80', '2,10', '3,50', '4,40', '4,90', '5,60', '6,80', '7,80', '8,20', '8,90');
INSERT INTO fretes (localidade, re0, re1, re2, re3, re4, re5, re6, re7, re8, re9) VALUES('pesointerior', '0,80', '4,00', '4,90', '6,00', '6,30', '7,00', '8,20', '9,20', '9,50', '10,20');

CREATE TABLE "newsletter" (
  "datacad" varchar(250),
  "email" varchar(250)
);


CREATE TABLE "pedidos" (
  "idcompra" int default NULL,
  "idprod" int default NULL,
  "quantidade" int default NULL
);


CREATE TABLE "produtos" (
  "idprod" int IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL,
  "nome" varchar(250),
  "fabricante" varchar(250),
  "detalhe" varchar(8000),
  "preco" varchar(50),
  "precovelho" varchar(50) NOT NULL,
  "parcela" varchar(50),
  "juro" varchar(50),
  "aomes" varchar(50),
  "estoque" varchar(50),
  "idsessao" varchar(50),
  "data" varchar(50),
  "peso" varchar(50),
  "imgra" varchar(250),
  "impeq" varchar(250),
  "status" varchar(50),
  "contador" int default NULL,
  PRIMARY KEY  ("idprod"));

CREATE TABLE "sessoes" (
  "id" bigint IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL,
  "data" varchar(250),
  "nome" varchar(250),
  "descr" varchar(250),
  "ver" varchar(250)
);

