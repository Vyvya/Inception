#Create a database

#démarrer MySQL
#La commande service permet de démarrer MySQL avec la commande associée
service mysql start;

#créer le table, du nom de la variable d’environnement SQL_DATABASE, indiqué dans mon fichier .env qui sera envoyé par le docker-compose.yml
mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"

#créer un utilisateur qui pourra la manipuler
#Je crée l’utilisateur SQL_USER s’il n’existe pas, avec le mot de passe SQL_PASSWORD , toujours à indiquer dans le .env
mysql -e "CREATE USER IF NOT EXISTS ${SQL_USER}@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

#donner tous les droits à cet utilisateur
#les droits à l’utilisateur SQL_USER avec le mot de passe SQL_PASSWORD pour la table SQL_DATABASE
mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO ${SQL_USER}@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

#Je change les droits root par localhost, avec le mot de passe root SQL_ROOT_PASSWORD
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

#Plus qu’à rafraichir tout cela pour que MySQL le prenne en compte.
mysql -e "FLUSH PRIVILEGES;"

#redémarrer MySQL pour que tout cela soit effectif
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

#Je commence déjà par éteindre MySQL.
exec mysqld_safe