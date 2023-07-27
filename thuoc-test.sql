CREATE DATABASE Ban_Thuoc_test
IF OBJECT_ID('THUOC') IS NOT NULL
DROP TABLE THUOC
CREATE TABLE THUOC (
Mathuoc VARCHAR(20) PRIMARY KEY,
Tenthuoc NVARCHAR(50),
Donvitinh Nvarchar(30),
Gia money,
Nhomdieutri Nvarchar(50)
)
IF OBJECT_ID('HOSO') IS NOT NULL
DROP TABLE HOSO
CREATE TABLE HOSO (
Mahs VARCHAR(20) PRIMARY KEY,
Hoten NVARCHAR(50),
Ngaysinh date,
Gioitinh NVARCHAR(5) CHECK(GIOITINH = N'NAM' OR GIOITINH = N'NỮ'),
Cancuoc varchar(10),
NgayLap date
)
IF OBJECT_ID('KHAMBENH') IS NOT NULL
DROP TABLE KHAMBENH
CREATE TABLE KHAMBENH (
Makb VARCHAR(20) PRIMARY KEY,
Mahs VARCHAR(20),
NgayKham date,
Bacsi nvarchar(50),
Ketluan nvarchar(90)
FOREIGN KEY (Mahs) REFERENCES HOSO(Mahs)
)
IF OBJECT_ID('TOATHUOC') IS NOT NULL
DROP TABLE TOATHUOC
CREATE TABLE TOATHUOC (
Makb VARCHAR(20) ,
Mathuoc VARCHAR(20),
PRIMARY KEY(Makb,Mathuoc),
Soluong int,
FOREIGN KEY (Mathuoc) REFERENCES THUOC(Mathuoc),
FOREIGN KEY (Makb) REFERENCES KHAMBENH(Makb),
)

insert into THUOC(Mathuoc,Tenthuoc,Donvitinh,Gia,Nhomdieutri) values
('t01',N'Cảm cúm',N'Vỉ',2000,N'Hô Hấp'),
('t02',N'Đi ngoài',N'Vỉ',3000,N'Tiêu Hóa'),
('t03',N'Giảm đau đầu',N'Vỉ',4000,N'Giảm Đau'),
('t04',N'Ho',N'Vỉ',2500,N'Hô Hấp'),
('t05',N'Siro Ho',N'Vỉ',2900,N'Hô Hấp')

insert into HOSO(Mahs,Hoten,Ngaysinh,Gioitinh,Cancuoc,NgayLap) values
 ('020',N'Ngô Văn Chung','2001-01-01',N'Nam','012345668','2022-8-15'),
 ('021',N'Ngô Văn A','2003-02-06',N'Nam','012345368','2022-7-13'),
 ('022',N'Ngô Văn B','2002-03-08',N'Nam','012345698','2022-6-9'),
 ('023',N'Nguyễn Thị C','2001-04-09',N'Nữ','012345678','2022-11-21'),
 ('024',N'Nguyễn Thị T','2005-05-03',N'NỮ','012345656','2022-12-22')
 
 insert into KHAMBENH(Makb,Mahs,NgayKham,Bacsi,Ketluan) values
 ('mk01','020','2022-01-3','Bs.A','Thua can'),
 ('mk02','021','2021-06-4','Bs.B','Thua can'),
 ('mk03','022','2022-01-5','Bs.C','Thua can'),
 ('mk04','023','2022-09-8','Bs.D','Thua can'),
 ('mk05','024','2022-01-7','Bs.E','Thua can')
insert into TOATHUOC(Makb,Mathuoc,Soluong) values 
 ('mk01','t01',300),
 ('mk03','t03',800),
 ('mk04','t04',900),
 ('mk05','t05',500)

select*from HOSO
select*from KHAMBENH
select*from TOATHUOC
select*from THUOC

---------------truy van---
--1) Hiển thị (mathuoc,tenthuoc,soluong,Mahs)trong nhung lần khám bệnh của hồ sơ có mà '024'
select t.Mathuoc,t.Tenthuoc,tt.Soluong,hs.Mahs from HOSO hs
join KHAMBENH kb
on hs.Mahs = kb.Mahs
join TOATHUOC tt
on kb.Makb = tt.Makb
join THUOC t
on tt.Mathuoc = t.Mathuoc
where hs.Mahs = '024'

