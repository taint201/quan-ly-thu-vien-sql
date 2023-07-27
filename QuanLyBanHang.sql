create database QuanLyBanHang_LAB2
if OBJECT_ID ('khachHang') is not null
drop table khachHang
go
create table khachHang(
	maKH varchar(5) primary key,
	hoTenLot nvarchar(50),
	tenKH nvarchar(50),
	diaChi nvarchar(255),
	email varchar(50),
	dienThoai char(13)
)
if OBJECT_ID ('sanPham') is not null
drop table sanPham
go
create table sanPham(
	maSP int primary key,
	moTa nvarchar(255),
	soLuong int,
	donGia money,
	tenSP nvarchar(50)
)
if OBJECT_ID ('hoaDon') is not null
drop table hoaDon
go
create table hoaDon(
	maHoaDon    int primary key,
	ngayMuaHang date,
	maKH        varchar(5),
	trangThai   nvarchar(30),
	foreign key (maKH) references khachHang
)
if OBJECT_ID ('HoaDonChiTiet') is not null
drop table HoaDonChiTiet
go
create table HoaDonChiTiet(
	maHoaDon   int,
	maSP       int,
	soLuong    int,
	maHoaDonCT int primary key,
	foreign key (maHoaDon) references hoaDon,
	foreign key (maSP) references sanPham
)
--go
delete khachHang
select * from khachHang
Insert into khachHang(maKH,hoTenLot,tenKH,diaChi,email,dienThoai ) values
	('KH01', N' Ngo Van ', N'Tai', N'Đai Mô, Nam Từ Liêm, Hà Nội', 'taint201bg@gmail.com',0965874856),
	('KH02', N'Ngo Van ', N'Chung', N'Khương Đình, Thanh Xuân, Hà Nội', 'nguyenvanchung@gmail.com',0965844878),
	('KH03', N'Nguyen Van ', N'Dung', N'Cầu Diễn, BẮc Từ liêm, Hà Nội', 'nguyenvandung@gmail.com',0953874890),
	('KH04', N'Nguyen Van ', N'Thanh', N'Xuân Phương, Nam Từ Liêm, Hà Nội', 'nguyenvanthanh@gmail.com',0965869811),
	('KH05', N'Nguyen Van ', N'Cường', N'Xuân Phương, Nam Từ Liêm, Hà Nội', 'nguyenvancuong@gmail.com',0965869812),
	('KH06', N'Nguyen Van ',N'Kien', N'Cầu Diễn, BẮc Từ liêm, Hà Nội', 'nguyenvanc@gmail.com',0953874875),
	('KH07', N' Ngo Van ', N'Tien', N'Đai Mô, Nam Từ Liêm, Hà Nội', 'taint201bg@gmail.com',0965874856)
	
	Select * from sanPham
	Insert into sanPham(maSP, moTa, soLuong,donGia, tenSP) values
	(1, N'Bim bim cay', 101, 2000, 'Oisi cay'),
	(2, N'Đồ họa tốt', 200, 3000, 'Laptop Dell2012'),
	(3, N'Thiết kế đẹp', 300, 4000, 'Iphone 13'),
	(4, N'Thiết kế đẹp', 200, 5000, 'Mac1'),
	(5, N'Thiết kế bình thường', 5, 2000, 'Samsung')
	Insert into sanPham(maSP, moTa, soLuong,donGia, tenSP) values
	(6, N'Bim bim cay', 100, 2000, 'Oisi cay'),
	(7, N'Đồ họa tốt', 250, 3000, 'Laptop Dell2012'),
	(8, N'Thiết kế đẹp', 300, 4000, 'Iphone 13'),
	(9, N'Thiết kế đẹp', 200, 5000, 'Mac1'),
	(10, N'Thiết kế bình thường', 5, 2000, 'Samsung')


	delete hoaDon
	select * from hoaDon
	Insert into hoaDon(maHoaDon, ngayMuaHang, maKH, trangThai) values
	(11, '2022-1-28', 'KH01', N'Tốt'),
	(12, '2022-2-27', 'KH02', N'Trung Bình'),
	(13, '2022-3-26', 'KH03', N'Tốt'),
	(14, '2022-4-25', 'KH04', N'Trung Bình'),
	(15, '2022-5-24', 'KH05', N'Tốt'),
	(16, '2022-1-28', 'KH01', N'Tốt'),
	(17, '2022-2-27', 'KH02', N'Trung Bình'),
	(18, '2022-3-26', 'KH03', N'Tốt'),
	(19, '2022-4-25', 'KH04', N'Trung Bình'),
	(110, '2022-5-24', 'KH05', N'Tốt')

	delete HoaDonChiTiet
	select * from HoaDonChiTiet
	Insert into HoaDonChiTiet(maHoaDon,maSP,soLuong,maHoaDonCT) values
	(11, 6, 2, 001),
	(12, 7, 4, 002),
	(13, 8, 2, 003),
	(14, 9, 1, 004),
	(15, 10, 5,005)
	--(16,5, 2, 001),
	--(17, 2, 4, 002),
	--18, 3, 2, 003),
	--(19, 4, 1, 004),
	--(110, 1, 5, 005)
	 --truy vấn--
