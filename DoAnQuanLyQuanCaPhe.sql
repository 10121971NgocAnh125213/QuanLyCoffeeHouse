CREATE DATABASE DoAnQuanLyQuanCafe
GO

USE DoAnQuanLyQuanCafe
GO


CREATE TABLE TableFood
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Bàn chưa có tên',
	status NVARCHAR(100) NOT NULL DEFAULT N'Trống'	-- Trống || Có người
)
GO

CREATE TABLE Account
(
	UserName NVARCHAR(100) PRIMARY KEY,	
	DisplayName NVARCHAR(100) NOT NULL DEFAULT N'Selina',
	PassWord NVARCHAR(1000) NOT NULL DEFAULT 0,
	Type INT NOT NULL  DEFAULT 0 -- 1: admin && 0: staff
)
GO

CREATE TABLE FoodCategory
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên'
)
GO

CREATE TABLE Food
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	idCategory INT NOT NULL,
	price FLOAT NOT NULL DEFAULT 0
	
	FOREIGN KEY (idCategory) REFERENCES dbo.FoodCategory(id)
)
GO

CREATE TABLE Bill
(
	id INT IDENTITY PRIMARY KEY,
	DateCheckIn DATE NOT NULL DEFAULT GETDATE(),
	DateCheckOut DATE,
	idTable INT NOT NULL,
	status INT NOT NULL DEFAULT 0 -- 1: đã thanh toán && 0: chưa thanh toán
	
	FOREIGN KEY (idTable) REFERENCES dbo.TableFood(id)
)
GO

CREATE TABLE BillInfo
(
	id INT IDENTITY PRIMARY KEY,
	idBill INT NOT NULL,
	idFood INT NOT NULL,
	count INT NOT NULL DEFAULT 0
	
	FOREIGN KEY (idBill) REFERENCES dbo.Bill(id),
	FOREIGN KEY (idFood) REFERENCES dbo.Food(id)
)
GO

CREATE TABLE Staff
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL,
	Gender NVARCHAR(3) NOT NULL,
	PhoneNumber NVARCHAR(10) NOT NULL,
	Address NVARCHAR(500) NOT NULL,
	Position NVARCHAR(100) NOT NULL
)
GO


CREATE TABLE Import
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL,
	date DATETIME NOT NULL,
	count INT NOT NULL,
	unit NVARCHAR(10) NOT NULL
)
GO

CREATE TABLE Supplier
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL,
	address NVARCHAR(100) NOT NULL,
	phone NVARCHAR(10) NOT NULL,
	email NVARCHAR(100) NOT NULL
)
GO

INSERT INTO dbo.Staff (name, Gender, PhoneNumber, Address, Position) VALUES (N'Nguyễn Thị Ngọc Anh',N'Nữ','0983762186',N'Kim Động - Hưng Yên',	N'Quản lý')
INSERT INTO dbo.Staff (name, Gender, PhoneNumber, Address, Position) VALUES (N'Hoàng Thùy Linh',N'Nữ','0381634892', N'Kim Động - Hưng Yên', N'Kế toán')
INSERT INTO dbo.Staff (name, Gender, PhoneNumber, Address, Position) VALUES (N'Hoàng Thị Phương Thảo',N'Nữ','0283640173', N'TP.Nam Định', N'Thu Ngân')
INSERT INTO dbo.Staff (name, Gender, PhoneNumber, Address, Position) VALUES (N'Nguyễn Thị Lan Anh',N'Nữ','0982810638', N'Cầu Giấy- Hà Nội', N'Pha chế')
INSERT INTO dbo.Staff (name, Gender, PhoneNumber, Address, Position) VALUES (N'Nguyễn Gia Khánh',N'Nam','0393746274',N'Nam Từ Liêm - Hà Nội', N'Nhân viên')
INSERT INTO dbo.Staff (name, Gender, PhoneNumber, Address, Position) VALUES (N'Trần Phương Thảo',N'Nữ','0222940167',N'TP.Nam Định', N'Nhân viên')
INSERT INTO dbo.Staff (name, Gender, PhoneNumber, Address, Position) VALUES (N'Nguyễn Văn Dũng', N'Nam','0938017354',N'Nam Từ Liêm - Hà Nội', N'Nhân viên')
SELECT * FROM dbo.Staff

