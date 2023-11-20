USE master
GO

IF DB_ID('QL_TKDKVIECLAM') IS NOT NULL
   drop database QL_TKDKVIECLAM
GO

/*==============================================================*/
/*====================== CREATE DATABASE =======================*/
/*==============================================================*/

--Declare @Primary_Path nvarchar(max), @Secon_Path nvarchar(max), @Log_Path nvarchar(max)
--Select	@Primary_Path = N'D:\Nam 4\DoAnTotNghiep\DoAn_Website_DangKyVaTimKiemViecLam\Database\Primary file',
--		@Secon_Path = N'D:\Nam 4\DoAnTotNghiep\DoAn_Website_DangKyVaTimKiemViecLam\Database\Secondary file',
--		@Log_Path = N'D:\Nam 4\DoAnTotNghiep\DoAn_Website_DangKyVaTimKiemViecLam\Database\Log file'
--DECLARE @SQL nvarchar(max);
--SET @SQL = N'
--CREATE DATABASE QL_TKDKVIECLAM
--ON PRIMARY
--(
--	NAME = QL_TKDKVIECLAM_PRIMARY,
--	FILENAME = ''' + @Primary_Path + '\QL_TKDKVIECLAM_PRIMARY.mdf'',
--	SIZE = 20 MB,
--	MAXSIZE = 50 MB,
--	FILEGROWTH = 10%
--),
--FILEGROUP FG1_QL_TKDKVIECLAM
--(
--	NAME = QL_TKDKVIECLAM_SECONDARY_1_1,
--	FILENAME = ''' + @Secon_Path + '\QL_TKDKVIECLAM_SECONDARY_1_1.ndf'',
--	SIZE = 5 MB,
--	MAXSIZE = 10 MB,
--	FILEGROWTH = 10%
--),
--(
--	NAME = QL_TKDKVIECLAM_SECONDARY_1_2,
--	FILENAME = ''' + @Secon_Path + '\QL_TKDKVIECLAM_SECONDARY_1_2.ndf'',
--	SIZE = 5 MB,
--	MAXSIZE = 10 MB,
--	FILEGROWTH = 10%
--)
--LOG ON
--(
--	NAME = QL_TKDKVIECLAM_LOG,
--	FILENAME = ''' + @Log_Path + '\QL_TKDKVIECLAM_LOG.trn'',
--	SIZE = 10 MB,
--	MAXSIZE = 20 MB,
--	FILEGROWTH = 10%
--)' 
--EXEC (@SQL)
--GO

Create Database QL_TKDKVIECLAM
Go

Use QL_TKDKVIECLAM
Go


/*==============================================================*/
/*======================== CREATE TABLE ========================*/
/*==============================================================*/

CREATE TABLE DOANHNGHIEP
(
	MaDN			nchar(20),
	TenDN			nvarchar(50),
	Diachi			nvarchar(100),
	Email			nvarchar(50),
	SDT				varchar(11) not null,
	Namthanhlap		char(4),
	Tinhthanh		nvarchar(50),
	Password_DN		nvarchar(100),
	Trangthai_DN	nvarchar(50),
	Constraint pk_DOANHNGHIEP Primary Key(MaDN)
)
Go

CREATE TABLE LOAICONGVIEC
(
	Maloai			nchar(20),
	Tenloai			nvarchar(50),
	Anh_Cviec       nvarchar(50),
	Constraint pk_LOAICONGVIEC Primary Key(Maloai)
)
Go
CREATE TABLE BAIDANG
(
	MaBD			nchar(20),
	TenBD			nvarchar(50),
	MaDN			nchar(20),
	Maloai			nchar(20),
	Mota			nvarchar (1000),
	Phucloi			nvarchar(1000),
	Vitri			nvarchar(1000),
	Kinhnghiem		nvarchar(1000),
	Dotuoilamviec	nvarchar(100),
	Mucluong		nvarchar(1000),
	Ngaydangbai		datetime,
	Yeucau			nvarchar(1000),
	Trangthai_BD	nvarchar(50),
	Constraint pk_BAIDANG Primary Key(MaBD),
	Constraint fk_DOANHNGHIEP_LCV Foreign Key(MaDN) references DOANHNGHIEP(MaDN),
	Constraint fk_BAIDANG_LCV Foreign Key(Maloai) references LOAICONGVIEC(Maloai)
)
Go

