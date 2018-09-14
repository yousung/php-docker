CREATE USER 'homestead'@'localhost' IDENTIFIED WITH mysql_native_password BY 'secret';
GRANT ALL PRIVILEGES ON *.* TO 'homestead'@'localhost' WITH GRANT OPTION;

CREATE USER 'homestead'@'%' IDENTIFIED WITH mysql_native_password BY 'secret';
GRANT ALL PRIVILEGES ON *.* TO 'homestead'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES ;
