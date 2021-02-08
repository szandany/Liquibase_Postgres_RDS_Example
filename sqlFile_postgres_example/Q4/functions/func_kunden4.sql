CREATE OR REPLACE FUNCTION func_kunden4 ()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
   BEGIN
      IF TG_OP = 'INSERT' THEN
        INSERT INTO STD_Adressat ("AdressatId", "Anrede", "Anzeigename", "Bemerkung")
           VALUES (new."AdressatId", new."Anrede", new."Anzeigename", new."Bemerkung");
        RETURN NEW;
      END IF;
      RETURN NEW;
    END;
$function$;