--2) Hiển thị (maHs,hotenbn,tuoi,bacsi,ketluan,)dươc kham trong ngay11/1/2021 sx danh sách theo mahs(tăng dần)
select hs.Mahs,hs.Hoten,DATEDIFF(YEAR,Ngaysinh,GETDATE()) as 'Tuổi',kb.Bacsi,kb.Ketluan
from HOSO hs
join KHAMBENH kb
on hs.Mahs = kb.Mahs
join TOATHUOC tt
on kb.Makb = tt.Makb
join THUOC t
on tt.Mathuoc = t.Mathuoc
where kb.NgayKham like '2022-09-08'
order by kb.NgayKham desc

--3)Hiển thị (mahs,tenbn,bs,ketluan,ngaykham) bị kết luận là Thua can
select hs.Mahs,hs.Hoten,kb.Bacsi,kb.Ketluan,kb.NgayKham
from HOSO hs
join KHAMBENH kb
on hs.Mahs = kb.Mahs
join TOATHUOC tt
on kb.Makb = tt.Makb
join THUOC t
on tt.Mathuoc = t.Mathuoc
where kb.Ketluan like '%Thua can%'

--4) tìm các loại thuốc nhóm điều điều trị "Hô Hấp", có giá tu 500->1000 đồng
select*from THUOC where Gia >=500 and Gia <=2900  and Nhomdieutri like N'Hô Hấp' and Tenthuoc like N'%S%'

--5)Hiển thị (ngay kham,bs,ketluan),cua cac bn sn1975.
select kb.NgayKham,kb.Bacsi,kb.Ketluan,Hoten,Ngaysinh from HOSO hs
join KHAMBENH kb
on hs.Mahs = kb.Mahs
where hs.Ngaysinh like '2005%'

--6) in chi tiết các lan kham benh (Ngkham,bs,ketluan,) cau benh nhan co ten sv.
--sx  theo ngay kham (tăng dần)
select*from HOSO
select*from KHAMBENH
---
SELECT hs.Hoten,kb.NgayKham,kb.Bacsi,kb.Ketluan FROM HOSO hs
join KHAMBENH kb
on hs.Mahs = kb.Mahs
where hs.Hoten like N'%Chung'
order by kb.NgayKham asc

--7)tìm thông tin các bệnh nhân nhiều tuoi nhat
select*from HOSO
select top(1) Mahs,Hoten,Ngaysinh,DATEDIFF(YEAR,Ngaysinh,GETDATE()) as 'Tuổi',Gioitinh,Cancuoc,NgayLap from HOSO
order by Tuổi desc

--8)Tìm thong tin các bệnh nhân  tren 50 tuôi
select Mahs,Hoten,Ngaysinh,DATEDIFF(YEAR,Ngaysinh,GETDATE()) as 'Tuoi'
,Gioitinh,Cancuoc,NgayLap from HOSO hs
where DATEDIFF(YEAR,Ngaysinh,GETDATE()) >20

--9)Đưa ra họ tên bệnh nhân , bác sỹ và tổng tiền mỗi toa thuốc
select hs.Hoten,kb.Bacsi,tt.Soluong*t.Gia as 'Tổng tiền' from HOSO hs
join KHAMBENH kb
on hs.Mahs = kb.Mahs
join TOATHUOC tt
on kb.Makb =tt.Makb
join THUOC t
on tt.Mathuoc = t.Mathuoc

--10)giảm 10% cho các thuốc thuộc nhóm điều y=trị "covit19"
select*from THUOC
update THUOC set Gia = Gia - (Gia*0.1)
where Nhomdieutri like N'%Giảm Đau%'

--11) xóa toa thuốc có mkb34 hoac mkb111
delete TOATHUOC where Makb ='mk04' or Makb ='mk111'
select*from TOATHUOC
select*from TOATHUOC where Makb ='mk04' or Makb ='mk111'

--12) xóa các thuốc có giá lớn hơn 100000
select*from THUOC
delete THUOC where Gia >3000

select COUNT(Mathuoc) from TOATHUOC
 

 -- dateadd(day/month/year,number,thoi gian);
--tawng ngày +6
---giam ngày -6
--datediff=int
---update ngày ra trường thêm 6 ngày
--update sinhVien set ngayRaTruong = dateadd(MONTH,-6,ngayRaTruong)
---update ngày ra trường - 6 ngày
--update sinhVien set ngayRaTruong = dateadd(DAY,-6,ngayRaTruong)