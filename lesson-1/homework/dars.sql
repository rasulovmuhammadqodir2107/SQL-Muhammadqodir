1. Data - bu xom ma'lumot ya'ni hali tartibga solinmagan yoki ishlov berilmagan raqamlar, so'zlar, rasmlar va hokozolar.
   Database - bu ma'lumotlar saqlanadigan tizim bo'lib, ko'p sonli ma'lumotlarni tartibli holatda saqlash, izlash va tahrirlash imkonini beradigan tizim.
   Relational database - bu bir nechta jadvallar orqali bog'langan ma'lumotlar bazasi.
   Table - bu jadval bo'lib u o'zida ma'lumotlarni saqlaydi, unda satrlar ya'ni (rows) hamda ustunlar ya'ni (columns)dan iborat bo'ladi.
2. 1) Ma’lumotlarni saqlash va boshqarish (Data Storage & Management) SQL Server - bu katta hajmdagi ma'lumotlarni xavfsiz saqlash va ularni tartib bilan boshqarish imkonini beradi.
   2) SQL (Structured Query Language) bu ma'lumotlar bilan ishlash tili
   3) Xavfsizlik (Security) SQL Server ma’lumotlarni parol, login, va foydalanuvchi huquqlari orqali himoya qiladi.
   4) Zaxira nusxa va tiklash (Backup and Restore) SQL Serverda ma’lumotlarni zaxira qilish (backup) va yo‘qolsa qayta tiklash (restore) funksiyalarini bajaradi.
   5) Ishonchlilik va tezlik (High Performance & Reliability) SQL Server katta tizimlarda ham tez ishlaydi va uzluksiz ishlashni ta’minlaydi.
3. 1) Windows Authentication Mode (Windows orqali kirish) Windows tizimidagi login va parol orqali kiriladi. Afzalligi alohida login parol kiritish shart emas. Hamda xavfsiz chunki foydalanuvchi Windows tizimi orqali tasdiqlanadi.
   2) SQL Server Authentication Mode (SQL Server orqali kirish) Bu rejimda foydalanuvchi SQL Server ichida yaratgan login va parol orqali tizimga kiradi. Afzalligi har kim Windows foydalanuvchilari bo'lmasa ham kira oladi. Hamda Boshqa kompyuterdan tarmoq orqali ulanayotgan foydalanuvchilar uchun qulay.

4. create database SchoolDB
   
   use SchoolDB

5. create table Students (StudentID int PRIMARY KEY, Name varchar(50), Age int)


6. SQL Server - bu katta hajmdagi ma'lumotlarni xavfsiz saqlash va ularni tartib bilan boshqarish imkonini beradi. Oddiy qilib aytganda SQL Server bu - ma'lumotlar ombori.
   SSMS (SQL Server Management Studio) - bu SQL Server bilan ishlash uchun yaratilgan daturiy interfeys. Unda ma'lumotlarni yaratish, so'rov yozish yoki jadval ko'rish uchun ishlatiladi.
   SQL (Structured Query Language) - bu ma'lumotlar bilan ishlash tili.

7. DQL (Data Query Language) - ma'lumotlarni o'qish. Example: SELECT * FROM Students
   DDL (Data Definition Language) - jadval tuzish yoki o'zgartirish. Example: CREATE TABLE. ALTER, DROP
   DML (Data Manipulation Language) - ma'lumotlar qo'shish yoki o'zgartirish. Example: INSERT, UPDATE, DELETE
   DCL (Data Control Language) - huquqlarni bo'shqarish. Example: GRANT, REVOKE
   TCL (Transaction Control Language) - o'zgarishlarni saqlash yoki bekor qilish. Example: COMMIT, ROLLBACK

8. insert into Students values (1, 'Muhammadqodir', 24), (2, 'Bexruz', 24), (3, 'Abbos', 24), (4, 'Sanjar', 24), (5, 'Izzatilla', 21)

   select * from Students

9. Mening kompyuterimga kiramiz va uning ichidagi C diskka kiramiz, u yerdan Program Files nomli papkani topib o'sha papkani ichiga kiramiz. U yerdan Microsoft SQL Sever nomli papkaga kiramiz. MSSQL16.MSSQLSERVER nomli papkaga kiramiz va uning ichidagi MSSQL papkasiga kiramiz va nihoyat oxirigi papka Backup papkasiga kiramiz va u yerdan AdventureWorksDW2022 nomli fileni topishimiz mumkin.