INSERT INTO dbo.Account (UserName, DisplayName, PassWord, Type) VALUES ( N'AD001', N'Selina', N'12345', 1)
INSERT INTO dbo.Account (UserName, DisplayName, PassWord, Type) VALUES ( N'AD002', N'Bong', N'12345', 1)
INSERT INTO dbo.Account (UserName, DisplayName, PassWord, Type) VALUES ( N'NV001', N'Staff01', N'123456', 0)
INSERT INTO dbo.Account (UserName, DisplayName, PassWord, Type) VALUES ( N'NV002', N'Staf02', N'123456', 0)
INSERT INTO dbo.Account (UserName, DisplayName, PassWord, Type) VALUES ( N'NV003', N'Staff03', N'123456', 0)
SELECT * FROM dbo.Account

INSERT INTO dbo.Import (name, date, count, unit) VALUES (N'Sữa', '2023-03-22', '20', N'Thùng')
INSERT INTO dbo.Import (name, date, count, unit) VALUES (N'Bột cà phê', '2023-03-22', '12', N'Kg')
INSERT INTO dbo.Import (name, date, count, unit) VALUES (N'Đường', '2023-03-23', '10', N'Kg')
INSERT INTO dbo.Import (name, date, count, unit) VALUES (N'Trân châu', '2023-03-25', '3', N'Kg')
INSERT INTO dbo.Import (name, date, count, unit) VALUES (N'Cacao', '2023-04-01', '14', N'Kg')
INSERT INTO dbo.Import (name, date, count, unit) VALUES (N'Trứng muối', '2023-04-05', '7', N'Kg')
INSERT INTO dbo.Import (name, date, count, unit) VALUES (N'Bột mì', '2023-04-07', '25', N'Kg')
SELECT * FROM dbo.Import

INSERT INTO dbo.Supplier (name, address, phone, email) VALUES (N'Công ty Sữa Vinamilk', N'Kim Động - Hưng Yên', N'0123456789', N'vinamilk@gmail.com')
INSERT INTO dbo.Supplier (name, address, phone, email) VALUES (N'Công ty cà phê Trung Nguyên', N'Cầu Giấy - Hà Nội', N'0977208125', N'TNCoffee@gmail.com')
INSERT INTO dbo.Supplier (name, address, phone, email) VALUES (N'Công ty đường Hưng Thịnh ', N'Hà Đông- Hưng Yên', N'0933785466', N'HTCompany@gmail.com')
INSERT INTO dbo.Supplier (name, address, phone, email) VALUES (N'Công ty TNHH IFood',N'Lương Bằng - Hưng Yên', N'0123456789', N'IFood@gmail.com')
INSERT INTO dbo.Supplier (name, address, phone, email) VALUES (N'Trần Phương Ly', N'Đông Anh- Hà Nội', N'0393809377', N'PhuongLy@gmail.com')
INSERT INTO dbo.Supplier (name, address, phone, email) VALUES (N'Đào Phương Thu',N'	Đông Hưng - Thái Bình',	N'0984648456', N'Thu123@gmail.com')
INSERT INTO dbo.Supplier (name, address, phone, email) VALUES (N'Vũ Thị Thùy Linh',	N'Ba Vì - Hà Nội',	N'0966379078', N'abc@gmail.com')
SELECT * FROM dbo.Supplier

CREATE PROC USP_GetAccountByUserName
@userName nvarchar(100)
AS 
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName
END
GO

EXEC dbo.USP_GetAccountByUserName @userName = N'AD001' -- nvarchar(100)

GO

CREATE PROC USP_Login
@userName nvarchar(100), @passWord nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName AND PassWord = @passWord
END
GO

-- thêm bàn
DECLARE @i INT = 0

WHILE @i <= 20
BEGIN
	INSERT dbo.TableFood ( name)VALUES  ( N'Bàn ' + CAST(@i AS nvarchar(100)))
	SET @i = @i + 1
END
GO

CREATE PROC USP_GetTableList
AS SELECT * FROM dbo.TableFood
GO

UPDATE dbo.TableFood SET STATUS = N'Có người' WHERE id = 9

EXEC dbo.USP_GetTableList
GO

-- thêm category
INSERT dbo.FoodCategory (name) VALUES (N'Cà phê phin')
INSERT dbo.FoodCategory (name) VALUES (N'Phindi')
INSERT dbo.FoodCategory (name) VALUES (N'Espresso')
INSERT dbo.FoodCategory (name) VALUES (N'Trà')
INSERT dbo.FoodCategory (name) VALUES (N'Bánh' )
INSERT dbo.FoodCategory (name) VALUES (N'Freeze' )


