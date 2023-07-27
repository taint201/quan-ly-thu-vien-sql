Create database HangHoa
if OBJECT_ID('nhaCungCap') is not null
drop table nhaCungCap
create table nhaCungCap(
	maNCC varchar(15) primary key,
	tenNCC nvarchar(25),
	diaChi nvarchar(55)
)
if OBJECT_ID('hang') is not null
drop table hang
create table hang(
	maHang varchar(15) primary key,
	tenHang nvarchar(25),
	soLuong int,
	donGia money,
	xuatSu nvarchar(25)
)
if OBJECT_ID('hangDaBan') is not null
drop table hangDaBan
create table hangDaBan(
	maNCC varchar(15),
	maHang varchar(15)
	primary key (maNCC, maHang),
	soLuongBan int,
	ngayBan date,
	giaBan money,
	foreign key (maNCC) references nhaCungCap(maNCC),
	foreign key (maHang) references hang(maHang)
)
delete nhaCungCap
select*from nhaCungCap
insert into nhaCungCap values
('ncc1',N'Tai',N'Thanh Xuan Ha Noi'),
('ncc2',N'Tuan',N'Ba Dinh Ha Noi'),
('ncc3',N' Anh Chung',N'Long Bien Ha Noi'),
('ncc4',N' Dung',N'Mi Dinh Ha Noi'),
('ncc5',N' Nam',N'Dai Mo Ha Noi')

select*from hang 
insert into hang values
('hang01', N'Nuoc Cam ep', 25,'3000','Viet Nam'),
('hang02', N'Nuoc Chanh Day', 10,'2000','Bac Giang'),
('hang03', N'Nuoc Ep Tao', 21,'4000','Viet Nam'),
('hang04', N'Nuoc Yen', 55,'9000','Viet Nam'),
('hang05', N'Nuoc Coca ', 25,'3000','Viet Nam')
delete hangDaBan
select *from hangDaBan
insert into hangDaBan values
	('ncc1', 'hang01', 17, '2019-05-11', '1200'),
	('ncc2', 'hang02', 9, '2020-05-20', '2300'),
	('ncc3', 'hang03', 21, '2021-05-21', '5200'),
	('ncc4', 'hang04', 5, '2022-05-25', '7200'),
	('ncc5', 'hang05', 3, '2022-05-21', '7200')

--1
select maNCC,tenNCC, diaChi  as 'ho va ten'from nhaCungCap where tenNCC like N'T%'
--2
select *from hangDaBan
where soLuongBan between  5 and 17
--3
select tenHang from hangDaBan a 
join hang b on a.maHang = b. maHang
where b.maHang not in (select maHang from hangDaBan where ngayBan like'2021-5%')

--4
select Top(2) * from hang order by donGia desc

--5
select soLuongBan*giaBan  as 'Tong tien ' from hangDaBan where   maHang = 'hang01' and ngayBan like '2022-05%'
--6
select tenHang from hangDaBan a
join hang b 
on a.maHang = b.maHang 
where b.maHang not in (select maHang  from hangDaBan where ngayBan like '2022-05%')

--
select maHang  from hangDaBan where ngayBan like '2022-05%'
--b
--1b
select*from hang 
update hang set donGia=donGia*0.9 
where xuatSu ='Viet Nam'

select*from hangDaBan
delete  from hangDaBan 
where  ngayBan < '2020-1-1'