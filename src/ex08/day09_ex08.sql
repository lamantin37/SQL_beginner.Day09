CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
RETURNS TABLE (fibonacci_number bigint) AS $$
DECLARE
    fib_prev bigint := 0;
    fib_current bigint := 1;
BEGIN
    WHILE fib_current < pstop LOOP
        fibonacci_number := fib_current;
        fib_current := fib_prev + fib_current;
        fib_prev := fibonacci_number;
        RETURN NEXT;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
