1. select ProductName as Name
   from Products;

2. select * from Customers as Client;

3. select ProductName from Products
   UNION
   select ProductName from Products_Discounted;

4. select * from Products
   INTERSECT
   select * from Products_Discounted;

5. select distinct FirstName, Country
   from Customers;

6. select 
     Price, 
     CASE
        when Price > 1000 then 'High'
        when Price <= 1000 then 'Low'
        else 'None'
     END as Bio from Products;

7. select 
     StockQuantity,
     IIF(StockQuantity > 100, 'Yes', 'No') as Bio from Products_Discounted;

8. select ProductName from Products
   UNION
   select ProductName from Products_Discounted;

9. select * from Products
   EXCEPT
   select * from Products_Discounted;

10. select Price,
   IIF(Price > 1000, 'Expensive', 'Affordable') as Bio from Products;

11. select * from Employees
    where Age < 25 AND Salary > 60000;

12. update Employees
    set Salary = Salary * 1.10
	where Department = 'HR' OR EmpID = 5;

13. select 
       SaleAmount,
       CASE
	     when SaleAmount > 500 then 'Top Tier'
	     when SaleAmount BETWEEN 200 AND 500 then 'Mid Tier'
	   else 'Low Tier'
       END as Bio from Sales;

14. select CustomerID from Orders
    EXCEPT
    select CustomerID from Sales;

15. select
      CustomerID, Quantity,
	  CASE
	  when Quantity = 1 then '3%'
	  when Quantity BETWEEN 1 AND 3 then '5%'
	  else '7%'
	  END as DiscountPercentage from Orders;
