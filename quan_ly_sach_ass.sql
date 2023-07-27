CREATE DATABASE QuanLySach_Ass_ph10947
IF OBJECT_ID('phanLoai') is not null
drop table phanLoai
create table phanLoai(
	maPhanLoai varchar(10) primary key,
	tenPhanLoai nvarchar(30)
);
IF OBJECT_ID('nhaXuatBan') is not null
drop table nhaXuatBan
create table nhaXuatBan(
	maNXB varchar(10) primary key,
	tenNXB nvarchar(30),
	diaChi nvarchar (50)
);
IF OBJECT_ID('tacGia') is not null
drop table tacGia
create table tacGia(
	maTG varchar(10) primary key,
	hoTen nvarchar(30),
	ngaySinh date,
	gioiTinh nvarchar(5)
);
IF OBJECT_ID('nganh') is not null
drop table nganh
create table nganh(
	maNganh varchar(10) primary key,
	tenNganh nvarchar(20)
);
IF OBJECT_ID('lop') is not null
drop table lop
create table lop(
	maLop varchar(10) primary key,
	tenLop nvarchar(20),
	maNganh varchar(10),
	foreign key (maNganh) references nganh(maNganh)
);
IF OBJECT_ID('sinhVien') is not null
drop table sinhVien
create table sinhVien(
	maSV varchar(10) primary key,
	hoTen nvarchar(20),
	ngaySinh date,
	gioiTinh nvarchar(5),
	ngayRaTruong date,
	maLop varchar(10),
	--email varchar(20),
	foreign key (maLop) references lop(maLop)
);
IF OBJECT_ID('sv_Lop') is not null
drop table sv_Lop
create table sv_Lop(
	maLop varchar(10),
	maSV varchar(10),
	primary key(maLop,maSV),
	foreign key (maLop) references lop(maLop),
	foreign key (maSV ) references sinhVien(maSV )
);
IF OBJECT_ID('sach') is not null
drop table sach
create table sach(
	maSach varchar(10) primary key,
	tieuDe nvarchar(50),
	soTrang int check (soTrang>5),
	soLuongBanSao int check (soLuongBanSao>1),
	giaTien money check(giaTien >0),
	viTri nvarchar(50),
	ngayNhap date,
	maPhanLoai varchar(10),
	maTG varchar(10),
	maNXB varchar(10),
	foreign key (maTG) references tacGia(maTG),
	foreign key (maPhanLoai) references phanLoai(maPhanLoai),
	foreign key (maNXB) references nhaXuatBan(maNXB)
);
IF OBJECT_ID('phieuMuon') is not null
drop table phieuMuon
create table phieuMuon(
	soPhieu int identity(1,1) primary key,
	maSV varchar(10),
	ngayMuon date,
	ngayTra date,
	trangThai int check(trangThai=1 or trangThai=0), -- 1 da trả, 0 chưa trả
	foreign key (maSV) references sinhVien(maSV)
);
IF OBJECT_ID('chiTietPhieuMuon') is not null
drop table chiTietPhieuMuon
create table chiTietPhieuMuon(
	soPhieu int not null,
	maSach varchar(10),
	ghiChu nvarchar(50),
	primary key (soPhieu, maSach),
	foreign key (maSach) references sach(maSach),
	foreign key (soPhieu) references phieuMuon(soPhieu)
);
-- Thêm dữ liệu;
select * from phanLoai
delete phanLoai
insert into phanLoai values
	('PL01', N'Truyện Cười'),
	('PL02', N'Tiểu Thuyết'),
	('PL03', N'Truyện Sắc'),
	('PL04', N'Khoa Học'),
	('PL05', N'Hiện Đại')
select * from nhaXuatBan
insert into nhaXuatBan values
	('NXB01', N' Chính trị Quốc gia',N'Hà Nội'),
	('NXB02', N' Tư pháp',N'Hải Dương'),
	('NXB03', N' Hồng Đức',N'Nam Định'),
	('NXB04', N' Quân đội',N'Hưng Yên'),
	('NXB05', N' Công an nhân dân',N'Quảng Ninh')

select * from tacGia
insert into tacGia values
	('TG01', N' Lý Hồng Thiên', '1958-10-27', N'Nam'),
	('TG02', N' Tố Thời', '1958-09-25', N'Nữ'),
	('TG03', N' La Tử Phùng', '1958-08-23', N'Nam'),
	('TG04', N' Trình Tiểu Nại', '1958-07-21', N'Nữ'),
	('TG05', N' Ngô Thừa Ân', '1958-06-19', N'Nam')

