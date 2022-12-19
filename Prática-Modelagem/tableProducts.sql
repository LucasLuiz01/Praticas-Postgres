CREATE TABLE products (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(30) NOT NULL,
    "price" INTEGER NOT NULL,
    "stockTotal" INTEGER NOT NULL,
    "image" TEXT NOT NULL,
    "idCategory" INTEGER NOT NULL REFERENCES "category"("id"),
    "idSize" INTEGER NOT NULL REFERENCES "size"("id"),
);