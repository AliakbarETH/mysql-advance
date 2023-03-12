mysql> CREATE FUNCTION GETMANAGERIDSUM(manager_id DECIMAL(5,2)) RETURNS DECIMAL(5,2) DETERMINISTIC BEGIN IF( manager_id > 100 AND manager_id < 300) THEN SET manager_id = manager_id -(manager_id *0.1); ELSEIF( manager_id > 500) THEN SET manager_id = manager_id -(manager_id * 0.2) ; END IF; RETURN (manager_id ) ; END //

SELECT GETMANAGERIDSUM(300) ;

CREATE PROCEDURE GetAverageSalary(OUT LowSalary INT, OUT HighSalary INT) BEGIN SELECT COUNT(salary) INTO LowSalary FROM employees WHERE salary <50 ; SELECT COUNT(salary) INTO HighSalary  FROM employees WHERE salary >=50; END //

CALL GetAverageSalary(@Low, @High) ;

SELECT @Low, @High;

DELIMITER //

CREATE TRIGGER OrderQuantityCheck BEFORE INSERT ON Orders FOR EACH ROW BEGIN IF NEW.Quantity <0 THEN SET NEW.Quantity = 0 ; END IF; END //

DELIMITER ;

DROP TRIGGER IF EXISTS Lucky_Shrub.OrderQuantityCheck ;


CREATE EVENT DailyRestock ON SCHEDULE EVERY 1 DAY DO BEGIN IF Products.NoOfItems < 50 THEN Products SET NoOfItems= 50; END IF ;  END //


CREATE EVENT GenerateRevenueReport ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 12 HOUR DO BEGIN INSERT INTO ReportData(OrderID, ClientID, ProductID, Quantity,Cost, Date ) SELECT * FROM Orders WHERE Date BETWEEN '2022-08-01' AND '2022-08-31'; END //


START TRANSACTION 

SQL_Statement_1

SQL_Statement_2

SQL_Statement_3

ROLLBACK/ COMMIT

Common Table Expression - CTE
