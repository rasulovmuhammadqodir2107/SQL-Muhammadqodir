 Easy Tasks

1. with Numbers as (
  select 1 as n
  UNION ALL
  select n + 1 from Numbers where n < 1000
)
  select * from Numbers 
  OPTION (MAXRECURSION 0);

2. select e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) as FullName, s.TotalSaleAmount
   from Employees e
   join (
   select EmployeeID, SUM(SalesAmount) as TotalSaleAmount
   from Sales s
   group by EmployeeID
) as s ON e.EmployeeID = s.EmployeeID;

3. with AvgSalary as (
   select CONCAT(FirstName, ' ', LastName) as FullName, AVG(Salary) as AvgSal
   from Employees
   group by FirstName, LastName
)
  select * from AvgSalary

4. select p.ProductID, p.ProductName, s.MaxSalesAmount
   from Products p
   join (
   select ProductID, MAX(SalesAmount) as MaxSalesAmount
   from Sales s
   group by ProductID
) as s ON p.ProductID = s.ProductID;

5. with Numbers as (
   select 1 as n
   UNION ALL
   select n * 2 from Numbers where n * 2 < 1000000
)
  select * from Numbers;

6. with CountSales as (
   select s.EmployeeID, COUNT(*) as CountS
   from Sales s
   group by EmployeeID
)
select e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) as FullName, s.CountS
from CountSales s
join Employees e ON s.EmployeeID = e.EmployeeID
where s.CountS > 5;

7. with sumTSA as (
   select s.ProductID, SUM(SalesAmount) as TotalSalesAmount
   from Sales s
   group by ProductID
)
select p.ProductID, p.ProductName, st.TotalSalesAmount
from sumTSA st
join Products p ON st.ProductID = p.ProductID
where st.TotalSalesAmount > 500;

8. with AboveAvg as (
   select EmployeeID, FirstName, LastName, Salary,
  (select AVG(Salary) from Employees) as AvgSalary
   from Employees
) 
  select EmployeeID, CONCAT(FirstName, ' ', LastName) as FullName, Salary, AvgSalary from AboveAvg
  where Salary > AvgSalary;

Medium Tasks

1. select top 5 e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) as FullName, s.NumberOfSales
   from Employees e
   join (
   select EmployeeID, COUNT(EmployeeID) as NumberOfSales
   from Sales s
   group by EmployeeID
) as s ON e.EmployeeID = s.EmployeeID
  order by s.NumberOfSales desc;

2. select p.CategoryID, SUM(s.SalesAmount) as TotalSAC
   from Products p
   join Sales s ON p.ProductID = s.ProductID
   group by p.CategoryID;

3. with FNumbers as (
    select Number as target, 1 as n, 1 as fn
    from Numbers1
    UNION ALL
    select target, n + 1, fn * (n + 1)
    from FNumbers
    where n < target     
)
select target as Number,
       fn as Factorial
from FNumbers
where n = target
order by Number;

4. with SepCte as(
  select id,
  LEFT(String, 1) as Char,
  RIGHT(String, LEN(String) - 1) as Remaining
  from Example
  UNION ALL
  select id,
  LEFT(Remaining, 1) Char,
  RIGHT(Remaining, LEN(Remaining) - 1) as Remaining
  from SepCte
  where LEN(Remaining) > 0
)
  select id, Char
  from SepCte
  order by id;

5. with CurrentMonth as (
  select SUM(SalesAmount) as TotalSales
  from Sales
  where MONTH(SaleDate) = MONTH(GETDATE())
  AND YEAR(SaleDate) = YEAR(GETDATE())
),
   PreviousMonth as (
   select SUM(SalesAmount) as TotalSales
   from Sales
   where MONTH(SaleDate) = MONTH(DATEADD(MONTH, - 1, GETDATE()))
   AND YEAR(SaleDate) = YEAR(DATEADD(MONTH, - 1, GETDATE()))
)
  select
  c.TotalSales as CurrentMonthSales,
  p.TotalSales as PreviousMonthSales,
  (c.TotalSales - p.TotalSales) as Difference
  from CurrentMonth c, PreviousMonth p;

6. select e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) as FullName, s.Quater, s.TotalSalesA
  from Employees e
  join (
  select EmployeeID, DATEPART(QUARTER, SaleDate) as Quater, SUM(SalesAmount) as TotalSalesA
  from Sales
  group by EmployeeID, DATEPART(QUARTER, SaleDate)
  ) as s ON e.EmployeeID = s.EmployeeID
  where s.TotalSalesA > 45000;

Difficult Tasks

1. with FibonacciCTE as (
  select 0 as n, 0 as Prev, 1 as Curr
  UNION ALL
  select n + 1,
  Curr as Prev,
  Prev + Curr as Curr
  from FibonacciCTE
  where n < 20
) 
 select n, Curr as FibonacciNumber
 from FibonacciCTE
 order by n
 OPTION (MAXRECURSION 1000);

4. select e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) as FullName, ts.TotalSaleL6M
   from Employees e
   join (
   select EmployeeID, SUM(SalesAmount) as TotalSaleL6M
   from Sales
   where SaleDate >= DATEADD(MONTH, -6, GETDATE())
   group by EmployeeID
) as ts ON e.EmployeeID = ts.EmployeeID
   join (
   select MAX(TotalSaleL6M) as MaxSale
   from (
   select EmployeeID, SUM(SalesAmount) as TotalSaleL6M
   from Sales
   where SaleDate >= DATEADD(MONTH, -6, GETDATE())
   group by EmployeeID
) as temp 
) as m ON ts.TotalSaleL6M = m.MaxSale;