select * from khachHang
select * from sanPham
select * from hoaDon
select * from HoaDonChiTiet
--21/7/20022
--1. các câu lệnh cập nhật dữ liệu
--A. Inser.
-- theem 1 khach hang
select * from khachHang
Insert into khachHang values
	('KH09', N'Nguyen Van ', N'Dung', N'Cầu Diễn, BẮc Từ liêm, Hà Nội', 'nguyenvandung@gmail.com',0953874890),
	('KH10', N'Nguyen Van ', N'tuan', N'Xuân Phương, Nam Từ Liêm, Hà Nội', 'nguyenvanthanh@gmail.com',0965869811),
	('KH11', N'Nguyen Van ', N'Cường', N'Xuân Phương, Nam Từ Liêm, Hà Nội', 'nguyenvancuong@gmail.com',0965869812),
	('KH12', N'Nguyen Van ',N'Anh', N'Cầu Diễn, BẮc Từ liêm, Hà Nội', 'nguyenvanc@gmail.com',0953874875)
*---------------------------------------------------21/7-------------------*
--them 1 dong vao bang hoa don chi tiet
select*from HoaDonChiTiet
--vi maHoadonCT la identity nen khong cho vao insert
Insert into HoaDonChiTiet(maHoaDon,maSP,soLuong,maHoaDonCT) values(16,5,6,6)
--update--
--update ten bang set tencot1=gia tri moi,tencot2=gia tri moi,...
-->where dieu kien;
--neu bo qua where thif : update toan bo bang
-- neu co where thi:  chi updte nhung bang thoa man where
--vd1:tawng 10% don gia cua tat ca cac san pham
select*from sanPham
update sanPham set donGia=donGia*1.1
--vd2: giam 5% don gia cua cac san pham co so luong <5
--update sanPham set donGia=donGia-()
update sanPham set donGia=donGia*0.95 
where soLuong<5

--C delete: xoa du lieu ; drop: xoa ca bang
--vd1 xoa cac chi tiet hoa don co so luong >3
select*from HoaDonChiTiet
delete  from HoaDonChiTiet where  soLuong>3
--vd: xoa nhet san pham  trong bang san pham
select*from sanPham
--delete * from sanPham ; -- khong the xoa duoc vif bangSanpham laf bang 1, chi xoa o cac bang nhieu

--2 Cau lenh select tong quat
--* Cú pháp:
  --SELECT [distinct][ALL][TOP] (danh sach cot)
	--FROM TENBANG
	--SELECT [distinct] column(s)
	--FROM TENBANG
	--[WHERE ĐK] điều kiện chung lấy dữ liệu
	--[GROUP BY] -- nhom du lieu
	--[HAVING ĐK NHÓM] -- dieu kien len nhom
	--[ORDER BY TENCOT [asc/desc]] -- sắp xếp dữ liệu: ASC tang dan, ; DESC giam dan