CREATE TABLE NGUOIUNGTUYEN
(
	MaNUT			nchar(20),
	Hoten			nvarchar(50),
	Diachi			nvarchar(50),
	SDT				varchar(11) not null,
	Email			nvarchar(50),
	CV_NUT			nvarchar(500),
	Ngaysinh		date,
	Gioitinh		nvarchar(10),
	Password_NUT	nvarchar(100),
	Constraint pk_NGUOIUNGTUYEN Primary Key(MaNUT)
)
Go

CREATE TABLE TK_Admin
(
	MaAD			nchar(20),
	Hoten			nvarchar(50),
	Diachi			nvarchar(50),
	SDT				varchar(11) not null,
	Email			nvarchar(50),
	Ngaysinh		date,
	Gioitinh		nvarchar(10),
	Password_AD		nvarchar(100),
	Constraint pk_TKADMIN Primary Key(MaAD)
	
)
Go

CREATE TABLE HOSOUNGTUYEN
(
	MAHS			nchar(20),
	MaNUT			nchar(20),
	MaBD			nchar(20),
	CV_HSUT			nvarchar(500),
	NgaydangkyUT	date,
	Constraint pk_HOSOUNGTUYEN Primary Key(MAHS),
	Constraint fk_HOSOUNGTUYEN_NUT Foreign Key(MaNUT) references NGUOIUNGTUYEN(MaNUT),
	Constraint fk_HOSOUNGTUYEN_BD Foreign Key(MaBD) references BAIDANG(MaBD)
)
Go

CREATE TABLE DUYET
(
	MaBD			nchar(20),
	MaAD			nchar(20),
	Ngayduyet		date,
	Constraint pk_BAIDANG_1 Primary Key(MaBD,MaAD),
	Constraint fk_BAIDANG_DUYET Foreign Key(MaBD) references BAIDANG(MaBD),
	Constraint fk_TKADMIN_DUYET Foreign Key(MaAD) references TK_Admin(MaAD)
)
Go


/*==============================================================*/
/*===================== CREATE CONSTRAINT ======================*/
/*==============================================================*/

-- Check gioi tinh nam nu nguoi ung tuyen 
ALTER TABLE NGUOIUNGTUYEN
ADD Constraint CK_GIOITINH_NV check(Gioitinh like 'Nam' or Gioitinh like N'Nữ')
GO

---- check muc luong > 0 
--ALTER TABLE BAIDANG
--ADD Constraint CK_MUCLUONG check(Mucluong > 0)
--GO

-- check email doanh nghiep
ALTER TABLE DOANHNGHIEP
ADD Constraint CK_EMAIL_DN check(Email like '_%@__%.__%')
GO

-- check email nguoi ung tuyen
ALTER TABLE NGUOIUNGTUYEN
ADD Constraint CK_EMAIL_NUT check(Email like '_%@__%.__%')
GO

-- Check SDT cua nguoi ung tuyen phai tu 10 den 11 so 
ALTER TABLE NGUOIUNGTUYEN
ADD Constraint CK_SDT_NUT check(DATALENGTH(SDT) >=10 AND DATALENGTH(SDT) <12 );
GO

-- Check SDT cua doanh nghiẹp phai tu 10 den 11 so 
ALTER TABLE DOANHNGHIEP
ADD Constraint CK_SDT_DN check(DATALENGTH(SDT) >=10 AND DATALENGTH(SDT) <12 );
GO

