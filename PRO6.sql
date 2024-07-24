CREATE DATABASE COMPANY6;

USE COMPANY6;

CREATE TABLE O_ROLL_CALL(
    STUDENT_ID INT PRIMARY KEY,
    STUDENT_NAME VARCHAR(30),
    BIRTH_DATE DATE
);

INSERT INTO O_ROLL_CALL VALUES (1, 'RAME', '1995-08-01');
INSERT INTO O_ROLL_CALL VALUES (2, 'SHAM', '2000-05-12');

CREATE TABLE N_ROLL_CALL(
    STUDENT_ID INT PRIMARY KEY,
    STUDENT_NAME VARCHAR(30),
    BIRTH_DATE DATE
);

INSERT INTO N_ROLL_CALL VALUES (2, 'SHAM', '2000-05-12');
INSERT INTO N_ROLL_CALL VALUES (3, 'MAHESH', '2002-05-12');
INSERT INTO N_ROLL_CALL VALUES (4, 'RAMESH', '2005-05-12');

DELIMITER //
CREATE PROCEDURE merge_roll_data()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE n_id INT;
    DECLARE n_name VARCHAR(30);
    DECLARE n_birth_date DATE;
    DECLARE n_cursor CURSOR FOR 
        SELECT student_id, student_name, birth_date 
        FROM N_ROLL_CALL;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN n_cursor;
    cursor_loop: LOOP
        FETCH n_cursor INTO n_id, n_name, n_birth_date;
        IF done THEN 
            LEAVE cursor_loop;
        END IF;
        
        IF NOT EXISTS(SELECT 1 FROM O_ROLL_CALL WHERE student_id = n_id) THEN 
            INSERT INTO O_ROLL_CALL (student_id, student_name, birth_date) 
            VALUES (n_id, n_name, n_birth_date);
        END IF;
        END LOOP;
    CLOSE n_cursor;
END //
DELIMITER ;

CALL merge_roll_data();
SELECT *FROM O_ROLL_CALL;