--* Chú ý: Distinct có thể là các giá trị
--all: Trả về tất cả các bản ghi tìm thấy
-- Distinct: Trả về các bản ghi không trùng lặp nhau
-- Top: Trả về n (hay %) các bản ghi tìm thấy ở trên xuống.
--select: lấy cái gì
--from: lay o dau
--where: dieu kien
--Trả về các bản ghi không trùng lặp nhau
--vd1: dua ra ten cua tat ca khach hang
select tenKH from khachHang
--vd2 : dua ra ten khac nhau cua cac khach hang
select  distinct tenKH from khachHang
--vd3: dua ra tat ca cac khach hang co ten bat dau bang chu T
--* ten : tai , tien , thi ,thao
select * from khachHang --* thay the cho tat ca cac cot cua bang
where tenKH like N'T%'
--select tenKH from khachHang
--*cac vi tu tim kiem trong Where
-- *and : va = tat ca
--*or: 1 trong 3 cai
--vd-tim ban gai:
--1 xinh
--ngoan
--nhieu tien
-- in (gt1,gt2,gt3,..); lay trong 1 tap cac giatri
-- not : khong thuoc
-- like: so sanh tuong doi(gtri gan dung)-> khi chi biet 1 phan cua du lieu; gan nhu, giong nhu
-- + %: thay the 1 nhom cac ky tu
-- + _: gach duoi: thay the cho 1 ky tu bat ky
-- between gt1 and gt2: lay tu gia tri 1 den gt2; luu y : tu gt1 den gt2 la cac gia tri dem duoc; la cac giatri nguyen: int, date,...
-- = : so sanh tuyet doi
--vd4: dua ra thong tin cac sp cos so gia tien tu 1000-2000
select* from sanPham where donGia>=1000 and donGia<=2000
--cach2:
select* from sanPham where donGia between 100 and 2000;

--vd5 : dua ra thong tin cac hoa don co mua hang tuw 1/2022 den 2/2022
select * from hoaDon
select*from hoaDon where ngayMuaHang between '2022-1-1'and '2022-2-28'
--vd6: dua ra thong ti cua cac hoa don da mua hang trong thang 5 /2022
select*from hoaDon where ngayMuaHang between '2022-5-1' and '2022-5-31'
--vd7: dua ra top 3 hoa don chi tiet co so luong nhieu nhat 
--3,1,2,5,7,8,9
--xap xep :9,8,7,5,3,2,1
select * from HoaDonChiTiet
select top(3)*from HoaDonChiTiet order by soLuong desc 

--vd8: tim thong tin cac khach hang co ho la nguyen
select * from khachHang
--select*from khachHang where hoTenLot like N'nguyen%'
select*from khachHang where hoTenLot like N'% Ngo Van%';
*------------------------23/7/2022---lab5----(truy vấn trên nhiều bảng, select lồng = if, for lồng , froup by, having)-----------------------------*
--1.Truy van tren nhieu bang
--hai bang phai co cot chung de ket noi
select*from khachHang join hoaDon on khachHang.maKH = hoaDon.maKH
--vd1 dua ra thong tin chi tiet cac san pham trong hoa don chi tiet co ma hdct=1
--thong tin chi tiet san pham: bang sabPham
--co ma hdct=1 : lay bang hdct
-- as dat laij ten cho bang
-- join = inner join
select*from HoaDonChiTiet
select sp.*from sanPham  as sp join HoaDonChiTiet as hdct
on sp.maSP = hdct.maSP
where hdct.maHoaDonCT=1
--vd2: dua ra  ho ten cac khach hang da mua hang trong thang 4/2022
--phan tich
--+ ho ten khach : khachhang
--da mua hang: hoadon
--kiem tra kh va hoa don co kien ket?
----------------------------
--2 select long nhau
--select from [where...]
--(select from ... --select con)
--ket qua cua select con la dieu kien cua select cha.
--select con luon duoc thuc hien truoc.
--select con dat tron ()
--select  (kh.hoTenLot + '' +kh.tenKH) as 'hovaten'
--3 cac ham co san
--+ sum : tinh tong
-- hay tinh tong so sinh vien cua lop:
--+ dung count dem , khong dung sum
--+ min, max : chi dung tren cot co kieu la so.
-- +avg : tinh trung binh
--- vd1: hay dua ra thong tin cua khach hang mua hang  dau tien
--phan tich: ngay mua hang dau tien = ngay mua nho nhat
select * from khachHang
where maKH in
( --select con
select  maKH from hoaDon where ngayMuaHang =
(select min(ngayMuaHang) from hoaDon) --select chau
)