/*------ UNIQUE ------*/
-- unique ten BAIDANG 
ALTER TABLE BAIDANG
ADD Constraint UNI_TEN_BD unique(TenBD)
GO
/*==============================================================*/
/*===================== CREATE DATA ============================*/
/*==============================================================*/
--Doanh nghiep
INSERT INTO DOANHNGHIEP VALUES	
('DN001', N'Công Ty TSOIS',											N'381 Lê Trọng Tấn',		N'tsoisonthemic1909@gmail.com',	'0782523152', '2016', N'TP.HCM',					'123456',N'Đã Duyệt'),
('DN002', N'Công Ty Tín Coder',										N'529 Hoàng Văn Thụ',		N'tinkhonglohoc854@gmail.com',	'0782529652', '2018', N'Bà Rịa - Vũng Tàu',			'111111',N'Đã Duyệt'),
('DN003', N'Công Ty Tùng Chăm Học',									N'254 Lê Văn Sỹ',			N'tunghokaka@gmail.com',		'0732523152', '2017', N'Tiền Giang',				'aaaaaa',N'Đã Duyệt'),
('DN004', N'Công Ty Phương Vịt',									N'21 Tô Hiệu',				N'chienthancomsuon@gmail.com',	'0782522594', '2012', N'Đồng Nai',					'zzzzzz',N'Đã Duyệt'),
('DN005', N'Công Ty Thịnh Giáo Sư',									N'205 Hòa Bình',			N'thinhgiaosu3584@gmail.com',	'0782500252', '2018', N'TP.HCM',					'qqqqqq',N'Đã Duyệt'),
('DN006', N'Công Ty Quang Vận Tải',									N'254 Lê Lai',	 			N'quangvantai000@gmail.com',	'0782500291', '2019', N'TP.HCM',					'zxcvbn',N'Đã Duyệt'),
('DN007', N'Công Ty Tài Vận Thông',									N'132 Hòa Bình',			N'ngoctinh123@gmail.com',		'0782500299', '2010', N'TP.HCM',					'rrrrrr',N'Chưa duyệt'),
('DN008', N'Ngân Hàng Quân Đội',									N'23/2 Phú Thọ Hòa',		N'nganhangquandoi@gmail.com',	'0782500222', '2013', N'TP.HCM',					'123456',N'Chưa duyệt'),
('DN009', N'Ngân Hàng Thương Mại Cổ Phần Ngoại Thương Việt Nam',	N'12/2/14 Lê Thúc Hoạch',	N'vietcombank@gmail.com',		'0782500333', '2015', N'TP.HCM',					'123456',N'Chưa duyệt'),
('DN010', N'Bệnh Viện Quận Tân Phú',								N'611 Đ. Âu Cơ, Phú Trung',	N'BVtanphu@gmail.com',		'02854088924', '2015', N'Thái Bình',					'123456',N'Chưa duyệt')
GO

SET DATEFORMAT DMY

--Nguoi ung tuyen
INSERT INTO NGUOIUNGTUYEN VALUES 
('NUT001', N'Lê Thành Nhân',		N'263 Hoang Hoa Tham',		'0782511972', N'nhanle1111@gmail.com', N'https://drive.google.com/drive/folders/1e4U1ojKvxJSsyRiTBLQABup9rhN-3tMR?usp=drive_link', '16/09/2021','Nam','aaaaaa'),
('NUT002', N'Hoang Le Thanh My',	N'324 Hòa Bình',			'0782511152', N'myhoang001@gmail.com', N'https://drive.google.com/drive/folders/2l9P1ojKvxJSsyRiTBLQABup9rhN-3tMR?usp=drive_link', '13/05/1998',N'Nữ','zzzzzz'),
('NUT003', N'Nguyen Uy Tin',		N'201 Trần Thị Báo',		'0783001152', N'uytin1415@gmail.com', N'https://drive.google.com/drive/folders/3m1L1ojKvxJSsyRiTBLQABup9rhN-3tMR?usp=drive_link', '17/02/2000','Nam','123456'),
('NUT004', N'Tran Thi My Nhan',		N'402 Lý Thái Tổ',			'0782519652', N'mynhan1160@gmail.com', N'https://drive.google.com/drive/folders/alooojKvxJSsyRiTBLQABup9rhN-3tMR?usp=drive_link', '11/07/1997',N'Nữ','111111'),
('NUT005', N'Long Tran Thanh Tuan', N'117 Nguyễn Tri Phương',	'0782020152', N'thanhtuan9923@gmail.com', N'https://drive.google.com/drive/folders/1mR51ojKvxJSsyRiTBLQABup9rhN-3tMR?usp=drive_link', '20/04/1995','Nam','222222')
GO


