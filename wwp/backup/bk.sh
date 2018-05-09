database=`mysql --user=hassanemam --password='' -e "SHOW DATABASES"`
for db in $database; do
    echo "$db"
    mysqldump --user="hassanemam" --password='' --databases "$db" > ./"$db".sql
    gzip "$db"
done
