CREATE DATABASE QLTV
GO
USE QLTV
GO
--Tạo các bảng Table mới
CREATE TABLE SinhVien
(
--Tạo các trường trong bảng
  MaSV NCHAR(10) PRIMARY KEY,
  TenSV NVARCHAR(50),
  NgayHetHan DATE,
  ChuyenNganh NVARCHAR(50),
  Email NVARCHAR(50),
  SoDT VARCHAR(50),
);
--Nhập dữ liệu vào bảng (từng bản ghi 1) "Kiểu đơn giản"
INSERT SinhVien VALUES  ('SV001',N'Trần Thu Huyền','20230303',N'CNTT', N'Huyentt@gmail.com','0966011728');
INSERT SinhVien VALUES  ('SV002',N'Lê Thị Giang','20230303',N'Văn Học', N'Gianglt@gmail.com','0966011980');
INSERT SinhVien VALUES  ('SV003',N'Đặng Văn Thành','20230303',N'QTKS', N'Thanhdv@gmail.com','0966011880');
INSERT SinhVien VALUES  ('SV004',N'Trần Bảo Linh','20230303',N'CNTT', N'Linhtb@gmail.com','0966011978');
INSERT SinhVien VALUES  ('SV005',N'Vũ Thị Hường','20230303',N'Ngoại ngữ', N'Huongvt@gmail.com','0966011543');
INSERT SinhVien VALUES  ('SV006',N'Khổng Thị Quỳnh','20210303',N'Du lịch', N'Quynhkt@gmail.com','0966011165');
INSERT SinhVien VALUES  ('SV007',N'Lê Anh Quân','20210303',N'QTKD', N'Quanla@gmail.com','0966011532');
INSERT SinhVien VALUES  ('SV008',N'Đặng Quốc Chiến','20210303',N'Marketing', N'Chiendq@gmail.com','0966011443');
INSERT SinhVien VALUES  ('SV009',N'Trần Trường Sơn' , '20210303' ,N'Thiết kế đồ họa',  N'Sontt@gmail.com','0966011512');
INSERT SinhVien VALUES  ('SV010',N'Nguyễn Thanh Trang','20210303',N'CNTT', N'Trangnt@gmail.com','0966011109');
INSERT SinhVien VALUES  ('SV011',N'Đặng Thị Thủy','20210303',N'CNTT', N'Thuydt@gmail.com','0966011089');
INSERT SinhVien VALUES  ('SV012',N'Vũ Văn Oai','20210303',N'CNTT', N'Oaivv@gmail.com','0966011769');

CREATE TABLE LoaiSach
(
--Tạo các trường trong bảng
  MaLoai Nchar(10) PRIMARY KEY,
  TenLoai NVARCHAR(50),
);
--Nhập dữ liệu vào bảng (từng bản ghi 1) "Kiểu đơn giản"
INSERT LoaiSach VALUES  (N'KT',N'Kinh tế');
INSERT LoaiSach VALUES  (N'IT',N'CNTT' );
INSERT LoaiSach VALUES  (N'VH',N'Văn học' );
INSERT LoaiSach VALUES  (N'NN',N'Ngoại ngữ');
INSERT LoaiSach VALUES  (N'DL',N'Du lịch' );
INSERT LoaiSach VALUES  (N'PTS',N'Photoshop');
INSERT LoaiSach VALUES  (N'TCC',N'Toán cao cấp');
INSERT LoaiSach VALUES  (N'L',N'Luật');
INSERT LoaiSach VALUES  (N'WEB',N'Lập trình web ' );
INSERT LoaiSach VALUES  (N'JAVA',N'Lập trình java');
INSERT LoaiSach VALUES  (N'M',N'Marketing')

