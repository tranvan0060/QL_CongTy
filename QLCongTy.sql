create database QLCuaHang
use QLCuaHang

---Tao cac bang.
CREATE TABLE nhacungcap
(
	macongty nvarchar(10) NOT NULL primary key ,
	tencongty nvarchar(40) NOT NULL, 
	tengiaodich nvarchar(30) NULL,
	diachi nvarchar(60) NULL, 
	dienthoai nvarchar(20) NULL, 
	fax nvarchar(20) NULL, 
	email nvarchar(50) NULL 
)

CREATE TABLE Loaihang
(
	maloaihang INT primary key NOT NULL,
	tenloaihang nvarchar(15) NOT NULL
)

CREATE TABLE Mathang
(
	mahang nvarchar(10) primary key NOT NULL,
	tenhang nvarchar(50) NOT NULL,
	macongty nvarchar(10) NULL FOREIGN KEY(macongty) REFERENCES nhacungcap(macongty),
	maloaihang INT NULL  FOREIGN KEY(maloaihang) REFERENCES Loaihang(maloaihang),
	soluong INT NOT NULL,
	donvitinh nvarchar(20) NULL,
	giahang MONEY NULL
)

CREATE TABLE Nhanvien
(
	manhanvien nvarchar(10) primary key NOT NULL,
	ho nvarchar(20) NOT NULL,
	ten nvarchar(10) NOT NULL,
	ngaysinh DATETIME NULL,
	ngaylamviec DATETIME NULL,
	diachi nvarchar(50) NULL,
	dienthoai nvarchar(15) NULL check(dienthoai like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), 
	luongcoban MONEY NULL,
	phucap MONEY NULL
)

CREATE TABLE Khachhang
(
	makhachhang nvarchar(10) NOT NULL primary key,
	tencongty nvarchar(50) NOT NULL,
	tengiaodich nvarchar(30) NOT NULL,
	diachi nvarchar(50) NULL,
	email nvarchar(30) NULL,
	dienthoai nvarchar(15) NULL,
	fax nvarchar(15) NULL
)

CREATE TABLE dondathang
(
	sohoadon INT primary key NOT NULL,
	makhachhang nvarchar(10) NOT NULL FOREIGN KEY(makhachhang) REFERENCES Khachhang(makhachhang),
	manhanvien nvarchar(10) NOT NULL FOREIGN KEY(manhanvien) REFERENCES Nhanvien(manhanvien),
	ngaydathang SMALLDATETIME NULL,
	ngaygiaohang SMALLDATETIME NULL,
	ngaychuyenhang SMALLDATETIME NULL,
	noigiaohang nvarchar(50) NULL
)

CREATE TABLE chitietdathang
(
	sohoadon INT NOT NULL FOREIGN KEY(sohoadon) REFERENCES dondathang(sohoadon),
	mahang nvarchar(10) NOT NULL FOREIGN KEY(mahang) REFERENCES Mathang(mahang),
	giaban MONEY NOT NULL,
	soluong SMALLINT NOT NULL,
	mucgiamgia REAL NOT NULL
)

SELECT * FROM Khachhang
SELECT * FROM nhacungcap
SELECT * FROM Loaihang
SELECT * FROM Mathang
SELECT * FROM Nhanvien
SELECT * FROM Khachhang
SELECT * FROM dondathang
SELECT * FROM chitietdathang

---Chèn dữ liệu vào bảng.

INSERT INTO Khachhang VALUES ('K01', 'VinaMilk', 'VinaMilk', N'Việt Nam', '' , '' , '' )
INSERT INTO Khachhang VALUES ('K02', 'VinaSoy', 'VinaSoy', N'Việt Nam', '' , '' , '' )
INSERT INTO Khachhang VALUES ('K03', 'Nestle', 'Nestle', '', '' , '' , '' )
INSERT INTO Khachhang VALUES ('K04', 'Milky US', 'Milky US', '', '' , '' , '' )
INSERT INTO Khachhang VALUES ('K05', 'Mộc Châu Milk', 'Mộc Châu Milk', N'Việt Nam', '' , '' , '' )

INSERT INTO Nhanvien VALUES ('NV01', N'Vũ Thị', N'Thảo', '1992-02-10', '2010-07-10', N'Hải Dương', '0123456789', 650000, 1000000)
INSERT INTO Nhanvien VALUES ('NV02', N'Vũ Thị', N'Lụa', '1992-05-20', '2010-05-03', N'Hải Dương', '1123456789', 650000, 1000000)
INSERT INTO Nhanvien VALUES ('NV03', N'Vũ Thị', N'Thảo', '1989-10-15', '2009-04-21', N'Hải Dương', '2123456789', 650000, 1000000)
INSERT INTO Nhanvien VALUES ('NV04', N'Vũ Tuấn', N'Anh', '1991-07-10', '2009-10-10', N'Hải Dương', '3123456789', 650000, 1000000)
INSERT INTO Nhanvien VALUES ('NV05', N'Đào Thị', N'Bưởi', '1991-10-20', '2010-08-15', N'Hải Dương', '4123456789', 650000, 1000000)

