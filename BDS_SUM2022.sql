-- tao database
create database Quanly_BDS_2012_MOI
-- tao bang vanphong
if OBJECT_ID('vanphong') is not null
drop table vanphong
go
create table vanphong(
mavp char(10) primary key,--khoa chinh
diadiem nvarchar(50),
truongphong char(10)
)
--tao bang nhan vien
if OBJECT_ID('nhanvien') is not null
drop table nhanvien
go
create table nhanvien(
manv char(10) primary key,--khoa chinh
hoten nvarchar(50),
mavanphong char(10), 
foreign key(mavanphong) references vanphong(mavp),--khoa ngoai
)
--tao bang than nhan
if OBJECT_ID('thannhan') is not null
drop table thannhan
go
create table thannhan(
mathannhan nvarchar(50) primary key,--khoa chinh
tentn nvarchar(50),
ngaysinh date,
moiquanhe nvarchar(30),
manv char(10),
foreign key(manv) references nhanvien(manv)--khoa ngoai
)
--tao bang chu so huu
if OBJECT_ID('csh') is not null
drop table csh
go
create table csh(
macsh nvarchar(50) primary key,--khoa chinh
tencsh nvarchar(50),
diachi nvarchar(50),
sdt char(10),
)
--tao bang bat dong san
if OBJECT_ID('bds') is not null
drop table bds
go
create table bds(
mabds nvarchar(30) primary key,
diachi nvarchar(50),
macsh nvarchar(50),
foreign key(macsh) references csh(macsh)--khoa ngoai
)
--tao bang bat dong san da ban
if OBJECT_ID('bdsdaban') is not null
drop table bdsdaban
go
create table bdsdaban(
mabds nvarchar(30) ,
manv char(10)  ,
ngayban date,
giaban money,
diachi nvarchar(50),
foreign key(mabds) references bds(mabds),--khoa ngoai
foreign key(manv) references nhanvien(manv),--khoa ngoai
Constraint pk_bdsdaban Primary key(manv,mabds)--khoa chinh
)