CREATE TABLE Sach
(
--Tạo các trường trong bảng
  MaSach NCHAR(10) PRIMARY KEY,
  TenSach NVARCHAR(50),
  NhaXuatBan VARCHAR(50),
  TacGia NVARCHAR(50),
  SoTrang INT,
  SLBS INT,
  GiaTien FLOAT,
  NgayNhapKho Date,
  ViTri NVARCHAR(50),
  MaLoai NCHAR(10),
);
--Nhập dữ liệu vào bảng (từng bản ghi 1) "Kiểu đơn giản"
INSERT Sach VALUES  (N'S0041',N'Tin học',N'FPT',N'AD',100,1000,100000,'20130102',N'F1',N'IT');
INSERT Sach VALUES  (N'S0042',N'Photoshop',N'FPT',N'AD',100,2000,100000,'20130102',N'F2',N'PTS');
INSERT Sach VALUES  (N'S0043',N'Tiếng Anh',N'FPT',N'AD',100,1000,100000,'20130102',N'F3',N'NN');
INSERT Sach VALUES  (N'S0044',N'Bộ Luật',N'FPT',N'AD',100,1000,100000,'20130102',N'F4',N'L');
INSERT Sach VALUES  (N'S0045',N'Tiếng Anh',N'FPT',N'AD',100,1000,100000,'20130102',N'F5',N'KT');
INSERT Sach VALUES  (N'S0046',N'Tin Học',N'FPT',N'AD',100,1000,100000,'20130102',N'F6',N'JAVA');
INSERT Sach VALUES  (N'S0047',N'Toán',N'FPT',N'AD',100,1000,100000,'20130102',N'F7',N'NN');
INSERT Sach VALUES  (N'S0048',N'Địa lý & Lịch sử',N'FPT',N'AD',100,1000,100000,'20130102',N'F8',N'DL');
INSERT Sach VALUES  (N'S0049',N'Tin Học',N'FPT',N'AD',100,1000,100000,'20130102',N'F9',N'WEB');
INSERT Sach VALUES  (N'S0050',N'Văn Học',N'FPT',N'AD',100,1000,100000,'20130102',N'F10',N'VH');
INSERT Sach VALUES  (N'S0051',N'CSDL SQL',N'FPT',N'AD',100,1000,100000,'20130102',N'F11',N'IT')

CREATE TABLE PhieuMuon
(
--Tạo các trường trong bảng
  MaPM NCHAR(10) PRIMARY KEY,
  NgayMuon DATE,
  NgayTra DATE,
  MaSV NCHAR(10),
  TrangThai NVARCHAR(30),
);
--Nhập dữ liệu vào bảng (từng bản ghi 1) "Kiểu đơn giản"
INSERT PhieuMuon VALUES  (N'PM41','20170101','20170308',N'SV001',N'Đã trả sách');
INSERT PhieuMuon VALUES  (N'PM42','20170103','20170110',N'SV002',N'Chưa trả sách');
INSERT PhieuMuon VALUES  (N'PM43','20170301','20170308',N'SV003',N'Chưa trả sách');
INSERT PhieuMuon VALUES  (N'PM44','20170228','20170307',N'SV004',N'Đã trả sách');
INSERT PhieuMuon VALUES  (N'PM45','20170303','20170310',N'SV004',N'Chưa trả sách');
INSERT PhieuMuon VALUES  (N'PM46','20170303','20170310',N'SV006',N'Đã trả sách');
INSERT PhieuMuon VALUES  (N'PM47','20090103','20090110',N'SV002',N'Chưa trả sách');
INSERT PhieuMuon VALUES  (N'PM48','20090103','20090110',N'SV002',N'Chưa trả sách');



CREATE TABLE ChiTiet_PM
(
--Tạo các trường trong bảng
  MaPM NCHAR(10),  
  MaSach NCHAR(10),
  GhiChu NVARCHAR(50),
  PRIMARY KEY(MaPM,MaSach),
   FOREIGN KEY(MaPM) REFERENCES PhieuMuon(MaPM),
   FOREIGN KEY(MaSach) REFERENCES Sach(MaSach)
);
--Nhập dữ liệu vào bảng (từng bản ghi 1) "Kiểu đơn giản"
INSERT ChiTiet_PM VALUES  (N'PM41',N'S0041',N'Mới');
INSERT ChiTiet_PM VALUES  (N'PM42',N'S0042',N'Cũ');
INSERT ChiTiet_PM VALUES  (N'PM43',N'S0042',N'Mới');
INSERT ChiTiet_PM VALUES  (N'PM44',N'S0044',N'Cũ');
INSERT ChiTiet_PM VALUES  (N'PM45',N'S0044',N'Mới');
INSERT ChiTiet_PM VALUES  (N'PM46',N'S0046',N'Mới');



--Thêm khóa ngoại
ALTER TABLE Sach ADD FOREIGN KEY(MaLoai) REFERENCES LoaiSach(MaLoai)
ALTER TABLE PhieuMuon ADD FOREIGN KEY(MaSV) REFERENCES SinhVien(MaSV)

--6.1 Liệt kê tất cả thông tin của các đầu sách gồm tên sách, mã sách, giá tiền , tác giả thuộc loại sách có mã “IT”.
SELECT TenSach, MaSach, GiaTien, TacGia From Sach Where MaLoai LIKE N'IT%'

--6.2 Liệt kê các phiếu mượn gồm các thông tin mã phiếu mượn, mã sách , ngày mượn, mã sinh viên có ngày mượn trong tháng 01/2017.
SELECT a.MaPM, b.MaSach, a.NgayMuon, a.MaSV From PhieuMuon a 
INNER JOIN ChiTiet_PM b 
on a.MaPM=b.MaPM 
where a.NgayMuon like '2017-01%';