INSERT INTO dondathang VALUES(1, 'K01', 'NV01', '2003-01-12', '2003-01-15', '2003-01-15', N'Việt Nam')
INSERT INTO dondathang VALUES(2, 'K02', 'NV02', '2003-02-12', '2003-03-15', '2003-03-15', N'Việt Nam')
INSERT INTO dondathang VALUES(3, 'K03', 'NV04', '2003-01-12', '2003-01-15', '2003-01-15', N'Việt Nam')
INSERT INTO dondathang VALUES(4, 'K03', 'NV02', '2003-01-12', '2003-01-15', '2003-01-15', N'Việt Nam')
INSERT INTO dondathang VALUES(5, 'K04', 'NV02', '2003-01-12', '2003-02-15', '2003-02-15', N'Việt Nam')
INSERT INTO dondathang VALUES(6, 'K03', 'NV04', '2003-01-12', '2003-01-15', '2003-01-15', N'Việt Nam')
INSERT INTO dondathang VALUES(7, 'K02', 'NV04', '2003-01-12', '2003-01-15', '2003-01-15', N'Việt Nam')
INSERT INTO dondathang VALUES(8, 'K01', 'NV05', '2003-01-12', '2003-02-15', '2003-02-15', N'Việt Nam')
INSERT INTO dondathang VALUES(9, 'K02', 'NV02', '2003-02-12', '2003-01-15', '2003-01-15', N'Việt Nam')
INSERT INTO dondathang VALUES(10, 'K03', 'NV01', '2003-01-12', '2003-01-15', '2003-01-15', N'Việt Nam')

INSERT INTO Loaihang VALUES(1, N'Sữa bột')
INSERT INTO Loaihang VALUES(2, N'Sữa bột')
INSERT INTO Loaihang VALUES(3, N'Sữa tươi')
INSERT INTO Loaihang VALUES(4, N'Phô mai')
INSERT INTO Loaihang VALUES(5, N'Sữa nguyên chất')
INSERT INTO Loaihang VALUES(6, N'Sữa tiệt trùng')

INSERT INTO nhacungcap VALUES ('CT01', 'VinaMilk', 'VinaMilk', N'Việt Nam', '' , '' , '' )
INSERT INTO nhacungcap VALUES ('CT02', 'VinaSoy', 'VinaSoy', N'Việt Nam', '' , '' , '' )
INSERT INTO nhacungcap VALUES ('CT03', 'Nestle', 'Nestle', '', '' , '' , '' )
INSERT INTO nhacungcap VALUES ('CT04', 'Mộc Châu', 'Mộc Châu', N'Việt Nam', '' , '' , '' )
INSERT INTO nhacungcap VALUES ('CT05', 'Milky US', 'Milky US', '', '' , '' , '' )
INSERT INTO nhacungcap VALUES ('CT06', 'VinaMilk', 'VinaMilk', N'Việt Nam', '' , '' , '' )

INSERT INTO Mathang VALUES ('H01', N'Phô mai', 'CT02', 1, 100, N'Thùng', 1000000)
INSERT INTO Mathang VALUES ('H02', N'Sữa', 'CT02', 2, 100, N'Hộp', 1000000)
INSERT INTO Mathang VALUES ('H03', N'Sữa', 'CT03', 3, 100, N'Thùng', 2000000)
INSERT INTO Mathang VALUES ('H04', N'Sữa', 'CT04', 4, 100, N'Thùng', 1000000)
INSERT INTO Mathang VALUES ('H05', N'Sữa', 'CT05', 5, 100, N'Vỉ', 1000000)
INSERT INTO Mathang VALUES ('H06', N'Phô mai', 'CT06', 6, 100, N'Thùng', 1000000)
 
INSERT INTO chitietdathang VALUES (1, 'H01', 35000.00, 150, 1)
INSERT INTO chitietdathang VALUES (2, 'H02', 45000.00, 250, 1)
INSERT INTO chitietdathang VALUES (3, 'H03', 55000.00, 350, 1)
INSERT INTO chitietdathang VALUES (4, 'H04', 65000.00, 450, 1)
INSERT INTO chitietdathang VALUES (5, 'H05', 75000.00, 550, 1)

---Bổ sung ràng buộc.

---ALTER TABLE chitietdathang ADD CONSTRAINT soluong DEFAULT '1', 

---Thực hiện các câu lệnh truy vấn.
---1. Cho biết danh sách các đối tác cung cấp cho công ty.
SELECT tencongty
FROM nhacungcap

---2. Những mặt hàng nào chưa từng đc khách hàng đặt mua.
SELECT *
FROM Mathang
WHERE mahang not in (select mahang from chitietdathang)

