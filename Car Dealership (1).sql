CREATE TABLE "Car" (
  "car_id" integer PRIMARY KEY,
  "vin_num" serial,
  "make" varchar,
  "model" varchar,
  "color" varchar,
  "man_year" integer,
  "new_car" boolean,
  "used_car" boolean,
  "invoice_id" integer,
  "price" float8
);

CREATE TABLE "invoice" (
  "invoice_id" integer PRIMARY KEY,
  "invoice_number" integer,
  "invoice_date" timestamp,
  "price" float8,
  "car_id" integer,
  "customer_id" integer,
  "sales_id" integer
);

CREATE TABLE "customers" (
  "customer_id" integer PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "phone_number" integer,
  "address" varchar
);

CREATE TABLE "salespeople" (
  "sales_id" integer PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar
);

CREATE TABLE "mechanics" (
  "mechanic_id" integer PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar
);

CREATE TABLE "service" (
  "serv_id" integer PRIMARY KEY,
  "service_name" varchar,
  "hourly_rate" float4,
  "invoice_id" integer,
  "mechanic_id" integer
);

CREATE TABLE "parts" (
  "part_id" integer PRIMARY KEY,
  "part_number" integer,
  "description" varchar,
  "serv_ticket" integer,
  "purchase_price" float4,
  "retail_price" float4
);

CREATE TABLE "service_ticket" (
  "serv_ticket" integer PRIMARY KEY,
  "retail_price" float8,
  "serv_id" integer,
  "part_id" integer
);

ALTER TABLE "invoice" ADD FOREIGN KEY ("car_id") REFERENCES "Car" ("car_id");

ALTER TABLE "invoice" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("customer_id");

ALTER TABLE "invoice" ADD FOREIGN KEY ("sales_id") REFERENCES "salespeople" ("sales_id");

ALTER TABLE "service_ticket" ADD FOREIGN KEY ("serv_ticket") REFERENCES "parts" ("serv_ticket");

ALTER TABLE "service" ADD FOREIGN KEY ("mechanic_id") REFERENCES "mechanics" ("mechanic_id");

ALTER TABLE "service" ADD FOREIGN KEY ("invoice_id") REFERENCES "invoice" ("invoice_id");

ALTER TABLE "service_ticket" ADD FOREIGN KEY ("serv_id") REFERENCES "service" ("serv_id");

ALTER TABLE "service_ticket" ADD FOREIGN KEY ("part_id") REFERENCES "parts" ("part_id");