--Tai khoan Admin
INSERT INTO TK_Admin VALUES
('AD001', N'Trần Minh Quân', N'262 Lũy Bán Bích','0782533332', N'quanvipvip@gmail.com', '12/09/1999',N'Nam', N'ql111'),
('AD002', N'Lê Thị Minh Thư', N'384 Thống Nhất','0782531112', N'tuyethehe@gmail.com', '26/11/1997',N'Nữ',  N'ql222'),
('AD003', N'Nguyễn Hoàng Thanh Tuấn', N'408 Nguyễn Tri Phương','0789463332', N'tuan2001@gmail.com', '22/08/2001',N'Nam', N'ql333')
GO


--Loai cong viec
INSERT INTO LOAICONGVIEC VALUES 
('L001', N'Thực phẩm', N'hinh1.jpg'),
('L002', N'Cà phê', N'hinh2.jpg'),
('L003', N'Thú cưng', N'hinh4.jpg'),
('L004', N'Việc tại gia', N'hinh3.jpg'),
('L005', N'Nhân viên văn phòng', N'hinh5.jpg'),
('L006', N'Lập trình Backend', N'hinh6.jpg'),
('L007', N'Thợ hồ', N'hinh7.jpg'),
('L008', N'Tài xế', N'hinh8.jpg'),
('L009', N'Kỹ sư dữ liệu (Data Engineer)', N'hinh6.jpg'),
('L010', N'Chuyên gia phân tích dữ liệu (Data Analyst)', N'hinh6.jpg'),
('L011', N'Kỹ sư trí tuệ nhân tạo (AI Engineer)', N'hinh5.jpg'),
('L012', N'Nhân viên bán hàng', N'hinh9.jpg'),
('L013', N'Chuyên viên quan hệ công chúng', N'hinh10.png'),
('L014', N'Y tá', N'hinh11.jpg'),
('L015', N'Trợ giảng', N'hinh12.jpg')
GO


