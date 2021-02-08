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
$function$
