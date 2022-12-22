CREATE TABLE "public.Alunos" (
	"id" serial NOT NULL,
	"name" character varying NOT NULL,
	"cpf" TEXT NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE,
	CONSTRAINT "Alunos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Turma" (
	"id" serial NOT NULL UNIQUE,
	"sigla" character varying NOT NULL UNIQUE,
	CONSTRAINT "Turma_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.modulos" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "modulos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.HistoricAluno" (
	"id" serial NOT NULL,
	"idAluno" integer NOT NULL,
	"idTurma" integer NOT NULL,
	"dataEntrada" DATE NOT NULL,
	"dataSaida" DATE NOT NULL,
	CONSTRAINT "HistoricAluno_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Projetos" (
	"id" serial NOT NULL,
	"idAluno" integer NOT NULL,
	"data" DATE NOT NULL DEFAULT 'NOW()',
	"nota" TEXT NOT NULL,
	"nome" TEXT NOT NULL,
	"moduloId" TEXT NOT NULL,
	CONSTRAINT "Projetos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);






ALTER TABLE "HistoricAluno" ADD CONSTRAINT "HistoricAluno_fk0" FOREIGN KEY ("idAluno") REFERENCES "Alunos"("id");
ALTER TABLE "HistoricAluno" ADD CONSTRAINT "HistoricAluno_fk1" FOREIGN KEY ("idTurma") REFERENCES "Turma"("id");

ALTER TABLE "Projetos" ADD CONSTRAINT "Projetos_fk0" FOREIGN KEY ("idAluno") REFERENCES "Alunos"("id");
ALTER TABLE "Projetos" ADD CONSTRAINT "Projetos_fk1" FOREIGN KEY ("moduloId") REFERENCES "modulos"("id");






