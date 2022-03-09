CREATE DATABASE IF not exists my_database
USE my_database;
DROP TABLE IF EXISTS t_mydata;

CREATE TABLE t_mydata( id int(10), name varchar(255) );

INSERT INTO t_mydata(id,name) VALUES(1, "Takeda");
INSERT INTO t_mydata(id,name) VALUES(2, "すらりん");