--vd2 dua ra thong tin cac khach chua mua hang trong 6/2022 (65%)
--phan tich:
--tim khach  mua trong thang 6/2022(1)--hoa don
--tim tat ca cac khach hang (2)--khachhang
-- khach khong mua thang =(2) not in (1)
select * from khachHang
where maKH not in (
select  maKH from hoaDon
where ngayMuaHang between '2022-05-1' and '2022-05-30'
)

select  maKH from hoaDon -- select con
where ngayMuaHang between '2022-04-1' and '2022-04-30'-- select con


--+ count: dem
Select (kh.hoTenLot + '' + kh.tenKH) as 'hoTenLot'
	from hoaDon as hd join khachHang as kh on hd.maKH=kh.maKH
	where hd.ngayMuaHang between '2020-06-01' and '2020-06-28'
--vd3
--Bài 1 (4 điểm) Viết các câu truy vấn sau:
--a. Hiển thị tất cả thông tin có trong bảng khách hàng bao gồm tất cả các cột
select * from khachHang;
--b. Hiển thị 10 khách hàng đầu tiên trong bảng khách hàng bao gồm các cột: mã
--khách hàng, họ và tên, email, số điện thoại
--select top(10)* from khachHang;
select top 10 maKH ,hoTenLot+''+ tenKH as 'hoTenLot',email,dienThoai from khachHang
--c. Hiển thị thông tin từ bảng Sản phẩm gồm các cột: mã sản phẩm, tên sản phẩm,
--tổng tiền tồn kho. Với tổng tiền tồn kho = đơn giá* số lượng
select  maSp ,tenSP, donGia* soLuong  as 'Tong Tien '
from sanPham
--d. Hiển thị danh sách khách hàng có tên bắt đầu bởi kí tự ‘H’ gồm các cột:
--maKhachHang, hoVaTen, diaChi. Trong đó cột hoVaTen ghép từ 2 cột
--hoVaTenLot và Ten
select maKH ,hoTenLot + '' + tenKH as 'Ho va ten ' , diaChi
from khachHang where tenKH like N'C%'
--e. Hiển thị tất cả thông tin các cột của khách hàng có địa chỉ chứa chuỗi ‘Đà Nẵng’/"xuan phương"
select maKH ,hoTenLot + '' + tenKH as 'Ho va ten ' , diaChi ,email,dienThoai
from khachHang where diaChi like N'%Xuân Phương%'
--f. Hiển thị các sản phẩm có số lượng nằm trong khoảng từ 100 đến 500.
select*from sanPham where soLuong between 100 and 500;

select*from sanPham where soLuong >=100 and soLuong <=500;--cach2
--g. Hiển thị danh sách các hoá hơn có trạng thái là chưa thanh toán(tot/trung binh) và ngày mua hàng
--trong năm 2016
select *from hoaDon where trangThai like N'Tốt' and YEAR(ngayMuaHang)=2022
--h. Hiển thị các hoá đơn có mã Khách hàng thuộc 1 trong 3 mã sau: KH001, KH003,
--KH006
select *from hoaDon where maKH = 'KH01' or maKH = 'KH02' or maKH ='KH03'

--Bài 2 (4 điểm) Viết các câu truy vấn sau:
--a. Hiển thị số lượng khách hàng có trong bảng khách hàng
select *from khachHang
select COUNT(*) from khachHang
--b. Hiển thị đơn giá lớn nhất trong bảng SanPham
select* from sanPham
select MAX(donGia) from sanPham
--c. Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm
select Min(soLuong) from sanPham
select Max(soLuong) from sanPham
--d. Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm
select SUM(soLuong) from sanPham
--e. Hiển thị số hoá đơn đã xuất trong tháng 12/2016 mà có trạng thái chưa thanh toán
select *from hoaDon where ngayMuaHang between '2022-5-1' and '2022-5-31' and trangThai like N'Tốt'

select*from hoaDon where ngayMuaHang >='2022-5-1' and ngayMuaHang<='2022-5-31' and trangThai like N'Tốt'
--f. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn.
select maSP , SUM(soLuong) from HoaDonChiTiet
group by maSP
select *from HoaDonChiTiet
--g. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. Yêu cầu
--chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5.
select *from HoaDonChiTiet
select maHoaDon,SUM(soLuong) from HoaDonChiTiet
group by maHoaDon having SUM(soLuong)>=5
--h. Hiển thị thông tin bảng HoaDon gồm các cột maHoaDon, ngayMuaHang,
--maKhachHang. Sắp xếp theo thứ tự giảm dần của ngayMuaHan
select maHoaDon , ngayMuaHang, maKH from hoaDon
order by ngayMuaHang desc

