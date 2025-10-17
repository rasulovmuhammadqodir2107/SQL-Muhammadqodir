1. select top (5) * from Employees
   order by Salary desc;
  
2.  select distinct Category
    from Products;

3.  select * from Products
    where price > 100;

4.  select * from Customers
    where FirstName LIKE 'A%';

5.  select * from Products
    order by Price asc;

6.  select * from Employees
    where Department = 'HR' AND Salary >= 60000;

7.  select FirstName, isnull(Email, 'noemail@example.com') as ConfirmedEmail from Employees;

8.  select * from Products
    where Price BETWEEN 50 AND 100;

9. va 10.  
    select distinct ProductName, Category
    from Products order by ProductName desc;

11. select top (10) * from Products
    order by Price desc;

12. select coalesce(FirstName, LastName) as Name
    from Employees;

13. select distinct Category, Price
    from Products;

14. select * from Employees
    where Department = 'Marketing' AND Age BETWEEN 30 AND 40;

15. select * from Employees
    order by Salary desc
	offset 10 rows fetch next 10 rows only;

16. select * from Products
    where Price <= 1000 AND StockQuantity > 50
	order by StockQuantity asc;

17. select * from Products
    where ProductName LIKE '%e%';
	
18. select * from Employees
    where Department IN ('HR', 'IT', 'Finance');

19. select * from Customers
    order by City asc, PostalCode desc;

20. select top (5) * from Products
    order by SaleAmount desc;

21. select FirstName + ' ' + LastName as FullName
    from Employees;

22. select distinct Category, ProductName, Price
    from Products where Price > 50;

23. select * from Products
    where Price < (select AVG(Price) * 0.1 from Products);

24. select * from Employees
    where Age < 30 AND Department IN ('HR', 'IT');

25. select * from Customers
    where Email LIKE '%@gmail.com';

26. select * from Employees
    where Department = 'Sales' AND Salary = (select MAX(Salary) from Employees where Department = 'Sales');

27. select * from Orders
    where LATEST_DATE BETWEEN DATEADD(DAY, -180, GETDATE()) AND GETDATE(); 
