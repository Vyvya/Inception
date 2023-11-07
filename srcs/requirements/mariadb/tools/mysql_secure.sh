#!/bin/bash
# https://gist.githubusercontent.com/Mins/4602864/raw/f46009ff422ec580dbe3b199a25bfc944d0c5eb2/mysql_secure.sh

PWD=
SECURE_MYSQL=$(expect -c "

set timeout 10
spawn mysql_secure_installation

expect \"Enter current password for root (enter for none):\"
send \"$PWD\r\"

expect \"Change the root password?\"
send \"n\r\"

expect \"Remove anonymous users?\"
send \"y\r\"

expect \"Disallow root login remotely?\"
send \"y\r\"

expect \"Remove test database and access to it?\"
send \"y\r\"

expect \"Reload privilege tables now?\"
send \"y\r\"

expect eof
")

echo "$SECURE_MYSQL"