------------------------28/07--------------------------
 --group by (nhóm dữ liệu)
 --vd: Tính tổng tiền của từng hóa đơn
 --h1; sl:10 ; dg:50; = 1*50=50
 --h2; sl:2 ; dg:30;2*30=60
 --h3; sl:1 ; dg:20;1*20=20
 ---tổng tiền; 50 +60+20
 --bắt buộc phải nhóm dl; nhóm theo mã hóa đơn
 select * from HoaDonChiTiet
 --trong HoaDonCHiTiet ko có dongia;
 --dongia : trong sanpham
 --=> phải join 2 bảng : hdct join sanpham
 -- so hoa don : hoaDon => join bang hoadon
 --code
 select  hdct.soLuong*sp.donGia as 'Tong tien'
 from  hoaDon as hd join  HoaDonChiTiet  as hdct
 on hd.maHoaDon = hdct.maHoaDon
 join sanPham as sp
 on hdct.maSP = sp.maSP
 group by hd.maHoaDon,hdct.soLuong,sp.donGia
 --* nếu sử dụng group by , sau select lấy cái gì thì 
 --phải đặt trong group by


 ---vd2:Tính tổng tiền của từng hóa đơn,chỉ đưa ra các hóa đơn có tổng tiền lớn hơn 1 triệu

 --h1; sl:10 ; dg:50; = 1*50=50
 --h2; sl:2 ; dg:30;2*30=60
 --h3; sl:1 ; dg:20;1*20=20
 ---tổng tiền; 50 +60+20
 --bắt buộc phải nhóm dl; nhóm theo mã hóa đơn
 select * from HoaDonChiTiet
 --trong HoaDonCHiTiet ko có dongia;
 --dongia : trong sanpham
 --=> phải join 2 bảng : hdct join sanpham
 -- so hoa don : hoaDon => join bang hoadon
 --code
 select  hdct.soLuong*sp.donGia as 'Tong tien'
 from  hoaDon as hd join  HoaDonChiTiet  as hdct
 on hd.maHoaDon = hdct.maHoaDon
 join sanPham as sp
 on hdct.maSP = sp.maSP
 group by hd.maHoaDon,hdct.soLuong,sp.donGia
 having hdct.soLuong*sp.donGia >10000
 --* nếu sử dụng group by , sau select lấy cái gì thì 
 --phải đặt trong group by
 -- having là điều kiện lên nhóm chỉ sự dụng sau group by


---lap6---
--Bài 1 (4 điểm) Viết các câu truy vấn sau:
--a. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột
--sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua
--c1-- đặt bí danh cho hoaDon = a ; HoaDonChiTiet = b
select a.maHoaDon,maKH,trangThai,maSP,ngayMuaHang from hoaDon a
join HoaDonChiTiet b
on a.maHoaDon = b.maHoaDon
--c2--
select hd.maHoaDon,maKH,trangThai,maSP,ngayMuaHang from hoaDon hd
join HoaDonChiTiet hdct
on hd.maHoaDon = hdct.maHoaDon
--b. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột
--sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua với
--điều kiện maKhachHang = ‘KH001’
select hd.maHoaDon,maKH,trangThai,maSP,soLuong,ngayMuaHang from hoaDon hd
 join HoaDonChiTiet hdct
