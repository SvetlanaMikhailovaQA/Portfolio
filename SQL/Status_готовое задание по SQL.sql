Таблица A
Колонки:
ID
STATUS
ERROR
DATE_TIME
 
Возможные значения колонки STATUS: TobeProcessed, InProgress, Processed, Error

Таблица B
Колонки:
ID (по которым записи таблиц А и B соотносятся)
NAME

Задание:

1) Выбрать из таблицы А запись с ID=160188320
SELECT *
FROM A
WHERE ID = 160188320

2) Изменить в таблице A для 10 записей STATUS ‘TobeProcessed’ – на статус ‘Processed’
UPDATE A 
SET STATUS ='Processed'
WHERE STATUS ='TobeProcessed'
LIMIT 10

3) Посчитать количество записей в таблице А со всеми разными статусами
SELECT STATUS,
COUNT(STATUS) AS COUNT
FROM A 
GROUP BY STATUS

4) Выбрать запись со значением STATUS = 'In Progress' и значением NAME ='test'
SELECT *
FROM A
INNER JOIN B ON A.ID = B.ID
WHERE A.STATUS = 'InProgress' AND B.NAME = 'test'