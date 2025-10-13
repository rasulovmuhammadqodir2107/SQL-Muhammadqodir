1. BULK INSERT - bu SQL SERVERda tashqi fayldan (csv, txt yoki dat) fayllarda malumotlarni togridan-togri tez va qulay tarzda jadvalga yuklash uchun ishlatiladi. Yani bu usul yordamida birma-bir insert bilan kiritmasdan bir martada bazaga yuklash mumkin.

2. csv, txt, xml, json

3. create table Products (
ProductID INT PRIMARY KEY, 
ProductName VARCHAR(50), 
Price DECIMAL(10,2)
)

4. insert into Products (ProductID, ProductName, Price)
   values (1, 'Gosht', 150000), 
	      (2, 'Guruch', 15000),
		  (3, 'Sabzi', 10000)

5. NULL - bu turdagi ustunlarga qiymat kiritsa ham boladi kiritilmasa NULL nomalum deganini bildiradi.
   NOT NULL - bu turdagi ustunlar bosh kelmasligi kerak yani ichida malumot bolishi shart.

6. alter table Products
   add constraint unique_product_name
   unique (ProductName)

7. "--" belgisi bilan boshlangan satr bir qatorli izoh hisoblanadi.

   "/* ... */" orasidagi matn esa bir nechta qatorli izoh bo‘lishi mumkin.

8. alter table Products
   add CategoryID INT

9. create table Categories (
   CategoryID INT PRIMARY KEY,
   CategoryName VARCHAR(50) UNIQUE
   )

10. SQL SERVERda ustunga IDENTITY ni qoshish orqali avtomatik tarzda osuvchi (inkremental) qiymat hosil qiluvchi ustun hisoblanadi. Yani yangi record qoshilsa bu ustunga ozi avtomatik raqam beradi.

11. BULK INSERT Products
    FROM 'C:\Users\Downloads\Products.txt'
    WITH (
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n',    
    FIRSTROW = 2             
);

12. ALTER TABLE Products
    ADD CONSTRAINT FK_Products_Categories
    FOREIGN KEY (CategoryID)
    REFERENCES Categories(CategoryID);

13. PRIMARY KEY - Jadvaldagi asosiy (unique) identifikator, NULL qiymat qabul qilmaydi, har bir jadvalda faqat bitta PRIMARY KEY bolishi mumkin
    UNIQUE KEY - Ustundagi qiymatlar takrorlanmasligi kerak, NULL qiymatni qabul qilishi mumkin, bir jadvalda bir nechta UNIQUE KEY bolishi mumkin

14. ALTER TABLE Products
    ADD CONSTRAINT chk_price
    CHECK (Price > 0);

15. ALTER TABLE Products
    ADD Stock INT NOT NULL DEFAULT 0;

16. UPDATE Products
    SET Price = ISNULL(Price, 0);

17. SQL Serverda FOREIGN KEY constraint - bu ikki jadval orasidagi boglanishni (relationship) taminlaydigan cheklovdir yani jadvaldagi ustunni boshqa jadvaldagi qiymatga mos bolishini taminlaydi.

18 va 19. create table Customers  (
          CustomerID INT PRIMARY KEY IDENTITY(100,10),
          CustomerName VARCHAR(50) NOT NULL,
          Age INT,
          CONSTRAINT chk_age CHECK (Age >= 18)
);
 
20. create table OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    PRIMARY KEY (OrderID, ProductID)
);

21. ISNULL - Bu funksiya bitta qiymatni tekshiradi. Agar u NULL bolsa, orniga siz belgilagan qiymatni qoyadi.
    COALESCE - Bu funksiya bir nechta qiymatlarni ketma-ket tekshiradi va birinchi NULL bolmagan qiymatni qaytaradi.

22. create table Employees (
    EmpID INT PRIMARY KEY,
	Email NVARCHAR(50) UNIQUE
);

23. create table Departments (
	DeptID INT PRIMARY KEY,
	DeptName VARCHAR(50)
	);

	create table People  (
	PersonID INT PRIMARY KEY,
	PersonName VARCHAR(50),
	DeptID INT
	FOREIGN KEY (DeptID)
	REFERENCES Departments(DeptID)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);
