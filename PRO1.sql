CREATE DATABASE COMPANYA1;

USE COMPANYA1;

CREATE TABLE EMPLOYEE(
EMP_NO INT ,
ENAME VARCHAR(30),
JOB VARCHAR(20),
MGR INT ,
SAL DECIMAL(10.2)

);

DESC EMPLOYEE;

INSERT INTO EMPLOYEE value(1,'NITHN','S DEV',111,'55000.33');
INSERT INTO EMPLOYEE value(3,'KRISHNA','UIUX',111,'45000.33');
INSERT INTO EMPLOYEE value(4,'YASHU','UIUX',111,'65000.33');
INSERT INTO EMPLOYEE value(5,'MOHI','S DEV',111,'65000.33');


SELECT *FROM EMPLOYEE;


CREATE USER IF NOT EXISTS 'user1'@'localhost' identified by 'user1';
GRANT ALL PRIVILEGES ON COMPANYA1.EMPLOYEE TO 'user1'@'localhost' ;