-- thêm món ăn
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'Phin Sữa Đá', 1, 29000)
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'Pin Đen Đá', 1, 29000)
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'Bạc Xỉu', 1, 35000)
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'PhinDi Hạnh Nhân', 2, 40000)
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'PhinDi Kem Sữa', 2, 40000)
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'Espresso / Americano', 3, 50000)
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'Capuchino / Latte', 3, 55000)
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'Mocha / Caramel Machiato', 3, 60000)
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'Trà Sen Vàng', 4, 20000)
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'Trà Thạch Đào', 4, 20000)
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'Trà Xanh Đậu Đỏ', 4, 20000)
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'Phô Mai Chanh Dây', 5, 35000)
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'Phô Mai Cà Phê', 5, 35000)
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'Tiramisu', 5, 30000)
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'Freeze Trà Xanh', 6, 29000)
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'CaramelPhin Freeze', 6, 29000)
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'Cookies & Cream', 6, 29000)
INSERT dbo.Food( name, idCategory, price ) VALUES  ( N'Class Phin Freeze', 6, 29000)

-- thêm bill
INSERT	dbo.Bill (DateCheckIn, DateCheckOut, idTable, status) VALUES  ( GETDATE() , NULL, 7,0)
INSERT	dbo.Bill (DateCheckIn, DateCheckOut, idTable, status) VALUES  ( GETDATE() , NULL, 8, 0)
INSERT	dbo.Bill (DateCheckIn, DateCheckOut, idTable, status) VALUES  ( GETDATE() , GETDATE(), 9, 1)
SELECT * FROM dbo.Bill

-- thêm bill info 
INSERT	dbo.BillInfo ( idBill, idFood, count ) VALUES (4, 1, 2)
INSERT	dbo.BillInfo ( idBill, idFood, count ) VALUES  ( 5, 2, 4)
INSERT	dbo.BillInfo ( idBill, idFood, count ) VALUES (6, 3, 1)    
SELECT * FROM dbo.BillInfo

CREATE PROC USP_InsertBill
@idTable INT
AS
BEGIN
	INSERT dbo.Bill (DateCheckIn, DateCheckOut, idTable, status, discount)
	VALUES  ( GETDATE() , NULL, @idTable, 0, 0) -- DateCheckIn - date
END
GO

CREATE PROC USP_InsertBillInfo
@idBill INT, @idFood INT, @count INT
AS
BEGIN

	DECLARE @isExitsBillInfo INT
	DECLARE @foodCount INT = 1
	
	SELECT @isExitsBillInfo = id, @foodCount = b.count 
	FROM dbo.BillInfo AS b 
	WHERE idBill = @idBill AND idFood = @idFood

	IF (@isExitsBillInfo > 0)
	BEGIN
		DECLARE @newCount INT = @foodCount + @count
		IF (@newCount > 0)
			UPDATE dbo.BillInfo	SET count = @foodCount + @count WHERE idFood = @idFood
		ELSE
			DELETE dbo.BillInfo WHERE idBill = @idBill AND idFood = @idFood
	END
	ELSE
	BEGIN
		INSERT	dbo.BillInfo
        ( idBill, idFood, count )
		VALUES  ( @idBill, -- idBill - int
          @idFood, -- idFood - int
          @count  -- count - int
          )
	END
END
GO

DELETE dbo.BillInfo

DELETE dbo.Bill

CREATE TRIGGER UTG_UpdateBillInfo
ON dbo.BillInfo FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @idBill INT
	
	SELECT @idBill = idBill FROM Inserted
	
	DECLARE @idTable INT
	
	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill AND status = 0	
	
	DECLARE @count INT
	SELECT @count = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idBill
	
	IF (@count > 0)
	BEGIN
	
		PRINT @idTable
		PRINT @idBill
		PRINT @count
		
		UPDATE dbo.TableFood SET status = N'Có người' WHERE id = @idTable		
		
	END		
	ELSE
	BEGIN
	PRINT @idTable
		PRINT @idBill
		PRINT @count
	UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable	
	end
	
END
GO


