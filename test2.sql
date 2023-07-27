create database test2
go
use test2
go

if OBJECT_ID('khachhang') is not null
drop table khachhang
go
create table khachhang (
   makh nvarchar(5) primary key,
   ten nvarchar(50),
   taikhoan char(9)
)

if OBJECT_ID('dathhang') is not null
drop table dathhang
go
create table dathhang (
   madh nvarchar(5),
   makh nvarchar(5),
   primary key(madh, makh),
foreign key (makh) references khachhang(makh),
   masach nvarchar(5),
   soluong int,
   dongia money
)

insert into khachhang values ('a1', N'nguyễn kim tuấn dũng', '097730469'),
                             ('a2', N'nguyễn dũng', '097730469'),
							 ('a3', N'nguyễn kim', '097730469')

insert into dathhang values ('dt3', 'a1', 's1', '10', 50000),
                            ('dt1', 'a3', 's2', '9', 110000),
							('dt2', 'a2', 's3', '7', 90000)
select * from khachhang

select * from dathhang

-- 3.1
select makh, ten from khachhang 
-- 3.2
select madh, khachhang.makh, soluong, dongia, (soluong * dongia) as thanhtien 
from dathhang join khachhang 
on dathhang.makh = khachhang.makh
-- 3.3
select * from khachhang 
where taikhoan like '%69'
-- 3.4
select * from khachhang 
where ten like N'%k%'
-- 3.5
select makh, sum (soluong) as tongsoluong
from dathhang
group by makh
having sum(soluong)>=10
order by sum (soluong) asc
-- 3.6
select top(1) makh, sum (soluong) as soluongnhieunhat
from dathhang
group by makh
order by sum (soluong) desc
