CREATE TABLE "admin" (
  "data" varchar(250),
  "hora" varchar(250),
  "ip" varchar(250),
  "host" varchar(250));

CREATE TABLE "clientes" (
  "clienteid" int IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL,
  "email" varchar(250) default NULL,
  "senha" varchar(50)default NULL,
  "codigo" varchar(250)default NULL,
  "nocliente" varchar(250)default NULL,
  "nofantasia" varchar(250)default NULL,
  "endereco" varchar(250)default NULL,
  "numero" varchar(20)default NULL,
  "complemento" varchar(250)default NULL,
  "bairro" varchar(50)default NULL,
  "cidade" varchar(250)default NULL,
  "estado" varchar(50)default NULL,
  "cep" varchar(30)default NULL,
  "cnpj" varchar(100)default NULL,
  "pessoa" varchar(250)default NULL,
  "inestadual" varchar(100)default NULL,
  "identidade" varchar(100)default NULL,
  "nomepai" varchar(250)default NULL,
  "nomemae" varchar(250)default NULL,
  "telefone" varchar(60)default NULL,
  "fax" varchar(60)default NULL,
  "celular" varchar(60)default NULL,
  "pecontato" varchar(250)default NULL,
  "email2" varchar(150)default NULL,
  "homepage" varchar(250)default NULL,
  "produtor" varchar(250)default NULL,
  "nascimento" varchar(250)default NULL,
  "datacadastro" varchar(250)default NULL,
  "limite" varchar(250)default NULL,
  "vendedor" varchar(250)default NULL,
  "banco" varchar(250)default NULL,
  "agencia" varchar(250)default NULL,
  "conta" varchar(100)default NULL,
  "data" varchar(50)default NULL,
  "hora" varchar(50)default NULL,
  "foto" varchar(250)default NULL,
  "datacad" varchar(250)default NULL,
  "nome" varchar(250)default NULL,
  "cpf" varchar(250)default NULL,
  "rg" varchar(250)default NULL,
  "pais" varchar(250)default NULL,
  "tel" varchar(250)default NULL,
  "status" varchar(250)default NULL,
  "msg" varchar(800)default NULL
  PRIMARY KEY ("clienteid"));


CREATE TABLE "compras" (
  "pedido" "int" IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL,
  "idcompra" "int" default NULL,
  "datacompra" varchar(250),
  "clienteid" varchar(250),
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
  "idcompra" int NOT NULL,
  "idprod" int NOT NULL,
  "quantidade" int NOT NULL
);


CREATE TABLE "produtos" (
  "idprod" bigint IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL,
  "nome" varchar(250),
  "fabricante" varchar(250),
  "detalhe" varchar(8000),
  "preco" varchar(250),
  "precovelho" varchar(250) NOT NULL,
  "parcela" varchar(250),
  "juro" varchar(250),
  "aomes" varchar(250),
  "estoque" varchar(250),
  "idsessao" varchar(250),
  "data" varchar(250),
  "peso" varchar(250),
  "imgra" varchar(250),
  "impeq" varchar(250),
  "status" varchar(250),
  "contador" int default NULL,
  PRIMARY KEY  ("idprod"));


CREATE TABLE "sessoes" (
  "id" int IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL,
  "data" varchar(250),
  "nome" varchar(250),
  "descr" varchar(250),
  "ver" varchar(250)
);