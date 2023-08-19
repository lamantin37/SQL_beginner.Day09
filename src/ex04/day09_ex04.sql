CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE (
    person_id bigint,
    person_name varchar,
    person_age integer,
    person_gender varchar,
    person_address varchar
) AS $$
BEGIN
    RETURN QUERY
    SELECT id, name, age, gender, address
    FROM person
    WHERE gender = 'female';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS TABLE (
    person_id bigint,
    person_name varchar,
    person_age integer,
    person_gender varchar,
    person_address varchar
) AS $$
BEGIN
    RETURN QUERY
    SELECT id, name, age, gender, address
    FROM person
    WHERE gender = 'male';
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_persons_female();

SELECT * FROM fnc_persons_male();



