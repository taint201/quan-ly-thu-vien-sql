﻿create database Thi_thu_2
if OBJECT_ID('PhongBan') is not null
drop table PhongBan
create table PhongBan(
	maPB varchar(10) primary key,
	tenPB nvarchar(20),
	nganSach money
)
if OBJECT_ID('CongViec') is not null
drop table CongViec
create table CongViec(
    maCV varchar(10) primary key,
	tenCV nvarchar(50),
	luongMin money,
	luongMax money
)
if OBJECT_ID('NhanVien') is not null
drop table NhanVien
create table NhanVien(
    maNV varchar(10) ,
	primary key( maNV,maCV,maPB),
	hoTenNV nvarchar(50),
	luongCB money,
	ngaySinh date,
	gioiTinh nvarchar(20),
	maCV varchar(10),
	maPB varchar(10)
	foreign key (maPB) references PhongBan(maPB),
	foreign key (maCV) references CongViec(maCV)
)

--nhập dữ liệu
insert into PhongBan(maPB,tenPB,nganSach) values 
   ('HC',N'Hành Chính','5000000'),
   ('KT',N'Kĩ Thuật','7000000'),
   ('KD',N'Kinh Doanh','10000000')

insert into CongViec(maCV,tenCV,luongMin,luongMax) values
  ('CV01',N'Sửa chữa điện nước','200000','800000'),
  ('CV02',N'Dọn dẹp','100000','500000'),
  ('CV03',N'Bán sản phẩm','800000','2200000')
  
insert into NhanVien values
   ('NV01',N'Trần Hoàng Anh','5000000','1977-8-8',N'Nam','CV02','KT'),
   ('NV02',N'Nguyễn Trà My','4000000','1982-10-20',N'Nữ','CV02','HC'),
   ('NV03',N'Lê Tuấn Tú','6000000','1991-11-10',N'Nam','CV01','KD')

   
---------------------------------------Truy vấn
   select *from PhongBan
   select *from NhanVien
   select *from CongViec


   --a--
   SELECT maNV, hoTenNV,tenCV, DATEDIFF(YEAR, ngaySinh, GETDATE()) AS 'Tuổi'
FROM NhanVien nv
JOIN CongViec cv
ON nv.maCV = cv.maCV
WHERE DATEDIFF(YEAR, ngaySinh, GETDATE()) >= 40
   ---b-ff
   select nv.maNV,nv.hoTenNV,pb.tenPB,cv.tenCV,cv.luongMin from NhanVien nv
   join CongViec cv
   on nv.maCV = cv.maCV
   join PhongBan pb
   on pb.maPB = nv.maPB
   where cv.luongMin  between  950000  and 130000
   --c--ok
   select nv.maNV,nv.hoTenNV,pb.tenPB,cv.tenCV from NhanVien nv
   join CongViec cv
   on nv.maCV = cv.maCV
   join PhongBan pb
   on pb.maPB = nv.maPB
   where  nv.hoTenNV like N'Nguyễn%'
  -- group by nv.maNV,nv.hoTenNV,pb.tenPB,cv.tenCV
  --- having nv.hoTenNV like N'Nguyễn%'
---------------------------------------
---d
 select  Top(1) nv.maNV,nv.hoTenNV,pb.tenPB,cv.tenCV,nv.luongCB from NhanVien nv
   join CongViec cv
   on nv.maCV = cv.maCV
   join PhongBan pb
   on pb.maPB = nv.maPB
   order by nv.luongCB desc
---e
SELECT pb.maPB, pb.tenPB FROM PhongBan pb
JOIN NhanVien nv
ON pb.maPB = nv.maPB
WHERE pb.maPB NOT IN (
SELECT pb.maPB
FROM PhongBan pb
JOIN NhanVien nv
ON pb.maPB = nv.maPB
GROUP BY pb.maPB
)
---f
insert into NhanVien values
 ('NV04',N'Lê Tuấn Anh','7000000','1991-12-10',N'Nam','CV02','KD')
---g
select*from NhanVien
DELETE
FROM NhanVien
WHERE maCV = 'CV02'

UPDATE NHANVIEN
SET luongCB = luongCB + luongCB * 0.1
WHERE maNV = 'NV03'

   --1 Đưa ra thông tin các nhà cung cấp có tên bắt đầu bằng chữ 'T' và 'V'
  -- select* from NhaCungCap
  -- where tenNCC like '%T%' and tenNCC like '%V%'
   --2 Đưa ra thông tin các mặt hàng có số lượng bán từ 200-1000
   --select *from hangDaBan
   --where soLuongBan between  200 and 1000
   ---c2----
   --select h.maHang, h.tenHang,h.donGia,h.xuatSu,hdb.soLuongBan,hdb.maNCC from Hang h
--join hangDaBan hdb
  -- on h.maHang = hdb.maHang
   --group by h.maHang, h.tenHang,h.donGia,h.xuatSu,hdb.soLuongBan,hdb.maNCC
   --having hdb.soLuongBan >=200 and hdb.soLuongBan <=1000
   --order by hdb.soLuongBan desc --sắp xếp từ lớn -> bé ; asc :sắp xếp từ bé -> lớn
 --lưu ý: thứ tự   group by(nhóm dữ liệu) -> having(điều kiện lên nhóm) -> order by(sắp xếp dữ liệu)
 -- sau group by có gì => sau select có đấy 
 -----
  --3 Đưa ra thông tin các mặt hàng chưa được bán trong tháng 2/2022
  -- select tenHang from hangDaBan a 
  --- join hang b on a.maHang = b. maHang
  -- where b.maHang not in (select maHang from hangDaBan where ngayBan like'2021-2%')
   --4 Tìm thông tin 2 mặt hàng có đơn giá cao nhất 
   --select Top(2) * from hang order by donGia desc
   --5 tính tổng tiền đã bán của hàng có mã 'H2' trong tháng 1/2022
   --select soLuongBan*giaBan  as 'Tong tien ' from hangDaBan 
   --where   maHang = 'hang01' and ngayBan like '2022-01%'
   --6 Đưa ra tên các hàng không bán được trong tháng 6/2022
   ---select tenHang from hangDaBan a
   --join hang b 
  --- on a.maHang = b.maHang 
   --where b.maHang not in (select maHang  from hangDaBan where ngayBan like '2022-06%')
   --7 giảm 10% giá báncho các mặt hàng có xuất sứ 'Việt Nam'
   --select*from Hang
  --- update Hang set donGia = donGia*0.9
  -- where xuatSu = 'Việt Nam'
   --8 xóa các hàng đã bán trước năm 2020
  -- select *from hangDaBan
  -- delete hangDaBan where ngayBan < '2020-1-1'
  --------------------------------------------
 -- dateadd(day/month/year,number,thoi gian);
--tawng ngày +6
---giam ngày -6
--datediff=int
---update ngày ra trường thêm 6 ngày
--update sinhVien set ngayRaTruong = dateadd(MONTH,-6,ngayRaTruong)
---update ngày ra trường - 6 ngày
--update sinhVien set ngayRaTruong = dateadd(DAY,-6,ngayRaTruong)