on hd.maHoaDon = hdct.maHoaDon where maKH = 'KH01'
--c. Hiển thị thông tin từ 3 bảng Hoá đơn, Hoá đơn chi tiết và Sản phẩm gồm các cột
--sau: maHoaDon, ngayMua, tenSP, donGia, soLuong mua trong hoá đơn, thành
--tiền. Với thành tiền= donGia* soLuong
select *from sanPham
select hd.maHoaDon,ngayMuaHang,tenSP,donGia,hdct.soLuong ,
hdct.soLuong*donGia as 'Thành Tiền'
from hoaDon hd
join HoaDonChiTiet hdct
on hd.maHoaDon = hdct.maHoaDon
--select * from HoaDonChiTiet hdct
join sanPham sp
on sp.soLuong = hdct.soLuong
--join sanPham sp
--d. Hiển thị thông tin từ bảng khách hàng, bảng hoá đơn, hoá đơn chi tiết gồm các
--cột: họ và tên khách hàng, email, điện thoại, mã hoá đơn, trạng thái hoá đơn và
--tổng tiền đã mua trong hoá đơn. Chỉ hiển thị thông tin các hoá đơn chưa thanh
--toán.
---------
select*from khachHang
select KH.hoTenLot + ' ' + tenKH AS N'HO VA TEN', email, dienThoai, HD.maHoaDon, trangThai, SUM(SP.donGia*HDCT.soLuong) AS N'TONG TIEN'
from khachHang AS KH JOIN hoaDon AS HD
on KH.maKH=HD.maKH
 JOIN HoaDonChiTiet AS HDCT
on HD.maHoaDon= 
HDCT.maHoaDon JOIN SANPHAM AS SP
on SP.maSP=HDCT.maSP
where HD.trangThai LIKE N'Tốt' -- N'Tốt%'
group by HD.maHoaDon, KH.hoTenLot, tenKH , email, dienThoai, HD.maHoaDon, trangThai

--e. Hiển thị maHoaDon, ngàyMuahang, tổng số tiền đã mua trong từng hoá đơn. Chỉ
--hiển thị những hóa đơn có tổng số tiền >=500.000 và sắp xếp theo thứ tự giảm dần
--của cột tổng tiền.
select hd.maHoaDon,ngayMuaHang,hdct.soLuong,SUM(hdct.soLuong*donGia ) as 'Tổng Tiền'
from hoaDon hd
join HoaDonChiTiet hdct
on hd.maHoaDon = hdct.maHoaDon
join sanPham sp
on sp.maSP = hdct.maSP
group by hd.maHoaDon, ngayMuaHang,hdct.soLuong
having SUM(hdct.soLuong * donGia) >=5000 


--e 2
select*from khachHang

select KH.hoTenLot + ' ' + tenKH AS N'HO VA TEN', email, dienThoai, HD.maHoaDon, trangThai, SUM(SP.donGia*HDCT.soLuong) AS N'TONG TIEN'
from khachHang AS KH JOIN hoaDon AS HD
on KH.maKH=HD.maKH
 JOIN HoaDonChiTiet AS HDCT
on HD.maHoaDon= 
HDCT.maHoaDon JOIN SANPHAM AS SP
on SP.maSP=HDCT.maSP
where HD.trangThai LIKE N'Tốt' -- N'Tốt%'
group by HD.maHoaDon, KH.hoTenLot, tenKH , email, dienThoai, HD.maHoaDon, trangThai
having SUM(hdct.soLuong * donGia) >=5000
order by SUM(hdct.soLuong * donGia)   
--Bài 2 (4 điểm) Viết các câu truy vấn sau:
--a. Hiển thị danh sách các khách hàng chưa mua hàng lần nào kể từ tháng 1/1/2016
select * from hoaDon
--phân tích: 
---.thay vì tìm người chưa mua hàng thì sẽ tìm người mua hàng 1/1/2022 đến nay (1)
---.người chưa mua: = tổng số người mua  không nằm trong(not in) (1)
---chưa đúng
---code--
--tìm tất cả khách hàng
select*from hoaDon
select maKH from khachHang
where maKH not in (
--tìm khách mua hàng từ 1/1/2022 đến nay
select maKH from hoaDon where ngayMuaHang >= '2022-02-13'
)

---chưa đúng
--b. Hiển thị mã sản phẩm, tên sản phẩm có lượt mua nhiều nhất trong tháng 12/2016
--phân tích:
-- + lượt mua: count; đếm
-- + nhiều nhất: max(count(mahang))
-- + muốn đếm được số lượt mua thì phải nhóm theo mã sản phẩm - group by
-- + masp, tensp: sanpham
--+ da mua: hoadonchitiet
SELECT TOP (1)  HDCT.maSP, SP.tenSP, COUNT(HDCT.maSP) AS N'SO LUOT'
FROM HoaDon AS HD JOIN HoaDonChiTiet AS HDCT 
on hd.maHoaDon=HDCT.maHoaDon
join  sanPham AS SP 
 ON SP.masp=HDCT.maSp
 WHERE YEAR(HD.ngayMuaHang)=2022 AND MONTH(HD.ngayMuaHang)=3
