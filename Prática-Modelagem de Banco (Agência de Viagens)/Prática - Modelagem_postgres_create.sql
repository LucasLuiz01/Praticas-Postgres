CREATE TABLE "public.companias" (
	"id" serial NOT NULL,
	"name" character varying NOT NULL,
	CONSTRAINT "companias_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Aeroporto" (
	"id" serial NOT NULL UNIQUE,
	"name" character varying NOT NULL UNIQUE,
	"sigla" TEXT NOT NULL,
	CONSTRAINT "Aeroporto_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Voos" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"HoraSaida" timestamp with time zone NOT NULL,
	"HoraChegada" timestamp with time zone NOT NULL,
	"AeroportoSaidaId" integer NOT NULL,
	"AeroportoChegadaId" integer NOT NULL,
	CONSTRAINT "Voos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "Voos" ADD CONSTRAINT "Voos_fk0" FOREIGN KEY ("AeroportoSaidaId") REFERENCES "Aeroporto"("id");
ALTER TABLE "Voos" ADD CONSTRAINT "Voos_fk1" FOREIGN KEY ("AeroportoChegadaId") REFERENCES "Aeroporto"("id");




