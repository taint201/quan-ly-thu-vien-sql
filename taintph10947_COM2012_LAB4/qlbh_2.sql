create database QuanLyBanHang_LAB2
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
Select*from HoaDonChiTiet
Select*from khachHang
Select*from sanPham
Insert into khachHang(maKH,hoTenLot,tenKH,diaChi, email,dienThoai ) values
	('KH01', N'Nguyen Van ', N'An', N'Đồng Trúc, Thạch Thất, Hà Nội', 'nguyenvana@gmail.com',0965874875),
	('KH02', N'Ngo Van ', N'Khang', N'Đồng Trúc, Thạch Thất, Hà Nội', 'nguyenvana@gmail.com',0965874875),
	('KH03', N'Nguyen Van ', N'Thinh', N'Đồng Trúc, Thạch Thất, Hà Nội', 'nguyenvana@gmail.com',0965874875),
	('KH04', N'Ngo Van ', N'Vuong', N'Đồng Trúc, Thạch Thất, Hà Nội', 'nguyenvana@gmail.com',0965874875),
	('KH05', N'Nguyen Van ', N'AN', N'Đồng Trúc, Thạch Thất, Hà Nội', 'nguyenvana@gmail.com',0965874875)
	
Insert into sanPham(maSP,moTa,soLuong,donGia,tenSP) values
    ('1',N'san pham 1','20','5000',N'Bim bim'),
	('2',N'san pham 2','30','6000',N'Bim bim'),
	('3',N'san pham 3','40','7000',N'Bim bim'),
	('4',N'san pham 4','50','8000',N'Bim bim'),
	('5',N'san pham 5','60','9000',N'Bim bim')

--Insert into hoaDon(maHoaDon,ngayMuaHang,maKH,trangThai) values