---3. Mã hàng, tên hàng, số lượng của các mặt hàng có trong công ty.
SELECT mahang, tenhang, soluong
FROM Mathang

---4. Họ tên, địa chỉ và năm bắt đầu làm việc của các nhân viên.
SELECT ho, ten, diachi, YEAR(ngaylamviec) as'nam lam viec'
FROM Nhanvien

---5. Địa điểm và điện thoại của nhà cung cấp có tên giao dịch là VianMilk.
SELECT diachi, dienthoai
FROM nhacungcap
WHERE tengiaodich = 'VinaMilk'

---6. Cho biết mã và tên của các mặt hàng có giá hơn 100000 và số lượng ít hơn 50.
SELECT mahang, tenhang
FROM Mathang
WHERE giahang>'100000' or soluong <'50'

---7. Loại thực phẩm do những công ty nào cung cấp và địa chỉ của công ty đó.
SELECT Mathang.maloaihang, tencongty, diachi
FROM nhacungcap, Mathang, Loaihang
WHERE nhacungcap.macongty=Mathang.macongty AND Mathang.maloaihang=Loaihang.maloaihang

---8. Những khác hàng nào(tên giao dịch) đã đặt mua mặt hàng Sữa hộp của công ty.
SELECT tengiaodich, tenhang
FROM Khachhang, dondathang, chitietdathang, Mathang
WHERE Khachhang.makhachhang=dondathang.makhachhang AND dondathang.sohoadon=chitietdathang.sohoadon AND chitietdathang.mahang=Mathang.mahang AND tenhang=N'Phô mai'

---9. Đơn đặt hàng số 1 do ai đặt và so nhân viên nào lập, thời gian và địa điểm giao hàng là ở đâu.
SELECT tengiaodich, ho, ten, ngaygiaohang, noigiaohang
FROM dondathang, Nhanvien, Khachhang
WHERE sohoadon = '1' AND dondathang.manhanvien=Nhanvien.manhanvien AND Khachhang.makhachhang=dondathang.makhachhang

---10. Hãy cho biết số tiền lương mà công ty phải trả cho mỗi nhân viên là bao nhiêu(lương= lương cơ bản + phụ cáp).
SELECT manhanvien, luongcoban+phucap AS 'Lương phải trả'
FROM Nhanvien

---11. Trong đơn đặt hàng số 3, đặt mua những mặt hàng nào và số tiền phải trả(solg*giaban-soluong*giaban*mucgiamgia/100).
SELECT soluong*giaban-soluong*giaban*mucgiamgia/10 AS 'Tiền phải trả', mahang
FROM chitietdathang C, dondathang D
WHERE C.sohoadon = D.sohoadon AND C.sohoadon='4'

---12. Hãy cho biết có những khách hàng nào lại chính là đối tác cung cấp hàng của công ty.
SELECT Khachhang.tengiaodich
FROM Khachhang, nhacungcap
WHERE Khachhang.tengiaodich=nhacungcap.tengiaodich
SELECT * FROM Khachhang
SELECT * FROM nhacungcap

---13. Trong công ty có những nhân viên sinh tháng 2 năm 1992
SELECT ho, ten
FROM Nhanvien 
WHERE MONTH(ngaysinh)='2' AND YEAR(ngaysinh)='1992' 
SELECT * FROM Nhanvien

---14. Những đơn đặt hàng nào yêu cầu giao hàng ngay tại công ty đặt hàng và đơn đó của công ty nào.
SELECT sohoadon, tengiaodich
FROM Khachhang, dondathang
WHERE Khachhang.diachi=dondathang.noigiaohang
SELECT * FROM Khachhang
SELECT * FROM dondathang

---15. Cho biết tên công ty, tên giao dịch, địa chỉ, điện thoại, của các khách hàng và nhà cung cấp hàng cho công ty.
SELECT tencongty, tengiaodich, diachi, dienthoai 
FROM Khachhang
SELECT tencongty, tengiaodich, diachi, dienthoai 
FROM nhacungcap

---16. Cho biết số hóa đơn mà mỗi nhân viên bán được, chỉ hiện những nhân viên có từ 3 hóa đơn trở lên.
SELECT manhanvien, COUNT(sohoadon)AS 'SO HOA DON'
FROM dondathang
GROUP BY manhanvien
HAVING COUNT(sohoadon)>=3

---17. Cho biết số hóa đơn mà mỗi nhân viên bán được.
SELECT manhanvien, COUNT(sohoadon)as 'SO HOA DON'
FROM dondathang
GROUP BY manhanvien

---18. Đưa ra số lượng max, min, trung bình.
SELECT MAX(soluong) AS Max, MIN(soluong) AS Min, AVG(soluong) AS 'Trung binh cong'
FROM Mathang

---19. Đưa ra mặt hàng có số lượng max.
SELECT *
FROM Mathang
WHERE soluong = (SELECT MAX(soluong) FROM Mathang)