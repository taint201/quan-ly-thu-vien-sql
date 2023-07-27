Create database LAB_8_PH10947
if OBJECT_ID('MatHang') is not null
drop table MatHang
create table  MatHang(
	maHang varchar(15) primary key,
	tenHang nvarchar(50),
	donGia money,
)
if OBJECT_ID('KhachHang') is not null
drop table KhachHang
create table KhachHang(
	MaKH varchar(15) primary key,
	ngaySinh date,
	tenKhachHang nvarchar(50),
	gioiTinh nvarchar(20),
	queQuan nvarchar(50),

)
if OBJECT_ID('HoaDon') is not null
drop table HoaDon
create table HoaDon(
    soPhieu varchar(15) primary key,
	ngayLap date,
	MaKH varchar(15)
	foreign key (MaKH) references KhachHang(MaKH),
)
if OBJECT_ID('CTHoaDon') is not null
drop table CTHoaDon
create table CTHoaDon(
    soPhieu varchar(15) ,
	maHang varchar(15) ,
	soLuong int,
	primary key(soPhieu,maHang),
	foreign key (soPhieu) references HoaDon(soPhieu),
	foreign key (maHang) references  MatHang(maHang)
)
SELECT * FROM MatHang
Insert into MatHang(maHang,tenHang,donGia) values
    ('M1',N'Duowngx môi Ohui',200000),
	('M2',N'Tinh chất Ohui',1000000),
	('M3',N'Kem dưỡng Ohui',550000)
	
	
Insert into KhachHang(MaKH,ngaySinh,tenKhachHang,gioiTinh,queQuan) values
    ('K1', '2000-12-01', N'Trần Triệu Vy', N'Nữ', N'Hà Nội'),
	('K2', '2006-03-02', N'Trần Đình Trọng', N'Nam', N'Thái Bình'),
	('K3', '2013-03-14', N'Minh Hà', N'Nữ', N'Sài Gòn'),
	('K4', null, null, null, null)

SELECT * FROM KhachHang
SELECT * FROM  HoaDon
INSERT INTO  HoaDon VALUES
	('P1', '2022-1-1', 'K1'),
	('P2', '2022-1-18', 'K1'),
	('P3', '2022-4-18', 'K3')


SELECT * FROM CTHoaDon
INSERT INTO CTHoaDon VALUES
	('P1', 'M1', 2),
	('P1', 'M2', 3),
	('P2', 'M2', 1),
	('P1', 'M3', 2)


--	Câu 1: Viết lệnh SQL thực hiện như sau: (3đ) 
--a.	tạo Database có tên: Quanlysanpham 
--b.	Tạo các bảng trên (Xác định khóa chính, khóa ngoại)  (1.5đ)
--c.	Chèn dữ liệu vào các bảng trên (1.5đ)
--Câu 2: Truy Vấn dữ liệu SQL (5đ)
-----------------------------------------------------------------
--a.	Đưa ra thông tin: Makh, Tenkh, Gioitinh của những khách hàng có Họ Trần và Quequan là ‘Hà Nội’. (0.5đ).
select MaKH,tenKhachHang,gioiTinh from KhachHang
where tenKhachHang like N'Trần%' and queQuan like N'Hà Nội'
---------------------------------------------------------
--b.	Đưa ra thông tin các khách hàng > 20 tuổi. (0.5đ).
select *from KhachHang kh
where DATEDIFF(YEAR,kh.ngaySinh,GETDATE()) >20


--DATEDIFF--trong SQL Server trả về chênh lệch giữa hai giá trị thời gian
--dựa trên khoảng thời gian được chỉ định.
--Hai giá trị thời gian phải là ngày hoặc các biểu thức ngày và giờ.
--GETDATE:Hàm GETDATE trong SQL Server trả về ngày tháng năm hiện tại của hệ thống
-------------------------------------------------------------------------
--c.*Đưa ra thông tin danh sách các khách hàng (Makh, Tenkh, tổng tiền) có tổng thành tiền của các
--hóa đơn từ 1.000.
--trở lên.  TONGTIEN=SUM( SOLUONG*DONGIA)
select *from KhachHang
select *from HoaDon
select*from CTHoaDon
select *from MatHang
----------------------------------------------
select hd.MaKH ,kh.tenKhachHang , mh.donGia , soLuong , SUM(soLuong*donGia) as 'Tổng Tiền'  from KhachHang kh
join HoaDon hd
on kh.MaKH = hd.MaKH
join CTHoaDon cthd
on hd.soPhieu = cthd.soPhieu
join MatHang mh
on cthd.maHang = mh.maHang
group by cthd.soLuong, mh.donGia, hd.MaKH,kh.tenKhachHang -- nhóm những dữ liệu cần lấy
having SUM(soLuong*donGia) >=1000000 -- điều kiện lên nhóm--ok--những gì có sau
 --* nếu sử dụng group by , sau select lấy cái gì thì 
 --phải đặt trong group by
 -- having là điều kiện lên nhóm chỉ sự dụng sau group by