--Bai dang
INSERT INTO BAIDANG VALUES 
('BD001', N'Tuyển đầu bếp nấu ăn', 'DN001', 'L001', N'Đầu bếp phải tạo ra các món ăn và thực đơn hấp dẫn dựa trên nhu cầu của khách hàng và phong cách của nhà hàng. Họ phải nắm chắc các nguyên liệu, phương pháp chế biến và sự kết hợp hương vị để tạo ra các món ăn độc và ngon miệng', N'Được hỗ trợ tiền ăn 2 buổi, xăng xe là 500k/1 tháng', N'Đầu bếp',N'2 năm kinh nghiệm', N'25-45 tuổi', N'Thỏa thuận', '13-10-2023', N'Có trách nhiệm cao trong việc',N'Đã Duyệt'),
('BD002', N'Tuyển phục vụ cà phê', 'DN002', 'L002', N'Nghe order từ khách và bưng nước cho khách', N'Được hỗ trợ tiền ăn 2 buổi, xăng xe là 200k/1 tháng', N'Phuc vu',N'1 năm kinh nghiệm', N'18-27tuổi', N'20-25k/1h', '14-10-2023', N'Có trách nhiệm cao trong việc, năng động',N'Đã Duyệt'),
('BD003', N'Tuyển người giúp việc','DN003', 'L003', N'Làm những việc đơn giản như lau nhà, quét nhà,...', N'Được hỗ trợ tiền ăn 2 buổi, xăng xe là 500k/1 tháng', N'Nguoi giup viec',N'3 năm kinh nghiệm', N'15-27tuổi', N'Thỏa thuận', '15-10-2023', N'Có trách nhiệm cao trong việc, năng động',N'Đã Duyệt'),
('BD004', N'Tuyển người chăm sóc thú cưng', 'DN004', 'L004', N'Cho bé ăn đúng thời gian quy định và chơi với bé', N'Được hỗ trợ tiền ăn 2 buổi, xăng xe là 200k/1 tháng', N'Chăm thú cưng',N'2 năm kinh nghiệm', N'15-27tuổi', N'Thỏa thuận', '16-10-2023', N'Có trách nhiệm cao trong việc, năng động',N'Đã Duyệt'),
('BD005', N'Tuyển người viết Word', 'DN005', 'L005', N'Viết Word theo yêu cầu khách hàng', N'Được hỗ trợ tiền ăn 2 buổi, xăng xe là 200k/1 tháng', N'Người viết Word',N'1 năm kinh nghiệm', N'18-27tuổi', N'Thỏa thuận', '17-10-2023', N'Có trách nhiệm cao trong việc, năng động',N'Đã Duyệt'),
('BD006', N'Tuyển người viết Excel', 'DN005', 'L005', N'Viết Excel thống kê dữ liệu hóa theo yêu cầu', N'Được hỗ trợ tiền ăn 2 buổi, xăng xe là 200k/1 tháng',N'Người viết Excel',N'2 năm kinh nghiệm',  N'25-35 tuổi', N'Thỏa thuận', '17-10-2023', N'Có trách nhiệm cao trong việc',N'Đã Duyệt'),
('BD007', N'Tuyễn Thực Tập Sinh Backend ', 'DN002', 'L006', N'Phân tích yêu cầu, vấn đề và rủi ro có thể phát sinh trong quá trình thực hiện yêu cầu. Thiết kế tổng thể hệ thống, các module thành phần, các chức năng chi tiết. Lập trình phát triển, bảo trì các chức năng hệ thống phía backend,Triển khai và tích hợp các thành phần hệ thống phía backend. Tối ưu các thành phần hệ thống phía backend: code, database. Viết webservice, công cụ, tham gia debugging, và tối ưu trên các công nghệ & ngôn ngữ khác nhau', N'Thu nhập tối thiểu từ 200 triệu VNĐ/năm. Phụ cấp ăn trưa: 680.000 VNĐ/tháng. Điện thoại: 200.000 VNĐ/tháng. Chế độ thưởng theo quý, năm; tiền quà các ngày Lễ, Tết, ngày thành lập Tập đoàn; hỗ trợ chi phí nghỉ dưỡng hằng năm...', N'Backend',N'Sinh Viên năm 3 hoặc vừa ra trường.', N'22-35 tuổi', N'15 - 35 Triệu', '18-10-2023', N'Có tư duy xác định và giải quyết vấn đề, Lập trình thông thạo với 1 ngôn ngữ: Java / Go, Hiểu biết về 1 mô hình lập trình: lập trình hướng đối tượng (object-oriented programming), lập trình hàm (functional programming),..., Hiểu biết và sử dụng Git để quản lý phiên bản',N'Đã Duyệt'),
('BD008', N'Tuyển thợ xây ', 'DN001', 'L007', N'Thợ xây làm việc theo yêu cầu của chủ thầu', N'Được hỗ trợ tiền ăn 2 buổi, tối đi nhậu', N'Thợ Xây', N'Không yêu cầu kinh nghiệm, có thể đào tạo',N'18-35 tuổi', N'300k/ngày', '18-10-2023', N'Có trách nhiệm cao trong việc,chịu khó học hỏi, năng động, biết tiếp bia rượu cấp trên.',N'Đã Duyệt'),
('BD009', N'Tuyển phụ bếp ', 'DN003', 'L001', N'Phụ bếp làm việc theo yêu cầu của bếp trưởng', N'Được hỗ trợ tiền ăn 2 buổi, xăng xe là 500k/1 tháng', N'Phụ bếp', N'Không yêu cầu kinh nghiệm, có thể đào tạo',N'22-35 tuổi', N'Thỏa thuận', '20-10-2023', N'Có trách nhiệm cao trong việc,chịu khó học hỏi, năng động',N'Đã Duyệt'),
('BD010', N'Tuyển bếp trưởng', 'DN003', 'L001', N'Phụ bếp làm việc theo yêu cầu của bếp trưởng', N'Được hỗ trợ tiền ăn 2 buổi, xăng xe là 500k/1 tháng', N'Phụ bếp', N'Không yêu cầu kinh nghiệm, có thể đào tạo',N'22-35 tuổi', N'Thỏa thuận', '20-10-2023', N'Có trách nhiệm cao trong việc,chịu khó học hỏi, năng động',N'Chưa Duyệt'),
('BD011', N'Tuyển tài xế container ', 'DN006', 'L008', N'Vận chuyển theo yêu cầu của khách hàng', N'Được hỗ trợ tiền ăn 2 buổi, tối đi nhậu', N'Tài xế', N'Không yêu cầu kinh nghiệm, có thể đào tạo',N'18-35 tuổi', N'500k/ngày', '20-10-2023', N'Có trách nhiệm cao trong việc,chịu khó học hỏi, năng động, biết tiếp bia rượu cấp trên.',N'Đã Duyệt'),
('BD012', N'Tuyển tài xế xe benz ', 'DN006', 'L008', N'Vận chuyển theo yêu cầu của khách hàng', N'Được hỗ trợ tiền ăn 2 buổi, tối đi nhậu', N'Lơ xe', N'Không yêu cầu kinh nghiệm, có thể đào tạo',N'18-35 tuổi', N'400k/ngày', '21-10-2023', N'Có trách nhiệm cao trong việc,chịu khó học hỏi, năng động, biết tiếp bia rượu cấp trên.',N'Đã Duyệt'),
('BD013', N'Tuyển tài xế grap ', 'DN006', 'L008', N'Vận chuyển theo yêu cầu của khách hàng', N'Được hỗ trợ tiền ăn 2 buổi, tối đi nhậu', N'Tài xế', N'Không yêu cầu kinh nghiệm, có thể đào tạo',N'18-35 tuổi', N'300k/ngày', '25-10-2023', N'Có trách nhiệm cao trong việc,chịu khó học hỏi, năng động, biết tiếp bia rượu cấp trên.',N'Chưa Duyệt'),
('BD014', N'Tuyển tài xế SM Xanh ', 'DN006', 'L008', N'Vận chuyển theo yêu cầu của khách hàng', N'Được hỗ trợ tiền ăn 2 buổi, tối đi nhậu', N'Tài xế', N'Không yêu cầu kinh nghiệm, có thể đào tạo',N'18-35 tuổi', N'200k/ngày', '28-10-2023', N'Có trách nhiệm cao trong việc,chịu khó học hỏi, năng động, biết tiếp bia rượu cấp trên.',N'Đã Duyệt'),
('BD015', N'Tuyển tài xế Zingspeed ', 'DN006', 'L008', N'Hoàn thành các chặn đường theo yêu cầu của khách hàng', N'Được hỗ trợ tiền ăn 2 buổi, tối đi nhậu', N'Tay đua', N'Không yêu cầu kinh nghiệm, có thể đào tạo',N'18-35 tuổi', N'100k/ngày', '28-10-2023', N'Có trách nhiệm cao trong việc,chịu khó học hỏi, năng động, biết tiếp bia rượu cấp trên.',N'Chưa Duyệt')
GO
Select * From BAIDANG
--INSERT INTO BAIDANG VALUES 
--('BD008', N'Tuyển thợ xây ', 'DN001', 'L007', N'Thợ xây làm việc theo yêu cầu của chủ thầu', N'Được hỗ trợ tiền ăn 2 buổi, tối đi nhậu', N'Thợ Xây', N'Không yêu cầu kinh nghiệm, có thể đào tạo',N'18-35 tuổi', N'300k/ngày', '2023-10-19', N'Có trách nhiệm cao trong việc,chịu khó học hỏi, năng động, biết tiếp bia rượu cấp trên.',N'Đã Duyệt')

