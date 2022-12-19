CREATE TABLE shop (
    "id" SERIAL PRIMARY KEY,
    "idUser" INTEGER NOT NULL REFERENCES "users"("id"),
    "idNameProducts" INTEGER NOT NULL REFERENCES "products"("id"),
    "idSize" INTEGER NOT NULL REFERENCES "size"("id"),
    "address" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "date" DATE NOT NULL DEFAULT NOW()
);