CREATE TRIGGER UTG_UpdateBill
ON dbo.Bill FOR UPDATE
AS
BEGIN
	DECLARE @idBill INT
	
	SELECT @idBill = id FROM Inserted	
	
	DECLARE @idTable INT
	
	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill
	
	DECLARE @count int = 0
	
	SELECT @count = COUNT(*) FROM dbo.Bill WHERE idTable = @idTable AND status = 0
	
	IF (@count = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable
END
GO

ALTER TABLE dbo.Bill
ADD discount INT

UPDATE dbo.Bill SET discount = 0
GO


CREATE PROC USP_SwitchTabel
@idTable1 INT, @idTable2 int
AS BEGIN

	DECLARE @idFirstBill int
	DECLARE @idSeconrdBill INT
	
	DECLARE @isFirstTablEmty INT = 1
	DECLARE @isSecondTablEmty INT = 1
	
	
	SELECT @idSeconrdBill = id FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0
	SELECT @idFirstBill = id FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'
	
	IF (@idFirstBill IS NULL)
	BEGIN
		PRINT '0000001'
		INSERT dbo.Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          idTable ,
		          status
		        )
		VALUES  ( GETDATE() , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
		          @idTable1 , -- idTable - int
		          0  -- status - int
		        )
		        
		SELECT @idFirstBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0
		
	END
	
	SELECT @isFirstTablEmty = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idFirstBill
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'
	
	IF (@idSeconrdBill IS NULL)
	BEGIN
		PRINT '0000002'
		INSERT dbo.Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          idTable ,
		          status
		        )
		VALUES  ( GETDATE() , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
		          @idTable2 , -- idTable - int
		          0  -- status - int
		        )
		SELECT @idSeconrdBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0
		
	END
	
	SELECT @isSecondTablEmty = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idSeconrdBill
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'

	SELECT id INTO IDBillInfoTable FROM dbo.BillInfo WHERE idBill = @idSeconrdBill
	
	UPDATE dbo.BillInfo SET idBill = @idSeconrdBill WHERE idBill = @idFirstBill
	
	UPDATE dbo.BillInfo SET idBill = @idFirstBill WHERE id IN (SELECT * FROM IDBillInfoTable)
	
	DROP TABLE IDBillInfoTable
	
	IF (@isFirstTablEmty = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable2
		
	IF (@isSecondTablEmty= 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable1
END
GO

ALTER TABLE dbo.Bill ADD totalPrice FLOAT

DELETE dbo.BillInfo
DELETE dbo.Bill

GO

CREATE PROC USP_GetListBillByDate
@checkIn date, @checkOut date
AS 
BEGIN
	SELECT t.name AS [Tên bàn], b.totalPrice AS [Tổng tiền], DateCheckIn AS [Ngày vào], DateCheckOut AS [Ngày ra], discount AS [Giảm giá]
	FROM dbo.Bill AS b,dbo.TableFood AS t
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.status = 1
	AND t.id = b.idTable
END
GO

CREATE PROC USP_UpdateAccount
@userName NVARCHAR(100), @displayName NVARCHAR(100), @password NVARCHAR(100), @newPassword NVARCHAR(100)
AS
BEGIN
	DECLARE @isRightPass INT = 0
	
	SELECT @isRightPass = COUNT(*) FROM dbo.Account WHERE USERName = @userName AND PassWord = @password
	
	IF (@isRightPass = 1)
	BEGIN
		IF (@newPassword = NULL OR @newPassword = '')
		BEGIN
			UPDATE dbo.Account SET DisplayName = @displayName WHERE UserName = @userName
		END		
		ELSE
			UPDATE dbo.Account SET DisplayName = @displayName, PassWord = @newPassword WHERE UserName = @userName
	end
END
GO

CREATE TRIGGER UTG_DeleteBillInfo
ON dbo.BillInfo FOR DELETE
AS 
BEGIN
	DECLARE @idBillInfo INT
	DECLARE @idBill INT
	SELECT @idBillInfo = id, @idBill = Deleted.idBill FROM Deleted
	
	DECLARE @idTable INT
	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill
	
	DECLARE @count INT = 0
	
	SELECT @count = COUNT(*) FROM dbo.BillInfo AS bi, dbo.Bill AS b WHERE b.id = bi.idBill AND b.id = @idBill AND b.status = 0
	
	IF (@count = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable
END
GO
select* from dbo.FoodCategory
