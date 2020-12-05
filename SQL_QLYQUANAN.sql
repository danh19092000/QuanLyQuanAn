CREATE DATABASE QL_QUANAN
GO
USE QL_QUANAN
GO

CREATE TABLE TaiKhoan
(
	iD int IDENTITY(1,1) PRIMARY KEY,
	taiKhoan nvarchar(50), 
	matKhau nvarchar(30),
	tenHienThi nvarchar(50),
	hoTen nvarchar(50),
	gioiTinh nvarchar(15)
)
GO

CREATE TABLE BaoCao
(
	iD int IDENTITY(1,1) PRIMARY KEY,
	iDTaiKhoan int
)
GO

CREATE TABLE NguyenLieu
(
	iD int IDENTITY(1,1) PRIMARY KEY,
	tenNguyenLieu nvarchar(50), 
	soLuong float,
	donVi nvarchar(15)
)
GO	

CREATE TABLE HoaDon
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	ngayXuatHD date
)
GO	

CREATE TABLE InfoHoaDon
(
	iDHoaDon int IDENTITY(1,1) PRIMARY KEY,
	iDMonAn int,
	soLuong int,
	iDBan int
)
GO	

CREATE TABLE MonAn
(
	iDMonAn int IDENTITY(1,1) PRIMARY KEY,
	donGia int,
	tenMon nvarchar(50)
)
GO	

CREATE TABLE BanAn
(
	iDBan int IDENTITY(1,1) PRIMARY KEY,
	trangThai int check(trangThai = 0 OR trangThai = 1)
)
GO	


INSERT INTO TaiKhoan (taiKhoan, matKhau, tenHienThi, hoTen, gioiTinh)
VALUES ('liem123', '123456', 'Liêm Lê', 'Lê Liêm', N'Nam'),
		('linh123', '123456', 'Linh Lý', 'Lý Thị Kim Linh', N'Nữ')
GO

ALTER TABLE baoCao ADD CONSTRAINT FK_BaoCao FOREIGN KEY (iDTaiKhoan) REFERENCES TaiKhoan(iD)
ALTER TABLE InfoHoaDon ADD CONSTRAINT FK_HD FOREIGN KEY (iDHoaDon) REFERENCES HoaDon(ID)
ALTER TABLE InfoHoaDon ADD CONSTRAINT FK_HD2 FOREIGN KEY (iDMonAn) REFERENCES MonAn(iDMonAn)
ALTER TABLE InfoHoaDon ADD CONSTRAINT FK_HD3 FOREIGN KEY (iDBan) REFERENCES BanAn(iDBan)

drop database QL_QUANAN

ALTER TABLE BanAn ADD CONSTRAINT DF_BanAn default 0 for trangThai


INSERT INTO NguyenLieu(tenNguyenLieu, soLuong, donVi) VALUES  (N'Gà', 1, 'kg')
															, (N'Cá diêu hồng', 800, 'g')
															, (N'Thịt', 1, 'kg')
															, (N'Trứng gà', 12, N'quả')
															, (N'Trứng vịt lộn', 12, N'quả')
															, (N'Tôm', 1, 'kg')
															, (N'Thịt bò', 1, 'kg')
															, (N'Đùi gà', 1, 'kg')
set dateformat dmy															
INSERT INTO HoaDon(ngayXuatHD) VALUES('20/9/2020'),
									  ('11/04/2020'),
									 ('15/7/2020'),
									 ('05/2/2020')
									 
INSERT INTO InfoHoaDon(soLuong) VALUES (9),
									   (10),
									   (1),
									   (9),
									   (8)
									   
INSERT INTO MonAn (tenMon, donGia) VALUES (N'Gà chiên nước mắm', 45000),
										  (N'Thịt kho hột vịt', 30000),
										  (N'Cá diêu hồng sốt cà chua', 45000),
										  (N'Tôm nướng muối ớt', 90000),
										  (N'Tôm hấp nồi đất', 110000),
										  (N'Bò lá lốt', 60000),
										  (N'Bia tiger', 20000),
										  (N'Bia sài gòn đỏ', 15000),
										  (N'Coca cola', 12000),
										  (N'Nước suối', 5000)
										  
INSERT INTO BanAn(trangThai) VALUES (1),(0),(1),(0),(1),(0),(0),(1),(0),(0),(0),(0),(1),(0),(1),(0),(0),(0)									
									
									
