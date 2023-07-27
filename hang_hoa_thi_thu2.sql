﻿create database Hang_Hoa_test
if OBJECT_ID('NhaCungCap') is not null
drop table NhaCungCap
create table NhaCungCap(
	maNCC varchar(10) primary key,
	tenNCC nvarchar(20),
	diaChi nvarchar(50)
)
if OBJECT_ID('Hang') is not null
drop table Hang
create table Hang(
    maHang varchar(10) primary key,
	tenHang nvarchar(50),
	soLuong int,
	donGia money,
	xuatSu nvarchar(50)
)
if OBJECT_ID('hangDaBan') is not null
drop table hangDaBan
create table hangDaBan(
    maNCC varchar(10) ,
	maHang varchar(10) ,
	primary key (maNCC,maHang), --2 khoa chinhs
	soLuongBan int,
	ngayBan date,
	giaBan money
	foreign key (maNCC) references NhaCungCap(maNCC),
	foreign key (maHang) references Hang(maHang)
)
--nhập dữ liệu
insert into NhaCungCap(maNCC,tenNCC,diaChi) values 
   ('NCC01',N'NCC Ngọc Vân',N'Đống Vồng - Danh Thắng - Hiệp Hòa - BG'),
   ('NCC02',N'NCC Thảo Vân',N'Đống Vồng - Danh Thắng - Hiệp Hòa - BG'),
   ('NCC03',N'NCC Thu H',N'Đống Vồng - Danh Thắng - Hiệp Hòa - BG'),
   ('NCC04',N'NCC Ngô Tài',N'Cẩm Trang - Mai Trung - Hiệp Hòa - BG'),
   ('NCC05',N'NCC Ngô Chung',N'Châu Minh - Hiệp Hòa - BG'),
   ('NCC06',N'NCC Tuệ Anh',N'Phố Hoa - Bắc Lý - Hiệp Hòa - BG'),
   ('NCC07',N'NCC Anh Đức',N'Phố Hoa - Bắc Lý - Hiệp Hòa - BG'),
   ('NCC08',N'NCC Thanh Sơn',N'Phố Hoa - Bắc Lý - Hiệp Hòa - BG'),
   ('NCC09',N'NCC Ngọc Vân 98',N'Đại Mỗ - Hà Nội')


insert into Hang(maHang,tenHang,soLuong,donGia,xuatSu) values
   ('H1',N'Cafe Chồn',9800,1000000,N'Việt Nam'),
   ('H2',N'Cafe Sữa',8000,800000,N'Việt Nam'),
   ('H3',N'Cafe Đen',9809,810000,N'Việt Nam'),
   ('H4',N'Nước Cam ép',800,30000,N'Bắc Giang'),
   ('H5',N'Bim Bim',500,9000,N'Việt Nam'),
   ('H6',N'Bia Hơi Hà Nội',1000,30000,N'Hà Nội'),
   ('H7',N'Nước Cam Ép',1000,50000,N'Bắc Cạn'),
   ('H8',N'Trà Sữa',6000,35000,N'Hàn Quốc'),
   ('H9',N'Nước Táo Ép',10098,52000,N'Việt Nam'),
   ('H10',N'Cafe Hòa Tan',6800,45000,N'Việt Nam')

insert into hangDaBan(maHang,soLuongBan,ngayBan,giaBan,maNCC) values
   ('H1',5200,'2021-8-9',1200000,'NCC01'),
   ('H2',5000,'2020-5-8',850000,'NCC02'),
   ('H3',560,'2019-6-5',890000,'NCC03'),
   ('H4',3600,'2022-1-8',39000,'NCC04'),
   ('H5',5980,'2021-8-20',20000,'NCC05'),
   ('H6',5200,'2019-3-6',40000,'NCC06'),
   ('H7',5630,'2018-9-8',60000,'NCC07'),
   ('H8',710,'2016-5-2',40000,'NCC08'),
   ('H9',920,'2017-9-1',62000,'NCC09'),
   ('H10',5200,'2022-9-8',55000,'NCC01')

   delete hangDaBan
   select*from NhaCungCap
   select*from Hang
   select*from hangDaBan

---------------------------------------Trua vấn
   --1 Đưa ra thông tin các nhà cung cấp có tên bắt đầu bằng chữ 'T' và 'V'
   select* from NhaCungCap
   where tenNCC like '%T%' and tenNCC like '%V%'
   --2 Đưa ra thông tin các mặt hàng có số lượng bán từ 200-1000
   select *from hangDaBan
   where soLuongBan between  200 and 1000
   ---c2----
   select h.maHang, h.tenHang,h.donGia,h.xuatSu,hdb.soLuongBan,hdb.maNCC from Hang h
   join hangDaBan hdb
   on h.maHang = hdb.maHang
   group by h.maHang, h.tenHang,h.donGia,h.xuatSu,hdb.soLuongBan,hdb.maNCC
   having hdb.soLuongBan >=200 and hdb.soLuongBan <=1000
   order by hdb.soLuongBan desc --sắp xếp từ lớn -> bé ; asc :sắp xếp từ bé -> lớn
 --lưu ý: thứ tự   group by(nhóm dữ liệu) -> having(điều kiện lên nhóm) -> order by(sắp xếp dữ liệu)
 -- sau group by có gì => sau select có đấy 
 -----
  --3 Đưa ra thông tin các mặt hàng chưa được bán trong tháng 2/2022
   select tenHang from hangDaBan a 
   join hang b on a.maHang = b. maHang
   where b.maHang not in (select maHang from hangDaBan where ngayBan like'2021-2%')
   --4 Tìm thông tin 2 mặt hàng có đơn giá cao nhất 
   select Top(2) * from hang order by donGia desc
   --5 tính tổng tiền đã bán của hàng có mã 'H2' trong tháng 1/2022
   select soLuongBan*giaBan  as 'Tong tien ' from hangDaBan 
   where   maHang = 'hang01' and ngayBan like '2022-01%'

   --6 Đưa ra tên các hàng không bán được trong tháng 6/2022
   select tenHang from hangDaBan a
   join hang b 
   on a.maHang = b.maHang 
   where b.maHang not in (select maHang  from hangDaBan where ngayBan like '2022-06%')
   --7 giảm 10% giá báncho các mặt hàng có xuất sứ 'Việt Nam'
   select*from Hang
   update Hang set donGia = donGia*0.9
   where xuatSu = 'Việt Nam'
   --8 xóa các hàng đã bán trước năm 2020
   select *from hangDaBan
   delete hangDaBan where ngayBan < '2020-1-1'
  --------------------------------------------
 -- dateadd(day/month/year,number,thoi gian);
--tawng ngày +6
---giam ngày -6
--datediff=int
---update ngày ra trường thêm 6 ngày
--update sinhVien set ngayRaTruong = dateadd(MONTH,-6,ngayRaTruong)
---update ngày ra trường - 6 ngày
--update sinhVien set ngayRaTruong = dateadd(DAY,-6,ngayRaTruong)