--Duyet
INSERT INTO Duyet VALUES
('BD001','AD001','14-10-2023'),
('BD002','AD001','15-10-2023'),
('BD003','AD002','16-10-2023'),
('BD004','AD001','17-10-2023'),
('BD005','AD002','18-10-2023'),
('BD006','AD002','18-10-2023'),
('BD007','AD002','19-10-2023'),
('BD008','AD003','19-10-2023'),
('BD009','AD003','21-10-2023'),
('BD011','AD001','21-10-2023'),
('BD012','AD001','22-10-2023'),
('BD014','AD002','01-11-2023')


--Use QL_TKDKVIECLAM
--Go

/*==============================================================*/
/*===================== TRUY VẤN ===============================*/
/*==============================================================*/

--1. Select tất cả các bảng
Select * From DOANHNGHIEP
Select * From NGUOIUNGTUYEN
Select * From TK_Admin
Select * From LOAICONGVIEC
Select * From BAIDANG
Select * From DUYET
Go

--2. Hiển thị thông tin cần thiết 1 bài đăng cần có gồm (tên bài đăng, tên loại công việc, mô tả, phúc lợi, vị trí, kinh nghiệm, độ tuổi làm việc, mức lương, ngày đăng bài,yêu cầu)
Select TenBD,Tenloai,Mota,Phucloi,Vitri,Kinhnghiem,Dotuoilamviec,Mucluong,Ngaydangbai,Yeucau
From BAIDANG bd, LOAICONGVIEC lcv
Where bd.Maloai = lcv.Maloai
Go

