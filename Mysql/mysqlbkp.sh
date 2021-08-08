#!/bin/bash
bkpdir=/var/backups
mysqldump=`which mysqldump`
mysql=`which mysql`
data=`date +"%Y%m%d"`
### Script Backup ###
for dbase in `$mysql -N -e "show databases" -ss | grep -v "performance_schema\|information_schema"`
do
if [ ! -d "$bkpdir/$dbase" ]; then
mkdir -p $bkpdir/$dbase
fi
echo "Backup: $dbase"
#$mysqldump $dbase --single-transaction --quick --lock-tables=false | bzip2 > $bkpdir/$dbase/$dbase.$data.bz2
$mysqldump $dbase --single-transaction --quick | bzip2 > $bkpdir/$dbase/$dbase.$data.bz2
done;
### Retençao de 30 dias ###

find $bkpdir -ctime +30 -type f -name \*.bz2 -exec rm -f {} \;
