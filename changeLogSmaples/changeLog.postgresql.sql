--liquibase formatted sql

--changeset SteveZ:1587073493976-1
CREATE TABLE exec_sales (id INTEGER NOT NULL, name VARCHAR(255), CONSTRAINT test1_pkey PRIMARY KEY (id));
--rollback drop table exec_sales;

--changeset SteveZ:1587073493976-2
CREATE VIEW myview2 AS SELECT exec_sales.id,
    exec_sales.name
   FROM exec_sales;;
--rollback drop view myview2;

--changeset SteveZ:1587073493976-3
CREATE VIEW newview AS SELECT exec_sales.id,
    exec_sales.name
   FROM exec_sales;;
--rollback drop view newview;

--changeset SteveZ:1587073493976-4
CREATE TABLE "salesTable" (id INTEGER NOT NULL, name VARCHAR(20), region VARCHAR(20), market VARCHAR(20));
--rollback drop table "salesTable";

--changeset SteveZ:1587073493976-5 endDelimiter:$function$
CREATE OR REPLACE FUNCTION public.func_kunden()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
   BEGIN
      IF TG_OP = 'INSERT' THEN
        INSERT INTO  public."STD_Adressat" ("AdressatId", "Anrede", "Anzeigename", "Bemerkung")
           VALUES (new."AdressatId", new."Anrede", new."Anzeigename", new."Bemerkung");
        RETURN NEW;
      END IF;
      RETURN NEW;
    END;
$function$;
--rollback drop function func_kunden();

--changeset SteveZ:1587073493976-6 endDelimiter:$function$
CREATE OR REPLACE FUNCTION public."plusOne"(val integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
BEGIN
RETURN val + 1;
END; $function$;
--rollback drop function "plusOne";
