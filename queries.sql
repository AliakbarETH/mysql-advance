mysql> CREATE FUNCTION GETMANAGERIDSUM(manager_id DECIMAL(5,2)) RETURNS DECIMAL(5,2) DETERMINISTIC BEGIN IF( manager_id > 100 AND manager_id < 300) THEN SET manager_id = manager_id -(manager_id *0.1); ELSEIF( manager_id > 500) THEN SET manager_id = manager_id -(manager_id * 0.2) ; END IF; RETURN (manager_id ) ; END //

SELECT GETMANAGERIDSUM(300) ;

CREATE PROCEDURE GetAverageSalary(OUT LowSalary INT, OUT HighSalary INT) BEGIN SELECT COUNT(salary) INTO LowSalary FROM employees WHERE salary <50 ; SELECT COUNT(salary) INTO HighSalary  FROM employees WHERE salary >=50; END //

CALL GetAverageSalary(@Low, @High) ;

SELECT @Low, @High;

