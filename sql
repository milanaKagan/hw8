create or replace FUNCTION sp_twice(x int) RETURNS int
language plpgsql AS
    $$
        DECLARE
            twice int := 0;
        BEGIN
            twice := x*2;
            RETURN twice;
        END;
    $$;

select * from sp_twice(4);

create or replace FUNCTION sp_half(x int, OUT div int, OUT modulu int) AS
    $$
        BEGIN
            div := x/2;
			modulu := x%2;
        END;
    $$ LANGUAGE plpgsql;

select * from sp_half(17);

create or replace FUNCTION sp_calc(x int, y int, z int, OUT res int, OUT modulu int) AS
    $$
        BEGIN
            res := x*y/z;
			modulu :=x*y%z;
        END;
    $$ LANGUAGE plpgsql;

select * from sp_calc(5,2,3);

create or replace FUNCTION sp_twice_xy(x int,y int, OUT xmult2 int,
									   OUT ymult2 int) AS
    $$
        BEGIN
            xmult2 := (select * from sp_twice(x));
			ymult2 := (select * from sp_twice(y));
        END;
    $$ LANGUAGE plpgsql;

select * from sp_twice_xy(2,5);

create or replace FUNCTION  sp_statistics(x double precision, y double precision ,OUT the_mul double precision,
     OUT the_div double precision, OUT sqrt_x double precision, OUT sqrt_y double precision, 
     OUT power_x_y double precision) AS
    $$
        BEGIN
            the_mul:=x*y;
			the_div:=x/y;
			sqrt_x:=(select * from sqrt(x));
			sqrt_y:=(select * from sqrt(y));
			power_x_y:=(select * from power(x, y));
			
			
        END;
    $$ LANGUAGE plpgsql;

select * from sp_statistics(2,5);