select * from nganh
insert into nganh values
	('N001', N'Công nghệ thông tin'),
	('N002', N'Thiết kế đồ họa'),
	('N003', N'Digital maketing'),
	('N004', N'Logistist'),
	('N005', N'Quản trị kinh doanh')

select * from lop
insert into lop values
	('CP310', N'Cơ sở dữ liệu', 'N001'),
	('WE312', N'Nhập môn đồ họa', 'N002'),
	('IT314', N'Maketing internet', 'N003'),
	('CP316', N'Giá cả thị trường', 'N004'),
	('WE318', N'Quản trị tài chính', 'N005')

select * from sinhVien
insert into sinhVien values
	('SV01', N'Nguyễn Huệ', '2002-01-05', N'Nữ', '2022-09-12', 'CP310'),
	('SV02', N'Quang Trung', '2002-04-30', N'Nam', '2022-08-05', 'WE312'),
	('SV03', N'Đinh Bộ Lĩnh', '2003-03-10', N'Nam', '2023-09-03', 'WE318'),
	('SV04', N'Nguyễn Thành Tất', '2003-11-20', N'Nam', '2023-09-22', 'CP316'),
	('SV05', N'Nguyễn Minh Châu', '2004-07-27', N'Nữ', '2024-07-18', 'IT314')

select * from sv_Lop --chua
insert into sv_Lop values
	('CP310', 'SV01'),
	('WE312', 'SV02'),
	('WE318', 'SV03'),
	('CP316', 'SV04'),
	('IT314', 'SV05')

select * from sach
insert into sach values --chua
	('B001', N'Giết Con Chim Nhại', 50, 7, '200000', N'Giá A1', '2019-02-13', 'PL01', 'TG01', 'NXB01'),
	('B002', N'Tiếng Chim Hót Trong Bụi Mận Gai', 200, 3, '350000', N'Giá D5', '2019-04-16', 'PL02', 'TG02', 'NXB02'),
	('B003', N'Ông Già Và Biển Cả', 150, 11, '129000', N'Giá A4', '2020-06-13', 'PL03', 'TG03', 'NXB03'),
	('B004', N'Không Gia Đình', 90, 6, '500000', N'Giá C1', '2020-08-22', 'PL04', 'TG04', 'NXB04'),
	('B005', N'Kiêu Hãnh Và Định Kiến', 145, 14, '99000', N'Giá B2', '2021-02-27', 'PL05', 'TG05', 'NXB05')

select * from phieuMuon
insert into phieuMuon values
	( 'SV01', '2018-01-09', '2018-03-13', 1),
	( 'SV02', '2018-03-11', '2018-05-14', 0),
	( 'SV03', '2018-04-12', '2018-06-11', 0),
	( 'SV04', '2018-06-11', '2018-07-21', 1),
	( 'SV05', '2018-07-09', '2018-09-05', 0)

select * from chiTietPhieuMuon
insert into chiTietPhieuMuon values
	( 1, 'B001', N' ....'),
	( 2, 'B002', N'....'),
	(3, 'B003', N'....'),
	( 4, 'B004', N'...'),
	( 5, 'B005', N'...')



--ok*6.1 Liệt kê tất cả thông tin của các đầu sách gồm tên sách, mã sách, giá tiền , tác giả 
--thuộc loại sách có mã “IT”.
select * from sach
select*from phanLoai
select  maSach, tieuDe,giaTien,maTG from sach where maPhanLoai ='Pl01'
--ok-6.2 Liệt kê các phiếu mượn gồm các thông tin mã phiếu mượn, mã sách , ngày mượn, mã 
--sinh viên có ngày mượn trong tháng 01/2017.
select *from phieuMuon
select *from chiTietPhieuMuon
--------------
select PM.soPhieu,ctPM.maSach,PM.ngayMuon,PM.maSV from phieuMuon PM
join chiTietPhieuMuon ctPM
on PM.soPhieu = ctPM.soPhieu
where ngayMuon like '2018-01%'
---c2--where ngayMuon  >='2018-01-1' and ngayMuon <='2018-01-30'
-----
---ok--6.3 Liệt kê các phiếu mượn chưa trả sách cho thư viên theo thứ tự tăng dần của ngày mượn sách.
select *from phieuMuon
-------------
select *from phieuMuon 
where trangThai like (0) 
order by ngayMuon asc

