Create database QUAN_LY_THUE_XE_PH10947
if OBJECT_ID('KhachHang') is not null
drop table KhachHang
create table KhachHang(
	maKhach varchar(15) primary key,
	hoTen nvarchar(25),
	diaChi nvarchar(55),
	sdt char(10),
	soCanCuoc char(20),
	
)
if OBJECT_ID('Xe') is not null
drop table Xe
create table Xe(
	bienSo varchar(15) primary key,
	soGhe int,
	donGia money,
	hangXe nvarchar(50),
	
)
if OBJECT_ID('thueXe') is not null
drop table thueXe
create table thueXe(
    primary key (maKhach,bienSo,ngayThue),
    maKhach varchar(15) ,
	bienSo varchar(15) ,
	ngayThue date ,
	ngayTra date,
	foreign key (maKhach) references khachHang(maKhach),
	foreign key (bienSo) references  Xe(bienSo)
)



----------------
select*from KhachHang
select*from KhachHang
select*from KhachHang

insert into khachHang values
    ('Kh124', N'Ngô Thành Tài', N'120-Bùi Xương Trạch', '0869189312', '00364789415601'),
	('Kh122', N'Lê Hồng Đăng', N'10-Lê Trọng Tấn', '0988467103', '00364789415649'),
	('Kh123', N'Trần Văn Thủy', N'27-Hoàng Hoa Thám', '033354687', '0036445456456')
delete  from KhachHang

	select * from Xe
insert into Xe values
	('29H-1234', 50, 500, 'Toyota'),
	('29N-2221', 7, 200, 'Honda'),
	('29A-1432', 29, 350, 'Ford')

	select * from thueXe
insert into thueXe values
	('Kh122', '29N-2221', '2022-03-20', '2022-03-25'),
	('Kh122', '29N-2221', '2022-01-10', '2022-01-12'),
	('Kh123', '29H-1234', '2021-03-10', '2021-03-18')


------CÂU3-------
SELECT * FROM XE 
WHERE hangXe ='Ford' 
AND
donGia =(SELECT MAX(donGia) FROM XE group BY hangXe,donGia HAVING hangXe='FORD')
------CÂU4-------
select  datediff(day,ngayThue,ngayTra) as soNgayThue,
datediff(day,ngaythue,ngaytra)*donGia  as sotienthuexe
from Khachhang
join Thuexe on Khachhang.makhach=Thuexe.makhach 
join xe on xe.bienso=Thuexe.Bienso
where MONTH(ngaythue)=3 and year(ngaythue)=2022
-----CÂU5-------
SELECT TOP 1 COUNT(KhachHang.maKhach) soLanThue,KhachHang.maKhach AS soNgayThue
FROM KhachHang JOIN thueXe ON  KhachHang.maKhach=thueXe.maKhach
GROUP BY KhachHang.maKhach
ORDER BY soLanThue DESC
------CÂU6------
select count(bienSo) as soLuotthue, bienSo from thueXe group by bienSo

-------------cau 7
select *,Tongsotien=donGia*soluotthue 
from xe 
join (select count(bienso) as soluotthue, Bienso from Thuexe group by Bienso)
a on xe.bienso=a.Bienso

select *,Tongsotien=donGia*songaythue
from xe join (
select sum(datediff(day,ngayThue,ngayTra))as songaythue,xe.bienso
from Xe join thueXe on Xe.bienSo=thueXe.bienSo group by xe.bienSo) a on xe.bienSo=a.bienSo


------------cau 8

select top( 1)   bienSo from Thuexe group by bienSo order by count(bienSo)
-------------cau 9
--3--a Giamr dơn giá 20% cho các xe trên 20 chỗ
	select*from Xe
	update Xe set donGia=donGia*0.8 where soGhe >20
-----------cau 10---------
---3--b--
	select*from thueXe
	delete  from thueXe where ngayThue <'2022-01-01'

	--2---a
	select*from KhachHang where hoTen like N'Lê%'
	--2---b
	select*from KhachHang where sdt like '03%'
	--2---c
	select Top(1) * from Xe order by donGia desc
--	c. Tìm tất cả các xe có đơn giá đắt nhất của hãng Ford.
   select * from xe
   where hangxe like 'Ford' and dongia=
  (select max(dongia) from xe where hangxe like 'Ford')
	
	----
	--d. Đưa ra tất cả họ tên khách,số ngày thuê,  số tiền thuê xe của các khách trong tháng 3/2022. // datediff(day,ngaythue,ngaytra) = so ngay thue

select k.hoten, datediff(day,ngaythue,ngaytra) as N'so ngay thue', datediff(day,ngaythue,ngaytra)*x.dongia as N'So tien thue'
from khachhang as k join thuexe as tx on 
k.maKhach=tx.maKhach join xe as x on x.bienso=tx.bienso
where year(tx.ngaythue)=2022 and month(tx.ngaythue)=3

--e. Đưa ra thông tin khách thuê xe nhiều lần nhất.
select top (1)  k.*, count(tx.maKhach) as N'So lan thue'
from khachhang as k join thuexe as tx on k.maKhach=tx.maKhach
group by tx.maKhach, k.maKhach, hoten,sdt,diachi,socancuoc
order by count(tx.maKhach) desc

--f. Đưa ra số lượt được thuê của mỗi xe.  
select bienso, count(bienso) as N'So luot thue'
from thuexe
group by bienso

---g. Tính tổng tiền thu được từ mỗi đầu xe. 
select tx.bienso, sum(datediff(day,tx.ngaythue,tx.ngaytra)*x.dongia) as N'Tong tien'
from thuexe as tx join xe as x on tx.bienso=x.bienso
group by tx.bienso

---h. Đưa ra đầu xe được thuê ít nhất.
select top (1) bienso, count(bienso) as N'So luot thue'
from thuexe
group by bienso
order by  count(bienso) asc -- giảm dan/ mac dinh