-----------------------------------------------------

--d.	*Cho biết thông tin khách hàng chưa đặt đơn hàng nào. Thông tin gồm: Makh, Tenkh (1đ)
--==> --tìm ra khách hàng không có mã khách hàng trong bảng hóa đơn
--+ lấy ra MaKH có trong bảng KhachHang
--+ lấy ra MaKH có trong bảng HoaDon
--> tìm ra MaKh có trong KhachHang nhưng không có trong HoaDon ->in ra
select *from KhachHang
select *from HoaDon
---
select kh.MaKH, kh.tenKhachHang   from KhachHang kh
where kh.MaKH not in(
select MaKH from HoaDon --> lấy ra MaKH có trong hóa đơn
)

------a. Hiển thị danh sách các khách hàng chưa mua hàng lần nào kể từ tháng 1/1/2016
--phân tích: 
---.thay vì tìm người chưa mua hàng thì sẽ tìm người mua hàng 1/1/2022 đến nay (1)
---.người chưa mua: = tổng số người mua  không nằm trong(not in) (1)
---code--
--tìm tất cả khách hàng
select *from KhachHang
select * from hoaDon
------
select* from khachHang
where maKH not in (
--tìm khách mua hàng từ 1/1/2016 đến nay
select maKH from hoaDon where ngayLap > '2016-01-1' --> lấy ra MaKH có trong hóa đơn có ngày lập >'2016-1-1'
)
---
----
select kh.MaKH, kh.tenKhachHang   from KhachHang kh
where kh.MaKH not in(
select MaKH from HoaDon --> lấy ra MaKH có trong hóa đơn
)
----------------------------------------
--e.	Liệt kê thông tin: Makh, Tenkh, Mahang, Tenhang, Dongia, Soluong của khách hàng có tên khách hàng là Trần Triệu Vy . sắp xếp giảm dần theo ngay mua hàng (1đ)
select*from HoaDon
select*from KhachHang
----------
select kh.MaKH ,tenKhachHang, ctHd.maHang,tenHang,donGia,soLuong from KhachHang kh
join HoaDon hd
on kh.MaKH = hd.MaKH
join CTHoaDon ctHD
on hd.soPhieu = ctHD.soPhieu
join MatHang mh
on ctHD.maHang = mh.maHang
--group by tenKhachHang
--order by tenKhachHang asc -- giảm dan/ mac dinh
where tenKhachHang like N'Trần Triệu Vy' --ok
----------------------------------
--f.	Đưa ra thông tin các khách đã mua hàng trong tháng 1/2022 (1đ)
select *  from KhachHang kh
join HoaDon hd 
on kh.MaKH = hd.MaKH
where  ngayLap between  '2020-01-1' and  '2022-01-31'
---------------------------------------
--Câu 3. Hãy viết lệnh SQL thực hiện các thao tác sau: (2đ)
------------------------
--a.	Thêm một bản ghi mới vào chitiethoadon,dữ liệu phù hợp( không được nhập giá trị nul
select *from MatHang
select*from CTHoaDon
insert into CTHoaDon(soPhieu,maHang,soLuong) values
('P3', 'M4', 4) --loi
-------------------------------------------------------------------
--b.	Thay đổi quê quán của khách hàng Minh Hà thành ‘Miền Tây’ (1đ)
select *from KhachHang
update KhachHang set queQuan = N'Miền Tây' where tenKhachHang like N'Minh Hà'
--c.	 Xóa mặt hàng có tên hàng ‘Kem dưỡng Ohui’ (0.5đ)
select*from MatHang
delete MatHang where tenHang = N'Kem dưỡng Ohui'