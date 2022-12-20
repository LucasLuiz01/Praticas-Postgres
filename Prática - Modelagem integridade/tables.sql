CREATE TABLE shop (
    "id" SERIAL PRIMARY KEY,
    "idUser" INTEGER NOT NULL REFERENCES "users"("id"),
    "idNameProducts" INTEGER NOT NULL REFERENCES "products"("id"),
    "idSize" INTEGER NOT NULL REFERENCES "size"("id"),
    "address" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "date" DATE NOT NULL DEFAULT NOW()
);

CREATE TABLE states (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(40) NOT NULL
)
CREATE TABLE cities (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(40) NOT NULL,
    "stateId" INTEGER NOT NULL REFERENCES "states"("id")

)
CREATE TABLE customerAddresses (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "street" TEXT NOT NULL,
    "number" INTEGER NOT NULL UNIQUE,
    "complement" TEXT,
    "postalCode" TEXT NOT NULL,
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);
CREATE TABLE customerPhones (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "number" INTEGER NOT NULL UNIQUE,
    "type" TEXT NOT NULL,
);
CREATE TABLE customers (
    "id" SERIAL PRIMARY KEY,
    "fullName" VARCHAR(50) NOT NULL,
    "cpf" INTEGER NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
);
CREATE TABLE bankAccount (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "accountNumber" INTEGER NOT NULL UNIQUE,
    "agency" INTEGER NOT NULL,
    "openDate" TIMESTAMP NOT NULL,
    "closeDate" TIMESTAMP NOT NULL DEFAULT NOW(),
);
CREATE TABLE transctions (
    "id" SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    "amount" INTEGER NOT NULL UNIQUE,
    "time" TIME NOT NULL DEFAULT NOW(),
    "description" TEXT NOT NULL,
    "canceled" BOOLEAN NOT NULL DEFAULT FALSE,
);
CREATE TABLE transctions (
    "id" SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    "name" VARCHAR(50) NOT NULL UNIQUE,
    "number" INTEGER NOT NULL,
    "securityCode" VARCHAR(30) NOT NULL UNIQUE,
    "expirationMounth" DATE NOT NULL ,
    "expirationYear" DATE NOT NULL,
    "password" TEXT NOT NULL,
    "limit" INTEGER NOT NULL,
);