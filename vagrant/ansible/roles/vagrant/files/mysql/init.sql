GRANT all ON *.* to 'root'@'%' identified by '';
FLUSH PRIVILEGES;

CREATE SCHEMA IF NOT EXISTS `db_vagrant` COLLATE utf8_general_ci;
