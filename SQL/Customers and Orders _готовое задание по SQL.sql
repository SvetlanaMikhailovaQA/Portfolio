Таблица 1 – Customers.
Колонки
CustomerID
CompanyName
Address
City
Country

Таблица 2 – Orders.
Колонки
OrderID
CustomerID
OrderDate
OrderSum


Необходимо написать запросы, которые будут выводить следующую информацию:
Вывести названия всех компаний, которые не выполнили заказ с 15.11.1996 – 18.02.1997 
SELECT  CompanyName 
FROM  Customers 
lEFT JOIN Orders ON  Customers.CustomerID = Orders. CustomerID WHERE  OrderDate  NOT BETWEEN '15.11.1996' AND '18.02.1997' 

Вывести названия компаний поставщиков, которые находятся в México D.F.;
SELECT CompanyName FROM Customers WHERE City = 'México D.F.'

Вывести только те заказы, которые были оформлены с 12.12.1996 по 18.02.1997;
SELECT OrderID FROM Orders WHERE OrderDate BETWEEN '12.12.1996' AND '18.02.1997'

Вывести только тех заказчиков,  название компании которых начинаются с 'An';
SELECT CompanyName FROM Customers WHERE CompanyName LIKE  'An%'

Вывести названия компаний и заказы, которые они оформили, с суммой заказа более 17000. Использовать соединение таблиц. 
SELECT CompanyName, OrderID 
FROM Customers 
INNER JOIN  Orders ON Customers.CustomerID = Orders. CustomerID
WHERE  Orders.OrderSum > 17000

Вывести следующие колонки: имя поставщика, сумма заказа. Результаты отсортировать по поставщикам в порядке убывания:
SELECT CompanyName, OrderSum
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders. CustomerID
ORDER by CompanyName DESC

Вывести следующие колонки: имя поставщика, дата заказа. Вывести таким образом, чтобы все заказчики из таблицы 1 были показаны в таблице результатов.
SELECT CompanyName, OrderDate
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders. CustomerID

Написать запрос, выводящий количество работающих счетов (депозитов) с остатком более 0 по каждому клиенту в виде такой таблицы:
Колонки
ФИО клиента
Рубли
Доллары
Евро

SELECT Clients.ClientName AS [ФИО клиента],
COUNT (CASE When Deposits. Currency = 'RUB' THEN 1 END) AS [Рубли],
COUNT (CASE When Deposits. Currency = 'USD' THEN 1 END) AS [Доллары],
COUNT (CASE When Deposits. Currency = 'EUR' THEN 1 END) AS [Евро]
From Clients 
INNER Join Deposits ON Deposits.ClientID = Clients.ClientID
INNER Join Status ON Deposits. StatusID = Status. StatusID
Where Status.StatusCode = 'WORK' and Deposits. Saldo > 0
GROUP by Clients.ClientName
