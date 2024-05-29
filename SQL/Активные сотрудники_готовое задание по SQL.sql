Таблица - Employees
Колонки    
birth_date
last_name
first_name
middle_name
employee_id
manager_employee_id
employee_status
employment_weight
start_date
end_date
department_id
done

Комментарий
Дата рождения сотрудника
Фамилия сотрудника
Имя сотрудника
Отчество сотрудника
Табельный номер сотрудника
Табельный номер руководителя сотрудника
Статус сотрудника: w-работает, f-уволен
Процент занятости сотрудника
Дата начала работы
Дата конца работы
ID организационной единицы
Признак обработки: 1-строка обработат, 0-не обработана.

Таблица - Organizations
Колонки
Department_id
Department_name
Company_id
Company_name
Done

Комментарий
ID орг. единицы
Наименование орг. единицы
ID компании
Наименование компании
Признак обработки: 1-строка обработат, 0-не обработана.

Задание 1. Вывести ФИО, дату рождения и табельный номер всех активных сотрудников
компании ООО «Газпромнефть-Ямал».

SELECT last_name, first_name, middle_name, birth_date, employee_id
FROM Employees
INNER JOIN Organizations ON Employees.department_id = Organizations.department_id
WHERE Organizations.company_name = 'ООО «Газпромнефть-Ямал»' AND Employees.employee_status = 'w';

Задание 2. Вывести ID компании, наименование компании и количество активных
сотрудников каждой компании с процентом занятости от 50% до 100%.

SELECT Organizations.company_id, Organizations.company_name, Count(*)
FROM Organizations
INNER JOIN Employees ON Organizations.department_id = Employees.department_id
WHERE Employees.employment_weight between 50 and 100
And Employees.employee_status = 'w'
Group by Organizations.company_id, Organizations.company_name



