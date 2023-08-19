CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson varchar DEFAULT 'Dmitriy',
    IN pprice numeric DEFAULT 500,
    IN pdate date DEFAULT '2022-01-08'
)
RETURNS TABLE (
    name varchar
)
AS $$
BEGIN
    RETURN QUERY 
    SELECT DISTINCT pi.name
    FROM (
        SELECT pv.person_id, pv.pizzeria_id
        FROM person_visits pv
        WHERE pv.visit_date = pdate
        UNION
        SELECT po.person_id, m.pizzeria_id
        FROM person_order po
        JOIN menu m ON po.menu_id = m.id
        WHERE po.order_date = pdate AND m.price < pprice
    ) AS visits_and_orders
    JOIN person p ON visits_and_orders.person_id = p.id AND p.name = pperson
    JOIN pizzeria pi ON visits_and_orders.pizzeria_id = pi.id;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_person_visits_and_eats_on_date();
SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');

