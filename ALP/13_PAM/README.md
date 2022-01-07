## PAM

<li> 1. Запретить всем пользователям, кроме группы admin логин в выходные (суббота и воскресенье), без учета праздников</li>
<li> 2. Дать конкретному пользователю права работать с докером и возможность рестартить докер сервис</li><br>

**Решение:**<br>
1. Запретить всем пользователям, кроме группы admin логин в выходные (суббота и воскресенье), без учета праздников.<br><br>
Для выполнения поставленной задачи напишем скрипт /usr/local/bin/test_login.sh для модуля pam-exec, который будет проверять день недели и принадлежность пользователя группе admin, если это выходной день.
```bash
#!/bin/bash
if [[ " `date +%u` " > " 5 " ]]
 then
   if [ `grep "admin.*$(echo $PAM_USER)" /etc/group` ]
    then
     exit 0
    else
     exit 1
   fi
else
 exit 0
fi
```
<br>
Теперь подключим выполнение данного скрипта в PAM, добавив в /etc/pam.d/sshd строку <br>
<em><strong> account    required     pam_exec.so /usr/local/bin/test_login.sh </strong></em>
     <br><br>
2. Дать конкретному пользователю права работать с докером и возможность рестартить докер сервис<br><br>
Для выполнения поставленной задачи воспользуемся возможностями PolKit. Добавим новое правило /etc/polkit-1/rules.d/01-polkit.rules со следующим содержимым <br><br>

> polkit.addRule(function(action, subject) { <br>
>  if (action.id == "org.freedesktop.systemd1.manage-units" && <br>
>  action.lookup("unit") == "docker.service" && <br>
>  subject.user === "какой-то там user") <br>
>  {return polkit.Result.YES;}});<br>