--** Cau lenh select tong quat **
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

--chua ok-6.4 Liệt kê tổng số đầu sách của mỗi loại sách ( gồm mã loại sách, tên loại sách, tổng số 
--lượng sách mỗi loại).
select*from sach
select*from phanLoai
--select sach.maPhanLoai ,phanLoai.tenPhanLoai COUNT(maPhanLoai.tenPhanLoai) from sach as'So Dau Sach'
--join phanLoai PL
--on sach.maPhanLoai = phanLoai.maPhanLoai
--group by PL.maPhanLoai,maPhanLoai.tenPhanLoai

--ok-6.5 Đếm xem có bao nhiêu lượt sinh viên đã mượn sách.

select maSV , COUNT(maSV) as 'Số Lượt Mượn' from phieuMuon
group by maSV

---ok6.6 Hiển thị tất cả các quyển sách có tiêu đề chứa từ khoá “SQL”"T".
select*from sach
where tieuDe like (N'%T%')

--6.7 Hiển thị thông tin mượn sách gồm các thông tin: mã sinh viên, tên sinh viên, mã 
--phiếu mượn, tiêu đề sách, ngày mượn, ngày trả. Sắp xếp thứ tự theo ngày mượn sách.
----- ok
select*from sinhVien
select*from phieuMuon
select*from chiTietPhieuMuon
select*from sach
----
select SV.maSV,SV.hoTen,PM.soPhieu ,SACH.tieuDe,PM.ngayMuon,PM.ngayTra  from sinhVien SV
join phieuMuon PM
on SV.maSV = PM.maSV
join chiTietPhieuMuon ctPM
on PM.soPhieu = ctPM.soPhieu
join sach SACH
on ctPM.maSach = SACH.maSach
group by SV.maSV,SV.hoTen,PM.soPhieu ,SACH.tieuDe,PM.ngayMuon,PM.ngayTra

order by PM.ngayMuon desc--giam dan
-------
 --* nếu sử dụng group by , sau select lấy cái gì thì 
 --phải đặt trong group by
 
--ok-6.8 Liệt kê các đầu sách có lượt mượn lớn hơn 20 (>=1)lần.
select sach.maSach, COUNT(ctPM.maSach) from sach
join chiTietPhieuMuon ctPM
on sach.maSach = ctPM.maSach
group by sach.maSach
having COUNT (ctPM.maSach) >=1

--0k-6.9 Viết câu lệnh cập nhật lại giá tiền của các quyển sách có ngày nhập kho trước năm 
--2014 giảm 30%.
select*from sach
update sach set giaTien = giaTien*0.7 
where ngayNhap <'2020-01-01'
--0k--6.10 Viết câu lệnh cập nhật lại trạng thái đã trả sách cho phiếu mượn của sinh viên có mã 
--sinh viên PD12301 (ví dụ).
select*from phieuMuon
update phieuMuon set trangThai =(1)
where maSV ='SV02'
--6.11 Lập danh sách các phiếu mượn quá hạn chưa trả gồm các thông tin: mã phiếu mượn, 
--tên sinh viên, email, danh sách các sách đã mượn, ngày mượn.
select*from sinhVien
select*from phieuMuon
--ok--
select PM.soPhieu , SV.maSV, SV.maLop,SV.hoTen, ngayMuon, ngayTra ,trangThai , 
datediff(Day,PM.ngayTra,getdate()) as 'So Ngay vuot'
from phieuMuon PM
join sinhVien SV
on SV.maSV = PM.maSV
where trangThai like N'0'
and datediff(Day,PM.ngayTra,getdate()) >=1500
--0k-6.12 Viết câu lệnh cập nhật lại số lượng bản sao tăng lên 5 đơn vị đối với các đầu sách có 
--lượt mượn lớn hơn 10
select*from phieuMuon
select*from sach
update sach set soLuongBanSao = soLuongBanSao + 5
where maSach in (select sach.maSach  from sach
join chiTietPhieuMuon ctPM
on sach.maSach = ctPM.maSach
group by sach.maSach
having COUNT (ctPM.maSach) >=1)
--ok-6.13 Viết câu lệnh xoá các phiếu mượn có ngày mượn và ngày trả trước „1/1/2010‟
delete phieuMuon where ngayMuon < '2020-03-01' and ngayMuon <'2020-03-01'
--Y7. Tổ chức sao lưu dự phòng cho cơ sở dữ liệu

