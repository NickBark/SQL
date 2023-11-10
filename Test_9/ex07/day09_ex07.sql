CREATE OR REPLACE FUNCTION func_minimum (
    VARIADIC arr NUMERIC[]
)
RETURNS NUMERIC AS
$$
DECLARE result NUMERIC; 
BEGIN
    IF(array_length(arr, 1) IS NULL) 
    THEN
        result := NULL;
    ELSE
        result := (SELECT MIN(x) FROM unnest(arr) AS x);
    END IF;
    RETURN result;
END;
$$
LANGUAGE plpgsql;