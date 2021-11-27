## Практические навыки работы с ZFS

**Цель:**<br>
Отрабатываем навыки работы с созданием томов export/import и установкой параметров. 

**Задачи:**<br>
<li> Определить алгоритм с наилучшим сжатием.<br>
  создать 4 файловых системы на каждой применить свой алгоритм сжатия;<br>
  для сжатия использовать либо текстовый файл либо группу файлов</li>
<li> Определить настройки pool’a.<br>
  с помощью команды zfs import собрать pool ZFS;<br>
  командами zfs определить настройки:<br>
  размер хранилища;<br>
  тип pool;<br>
  значение recordsize;<br>
  какое сжатие используется;<br>
  какая контрольная сумма используется<br></li>
<li> Найти сообщение от преподавателей<br>
  восстановить файл локально. zfs receive<br>
  найти зашифрованное сообщение в файле secret_message</li><br>
  
**Результат:**<br>
  В каталоге репозитория содержится
  <li> <a href="https://github.com/elistratkin/otus_homeworks/blob/main/ALP/ZFS/Vagrantfile">vagrantfile</a> с машиной, в которой провижином устанавливаются пакеты для работы с zfs;</li>
  <li> набор <a href="https://github.com/elistratkin/otus_homeworks/blob/main/ALP/ZFS/result.txt">команд</a> для выполнения каждой из поставленных задач;</li>
  <li> <a href="https://github.com/elistratkin/otus_homeworks/blob/main/ALP/ZFS/otus_zfs.log">лог</a> выполнения задач, записанный через scripts</li>