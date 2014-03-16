# bash <(curl -s https://raw.github.com/smithandrobot/quickboot/master/ni_stem.sh)

read -e -p "Local folder: " folder
read -e -p "Local database username: " username
read -e -p "Local database password: " password
read -e -p "Local database name: " database
repo='git@github.com:smithandrobot/ni_stem.git'
fabric='local_pull_dev'

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

curl -s https://raw.github.com/smithandrobot/quickboot/master/general.sh | bash -s $folder $username $password $database $repo $fabric
