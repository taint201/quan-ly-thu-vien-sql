create database QuanLyBanHang_LAB2_qlbh
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
	maHoaDon    int primary key,
	ngayMuaHang date,
	maKH        varchar(5),
	trangThai   nvarchar(30),
	foreign key (maKH) references khachHang
)
if OBJECT_ID ('HoaDonChiTiet') is not null
drop table HoaDonChiTiet
go
create table HoaDonChiTiet(
	maHoaDon   int,
	maSP       int,
	soLuong    int,
	maHoaDonCT int primary key,
	foreign key (maHoaDon) references hoaDon,
	foreign key (maSP) references sanPham
)
--go
select * from khachHang
Insert into khachHang(maKH,hoTenLot,diaChi, email,dienThoai ) values
	('KH01', N'Nguyen Van A', N'Đồng Trúc, Thạch Thất, Hà Nội', 'nguyenvana@gmail.com',0965874875),
	('KH02', N'Nguyen Van B', N'Láng, Nam Từ Liêm, Hà Nội', 'nguyenvanb@gmail.com',0965844875),
	('KH03', N'Nguyen Van C', N'Cầu Diễn, BẮc Từ liêm, Hà Nội', 'nguyenvanc@gmail.com',0953874875),
	('KH04', N'Nguyen Van D', N'Xuân Phương, Nam Từ Liêm, Hà Nội', 'nguyenvand@gmail.com',0965869875),
	('KH05', N'Nguyen Van E', N'Xuân Phương, Nam Từ Liêm, Hà Nội', 'nguyenvane@gmail.com',0965869878)

	select * from sanPham
	Insert into sanPham(maSP, moTa, soLuong,donGia, tenSP) values
	(1, N'Thiết kế đẹp', 1, 2000, 'Iphone X'),
	(2, N'Thiết kế rất đẹp', 2, 3000, 'Iphone XS MAX'),
	(3, N'Thiết kế xấu', 3, 4000, 'Iphone 13'),
	(4, N'Thiết kế đẹp', 2, 5000, 'Iphone XR'),
	(5, N'Thiết kế bình thường', 5, 2000, 'Iphone 12')

	

	select * from hoaDon
	Insert into hoaDon(maHoaDon, ngayMuaHang, maKH, trangThai) values
	(11, '2022-1-28', 'KH01', N'Tốt'),
	(12, '2022-2-27', 'KH02', N'Trung Bình'),
	(13, '2022-3-26', 'KH03', N'Tốt'),
	(14, '2022-4-25', 'KH04', N'Trung Bình'),
	(15, '2022-5-24', 'KH05', N'Tốt')
	

	select * from HoaDonChiTiet
	Insert into HoaDonChiTiet(maHoaDon,maSP, soLuong, maHoaDonCT) values
	(11, 1, 2, 001),
	(12, 2, 4, 002),
	(13, 3, 2, 003),
	(14, 4, 1, 004),
	(15, 5, 5, 005)
