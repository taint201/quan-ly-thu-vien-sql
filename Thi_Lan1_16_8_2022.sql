CREATE DATABASE Thi_Lan1_16_8_2022
IF OBJECT_ID('SinhVien') IS NOT NULL
DROP TABLE SinhVien
CREATE TABLE SinhVien (
MaSinhVien VARCHAR(30) PRIMARY KEY,
HoTen NVARCHAR(50),
NgaySinh date,
GioiTinh Nvarchar(20) check(GioiTinh = N'Nam' or GioiTinh= N'Nữ')
)
IF OBJECT_ID('MonHoc') IS NOT NULL
DROP TABLE MonHoc
CREATE TABLE MonHoc (
MaMonHoc VARCHAR(20) PRIMARY KEY,
TenMonHoc NVARCHAR(50),
SoTinChi int
)
IF OBJECT_ID('BangDiem') IS NOT NULL
DROP TABLE BangDiem
CREATE TABLE BangDiem (
MaSinhVien VARCHAR(30),
MaMonHoc VARCHAR(20),
PRIMARY KEY(MaSinhVien,MaMonHoc),
DiemThi int Check(DiemThi >=0 or DiemThi <=10),
FOREIGN KEY (MaSinhVien) REFERENCES SinhVien(MaSinhVien),
FOREIGN KEY (MaMonHoc) REFERENCES MonHoc(MaMonHoc),
)
 insert into SinhVien(MaSinhVien,HoTen,NgaySinh,GioiTinh) values
 ('ph10198',N'Nguyễn Thị Ngọc Vân','2001-08-09',N'Nữ'),
 ('ph10199',N'Chu Thị Vân','2002-09-20',N'Nữ'),
 ('ph10355',N'Nguyễn Thị Dung','2004-2-5',N'Nữ'),
 ('ph10947',N'Ngô Thành  Tài','2001-1-20',N'Nữ'),
 ('ph10998',N'Ngô Văn Chung','2001-3-25',N'Nam')

 insert into MonHoc(MaMonHoc,TenMonHoc,SoTinChi) values
 ('SQL',N'Cơ Sở Dữ Liệu',5),
 ('Java',N'Cơ Sở Dữ Liệu',6),
 ('Js',N'Cơ Sở Dữ Liệu',8),
 ('Moblie App',N'Cơ Sở Dữ Liệu',12),
 ('Web',N'Cơ Sở Dữ Liệu',10)

  insert BangDiem(MaSinhVien,MaMonHoc,DiemThi) values
 ('ph10198',N'SQL',9),
 ('ph10199',N'Web',5),
 ('ph10355',N'Java',8),
 ('ph10947',N'SQL',10),
 ('ph10998',N'Web',6)

 ----------------
 select*from SinhVien
 select*from MonHoc
 select*from BangDiem

--1. hiển thị dữ liệu sinh viên gồm masv,hoten,ngaysinh,gioitinh
select*from SinhVien
--2.hiển thị sinh viên có điểm <=5
select sv.MaSinhVien, sv.HoTen, sv.NgaySinh, sv.GioiTinh, bd.DiemThi  from SinhVien sv
join BangDiem bd
on sv.MaSinhVien = bd.MaSinhVien
where bd.DiemThi <=5

--3. hiển thị sinh viên có điểm trung bình <5 (trong đó ĐTB = (điểm thi nhân tiến chỉ)chia cho tổng tiến chỉ
select*from MonHoc
select * from BangDiem
---
select mh.MaMonHoc, mh.TenMonHoc, mh.SoTinChi,bd.MaSinhVien, bd.DiemThi,
(DiemThi*SoTinChi)/sum(SoTinChi) as 'DTB'from MonHoc mh 
join BangDiem bd
on mh.MaMonHoc = bd.MaMonHoc
group by mh.MaMonHoc, mh.TenMonHoc, mh.SoTinChi,bd.MaSinhVien, bd.DiemThi
having (DiemThi*SoTinChi)/sum(SoTinChi)>5

--4.hiển thi sinh viên có độ tuổi >19
select MaSinhVien, HoTen,NgaySinh,GioiTinh, DATEDIFF(YEAR,NgaySinh,getdate()) as 'Tuoi' from SinhVien 
where  DATEDIFF(YEAR,NgaySinh,getdate())>19
--5.chèn thêm dữ liệu vào bảng điểm
insert into BangDiem(MaSinhVien,MaMonHoc,DiemThi) values
('ph10947',N'Moblie App',8)
select*from BangDiem
--6. update  vào bảng điểm có số điểm thi=8 ->7
select*from BangDiem
update BangDiem set DiemThi =7 where DiemThi =6