create database QuanLyBanHang_Lab2_MOI
if OBJECT_ID ('khachHang') is not null
drop table khachHang
go
create table khachHang(
	maKH varchar(5) primary key,
	hoTenLot nvarchar(50),
	tenKH nvarchar(50),
	diaChi nvarchar(255),
	email varchar(50),
	dienThoai char(13)
)
if OBJECT_ID ('sanPham') is not null
drop table sanPham
go
create table sanPham(
	maSP int primary key,
	moTa nvarchar(255),
	soLuong int,
	donGia money,
	tenSP nvarchar(50)
)
if OBJECT_ID ('hoaDon') is not null
drop table hoaDon
go
create table hoaDon(
	maHoaDon int primary key,
	ngayMuaHang date,
	maKH varchar(5),
	trangThai nvarchar(30),
	foreign key (maKH) references khachHang
)
if OBJECT_ID ('HoaDonChiTiet') is not null
drop table HoaDonChiTiet
go
create table HoaDonChiTiet(
	maHoaDon int,
	maSP int,
	soLuong int,
	maHoaDonCT int primary key,
	foreign key (maHoaDon) references hoaDon,
	foreign key (maSP) references sanPham
)
Select*from khachHang
Select*from sanPham
Select*from hoaDon
Select*from HoaDonChiTiet
Insert into khachHang(maKH,hoTenLot,tenKH ,diaChi, email,dienThoai ) values
	('KH01', N'Nguyen Van A',N'tai', N'Đồng Trúc, Thạch Thất, Hà Nội', 'nguyenvana@gmail.com',0965874875),
	('KH02', N'Nguyen Van B',N'tien' ,N'Láng, Nam Từ Liêm, Hà Nội', 'nguyenvanb@gmail.com',0965844875),
	('KH03', N'Nguyen Van C', N'chung',N'Cầu Diễn, BẮc Từ liêm, Hà Nội', 'nguyenvanc@gmail.com',0953874875),
	('KH04', N'Nguyen Van D',N'dung', N'Xuân Phương, Nam Từ Liêm, Hà Nội', 'nguyenvand@gmail.com',0965869875),
	('KH05', N'Nguyen Van E', N'thanh',N'Xuân Phương, Nam Từ Liêm, Hà Nội', 'nguyenvane@gmail.com',0965869878)

Select*from sanPham
Insert into sanPham(maSP,moTa,soLuong,donGia,tenSP) values
(01,N'may tinh game ming',10,10000,N' Laptop Dell'),
(02,N'may tinh van phong',12,20000,N' Laptop Dell'),
(03,N'may tinh van phong',13,30000,N' Laptop Dell'),
(04,N'may tinh game ming',14,40000,N' Laptop Dell'),
(05,N'may tinh van phong',15,50000,N' Laptop Dell')

Select*from hoaDon
Insert into hoaDon(maHoaDon,ngayMuaHang,maKH,trangThai) values
(1,2022/04/1,'KH01',N'con hang'),
(2,2022/05/1,'KH02',N'con hang'),
(3,2022/06/1,'KH03',N'con hang'),
(4,2022/02/1,'KH05',N'con hang'),
(5,2022/09/1,'KH01',N'con hang')

Select*from HoaDonChiTiet
Insert into HoaDonChiTiet(maHoaDon,maSP,soLuong,maHoaDonCT) values
(1,01,500,520),
(2,03,600,521),
(3,05,700,522),
(4,04,800,523),
(5,02,000,524)