--3. Xuất Thông tin bài đăng theo các doanh nghiệp được tìm kiếm qua tên doanh nghiệp

Create Function XuatBaiDangTheoDN(@tendn nvarchar(50))
Returns Table
As
	Return	( 
				Select TenBD,Tenloai,Mota,Phucloi,Vitri,Kinhnghiem,Dotuoilamviec,Mucluong,Ngaydangbai,Yeucau,Trangthai_BD
				From DOANHNGHIEP Dn, BAIDANG bd, LOAICONGVIEC lcv
				Where Dn.MaDN= bd.MaDN AND bd.Maloai = lcv.Maloai AnD dn.TenDN = @tendn
			)
Go

Create proc XuatBDtheoDn @tendn nvarchar(50)
as 
begin

		select * from dbo.XuatBaiDangTheoDN(@tendn)
end
Go
	

--exec XuatBDtheoDn 'Công ty TUNG CHAM HOC'
--Go

--4.Trigger cập nhật bài đăng khi admin duyệt bài
Create Trigger CapNhatDuyetBaiDang
ON DUYET
for INSERT,DELETE
AS
BEGIN 
	DECLARE @MABD nchar(20), @TrangThai nvarchar(50)
	IF EXISTS (SELECT 1 FROM INSERTED)  --Sử dụng EXISTS để kiểm tra INSERTED có giá trị không
	BEGIN
		SELECT @MABD = MaBD FROM INSERTED
		UPDATE BAIDANG SET Trangthai_BD = N'Đã Duyệt' WHERE MaBD = @MABD
		--COMMIT TRAN
	END
	ELSE IF EXISTS (SELECT 1 FROM DELETED)  --Kiểm tra DELETED có giá trị không
	BEGIN
		SELECT @MABD = MaBD FROM DELETED
		UPDATE BAIDANG SET Trangthai_BD = N'Chưa Duyệt' WHERE MaBD = @MABD
		--COMMIT TRAN
	END
END
Go

--Drop trigger CapNhatDuyetBaiDang
--go


--5 proc Thêm duyệt
CREATE  PROCEDURE sp_Duyet_Insert
	@MaBD nchar(20),
	@MaAD nchar(20)
AS
BEGIN
	Insert into DUYET(MaBD,MaAD,Ngayduyet)
	Values (@MaBD,@MaAD,GETDATE())
END
Go

--EXEC  sp_Duyet_Insert 'BD015','AD001'
--Go
