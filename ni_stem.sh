read -e -p "Local folder: " folder
read -e -p "Local database username: " username
read -e -p "Local database password: " password
read -e -p "Local database name: " database

if [ "$folder" = "" ]; then
	echo "Must specify folder"
	exit
fi
if [ "$username" = "" ]; then
	echo "Must specify username"
	exit
fi
if [ "$password" = "" ]; then
	echo "Must specify password"
	exit
fi
if [ "$database" = "" ]; then
	echo "Must specify database"
	exit
fi


./general.sh $folder $username $password $database 'git@github.com:smithandrobot/ni_stem.git'