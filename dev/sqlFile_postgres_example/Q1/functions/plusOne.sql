CREATE OR REPLACE FUNCTION plusone (val integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
BEGIN
RETURN val + 1;
END; $function$;