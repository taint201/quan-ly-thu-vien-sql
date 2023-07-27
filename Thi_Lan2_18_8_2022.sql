create database Quan_ly_de_tai_thi
if OBJECT_ID('GIAOVIEN') is not null
drop table GIAOVIEN
create table GIAOVIEN(
    MaGv varchar(20) primary key,
	Hoten nvarchar(50),
	Ngaysinh date,
	Quequan nvarchar(100),
	GioiTinh nvarchar(50),
	--check GioiTinh = N'Nam' or GioiTinh = N'Nữ',
)
if OBJECT_ID('DETAI') is not null
drop table DETAI
create table DETAI(
  Madt varchar(20) primary key,
  tenDT nvarchar(50),
  Namthhien date,
  MaGv varchar(20),
  foreign key (MaGv) references GIAOVIEN(MaGv)
)
if OBJECT_ID('SINHVIEN') is not null
drop table SINHVIEN
create table SINHVIEN(
  Masv varchar(20) primary key,
  Hoten nvarchar(50),
  Ngaysinh date,
  Quequan nvarchar(60),
  Diem int,
  Madt varchar(20),
  foreign key (Madt) references DETAI(Madt)
)
  insert into GIAOVIEN(MaGv,Hoten,Ngaysinh,Quequan,GioiTinh) values
  ('Gv01',N'Trần Thị Loan','1978-5-6',N'Nam Định',N'Nữ'),
  ('Gv02',N'Lê Viết Thịnh','1989-3-5',N'Hà Tĩnh',N'Nam'),
  ('Gv03',N'Trần Hữu Thiện','1991-1-9',N'Nam Định',N'Nữ')

   insert into DETAI(Madt,Tendt,Namthhien,Magv) values
   ('D01',N'Công Nghệ 4.0','2017','Gv01'),
   ('D02',N'Công Nghệ Blockchain','2018','Gv03'),
   ('D03',N'Bitcoin','2018','Gv03')

   insert into SINHVIEN(Masv,Hoten,Ngaysinh,Quequan,Diem,Madt) values
    ('S009',N'Ngô Ngọc Hải ','1999-8-20',N'Bắc Giang',10,'D01'),
    ('S001',N'Lê Quang Tèo','2000-1-1',N'Hà Nội',7,'D02'),
    ('S002',N'Đỗ Mỹ Linh','1998-8-5',N'Hà Tĩnh',10,'D01'),
	('S003',N'Mai Phương Thúy','1999-9-6',N'Nghệ An',8,'D02')
   

   select*from GIAOVIEN
   select*from DETAI
   select*from SINHVIEN

   --2 đưa ra thông tin mã sv, họ tên , điểm ,tên đề tài,họ tên giáo viên 
   --của những sinh viên có giáo viên hưỡng dẫn là cô Trần Thị Loan 
   select sv.Masv,sv.Hoten,sv.Diem,dt.tenDT,gv.Hoten from GIAOVIEN gv
   join DETAI dt
   on gv.MaGv = dt.MaGv
   join SINHVIEN sv
   on dt.Madt = sv.Madt
   where gv.Hoten like N'Trần Thị Loan'

   --3-Đưa ra Masv, họ tên , năm sinh, tuổi của những sinh viên sống tại hà nội và tuổi >18
   select Masv, Hoten,Quequan,Ngaysinh,DATEDIFF(YEAR,Ngaysinh,getdate()) as 'Tuoi' from SINHVIEN
   where DATEDIFF(YEAR,Ngaysinh,getdate()) >18 and Quequan like N'Hà Nội'

   ---4
   select top(1) gv.MaGv,gv.Hoten,dt.Madt ,count(dt.Madt) as'Mã Đề Tài' from GIAOVIEN gv
   join DETAI dt
   on gv.MaGv = dt.MaGv
   group by gv.MaGv,gv.Hoten,dt.Madt
  ----
  select  gv.MaGv,gv.Hoten,dt.Madt ,count(dt.Madt) as'Mã Đề Tài' , avg(sv.Diem) as 'Điểm Trung Bình' from GIAOVIEN gv
   join DETAI dt
   on gv.MaGv = dt.MaGv
   join SINHVIEN sv
   on dt.Madt = sv.Madt
   group by gv.MaGv,gv.Hoten,dt.Madt,sv.Diem
  ---
  select AVG(Diem) from SINHVIEN
  select Sum(Diem) from SINHVIEN
  select * from SINHVIEN
   ---5
   select dt.Madt,dt.tenDT from DETAI dt
   join SINHVIEN sv
   on dt.Madt = sv.Masv

---6-- thêm dữ liệu vào bảng không đcược để dữ liệu trống
 insert into SINHVIEN(Masv,Hoten,Ngaysinh,Quequan,Diem,Madt) values
   ('S004',N'Ngô Thành Tài','2001-1-20',N'Đại Mỗ',10,'D02')

--7-Cập nhật quê quán thành hà nội cho giáo viên Trần Thị Loan
update GIAOVIEN set Quequan = N'Hà Nội' where Hoten like N'Trần Thị Loan'
select*from GIAOVIEN
--8 Xóa sinh viên có ngày sinh trong tháng 8
delete SINHVIEN where Ngaysinh like '%8%'
select*from SINHVIEN