GROUP BY  count(HDCT.maSP) desc



----
select * from HoaDon
select a.maSP , c.tenSP, COUNT(*) as luotMua --chua in ra dc
from HoaDonChiTiet a
join hoaDon b on a.maHoaDon = b.maHoaDon
join sanPham c on a.maSP = c.maSP
where b.ngayMuaHang like '2022-2%'
group by a.maSP, c.tenSP
having COUNT(*) >= ALL (select Count(*) from HoaDonChiTiet
join hoaDon on HoaDonChiTiet.maHoaDon = hoaDon.maHoaDon
where hoaDon.ngayMuaHang like '2022-2%'
group by HoaDonChiTiet.maSP)
--select con
select HoaDonChiTiet.maSP ,COUNT(*) from HoaDonChiTiet --loi
inner join hoaDon on HoaDonChiTiet.maHoaDon = hoaDon.maHoaDon
where hoaDon.ngayMuaHang like '2022-2%'
--c. Hiển thị top 5 khách hàng có tổng số tiền mua hàng nhiều nhất trong năm 2016
select top 5 khachHang.*, SUM(HoaDonChiTiet.soLuong * sanPham.donGia) as 'Tong Tien'
from sanPham 
 join HoaDonChiTiet on sanPham.maSP = HoaDonChiTiet.maSP
 join hoaDon on hoaDon.maHoaDon = HoaDonChiTiet.maHoaDon
 join khachHang on khachHang.maKH = hoaDon.maKH
where YEAR(hoaDon.ngayMuaHang) = '2022'
group by khachHang.maKH, khachHang.hoTenLot,khachHang.tenKH,diaChi,email,dienThoai
order by [Tong Tien] desc
--d. Hiển thị thông tin các khách hàng sống ở ‘Đà Nẵng’ có mua sản phẩm có tên
--“Iphone 7 32GB” trong tháng 12/2016
select*from hoaDon
select*from sanPham
select*from khachHang
select * from HoaDonChiTiet
join sanPham on HoaDonChiTiet.maSP = sanPham.maSP
join hoaDon on hoaDon.maHoaDon = HoaDonChiTiet.maHoaDon
join khachHang on khachHang.maKH = hoaDon.maKH
where khachHang.diaChi like N'%Cầu Diễn%' and
sanPham.tenSP like N'% Iphone 13%' and
sanPham.tenSP like N'% Iphone13' and hoaDon.ngayMuaHang like '2022-0-0'
-------
select AVG(soLuong) from HoaDonChiTiet
 select*from HoaDonChiTiet
 where soLuong < (select AVG(soLuong) from HoaDonChiTiet)
 ---
 select sanPham.*from sanPham
join HoaDonChiTiet on sanPham.maSP = HoaDonChiTiet.maSP
 where HoaDonChiTiet.soLuong < (select AVG(soLuong) as TBC from HoaDonChiTiet)
--e. Hiển thị tên sản phẩm có lượt đặt mua nhỏ hơn lượt mua trung bình các các sản
--phẩm.
--hien thi ra so luot mua
select sanPham.maSP, sanPham.tenSP, COUNT(sanPham.maSP) as 'So luot mua'  from HoaDonChiTiet
join sanPham on HoaDonChiTiet.maSP = sanPham.maSP
group by sanPham.maSP , sanPham.tenSP
having COUNT(sanPham.maSP) <( select AVG(SLM) as 'So Luot Mua Trung Binh' from (select sanPham.maSP, sanPham.tenSP, COUNT(sanPham.maSP) as ' So Luot Mua Trung Binh' from HoaDonChiTiet
join sanPham on HoaDonChiTiet.maSP = sanPham.maSP
group by sanPham.maSP , sanPham.tenSP) as sanPhamTB)
 --luot mua trung binh cac san pham
select AVG(SLM) as 'So Luot Mua Trung Binh' from (select sanPham.maSP, sanPham.tenSP, COUNT(sanPham.maSP) as 'So Luot Mua Trung Binh' from HoaDonChiTiet
 join sanPham on HoaDonChiTiet.maSP = sanPham.maSP
group by sanPham.maSP,sanPham.tenSP) as sanPhamTB