--6.3 Liệt kê các phiếu mượn chưa trả sách cho thư viên theo thứ tự tăng dần của ngày mượn sách.
SELECT * From PhieuMuon 
Where TrangThai like N'Chưa trả sách' ORDER BY NgayMuon ASC

--6.4 Liệt kê tổng số đầu sách của mỗi loại sách ( gồm mã loại sách, tên loại sách, tổng số lượng sách mỗi loại).
SELECT a.MaLoai, b.TenLoai, COUNT(a.MaLoai) as 'sodausach' from Sach a 
inner join LoaiSach b 
on a.MaLoai=b.MaLoai 
group by a.MaLoai, b.TenLoai

--6.5 Đếm xem có bao nhiêu lượt sinh viên đã mượn sách.
SELECT COUNT(MaPM) as 'soluotmuon' FROM PhieuMuon

--6.6 Hiển thị tất cả các quyển sách có tiêu đề chứa từ khoá “SQL”.
SELECT *FROM SACH WHERE TenSach like N'%SQL%'

--6.7 Hiển thị thông tin mượn sách gồm các thông tin: mã sinh viên, tên sinh viên, mã phiếu mượn, tiêu đề sách, ngày mượn, ngày trả. Sắp xếp thứ tự theo ngày mượn sách.
select a.TenSV, a.MaSV, b.MaPM, b.NgayMuon, b.NgayTra, c.TenSach from SinhVien a 
inner join PhieuMuon b on a.MaSV=b.MaSV 
inner join ChiTiet_PM on ChiTiet_PM.MaPM=b.MaPM
inner join Sach c on c.MaSach=ChiTiet_PM.MaSach  order by NgayMuon ASC

--6.8 Liệt kê các đầu sách có lượt mượn lớn hơn 1 lần.
SELECT Sach.MaSach, COUNT(ChiTiet_PM.MaSach) as'solanmuon' from Sach 
inner join  ChiTiet_PM on ChiTiet_PM.MaSach=Sach.MaSach
group by Sach.MaSach 
having count(ChiTiet_PM.MaSach)>1

--6.9 Viết câu lệnh cập nhật lại giá tiền của các quyển sách có ngày nhập kho trước năm 2014 giảm 30%.
UPDATE Sach SET GiaTien=GiaTien+GiaTien*0.3
WHERE Year(NgayNhapKho)<='2014'

--6.10 Viết câu lệnh cập nhật lại trạng thái đã trả sách cho phiếu mượn của sinh viên có mã sinh viên SV002 (ví dụ).
UPDATE PhieuMuon SET TrangThai='Đã trả sách' WHERE MaSV=N'SV002'

--6.11 Lập danh sách các phiếu mượn quá hạn chưa trả gồm các thông tin: mã phiếu mượn, tên sinh viên, email, danh sách các sách đã mượn, ngày mượn.
SELECT PhieuMuon.MaPM, NgayMuon, NgayTra, ChiTiet_PM.MaSach, SinhVien.TenSV, SinhVien.Email, Sach.MaSach, TenSach, NhaXuatBan, TacGia, SoTrang, SLBS, GiaTien, NgayNhapKho, ViTri, MaLoai From PhieuMuon
INNER JOIN SinhVien on PhieuMuon.MaSV=SinhVien.MaSV
INNER JOIN ChiTiet_PM ON ChiTiet_PM.MaPM=PhieuMuon.MaPM
INNER JOIN Sach on Sach.MaSach=ChiTiet_PM.MaSach
WHERE TrangThai like N'Chưa trả sách'

--6.12 Viết câu lệnh cập nhật lại số lượng bản sao tăng lên 5 đơn vị đối với các đầu sách có lượt mượn lớn hơn 1
UPDATE Sach SET SLBS=SLBS+5
WHERE MaSach in (SELECT Sach.MaSach from Sach inner join  ChiTiet_PM on ChiTiet_PM.MaSach=Sach.MaSach group by Sach.MaSach having count(ChiTiet_PM.MaSach)>1)

--6.13 Viết câu lệnh xoá các phiếu mượn có ngày mượn và ngày trả trước "1/1/2010"

DELETE FROM PhieuMuon WHERE NgayMuon < '2010-01-01' AND NgayTra < '2010-01-01' 

--Bảo mật sơ sở dữ liệu
--tạo tk đăng nhập
CREATE LOGIN assignment with password= '12345'
--Tạo người dùng
CREATE USER assignment for login assignment
--Cấp quyền
Grant select,insert on VATTU to assignment


--Sao lưu dữ liệu
backup database QLTV to disk ='D:\sql\QLTV_ASS.bak' with diferential