--DATE FUNCTIONS--
--365.25 days in a year--

--GETDATE--
/*return the current date and time*/
SELECT GETDATE()
--SYSDATETIME--
/*return the date andf time of the computer being used*/
SELECT SYSDATETIME()
--DATEADD--
/*d for current day, m for current month, yy for current year*/
DATEADD(<d, m, or yy>, <number to add>, <column to add to>) AS "due_date" --to add 5 days--
--DATEDIFF--
/*d for current day, m for current month, yy for current year*/
DATEDIFF(<d, m, or yy>, OrderDate, ShippedDate) AS "ship_days" --to calculate the difference between dates--
--YEAR--
SELECT YEAR(OrderDate) AS "order_year" --to extract the year from a date--
--MONTH--
SELECT MONTH(OrderDate) AS "order_month" --to extract the month from a date--
--DAY--
SELECT DAY(OrderDate) AS "order_day" --to extract the day from a date--

--example--
SELECT DATEADD(d, 5, OrderDate) AS "due_date"
      ,DATEDIFF(d, OrderDate, ShippedDate) AS "ship_days"
FROM ORDERS;

--output a list of employees including their CONCAT name and their age - calculated from DOB--
SELECT CONCAT(FirstName, ' ', LastName) AS "name"
      ,DATEDIFF(YY, BirthDate, GETDATE()) AS "age"
FROM Employees;

SELECT CONCAT(FirstName, ' ', LastName) AS "name"
      ,ROUND((DATEDIFF(D, BirthDate, GETDATE()) / 365.25), 2) AS "age"
FROM Employees;

--Extract Year--
SELECT YEAR(e.BirthDate) AS "year_of_birth" FROM Employees e;
--Extract Month--
SELECT MONTH(e.BirthDate) AS "month_of_birth" FROM Employees e;
--Extract Day--
SELECT DAY(e.BirthDate) AS "day_of_birth" FROM Employees e;

/*SYSDATETIME v GETDATE*/
SELECT DATEDIFF(yy, e.HireDate, SYSDATETIME()) FROM Employees e;

SELECT DATEDIFF(yy, e.HireDate, GETDATE()) FROM Employees e;