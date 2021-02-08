--liquibase formatted sql 

--changeset Bob:12 runOnChange:true endDelimiter:$function$
CREATE OR REPLACE FUNCTION getactual
 (val integer)
 RETURNS integer
 LANGUAGE plpgsql
AS
 $function$
BEGIN
RETURN val + 1;
END; 

$function$;

--rollback DROP FUNCTION getactual