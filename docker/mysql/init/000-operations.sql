-- FIRST OPERATIONS TO INIT

-- CREATE DATABASE IF NOT EXISTS `optional_database`;
-- GRANT ALL PRIVILEGES ON optional_database.* TO 'dbuser'@'%';

-- EXAMPLE

--# create databases
--CREATE DATABASE IF NOT EXISTS `primary`;
--CREATE DATABASE IF NOT EXISTS `secondary`;

--# create root user and grant rights
-- CREATE USER 'root'@'localhost' IDENTIFIED BY 'local';
-- GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';

-- GRANT ALL PRIVILEGES ON *.* TO 'usernamedb'@'%';

--DROP USER IF EXISTS 'MYSQL_USER';
--CREATE USER 'MYSQL_USER'@'%';
--CREATE DATABASE IF NOT EXISTS MYSQL_DATABASE;
--GRANT ALL ON MYSQL_DATABASE.* TO 'MYSQL_USER'@'%' IDENTIFIED BY 'MYSQL_PASSWORD';
 --------------your new NewDB----------------------
--CREATE DATABASE IF NOT EXISTS NewDB;
-- GRANT ALL ON dbapp.* TO 'dbuser'@'%' IDENTIFIED BY 'dbpass';
-- GRANT ALL ON database_one.* TO 'usernamedb'@'%' IDENTIFIED BY 'passworduserbb';
-- GRANT ALL ON database_two.* TO 'usernamedb'@'%' IDENTIFIED BY 'passworduserbb';
