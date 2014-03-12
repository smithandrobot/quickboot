folder=$1
username=$2
password=$3
database=$4
repo=$5

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
if [ "$repo" = "" ]; then
	echo "Must specify git repo"
	exit
fi

echo 'Installing Drupal'
mysqladmin --user=$username --password=$password create $database
drush dl drupal --drupal-project-rename=$folder
cd $folder
drush site-install standard --db-url=mysql://$username:$password@localhost/$database --site-name=$folder --account-name=admin --account-pass=admin -y
echo 'Cloning git repo'
rm -rf sites/all
git clone $repo sites/all
echo 'Go setup apache config'
