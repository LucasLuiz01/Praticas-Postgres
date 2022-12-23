CREATE TABLE "public.disco" (
	"id" serial NOT NULL,
	"idFilme" integer NOT NULL,
	"number" integer NOT NULL,
	"codigo" TEXT NOT NULL UNIQUE,
	CONSTRAINT "disco_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.informacoesAtores" (
	"id" serial NOT NULL UNIQUE,
	"name" character varying NOT NULL UNIQUE,
	"pais" TEXT NOT NULL,
	"dataDeNascimento" DATE NOT NULL,
	CONSTRAINT "informacoesAtores_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Category" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "Category_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Atores" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"idInformacoesAtores" bigint NOT NULL,
	CONSTRAINT "Atores_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.FIlme" (
	"id" serial NOT NULL,
	"titulo" TEXT NOT NULL UNIQUE,
	"IdCategory" serial NOT NULL,
	"idAtor" integer NOT NULL,
	CONSTRAINT "FIlme_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.clients" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"telefone" TEXT NOT NULL,
	"idAdress" TEXT NOT NULL,
	"cpf" TEXT NOT NULL,
	CONSTRAINT "clients_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Adress" (
	"id" serial NOT NULL,
	"rua" TEXT NOT NULL,
	"numero" TEXT NOT NULL,
	"complement" TEXT NOT NULL,
	"bairro" TEXT NOT NULL,
	"estado" TEXT NOT NULL,
	"cidade" TEXT NOT NULL,
	CONSTRAINT "Adress_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.locacao" (
	"id" serial NOT NULL,
	"idClient" integer NOT NULL,
	"idDisco" integer NOT NULL,
	"dataAlugel" DATE NOT NULL,
	"dataDevolucao" DATE NOT NULL,
	CONSTRAINT "locacao_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.pesquisa" (
	"id" serial NOT NULL,
	"nota" integer NOT NULL,
	"idClient" integer NOT NULL,
	CONSTRAINT "pesquisa_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "disco" ADD CONSTRAINT "disco_fk0" FOREIGN KEY ("idFilme") REFERENCES "FIlme"("id");



ALTER TABLE "Atores" ADD CONSTRAINT "Atores_fk0" FOREIGN KEY ("idInformacoesAtores") REFERENCES "informacoesAtores"("id");

ALTER TABLE "FIlme" ADD CONSTRAINT "FIlme_fk0" FOREIGN KEY ("IdCategory") REFERENCES "Category"("id");
ALTER TABLE "FIlme" ADD CONSTRAINT "FIlme_fk1" FOREIGN KEY ("idAtor") REFERENCES "Atores"("id");

ALTER TABLE "clients" ADD CONSTRAINT "clients_fk0" FOREIGN KEY ("idAdress") REFERENCES "Adress"("id");


ALTER TABLE "locacao" ADD CONSTRAINT "locacao_fk0" FOREIGN KEY ("idClient") REFERENCES "clients"("id");
ALTER TABLE "locacao" ADD CONSTRAINT "locacao_fk1" FOREIGN KEY ("idDisco") REFERENCES "disco"("id");

ALTER TABLE "pesquisa" ADD CONSTRAINT "pesquisa_fk0" FOREIGN KEY ("idClient") REFERENCES "clients"("id");










