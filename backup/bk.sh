database=`mysql --user=root --password="hassan" -e "SHOW DATABASES"`
for db in $database; do
    echo "$db"
    mysqldump --user="root" --password="hassan" --databases "$db" > ./"$db".sql
    gzip "$db"
done
