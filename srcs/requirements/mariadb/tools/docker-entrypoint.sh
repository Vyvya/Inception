#Create a database and user and give him the access to the database then FLUCH PRIVILEGES

#start MySQL
service mysql start;

#create a table, with the name of the environmental variable SQL_DATABASE, defined in .env, send by docker-compose.yaml
mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"

#create a user: SQL_USER, if it doesnt exist, with password SQL_PASSWORD, defined in .env
mysql -e "CREATE USER IF NOT EXISTS ${SQL_USER}@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

#give all rights to SQL_USER, with password SQL_PASSWORD for the table SQL_DATABASE
mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO ${SQL_USER}@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

#change the rights root of localhost, with password root SQL_ROOT_PASSWORD
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

#refresh all, so that MySQL takes changes into account
mysql -e "FLUSH PRIVILEGES;"

#restart MySQL for all this to take effect
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

#to keep container running
exec mysqld_safe