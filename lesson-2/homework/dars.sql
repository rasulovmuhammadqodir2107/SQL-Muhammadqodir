1. create table EmployeesTable (
   EmployeeID INT,
   Name VARCHAR(50),
   Salary DECIMAL(10,2)
)

2. insert into EmployeesTable values (1, 'Muhammadqodir', 10000)

   insert into EmployeesTable (EmployeeID, Name, Salary)
   values (2, 'Bexruz', 9500), (3, 'Abbos', 6000)

   --delete from EmployeesTable
   --where EmployeeID = 4

   select * from EmployeesTable

3. update EmployeesTable
   set Salary = 7000
   where EmployeeID = 1;

4. delete from EmployeesTable
   where EmployeeID = 2;

5. Delete - bu ma’lumotlar orasidan faqat ayrimlarini olib tashlash uchun ishlatiladi.
   Truncate - bu barcha ma’lumotlarni olib tashlash uchun ishlatiladi, lekin jadval saqlanib qoladi.
   Drop - bu butun jadval bilan olib tashlash uchun ishlatiladi.

6. alter table EmployeesTable
   alter column Name VARCHAR (100);

7. alter table EmployeesTable
   add Department VARCHAR(50);

8. alter table EmployeesTable
   alter column Salary Float;

9. create table DepartmentsBackup (
   DepartmentID INT PRIMARY KEY,
   DepartmentName VARCHAR(50)
   )
   
   insert into DepartmentsBackup (DepartmentID, DepartmentName)
   values (1, 'IT'), (2, 'Management'), (3, 'Marketing'), (4, 'Finance'), (5, 'Accaountant')
   select * from DepartmentsBackup

10. truncate table EmployeesTable;

11. select * into Departments from DepartmentsBackup;
    select * from Departments
	

12. update EmployeesTable
    set Department = 'Management' where Salary > 5000;
	select * from EmployeesTable

13. truncate table EmployeesTable;

14. alter table EmployeesTable
    drop column Department;

15. EXEC sp_rename 'EmployeesTable', 'StaffMembers'
    select * from StaffMembers

16. drop table Departments;

17. create table Products (
   ProductID INT Primary Key, 
   ProductName VARCHAR(50), 
   Category VARCHAR(50), 
   Price DECIMAL (10,2),
   Bio VARCHAR(60)
) 
  
18. ALTER TABLE Products
    ADD CONSTRAINT chk_price
    CHECK (Price > 0);

19. alter table Products
    add StockQuantity INT;
	select * from Products

20. EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN'

21. insert into Products (ProductID, ProductName, ProductCategory, Price, Bio, StockQuantity)
    values (1, 'Gosht', 'Gosht mahsuloti', 150000, 'Qoy goshti', 50), 
	       (2, 'Guruch', 'Don mahsulotlari', 15000, 'Lazer', 70),
		   (3, 'Sabzi', 'Sabzavotlar', 10000, 'Sariq sabzi', 40), 
	       (4, 'Piyoz', 'Sabzavotlar', 5000, 'Dumoloq piyoz', 30),
		   (5, 'Yog', 'Yog mahsuloti', 20000, 'Semechka yogi', 80)

22. select * into ProductsBackup from Products;
    select * from ProductsBackup

23. EXEC sp_rename 'Products', 'Inventory';
    select * from Inventory

24. alter table Inventory
    drop CONSTRAINT chk_price;

	alter table Inventory
    alter column Price Float;

25. alter table Inventory
    add ProductCode Int Identity (1000,5);
