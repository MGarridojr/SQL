DROP TABLE "creditCards";
DROP TABLE "bankAccount"; 
DROP TABLE "transactions"; 
DROP TABLE "customerAddresses";  
DROP TABLE "customerPhones";
DROP TABLE "customers";
DROP TABLE "cities";
DROP TABLE "states";


SELECT * FROM "creditCards"
SELECT * FROM cities  
SELECT * FROM "customerAddresses" 
SELECT * FROM "customerPhones" 
SELECT * FROM customers  
SELECT * FROM states  
SELECT * FROM "bankAccount"  
SELECT * FROM transactions  

CREATE TABLE "states" (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
    "createdAt" TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE "cities" (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	"stateId" INTEGER NOT NULL REFERENCES "states"("id"),
    "createdAt" TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE "customers" (
	id SERIAL PRIMARY KEY,
	"fullName" TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,
	email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    "createdAt" TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE "customerPhones" (
	id SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    number TEXT NOT NULL UNIQUE,
    type TEXT NOT NULL,
    "createdAt" TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE "customerAddresses" (
	id SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    street TEXT NOT NULL,
    number INTEGER NOT NULL,
    complement TEXT,
    "postalCode" TEXT NOT NULL,
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id"),
    "createdAt" TIMESTAMP NOT NULL DEFAULT NOW()
);


CREATE TABLE "bankAccount" (
	id SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "accountNumber" TEXT NOT NULL UNIQUE,
    agency INTEGER NOT NULL,
    "openDate" TIMESTAMP NOT NULL DEFAULT NOW(),
    "closeDate" TIMESTAMP DEFAULT NOW(),
    cancelled BOOLEAN DEFAULT false
);

CREATE TABLE "transactions" (
	id SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    amount NUMERIC NOT NULL UNIQUE,
    type TEXT NOT NULL,
    "time" TIMESTAMP NOT NULL DEFAULT NOW(),
    description TEXT NOT NULL,
    cancelled BOOLEAN DEFAULT false
);

CREATE TABLE "creditCards" (
	id SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    name TEXT NOT NULL,
    number TEXT NOT NULL UNIQUE,
    "securityCode" INTEGER NOT NULL,
    "expirationMonth" INTEGER NOT NULL,
    "expirationYear" INTEGER NOT NULL, 
    password TEXT NOT NULL,
    "limit" TEXT NOT NULL,
    "createdAt" DATE NOT NULL DEFAULT NOW()
);

INSERT INTO customers ("fullName", cpf, email, "password") VALUES ('meu nome completo', 2673112331763, 'emailbo13ladoASD@email.com', 'senha');
INSERT INTO states (name) VALUES ('ESTADAD11O');
INSERT INTO cities (name,"stateId") VALUES('cidade sinistra', 1);
INSERT INTO "customerAddresses" ("customerId", street, "number", "postalCode", "cityId") VALUES ()
INSERT INTO "creditCards" ("bankAccountId","name",number,"securityCode","expirationMonth","expirationYear",password,"limit") VALUES (1,'nome do cartao' ,'2698461294862',123,06,2022,'senha','2000');
 


