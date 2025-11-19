1. create table #MonthlySales (
   ProductID INT,
   TotalQuantity INT,
   TotalRevenue DECIMAL(10,2)
)
   insert into #MonthlySales (ProductID, TotalQuantity, TotalRevenue)
   select s.ProductID, SUM(s.Quantity) as TotalQuantity, SUM(s.Quantity * p.Price) as TotalRevenue
   from Sales s
   JOIN Products p ON s.ProductID = p.ProductID
   where MONTH(SaleDate) = MONTH(GETDATE())
    AND  YEAR(SaleDate)  = YEAR(GETDATE())
   group by s.ProductID;
   
2. create view vw_ProductSalesSummary as
   select p.ProductID,
          p.ProductName,
		  p.Category,
          (s.Quantity * p.Price) as TotalQuantitySold
   from Products p
   JOIN Sales s ON p.ProductID = s.ProductID;
   drop function fn_GetTotalRevenueForProduct
3. create function dbo.fn_GetTotalRevenueForProduct(@ProductID INT)
   RETURNS DECIMAL(10,2)
   AS BEGIN 
           DECLARE @TotalRevenue DECIMAL(10,2) 
		   select @TotalRevenue = SUM(s.Quantity * p.Price)
           from Sales s
		   JOIN Products p ON s.ProductID = p.ProductID
		   where s.ProductID = @ProductID

    RETURN @TotalRevenue

	END;

4. create function dbo.fn_GetSalesByCategory(@Category VARCHAR(50))
	   RETURNS TABLE
	   AS RETURN
			select p.ProductName,
			SUM(s.Quantity) as TotalQuantity,
			SUM(s.Quantity * p.Price) as TotalRevenue
			from Sales s
			JOIN Products p ON s.ProductID = p.ProductID
			where p.Category = @Category
			group by p.ProductName
drop function dbo.fn_IsPrime
5. create function dbo.fn_IsPrime(@Number INT)
   RETURNS VARCHAR(10)
   AS BEGIN
           DECLARE @Check_Prime VARCHAR(10)
		   SET @Check_Prime = CASE
			   WHEN @Number <= 1 THEN 'No'
	           WHEN @Number = 2 THEN 'Yes'
	           WHEN EXISTS (
	           select 1 from master..spt_values
	           where type = 'p'
	           AND number BETWEEN 2 AND FLOOR(SQRT(@Number))
	           AND @Number % number = 0
	           ) THEN 'No'
	           ELSE 'Yes'
	           END
    RETURN @Check_Prime

	END;
 
6. create function fn_GetNumbersBetween(@Start INT, @End INT)
   RETURNS TABLE
   AS RETURN
            WITH NumbersCTE as
			(
			select @Start as Number
			UNION ALL
			select Number + 1
			from NumbersCTE
			where Number + 1 <= @End
			)
			select Number from NumbersCTE

7. DECLARE @N INT = 2

   select distinct Salary 
   from Employee
   order by Salary desc
   offset @N - 1 rows
   fetch next 1 rows only;

8. with AllFriends as
   (
   select requester_id as UserID, accepter_id as FriendID 
   from Friendship
   UNION ALL
   select  accepter_id as UserID, requester_id as FriendID
   from Friendship
   )
   select top 1
   UserID as Id,
   COUNT(FriendID) as TotalFriends
   from AllFriends
   group by UserID
   order by TotalFriends desc;

9. create view vOrderSummaryCustomers as
   select c.customer_id, c.name, SUM(o.amount) as TotalAmount
   from Customers c
   JOIN Orders o ON c.customer_id = o.customer_id
   group by c.customer_id, c.name

10. WITH YourTable AS (
    SELECT 1 AS RowNumber, 'Alpha' AS Workflow UNION ALL
    SELECT 2, NULL UNION ALL
    SELECT 3, NULL UNION ALL
    SELECT 4, NULL UNION ALL
    SELECT 5, 'Bravo' UNION ALL
    SELECT 6, NULL UNION ALL
    SELECT 7, NULL UNION ALL
    SELECT 8, NULL UNION ALL
    SELECT 9, NULL UNION ALL
    SELECT 10, 'Charlie' UNION ALL
    SELECT 11, NULL UNION ALL
    SELECT 12, NULL
)  
    SELECT t1.RowNumber,
       (SELECT TOP 1 Workflow
        FROM YourTable t2
        WHERE t2.RowNumber <= t1.RowNumber
          AND t2.Workflow IS NOT NULL
        ORDER BY t2.RowNumber DESC) AS Workflow
    FROM YourTable t1
    ORDER BY t1.RowNumber;
