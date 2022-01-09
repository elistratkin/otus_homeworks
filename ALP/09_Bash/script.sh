#!/bin/bash
lockfile=access.lock
sendto=test@test.com
X=5
Y=5

startdate=`date --date="1 hours ago" +%d/%b/%Y:%H`
enddate=`date +%d/%b/%Y:%H`

send_mail()
{
        (
cat - <<END
Отчет за период с $startdate по $enddate
$X IP адресов (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта
`cat access.log | grep $startdate | awk '{print $1}' | sort | uniq -c | sort -nr | head -$X`
$Y запрашиваемых адресов (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта
`cat access.log | grep $startdate | awk '{print $7}' | sort | uniq -c | sort -nr | head -$Y`
Все ошибки c момента последнего запуска
`cat access.log | grep $startdate | awk {'print $9'} | sed 's/"-"/400/g' | awk '$1 <= 599 && $1 >= 400' | sort | uniq -c | sort -nr`
Список всех кодов возврата с указанием их кол-ва с момента последнего запуска
`cat access.log | grep $startdate | awk '{print $9}' |sed 's/"-"/400/g' | sort | uniq -c | sort -nr`
END
) | mail -s "Parse web server log" $1
}

if ( set -o noclobber; echo "$$" > "$lockfile") 2> /dev/null;
	then
        trap 'rm -f $lockfile; exit $?' INT TERM EXIT
        send_mail $sendto
        rm -r $lockfile
        trap - INT TERM EXIT
	else
		echo "Failed to acquire lockfile: $lockfile."
fi
