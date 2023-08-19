CREATE OR REPLACE FUNCTION get_persons_by_gender(gender_filter varchar)
    RETURNS TABLE (
        id      bigint,
        name    varchar,
        age     integer,
        gender  varchar,
        address varchar
    )
AS
$$
BEGIN
    RETURN QUERY
    SELECT *
    FROM person
    WHERE person.gender = gender_filter;
END;
$$
LANGUAGE plpgsql;

SELECT * FROM get_persons_by_gender(gender_filter := 'male');
SELECT * FROM get_persons_by_gender(gender_filter := NULL);
