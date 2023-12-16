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
	TenDN			nvarchar(100),
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
	TenBD			nvarchar(100),
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
('DN001', N'Công ty Cổ phần SANOFI Việt Nam',										N'Khu công nghệ cao quận 9',														N'nga81098@gmail.com',								'0782523152',		'1956', N'TP.HCM',					'123456',N'Đã Duyệt'),
('DN002', N'Công ty Cổ phần Kỹ nghệ Thực phẩm Việt Nam (VIFON)',					N'913 Trường Chinh, P. Tây Thạnh, Q. Tân Phú',										N'vifon@gmail.com',									'08976584632',		'1977', N'TP.HCM',					'111111',N'Đã Duyệt'),
('DN003', N'Công Ty Cổ phần XNK Dona Mit',											N'Tổ 5, ấp 1, Xã Xuân Bắc, Huyện Xuân Lộc',											N'donamit@gmail.com',								'0732523152',		'2021', N'Đồng Nai',				'aaaaaa',N'Đã Duyệt'),
('DN004', N'CÔNG TY CỔ PHẦN MEKOSILT CROP SCIENCE',									N'154 Phạm Văn Chiêu, Phường 9, Gò Vấp',											N'info@mekosilt.com',								'0886029306',		'2021', N'TP.HCM',					'zzzzzz',N'Đã Duyệt'),
('DN005', N'CÔNG TY TNHH SẢN XUẤT VÀ THƯƠNG MẠI THỦY SẢN QUẢNG NINH',				N'Thôn Đông Trung, Xã Đông Xá, Huyện Vân Đồn',										N'sxtmqn@gmail.com',								'0919705917',		'2014', N'Quảng Ninh',				'qqqqqq',N'Đã Duyệt'),
('DN006', N'CÔNG TY TNHH WK INTERNATIONAL',											N'49-57 Lê Trọng Tấn, Phường Sơn Kỳ, Quận Tân Phú',	 								N'trungle@wooyang7.com',							'0782500291',		'2019', N'TP.HCM',					'zxcvbn',N'Đã Duyệt'),
('DN007', N'Công ty TNHH Pulmuone Việt Nam',										N'Số 61-63 Khuất Duy Tiến, Phường Thanh Xuân Bắc, Quận Thanh Xuân',					N'pmocs_02@pulmuone.com',							'0802200859',		'2019', N'Hà Nội',					'rrrrrr',N'Đã duyệt'),
('DN008', N'Ngân hàng TMCP Tiên Phong - TP Bank',									N'659 Âu Cơ',																		N'nganhangtienphong@gmail.com',						'1900585885',		'2008', N'TP.HCM',					'123456',N'Đã duyệt'),
('DN009', N'CÔNG TY TÀI CHÍNH TNHH MTV SHINHAN VIỆT NAM (SHINHAN FINANCE)',			N'Tầng 18, Tháp B, Tòa nhà Sông Đà, Số 18 Phạm Hùng, Mỹ Đình 1 - Nam Từ Liên',		N'dvkh@shinhanfinance.com.vn',						'1900545449',		'2015', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN010', N'TRƯỜNG ĐẠI HỌC CÔNG NGHỆ ĐÔNG Á',										N'TÒA NHÀ POLYCO, ĐƯỜNG TRỊNH VĂN BÔ, NAM TỪ LIÊM',									N'EAUT@gmail.com',									'02435552008',		'2015', N'Thái Bình',				'123456',N'Đã duyệt'),
('DN011', N'CÔNG TY CỔ PHẦN ECO WIPES VIỆT NAM',									N'số 03 đường An Phú Đông 25, phường An Phú Đông, Quận 12',							N'info@ecowipes.com.vn',							'0909392813',		'2018', N'TP.HCM',					'123456',N'Đã duyệt'),
('DN012', N'CÔNG TY TNHH GRANDHOME STONE VINA',										N'14 Đường Nam Thông 2D, Khu Nam Thông 2-S19, Khu phố 6, Phường Tân Phú, Quận 7',	N'sales@grandhomestonevina.vn',						'0901891698',		'2022', N'TP.HCM',					'123456',N'Đã duyệt'),
('DN013', N'CÔNG TY LUẬT TNHH ĐẠI KIM',												N'số 11 ngõ 1 Nguyễn Thị Duệ, phường Yên Hòa, Cầu Giấy',							N'tuvanluat@luatdaikim.com',						'02485887555',		'2017', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN014', N'Công ty cổ phần Techcom Blockchain',									N'Ngõ 82 Dịch Vọng Hậu, Cầu Giấy',													N'info@Techcom.com',								'0909392333',		'2018', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN015', N'Sunnyday group',														N'62 Võ Duy Ninh, P.22, Q.Bình Thạnh',												N'sunnydaygroup.biz@gmail.com',						'0906679027',		'2022', N'TP.HCM',					'123456',N'Đã duyệt'),
('DN016', N'CÔNG TY TNHH MTV ALIFACO',												N'Tầng 6, Sảnh AB Imperia Garden, 143 Nguyễn Tuân, Thanh Xuân',						N'ALIFACO@gmail.com',								'02485887424',		'2019', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN017', N'Công Ty TNHH Thương Mại - Dịch Vụ Hoa Mai',								N'số 9, đường 34A, phường An Phú, Quận 2',											N'info@kizuna.com.vn',								'02873000109',		'2018', N'TP.HCM',					'123456',N'Đã duyệt'),
('DN018', N'Công ty TNHH Thương mại Hiếu Food',										N'Tổ 15, ấp Xóm Gốc, Xã Long An, Huyện Long Thành',									N'HFood@gmail.com',									'0909399282',		'2018', N'Đồng Nai',				'123456',N'Đã duyệt'),
('DN019', N'CÔNG TY TRÁCH NHIỆM HỮU HẠN MỘT THÀNH VIÊN DU LỊCH RỒNG VÀNG PHÚ QUỐC',	N'Tổ 4, Ấp Cửa Lấp, Dương Tơ, Phú Quốc',											N'info@phuquocrongvangtravel.com',					'0773995099',		'2022', N'Kiêng Giang',				'123456',N'Đã duyệt'),
('DN020', N'CÔNG TY CỔ PHẦN ĐẦU TƯ TCG',											N'Bến thuyền Tam Cốc, Văn Lâm, Ninh Hải, Hoa Lư',									N'TCG@gmail.com',									'02485887666',		'2017', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN021', N'CÔNG TY TNHH DỊCH VỤ ĂN UỐNG TINH HOA BIỂN DƯƠNG',						N'101 – 105 Nguyễn Tri Phương, P.7, Q.5',											N'mktbienduongvina@gmail.com',						'0931808166',		'2018', N'TP.HCM',					'123456',N'Đã duyệt'),
('DN022', N'CÔNG TY CỔ PHẦN KAS HOLDINGS',											N'tòa nhà TASCO, Phạm Hùng, Từ Liêm',												N'holding@gmail.com',								'0906679111',		'2018', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN023', N'CÔNG TY TNHH KIM LIÊN HÀ NỘI',											N'13 Lý Thái Tổ, Hoàn Kiếm',														N'kimlienhn@gmail.com',								'02485887444',		'1995', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN024', N'Công ty TNHH Neo Hospitality',											N'122 Lê Lai, Quận 1',																N'NeoHospitality@gmail.com',						'02873000109',		'2015', N'TP.HCM',					'123456',N'Đã duyệt'),
('DN025', N'CÔNG TY TNHH DỊCH VỤ VÀ GIÁO DỤC QUỐC TẾ HOÀNG GIA VIỆT NAM',			N'44, đường 30, khu phố 2, phường Hoà Phú, Tp Thủ Dầu Một',							N'nfo@iser.edu.vn',									'02743893888',		'2018', N'Bình Dương',				'123456',N'Đã duyệt'),
('DN026', N'BLUE OCEAN GROUP',														N'Hệ thống đào tạo iGEM Learning, 60 Láng Hạ, Đống Đa',								N'info@igemlearning.vn ',							'0962706922',		'2013', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN027', N'Chi Nhánh Công Ty TNHH Sen',											N'Số nhà 38, ngõ 22, Phúc Xá, Ba Đình, Ba Đình',									N'mai.le@senfoodco.com',							'0988515624',		'2008', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN028', N'Công ty cổ phần công nghệ CMM Việt Nam',								N'Thôn Nghĩa Lộ, xã Chỉ Đạo, huyện Văn Lâm',										N'cmmvietnam@gmail.com',							'0955508166',		'2018', N'Hưng Yên',				'123456',N'Đã duyệt'),
('DN029', N'CÔNG TY TNHH CÔNG NGHỆ THÔNG TIN AN PHÁT',								N'Số 286/1, Đường Trần Hưng Đạo, Phường Nguyễn Cư Trinh, Quận 1',					N'hotro@anphat.vn',									'0914972211',		'2008', N'TP.HCM',					'123456',N'Đã duyệt'),
('DN030', N'CÔNG TY TNHH CÔNG NGHỆ THÔNG TIN VÀ TRUYỀN THÔNG GTEL',					N'103 Nguyễn Tuân, Phương Thanh Xuân Trung, Quận Thanh Xuân',						N'Gtel@gmail.com',									'02485887444',		'2012', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN031', N'Công ty TNHH Golf Artexport Tam Nông',									N'Lò Đúc, Hai Bà Trưng',															N'golfartexport@gmail.com',							'02873000109',		'1997', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN032', N'Ngân Hàng TMCP Công Thương Việt Nam (VietinBank)',						N'108 Trần Hưng Đạo, Phường Cửa Nam, Quận Hoàn Kiếm',								N'contact@vietinbank.vn',							'02439418868',		'1988', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN033', N'VNDIRECT',																N'Số 9 Đào Duy Anh',																N'tuyendung@vndirect.com.vn',						'02439724600',		'2006', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN034', N'CÔNG TY TNHH SẢN XUẤT - THƯƠNG MẠI - DỊCH VỤ QUI PHÚC',					N'111/39/4 Tây Lân, Tân Tạo, Bình Tân',												N'quiphuc@gmail.com',								'0988515332',		'2007', N'TP.HCM',					'123456',N'Đã duyệt'),
('DN035', N'Công ty Cổ phần chế tạo máy Sora',										N'Số 3, Lô 5 Khu Công nghiệp Lai xá, Hoài Đức',										N'soragroup@gmail.com',								'0962967816',		'2012', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN036', N'CÔNG TY TNHH NĂNG LƯỢNG GIGAWATT',										N'85 đường 12, P. An Khánh, Thủ Đức',												N'gigawatt@anphat.vn',								'0914972333',		'2008', N'TP.HCM',					'123456',N'Đã duyệt'),
('DN037', N'Tập đoàn BRG',															N'Số 198 Trần Quang Khải, phường Lý Thái Tổ, quận Hoàn Kiếm',						N'brg@gmail.com',									'02485887431',		'2007', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN038', N'CÔNG TY CỔ PHẦN MKT GROUP',												N'5 Lê Thước, P Thảo điền, Quận 2',													N'info@mekongvina.vn',								'0901826689',		'2000', N'TP.HCM',					'123456',N'Đã duyệt'),
('DN039', N'Công Ty Cổ Phần Tập Đoàn Công Nghiệp Việt',								N'Nhà máy Honda, phường Phúc Thắng, Phúc Yên',										N'congnghiepviet@gmail.com',						'02743893818',		'2005', N'Vĩnh Phúc',				'123456',N'Đã duyệt'),
('DN040', N'CÔNG TY CỔ PHẦN TẬP ĐOÀN SGROUP VIỆT NAM',								N'289A Khuất Duy Tiến, Trung Hòa, Cầu giấy, HN, Cầu Giấy',							N'Sgroup@gmail.com',								'09232425123',		'2006', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN041', N'TNHH KỸ THUẬT KIỂM ĐỊNH',												N'Lô 11 Khu Công Nghiệp Quang Minh,Thị Trấn Quang Minh, Huyện Mê Linh',				N'thangkd@gmail.com',								'09090808003',		'2015', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN042', N'CÔNG TY CỔ PHẦN CAO SU SAO VÀNG',										N'Số 231 Nguyễn Trãi, P. Thượng Đình, Thanh Xuân',									N'caosusaovang@gmail.com',							'0955508153',		'2002', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN043', N'CÔNG TY CỔ PHẦN TẬP ĐOÀN XÂY DỰNG THĂNG LONG',							N'58 Láng Hạ, Đồng Đa',																N'hotro@anphat.vn',									'0914990811',		'2008', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN044', N'CÔNG TY TNHH THƯƠNG MẠI KỸ THUẬT VLXD COTO',							N'101/10 Đường số 1, Phường 11, Gò Vấp, Gò Vấp',									N'vlxdcoto@gmail.com',								'02485822244',		'2006', N'TP.HCM',					'123456',N'Đã duyệt'),
('DN045', N'Công ty Cổ phần Đầu Tư K&G Việt Nam',									N'Tầng 11, Khối A, Tòa nhà Sông Đà, Đường Phạm Hùng, Nam Từ Liêm',					N'golfartexport@gmail.com',							'02873111109',		'2012', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN046', N'Công ty Môi Trường Hành Trình Xanh',									N'số 203 đường 325 Trịnh Quang Nghị, Phường 7, quận 8',								N'hanhtrinhxanhco@gmail.com',						'0972799995',		'2003', N'TP.HCM',					'123456',N'Đã duyệt'),
('DN047', N'Công ty TNHH Xử Lý Môi Trường Water Care',								N'I45/14, Đường NI16, KCN Mỹ Phước III, Thới Hoà, Bến Cát',							N'nhansu@watercare.vn',								'02743803990',		'2014', N'Bình Dương',				'123456',N'Đã duyệt'),
('DN048', N'Công ty Cổ phần Phát triển Chăn nuôi Hoà Phát',							N'số 39 đường Nguyễn Đình Chiểu, Phường Lê Đại Hành, quận Hai Bà Trưng',			N'hoaphat@gmail.com',								'02462848666',		'2007', N'TP.HCM',					'123456',N'Đã duyệt'),
('DN049', N'Công ty Cổ Phần Chăn Nuôi C.P. Việt Nam',								N'Số 2 đường 2A, KCN Biên Hoà II, P. Long Bình Tân, TP. Biên Hòa',					N'web-info@cp.com.vn',								'02513836251',		'1986', N'Đồng Nai',				'123456',N'Đã duyệt'),
('DN050', N'CÔNG TY TNHH MF VIỆT NAM',												N'KCN Trà Nóc 1, Bình Thuỷ',														N'info@mfvietnam.com',								'0777873177',		'2008', N'Cần Thơ',					'123456',N'Đã duyệt'),
('DN051', N'Công ty TNHH Một Thành Viên Thương Mại Thời Trang Tổng Hợp',			N'163 Phan Đăng Lưu Quận Phú Nhuận',												N'crv.ssp.talentacquisition@vn.centralretail.com',	'0905045850',		'2007', N'TP.HCM',					'111111',N'Đã duyệt'),
('DN052', N'CÔNG TY CỔ PHẦN THƯƠNG MẠI NAM ANH',									N'94-96 Nguyễn Ngọc Phương, Phường 19, Quận Bình Thạnh',							N'namanhfabric@gmail.com',							'02873999101',		'2017', N'TP.HCM',					'123456',N'Đã duyệt'),
('DN053', N'CÔNG TY TNHH THỰC PHẨM SẠCH BIGGREEN VIỆT NAM',							N'số 203 đường 325 Trịnh Quang Nghị, Phường 7, quận 8',								N'infobiggreen@mybiggreen.org',						'0936198778',		'2010 ', N'TP.HCM',					'123456',N'Đã duyệt'),
('DN054', N'CÔNG TY CỔ PHẦN U ULTTY VIỆT NAM',										N'11 Nguyễn Xiển, Hạ Đình, Thanh Xuân',												N'ulttyvietnam@gmail.com',							'0965672335',		'2019', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN055', N'CÔNG TY TNHH NHÀ HÀNG TUNG DINING',										N'Số nhà 2C phố Quang Trung, Phường Hàng Trống, Quận Hoàn Kiếm',					N'tungdining@gmail.com',							'0859933970',		'2018', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN056', N'CÔNG TY CỔ PHẦN MÁY SẤY HAI TẤN',										N'49 An Phú Đông 03, Khu Phố 05, Phường An Phú Đông, Quận 12',						N'maysayhaitan@gmail.com',							'0932032036',		'2019', N'TP.HCM',					'123456',N'Đã duyệt'),
('DN057', N'TRƯỜNG CAO ĐẲNG CÔNG NGHỆ BÁCH KHOA HÀ NỘI',							N'Số 18-20/322 Đường Nhân Mỹ, Phường Mỹ Đình 1, Quận Nam Từ Liêm',					N'truyenthong@hpc.edu.vn',							'02437960505',		'2008', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN058', N'CÔNG TY TNHH GIẢI PHÁP KINH DOANH THẾ HỆ MỚI VNNG',						N'7 P. Láng Hạ,Chợ Dừa,Đống Đa',													N'Vnng@gmail.com',									'0905045850',		'2007', N'Hà Nội',					'111111',N'Đã duyệt'),
('DN059', N'Công ty Cp Công nghệ và Truyền thông Dagoras',							N'80 Duy Tân, Cầu Giấy',															N'dagoras@gmail.com',								'0859933970',		'2020', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN060', N'BIDV - Trung tâm Quản trị Dữ liệu',										N'Tháp A Vincom 191 Bà Triệu, Hai Bà Trưng',										N'bidv247@bidv.com.vn',								'0222005889',		'1957', N'Hà Nội',					'123456',N'Đã duyệt'),
('DN061', N'Công ty TNHH Hana Labs Việt Nam',										N'Hoàn Kiếm',																		N'minhkhue@gmail.com',								'02836223318',		'2008', N'Hà Nội',					'123456',N'Đã duyệt')
GO

SET DATEFORMAT DMY	

--Nguoi ung tuyen
INSERT INTO NGUOIUNGTUYEN VALUES 
('NUT001', N'Lê Thành Nhân',		N'263 Hoang Hoa Tham',		'0782511972', N'nhanle1111@gmail.com', N'https://drive.google.com/drive/folders/1e4U1ojKvxJSsyRiTBLQABup9rhN-3tMR?usp=drive_link', '16/09/2021','Nam','aaaaaa'),
('NUT002', N'Hoang Le Thanh My',	N'324 Hòa Bình',			'0782511152', N'myhoang001@gmail.com', N'https://drive.google.com/drive/folders/2l9P1ojKvxJSsyRiTBLQABup9rhN-3tMR?usp=drive_link', '13/05/1998',N'Nữ','zzzzzz'),
('NUT003', N'Nguyen Uy Tin',		N'201 Trần Thị Báo',		'0783001152', N'uytin1415@gmail.com', N'https://drive.google.com/drive/folders/3m1L1ojKvxJSsyRiTBLQABup9rhN-3tMR?usp=drive_link', '17/02/2000','Nam','123456'),
('NUT004', N'Tran Thi My Nhan',		N'402 Lý Thái Tổ',			 '0782519652', N'mynhan1160@gmail.com', N'https://drive.google.com/drive/folders/alooojKvxJSsyRiTBLQABup9rhN-3tMR?usp=drive_link', '11/07/1997',N'Nữ','111111'),
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
('L001', N'Công nghệ thực phẩm', N'nganh-cong-nghe-thuc-pham.jpg'),
('L002', N'Đảm bảo chất lượng và an toàn thực phẩm', N'nganh-dam-bao-chat-luong-va-an-toan-thuc-pham.jpg'),
('L003', N'Công nghệ chế biến thuỷ sản', N'nganh-cong-nghe-che-bien-thuy-san1.jpg'),
('L004', N'Kế toán', N'nganh-ke-toan1.jpg'),
('L005', N'Tài chính - Ngân hàng', N'nganh-tai-chinh-ngan-hang.jpg'),
('L006', N'Quản trị kinh doanh', N'nganh-quan-tri-kinh-doanh.jpg'),
('L007', N'Kinh doanh quốc tế', N'nganh-kinh-doanh-quoc-te.jpg'),
('L008', N'Luật kinh tế', N'luatkinhte.jpg'),
('L009', N'Khoa học dinh dưỡng và ẩm thực', N'nganh-khoa-hoc-dinh-duong-va-am-thuc.jpg'),
('L010', N'Khoa học chế biến món ăn', N'nganh-khoa-hoc-che-bien-mon-an.jpg'),
('L011', N'Quản trị dịch vụ du lịch và lữ hành', N'dulich-2.jpg'),
('L012', N'Quản trị nhà hàng và dịch vụ ăn uống', N'nganh-quan-tri-nha-hang-va-dich-vu-an-uong.jpg'),
('L013', N'Quản trị khách sạn ', N'nganh-quan-tri-khach-san-1.jpg'),
('L014', N'Ngôn ngữ Anh', N'nganh-ngon-ngu-anh.jpg'),
('L015', N'Ngôn ngữ Trung Quốc', N'nganh-ngon-ngu-trung-quoc.jpg'),
('L016', N'Công nghệ thông tin', N'nganh-cong-nghe-thong-tin.jpg'),
('L017', N'An toàn thông tin', N'nganh-an-toan-thong-tin.jpg'),
('L018', N'Công nghệ chế tạo máy', N'nganh-cong-nghe-che-tao-may.jpg'),
('L019', N'Công nghệ kỹ thuật điện, điện tử', N'nganh-cong-nghe-ky-thuat-dien-dien-tu.jpg'),
('L020', N'Công nghệ kỹ thuật cơ điện tử', N'nganh-cong-nghe-ky-thuat-co-dien-tu.jpg'),
('L021', N'Công nghệ kỹ thuật điều khiển và tự động hóa', N'nganh-tu-dong-hoa.jpg'),
('L022', N'Công nghệ kỹ thuật hoá học', N'nganh-cong-nghe-ky-thuat-hoa-hoc.jpg'),
('L023', N'Công nghệ vật liệu', N'nganh-cong-nghe-vat-lieu.jpg'),
('L024', N'Công nghệ dệt, may', N'nganh-cong-nghe-det-may.jpg'),
('L025', N'Công nghệ kỹ thuật môi trường', N'nganh-cong-nghe-ky-thuat-moi-truong.jpg'),
('L026', N'Quản lý tài nguyên và môi trường', N'nganh-quan-ly-tai-nguyen-va-moi-truong.jpg'),
('L027', N'Công nghệ sinh học', N'nganh-cong-nghe-sinh-hoc.jpg'),
('L028', N'Kinh doanh thời trang và dệt may', N'nganh-kinh-doanh-thoi-trang-va-det-may.jpg'),
('L029', N'Quản trị kinh doanh thực phẩm', N'nganh-quan-tri-kinh-doanh-thuc-pham.jpg'),
('L030', N'Marketing', N'nganh-marketing.jpg'),
('L031', N'Kỹ thuật nhiệt', N'nganh-ky-thuat-nhiet.jpg'),
('L032', N'Công nghệ tài chính', N'cong-nghe-tai-chinh.jpg'),
('L033', N'Khoa học dữ liệu', N'nganh-khoa-hoc-du-lieu.jpg'),
('L034', N'Thương mại điện tử', N'nganh-thuong-mai-dien.jpg')
GO


--Bai dang
INSERT INTO BAIDANG VALUES 
('BD001', N'TUYỂN DỤNG THỰC TẬP SINH QC', 'DN001', 'L001', N'Hỗ trợ kiểm soát hồ sơ, chất lượng nguyên liệu từ đầu vào đến thành phẩm.', N'Phụ cấp: 2.000.000 - 5.000.000 VND/tháng, Phụ cấp cơm trưa, Có hỗ trợ đóng mộc xác nhận.', N'THỰC TẬP SINH QC',N'Không yêu cầu kinh nghiệm', N'22-25 tuổi', N'Thỏa thuận', '10-10-2023', N'Sinh viên chuyên ngành thực phẩm, Ưu tiên sinh viên mới ra trường hoặc sinh viên năm cuối, Có thể làm việc fulltime',N'Đã Duyệt')
INSERT INTO BAIDANG VALUES 
('BD002', N'TUYỂN DỤNG THỜI VỤ (NHẬN SINH VIÊN THỰC TẬP)', 'DN002', 'L001', N'Làm thời vụ có thể xoay ca.', N'Công ty hỗ trợ các bữa ăn trong ngày: sáng, trưa, tối, và hỗ trợ sữa.Công ty hỗ trợ giặt quần áo cho người lao động.Đóng BHXH, BHYT, BH tai nạn 24/24 đầy đủ.Công ty hỗ trợ chỗ ở an toàn để đảm bảo sản xuất.', N'THỰC TẬP SINH QC',N'Không yêu cầu kinh nghiệm', N'22-25 tuổi', N'Mức lương từ 6 đến 10 triệu', '10-10-2023', N'Biết đọc, biết viết cơ bản, Siêng năng chịu khó, Làm việc, theo ca xoay ca chuyển ca, được tính công tăng ca, Ở lại công ty để sản xuất thực hiện theo chỉ chị 3 tại chỗ (Trong thời gian thực hiện theo chỉ thị 16 này, bắt buộc ở lại Cty 24/24 xuyên suốt, ko về nhà).',N'Đã Duyệt'), 
('BD003', N'Nhân viên Công nghệ thực phẩm', 'DN003', 'L001', N'Kiểm soát , báo cáo tình trạng chất lượng nguyên liệu đầu vào, Kiểm soát theo dõi chất lượng thành phẩm hàng hoá được sản xuất, Giám sát, tuân thủ, đánh giá và cải tiến quy trình sản xuất,...', N'Phụ cấp: 2.000.000 - 5.000.000 VND/tháng, Phụ cấp cơm trưa,', N'Nhân viên chính thức',N'Không yêu cầu kinh nghiệm', N'25-30 tuổi', N'Thỏa thuận', '11-10-2023', N'Tốt nghiệp đại học chuyên ngành : Công nghệ thực phẩm, Có thái độ cầu tiến, ham học hỏi, tỷ mỉ cẩn thận, nghiêm túc trong công việc. ',N'Đã Duyệt'),
('BD004', N'Nhân Viên Kinh Doanh Thuốc Bảo Vệ Thực Vật', 'DN004', 'L002', N'Tiến hành nghiên cứu thị trường theo khu vực được phân công và sản phẩm để xác định chiến lược bán hàng, Quản lý danh sách khách hàng hoặc dòng sản phẩm được chỉ định để tối đa hóa doanh thu bán hàng và đáp ứng các mục tiêu của Công ty, Tư vấn hỗ trợ kỹ thuật cho bà con nông dân, Một số công việc khác khi được yêu cầu bởi cấp quản lý,...', N'Xét tăng lương theo hiệu quả công việc.Trợ cấp tiền ăn trưa và xăng xe 1,500,000 VNĐ, cung cấp sim điện thoại trả sau cho nhân viên.Công ty sẽ đóng phí BHXH và BHYT cho nhân viên.Được đào tạo trong môi trường chuyên nghiệp,...', N'Nhân viên chính thức',N'Không yêu cầu kinh nghiệm', N'23-30 tuổi', N'Lương cứng 6,000,000 - 10,000,000 VNĐ (tùy thuộc vào khả năng ứng viên) + hoa hồng', '11-10-2023', N'Chuyên ngành Nông nghiệp hoặc các ngành khác có liên quan.Có kinh nghiệm bán hàng kênh đại lý BVTV là lợi thế.Khả năng giải quyết vấn đề nhanh và chính xác.Kỹ năng giao tiếp và chăm sóc khách hàng tốt.Kỹ năng tin học văn phòng tốt bao gồm MS Word, Excel, PowerPoint, Internet.',N'Đã Duyệt'),
('BD005', N'Nhân Viên Tư Vấn Bán Hàng / Cộng Tác Viên Partime', 'DN005', 'L003', N'Đứng tại các Booth Sampling của Bavabi:Mời khách hàng sử dụng sản phẩm, Giới thiệu chương trình khuyến mãi của Bavabi cho khách hàng, Tư vấn khách hàng khi có nhu cầu.', N'Được tiếp cận các sự kiện lớn, các tổ chức chất lượng.Được ký giấy chứng nhận thực tập để làm đẹp CV.Lương trả theo ca / theo buổi + Thưởng vượt số lượng bán sản phẩm (30.000vnd/giờ).Được đào tạo kỹ năng bán hàng , quay, chụp ảnh sp.', N'Nhân Viên Tư Vấn Bán Hàng',N'Không yêu cầu kinh nghiệm', N'22-30 tuổi', N'Thỏa thuận', '12-10-2023', N'Nhanh nhẹn, chủ động trong công việc.Có khả năng nói trước đám đông.Có kinh nghiệm bán hàng trực tiếp là 1 lợi thế ( không có sẽ được đào tạo ).Có khả năng chụp / quay video ngắn cơ bản.Ưu tiên các bạn ở khu vực Hà Đông, Thanh Trì',N'Đã Duyệt'),
('BD006', N'Nhân viên kế toán', 'DN006', 'L004', N'Cần tuyển 01 kế toán không có kinh nghiệm sẽ được đào tạo.', N'Được tham gia đầy đủ BHXH,BHYT,... hỗ trợ tiền cơm trưa 35.000 đồng.', N'Nhân viên chính thức',N'Không yêu cầu kinh nghiệm', N'22-25 tuổi', N'Thỏa thuận', '12-10-2023', N'Tiếng anh giao tiếp.Tốt nghiệp ngành kế toán',N'Đã Duyệt'),
('BD007', N'Kế Toán Trưởng','DN007', 'L004', N'Cân đối hóa đơn đầu ra, đầu vào của công ty hàng tháng.Kiểm tra, đối chiếu và tập hợp số liệu kiểm kê của các bộ phận, xử lý sai sót trong quá trình kiểm kê (kiểm kê gồm Kiểm kê Tài sản, CCDC và hàng hóa).Kiểm tra giám sát tất cả các khoản thu, chi cuối tháng để hoàn thiện sổ sách công ty.Lập báo cáo tài chính theo tháng, năm,...', N'Đóng BHXH, BHYT, BHTN theo đúng quy định của nhà nước.Hưởng phép năm theo đúng quy định của nhà nước',N'Kế Toán Trưởng', N'Kinh nghiệm làm việc ở vị trí tương đương tối thiểu 2 năm.Kinh nghiệm làm việc tối thiểu 5 năm', N'26-35 tuổi', N'Mức lương: 15M – 30M (thỏa thuận theo năng lực)', '13-10-2023', N'Tốt nghiệp cao đẳng/đại học các ngành kế toán; kiểm toán.Thành thạo các phần mềm kế toán.Có chứng chỉ Kế toán trưởng là một lợi thế.Tiếng Anh nâng cao: nói, nghe, đọc, viết.Ứng tuyển CV bằng tiếng anh',N'Đã Duyệt'),
('BD008', N'CTV Tư Vấn Tài Chính Ngân Hàng', 'DN008', 'L005', N'Làm việc tại ngân hàng, Khai thác và chăm sóc tệp data khách hàng VIP của ngân hàng, Thiết kế và tư vấn kế hoạch tài chính tối ưu cho khách hàng. Giới thiệu sản phẩm bán chéo của TPBank và BHNT Sun life,  Tổ chức, hỗ trợ các event, hội thảo Survey cho khách hàng tại TPbank và Sun life, Lập kế hoạch, báo cáo công việc cho team leader', N'Thời gian linh động - Thỏa mái - Môi trường ngân hàng chuyên nghiệp (Full time hoặc Part time).Được đào tạo chuyên môn và tham gia các khóa học kỹ năng.Phát triển bản thân và cơ hội thăng tiến rộng mở.', N'CTV Tư Vấn Tài Chính Ngân Hàng', N'Đã có kinh nghiệm trong lĩnh vực Bảo hiểm/ Ngân hàng/ Tư vấn telesales tài chính...',N'20-35 tuổi', N'Lương hỗ trợ + Thu nhập từ kinh doanh từ 8 Triệu - 20 Triệu', '13-10-2023', N'Tốt nghiệp Cao đẳng/ Đại học.Chăm chỉ và kiên trì.Chịu áp lực tốt và thích nghi tốt',N'Đã Duyệt'), 
('BD009', N'Nhân Viên Kinh Doanh / TTS Tài Chính Ngân Hàng', 'DN009', 'L005', N'Tư vấn làm hồ sơ vay tín chấp cho khách hàng, không cần thu hồi nợ.Data khách hàng đăng ký vay có sẵn.Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng.Phát triển mối quan hệ khách hàng. Lập kế hoạch bán hàng, báo cáo công việc.Thời gian làm việc: 8h30 - 17h30 từ Thứ 2 đến sáng Thứ 7.', N'Hỗ trợ dấu thực tập.Nghỉ trưa 1 tiếng rưỡi, phòng ăn có lò vi sóng, tủ lạnh.Có thể đi làm ngay, hồ sơ nộp bổ sung sau. Hưởng các quyền lợi và phụ cấp theo quy định của công ty.Được đào tạo, training về kỹ năng bán hàng, kỹ năng giao tiếp khách hàng, kỹ năng văn phòng cơ bản.Có thể ký hợp đồng chính thức sau 3 tháng thử việc nếu đạt kết quả cao.', N'Nhân Viên Kinh Doanh / TTS Tài Chính Ngân Hàng', N'Có kinh nghiệm về bất động sản, tài chính, thương mại điện tử, ô tô, bảo hiểm... là lợi thế của bạn',N'Tuổi từ 22 trở lên', N'Lương cứng 6,2triệu + phụ cấp + incentive (TN trung bình từ 10 tới 15 triệu)', '14-10-2023', N'Tốt nghiệp ít nhất trung cấp.Hỗ trợ cho các bạn sinh viên năm cuối sắp ra trường.Tự tin, năng động, nhiệt huyết.Có kỹ năng làm việc độc lập và làm việc nhóm.',N'Đã Duyệt'),
('BD010', N'Giảng Viên Quản Trị Kinh Doanh', 'DN010', 'L006', N'Thực hiện kế hoạch giảng dạy và học tập được Khoa phân công.Thực hiện quản lý sinh viên trên lớp, chấm điểm đánh giá và điểm kiểm tra theo quy định.Thực hiện nhiệm vụ ra đề thi, coi thi, chấm thi học phần do Khoa phân công.Đánh giá học liệu, viết mới và góp ý sửa chữa chương trình đào tạo/đề cương chi tiết các môn học thuộc chuyên ngành được phân công.Hỗ trợ tổ chức các sự kiện liên quan đến giảng viên, sinh viên,...của Khoa.Thực hiện các nhiệm vụ khác khi được Ban Lãnh đạo Khoa và Nhà Trường phân công.', N'Tham gia đầy đủ chế độ BHXH, BHYT, BHTN.Thưởng các ngày lễ của năm: 30/04, 01/05, 02/09, tết dương lịch, âm lịch.Lương thưởng tháng 13 theo quy định hàng năm.Đi du lịch, nghỉ mát hàng năm.', N'Giảng Viên', N'Ưu tiên ứng viên đã có kinh nghiệm làm giảng viên hoặc làm trong các lĩnh vực liên quan đến giáo dục','27 trở lên', N'Thỏa thuận', '14-10-2023', N'Có bằng Thạc sĩ trở lên các chuyên ngành Quản trị Kinh doanh/Kinh tế/Kinh doanh thương mại/Quản lý kinh tế/marketing/hoặc các chuyên ngành liên quan khác.Sử dụng thành thạo máy tính, tin học văn phòng trong công tác giảng dạy.Tôn trọng và hợp tác với đồng nghiệp, kỷ luật trong lao động, lối sống lành mạnh và có chí tiến thủ.',N'Đã Duyệt'),
('BD011', N'Nhân Viên Kinh Doanh Quốc Tế', 'DN011', 'L007', N'Phát triển tìm kiếm/duy trì/chăm sóc khách hàng nước ngoài: Chào giá, giới thiệu sản phẩm, điều khoản thanh toán, thời gian giao hàng, chất lượng của hàng hóa...Lập đơn hàng, theo dõi, đôn đốc quá trình thực hiện đơn hàng.Phối hợp với bộ phận xuất nhập khẩu lập các chứng từ xuất hàng.Thực hiện các công việc khác theo yêu cầu của BGĐ.', N' Thời Gian làm việc: theo giờ hành chính từ T2 đến trưa T7 (nghỉ chiều T7 + CN).Công ty bao cơm trưa.Các chế độ về BHXH, BHYT, BHTN theo Luật Lao động Việt Nam. Nghỉ các ngày lễ, tết theo quy định của Luật Lao động và chính sách của công ty.Môi trường làm việc chuyên nghiệp, cơ hội thăng tiến cao. Ngoài ra còn nhiều chế độ ưu đãi khác (nghỉ mát, thưởng lễ, tết, thưởng tháng 13,...). ', N'Nhân Viên', N'Đã có ít nhất 1-2 năm kinh nghiệm làm việc trong các công ty Logistics, Sales, Thương mại điện tử.',N'26 tuổi trở lên', N'Mức lương cơ bản: 08tr đến 10tr (+ Thưởng theo doanh số ...)','15-10-2023',N'Sử dụng thành thạo tiếng Anh là yêu cầu bắt buộc.Yêu thích công việc kinh doanh, chịu được áp lực và nhiệt tình trong công việc. Tốt nghiệp Cao đẳng các trường kinh tế, chuyên ngành đối ngoại, quản trị kinh doanh, ngoại ngữ tiếng Anh trở lên.',N'Đã Duyệt'),
('BD012', N'Senior International Sale/ Chuyên Viên Kinh Doanh Quốc Tế (Logistics)', 'DN012', 'L007', N'Chăm sóc khách hàng theo từng nhóm khu vực kinh doanh Châu Á, Mỹ, Úc,....và tìm kiếm khách hàng mới.Tạo và giữ mối quan hệ tốt với khách hàng, thu thập thông tin và thực hiện tốt dịch vụ hậu mãi.Giới thiệu mẫu sản phẩm Đá Quart mới tới khách hàng, thu thập và phân tích các thông tin phản hồi của khách hàng và thị trường.Lập và triển khai các kế hoạch gia tăng doanh số; Quản lý công nợ và lên kế hoạch thu hồi công nợ.Thực hiện việc Báo cáo tuần – tháng – quý – năm hoặc theo yêu cầu công việc;Các công việc khác theo sự phân công của Ban Giám đốc.', N'Tham gia BHXH đầy đủ theo quy định.Lương tháng 13 -14 (theo kết quả kinh doanh).Thưởng các ngày Lễ - Tết, thưởng cuối năm.Đi du lịch 1 năm/1 lần.Chế độ hiếu, hỉ, sinh con, sinh nhật..', N'Chuyên Viên Kinh Doanh Quốc Tế', N' Có kinh nghiệm trong việc kinh doanh xuất nhập khẩu ít nhất 4 năm.',N'25-35 tuổi', N'Lương thỏa thuận (20 Triệu + Hoa hồng )','15-10-2023',N'Tốt nghiệp CĐ/ Dại học các chuyên ngành xuất nhập khẩu, ngoại thương, QTKD.Kỹ năng giao tiếp tốt.Tiếng Anh thành thạo.Lương thỏa thuận theo kinh nghiệm và năng lực.',N'Đã Duyệt'), 
('BD013', N'Trợ Lý Luật Sư Tranh Tụng (Nam)', 'DN013', 'L008', N'Trực tiếp làm việc với khách hàng, cơ quan tố tụng.Làm việc trực tiếp với khách hàng, bên bảo đảm và người thân/người liên quan để thu thập thông tin, đánh giá phương án.Trực tiếp thực hiện các thủ tục tố tụng theo quy định của pháp luật nhằm xử lý tài sản bảo đảm và xử lý khoản nợ của khách nợ bao gồm nhưng không giới hạn ở:Đàm phán, đề nghị bàn giao, khởi kiện, xử lý tài sản qua thi hành án và các cơ quan liên quan;Hỗ trợ Luật sư trong việc đánh giá toàn diện tính pháp lý của hồ sơ theo quy định của pháp luật, hỗ trợ Luật sư trong quá trình giải quyết vụ việc với khách nợ và với các cơ quan nhà nước có thẩm quyền để giải quyết vụ việc,...', N'Thử việc 2 tháng hưởng 85% lương cứng + Doanh số.Được đóng BHXH khi ký hợp đồng chính thức. Các quy định tuân thủ theo luật Lao động.Cơ hội thăng tiến, điều chỉnh lương xét định kì 6 tháng 1 lần.Giờ nghỉ happytime 30 phút/ ngày, tổng thời gian làm việc 7,5 tiếng/ngày. Làm việc từ 8h00 - 17h30, nghỉ trưa 1,5h, từ thứ 2 đến sáng thứ 7.', N'Trợ Lý Luật Sư', N'Có kiến thức và am hiểu về quy trình tố tụng.',N'26 trở lên', N'Thu nhập rất hấp dẫn và cạnh tranh với thị trường (bao gồm lương cứng 6 tr/tháng + % giá trị hợp đồng + thưởng trên từng vụ việc + thưởng khác).','16-10-2023',N'Ưu tiên ứng viên đã hoàn thành khoá học luật sư.Năng động, không ngại di chuyển, đi công tác thường xuyên.Kỹ năng thương lượng và giải quyết vấn đề, kỹ năng quản lý thời gian;Trung thực, quyết đoán, có khả năng đàm phán và thuyết phục khách hàng;Có máy tính cá nhân, có phương tiện đi lại.',N'Đã Duyệt'),
('BD014', N'Luật Sư', 'DN014', 'L008', N'Làm việc với khách hàng, tiếp nhận vụ việc và tư vấn ban đầu cho khách hàng đối với các vụ việc tranh tụng;Nghiên cứu hồ sơ, soạn thảo văn bản tố tụng và các văn bản liên quan đến quá trình làm việc với khách hàng, cơ quan có thẩm quyền;Tham gia giải quyết vụ án tại Tòa án, trung tâm trọng tài;Tham gia bào chữa cho bị can, bị cáo trong các vụ án hình sự;Đại diện khách hàng thực hiện các thủ tục hành chính tại cơ quan nhà nước;Các công việc/ nghiệp vụ nghề nghiệp khác theo phân công của lãnh đạo Công ty.',N'Được hưởng lương tháng thứ 13 và các khoản thưởng Lễ Tết trong năm.Được nghỉ phép, nghỉ thai sản, nghỉ Lễ Tết. BHXH theo quy định.Được xét tăng lương định kỳ theo năng lực và kết quả công việc,Được tiếp cận nền tảng quản lý chuyên nghiệp hiện đại,...', N'Luật Sư',N'Đã có kinh nghiệm', N'30 tuổi trở lên', N'Lương thỏa thuận (thử việc 02 tháng, hưởng 85% lương).Thỏa thuận', '16-10-2023', N'Chỉ tuyển nam.Có chứng chỉ luật sư hoặc thẻ luật sư.Kỹ năng giao tiếp và thuyết phục tốt, không ngại va chạm.Kỹ năng soạn thảo, trình bày văn bản tốt.Ưu tiên những luật sư làm nhiều về tranh tụng hình sự',N'Đã Duyệt'),
('BD015', N'Cộng Sự Hợp Tác/ Quản Lý Kinh Doanh - Trung Tâm Dinh Dưỡng (20 Triệu Trở Lên)', 'DN015', 'L009', N'SUNNYDAY GROUP - TUYỂN LEADER TIÊN PHONG TRONG HỢP TÁC KINH DOANH! DÀNH CHO NHỮNG AI:Mong muốn kiếm thêm thu nhập bán thời gian,khởi nghiệp vốn thấp - muốn trau dồi phát triển bản thân, tích lũy kinh nghiệm kinh doanh,mong muốn xây dựng nguồn thu nhập thụ động không giới hạn.',N'Được trang bị kiến thức quy trình tư vấn - chăm sóc khách hàng miễn phí.Được huấn luyện đào tạo xây dựng hệ thống khách hàng theo quy trình (đã vận hành phát triển 10 năm).Được huấn luyện đào tạo quản trị hệ thống kinh doanh với đội ngũ chuyên gia kinh nghiệm 15 năm.Làm việc trong môi trường chuyên nghiệp, thân thiện, cơ hội phát triển bản thân tốt.', N'Nhân Viên Quản Lý',N'Có 02 năm kinh nghiệm làm việc trở lên.', N'25 – 35 tuổi.', N'THU NHẬP: dựa trên hoa hồng doanh số tối thiểu 50 - 70%. Thu nhập tăng trưởng theo thời gian.', '17-10-2023', N'Đúng giờ, kỷ luật, chịu học hỏi, chịu khó và chịu áp lực, quan tâm chăm sóc sức khỏe bản thân...Ưu tiên: người đã từng khởi nghiệp kinh doanh chưa thành công, đây là cơ hội để xây dựng phát triển bản thân BỀN VỮNG.THỜI GIAN: Full time hoặc partime (3 tiếng/ngày) theo thỏa thuận.',N'Đã Duyệt'),
('BD016', N'Chuyên Viên Đào Tạo Dinh Dưỡng', 'DN016', 'L009', N'Đào tạo kiến thức sản phẩm, dinh dưỡng cho nội bộ.Biên soạn tài liệu giảng dạy bằng các định dạng phù hợp với mục tiêu đào tạo.Nghiên cứu tìm hiểu các phương pháp đào tạo phù hợp với thực tế và yêu cầu của công ty.Hỗ trợ cung cấp thông tin chuyên ngành nhằm chỉnh sửa các tài liệu và chương trình đào tạo.Thực hiện các công việc khác theo chỉ đạo của cấp trên.',N'Lộ trình thăng tiến rõ ràng.Thưởng tháng lương thứ 13.Du lịch, nghỉ mát.Tham gia BHXH, BHYT, BHTN theo quy định.Phụ cấp gửi xe, điện thoại, thưởng quý, thưởng thâm niên...Cơ hội học hỏi và làm việc trong môi trường chuyên nghiệp, trẻ trung.', N'Chuyên Viên Đào Tạo Dinh Dưỡng',N'Đã có kinh nghiệm từ 2 năm trở lên.', N'25 – 35 tuổi.', N'Lương cứng: 12-15 triệu + phụ cấp + thưởng', '17-10-2023', N'Tốt nghiệp Đại học chính quy chuyên ngành Y khoa, dinh dưỡng hoặc dược sĩ.Am tường các kiến thức tổng  quát/chuyên sâu về sức khỏe - dinh dưỡng - thực phẩm.Có khả năng quản lý, tổ chức, làm việc dưới áp lực cao và đúng thời hạn.Có khả năng nắm bắt xu thế phát triển của thị trường và người tiêu dùng.',N'Đã Duyệt'),
('BD017', N'Bếp Trưởng - Bếp Chính Bếp Ăn Công Nghiệp', 'DN017', 'L010', N'Nấu bếp ăn công nghiệp tại các Công ty, Xí nghiệp trong các Khu chế xuất, Khu công nghiệp.Kiểm soát quy trình làm việc của nhân viên bộ phận bếp, đảm bảo thực hiện đúng quy trình tiêu chuẩn món ăn của Công ty đề ra.Kiểm tra thực đơn, số lượng phần ăn hàng ngày để lên kế hoạch sản xuất,...',N'Có cơ hội phát triển và thăng tiến;Có chế độ lương thưởng tốt;Được tham gia BHXH, BHYT, BHTN....đầy đủ;Được hưởng 12 ngày phép năm,...', N'Bếp Trưởng',N'Từ 02 năm trở lên', N'25 – 35 tuổi.', N'Thỏa Thuận', '18-10-2023', N'Chuyên môn: trung cấp chuyên nấu các món ăn ba miền, tiệc cưới, nhà hàng, khách sạn, có kinh nghiệp nấu suất ăn công nghiệp là lợi thế;Kỹ năng yêu cầu: Nhanh nhẹn, thành thạo trong công việc, chịu được áp lực cao trong môi trường công nghiệp.',N'Đã Duyệt'),
('BD018', N'Bếp Trưởng', 'DN018', 'L010', N'Quản lý khu vực trong bếp, sắp xếp thời gian, phân công công việc của mọi người cho phù hợp.Giám sát, theo dõi quá trình nhân viên làm việc, đánh giá hiệu quả công việc.Kiểm kê hàng hoá, lên kế hoạch dự trù tối ưu.Quản lý quy trình món ăn để đạt chất lượng nhất.',N'Hỗ trợ ăn ca (2 bữa/ ngày).Hưởng đầy đủ BHXH, các chế đỗ phúc lợi như quy định.Nghỉ 1 ngày trong tuần.Thời gian làm việc: ca gãy (10h-14h & 17h-22h)', N'Bếp Trưởng',N'Có kinh nghiệm Bếp trưởng tối thiểu 3 năm, làm bếp Hàn', N'25 – 35 tuổi.', N'Thỏa Thuận', '18-10-2023', N'Bắt buộc phải biết làm thịt + bảo quản thịt đúng cách.Có kinh nghiệm, khả năng quản lý, bao quát nhân sự và công việc',N'Đã Duyệt'),
('BD019', N'Hướng Dẫn Viên Du Lịch Tiếng Anh', 'DN019', 'L011', N'Ghi nhận việc cung cấp chất lượng dịch vụ và phục vụ của đối tác theo chương trình, phản ánh về bộ phận điều hành.Trực tiếp tham gia thực hiện chương trình tour, hướng dẫn, chăm sóc, tư vấn khách xuyên suốt chương trình.Chi tiết công việc trao đổi cụ thể khi phỏng vấn,...',N'Bảo Hiểm y tế & Xã hội.Phúc lợi xã hội.Lương + Thưởng theo chế độ Cty.Được đi Nghĩ dưỡng theo chế độ định kỳ của Công ty.', N'Hướng Dẫn Viên Du Lịch Tiếng Anh',N'Không Yêu cầu kinh nghiệm', N'23 – 35 tuổi.', N'Thỏa Thuận', '19-10-2023', N'Có thẻ Hướng dẫn viên , Nhanh nhẹn , Vui Vẻ, Hoạt bát, cẩn trọng, Nhiệt tình, chịu được áp lực trong công việc, Trung Thực, Có chí tiến thụ & Yêu nghề.Kỹ năng Tiếng Anh: nghe nói đọc viết.Có kỹ năng tổ chức team building, gala du lịch là một lợi thế.Sức khỏe tốt',N'Đã Duyệt'),
('BD020', N'Hướng Dẫn Viên Du Lịch', 'DN020', 'L011', N'Thực hiện dẫn tour cho khách hàng.Hỗ trợ xử lý các công việc giẩy tờ, thủ tục cho khách hàng.Các công việc khác theo sự phân công của cấp quản lý',N'Thưởng lễ tết, thưởng lương tháng 13.Được đi du lịch 1 năm 1 lần.Được đóng bảo hiểm y tế, bảo hiểm xã hội, bảo hiểm thất nghiệp.Môi trường làm việc trẻ, vui vẻ, thời gian làm việc thoải mái, không gian làm việc sạch đẹp.Sử dụng laptop cá nhân để làm việc (nếu không có công ty sẽ cung cấp).Giờ làm việc:Tuần 6 ngày, nghỉ 1 ngày.Sáng từ 8h00 – 12h00; Chiều từ 13h00 – 17h00.', N'Hướng Dẫn Viên Du Lịch',N'Ưu tiên có kinh nghiệm hướng dẫn viên quốc tế.', N'25 – 35 tuổi.', N'Thỏa Thuận', '19-10-2023', N'Trình độ tiếng Anh cơ bản (sẽ được đào tạo thêm).Có đam mê, hiểu biết về du lịch.Kỹ năng khởi tạo ý tưởng, tư duy sáng tạoNăng động, nhiệt tình và chủ động trong công việc.Ăn nói lễ phép, lịch thiệp trong giao tiếp',N'Đã Duyệt'),
('BD021', N'Quản Lý Nhà Hàng', 'DN021', 'L012', N'Quản lý nhân viên.Quản lý hàng hoá, tài sản.Giải quyết sự cố và khiếu nại của khách.Điều hành công việc.Quản lý tiêu chuẩn phục vụ.Các công việc khác: Thực hiện các báo cáo lên cấp trên.',N'Có chế độ tốt khi làm việc lâu dài, hưởng các chế độ ưu đãi của công ty, thưởng lương tháng 13 và các ngày lễ, tết trong năm, BHXH đầy đủ.Làm việc tại Q3, Q5', N'Nhân Viên Quản Lý',N'Có kinh nghiệm tối thiểu 3 năm ở vị trí tương đương.', N'27 tuổi trở lên', N'Mức lương thoả thuận tuỳ vào năng lực', '20-10-2023', N'Ưu tiên ứng viên biết tiếng Hoa.Biết tin học văn phòng: word, excel. Có kinh nghiệm về mảng Tiệc và Hải sản.Hiểu biết về các trang thiết bị trong Nhà hàng là một lợi thế',N'Đã Duyệt'),
('BD022', N'Quản Lý Nhà Hàng / F&B Manager (Nữ) (Thu Nhập Upto 25Tr)', 'DN022', 'L012', N'Đảm bảo sự hài lòng của khách hàng.Đảm bảo chất lượng.Quản lý nhân sự hiệu quả.Quản lý tài chính, tài sản.Quản lý hoạt động kinh doanh.',N'Thưởng hấp dẫn: thưởng lương tháng 13 + thưởng theo đánh giá năng lực + thưởng kinh doanh.Các chế độ BHXH, BHYT, ngày nghỉ phép năm theo quy định của Luật Lao Động và quy định công ty.Thường xuyên tham gia các khóa đào tạo bài bản, chuyên nghiệp, nâng cao kỹ năng chuyên môn.Được tham gia các hoạt động ngoại khóa, team building do công ty tài trợ,...', N'Nhân Viên Quản Lý',N'Có kinh nghiệm và kiến thức trong lĩnh vực dịch vụ F&B ít nhất 3 năm.', N'26 tuổi trở lên.', N'Mức Lương hấp dẫn theo năng lực, UP TO 25TR =  Lương cứng + hoa hồng.', '20-10-2023', N'Thành thạo TIẾNG ANH thương mại hoặc tiếng HÀN.Tuyển ứng viên NỮ.Có tinh thần nhiệt huyết với công việc, luôn cố gắng hoàn thành tốt nhiệm vụ được giao.Trung thực, tự tin và có kỹ năng giao tiếp tốt.Có kỹ năng lãnh đạo và tổ chức tốt, Có khả năng toàn diện và nhạy bén trong công việc.',N'Đã Duyệt'),
('BD023', N'Nhân Viên Lễ Tân Khách Sạn - Đi Làm Ngay', 'DN023', 'L013', N'Trực tiếp check in – check out đón khách.Quản lý thu – chi liên quan đến tiền phòng của khách hàng.Kịp thời hỗ trợ, giải đáp các yêu cầu, phàn nàn từ khách hàng.Phối hợp và chủ động nhập thông tin đặt phòng vào hệ thống.Các công việc khác theo yêu cầu của trưởng bộ phận và quản lý,...',N'Thưởng Service Charge hàng tháng.Thưởng lễ tết công đoàn.Thưởng tháng lương 13.Ăn ca, đồng phục, gửi xe miễn phí.Giặt là đồng phục.12 ngày nghỉ phép/năm hưởng lương theo quy định.Chế độ BHXH + BHYT + BHTN theo quy định.Du xuân đầu năm, nghỉ dưỡng hè, staff party cuối năm.', N'Nhân Viên Lễ Tân',N'Không yêu cầu kinh nghiệm.', N'18 tuổi trở lên', N'Mức lương cạnh tranh. Thu nhập từ 7 triệu', '20-10-2023', N'Tốt nghiệp trung cấp chuyên ngành du lịch, khách sạn; Trung cấp nghề trở lên.Yêu thích ngành Khách sạn, thích công việc phục vụ tại Khách sạnTiếng Anh giao tiếp tốt.Nhanh nhẹn, trung thựcCó tinh thần làm việc lâu dài với tổ chức.Ưu tiên ứng viên đã có kinh nghiệm làm việc tại các khách sạn 4 sao trở lên',N'Đã Duyệt'),
('BD024', N'Lễ Tân Khách Sạn', 'DN024', 'L013', N'Làm thủ tục check in, out, gia hạn lưu trú cho khách, đăng ký lưu trú online cho khách.Tư vấn, nhận đặt phòng qua điện thoại, email, trực tiếp,...Sử dụng hệ thống quản lý thông tin, báo cáo doanh thu và tình hình khách cho quản lý hằng ngày.Xử lý các nghiệp vụ, tình huống theo sự hướng dẫn của quản lý.Theo dõi, báo cáo các góp ý, review của khách.',N'Nhân viên được cấp phát đồng phục miễn phí.Được đào tạo quy trình bài bản & có cơ hội thăng tiến.Cơ hội làm việc trong môi trường chuyên nghiệp , tiêu chuẩn Nhật Bản.Được đào tạo nâng cao chuyên môn, nghiệp vụ.Hưởng đủ chế độ theo quy định pháp luật về quản lý lao động BHXH, BHYT theo quy định Nhà Nước.', N'Nhân Viên Lễ Tân',N'Không yêu cầu kinh nghiệm', N'18 tuổi trở lên.', N'Trên 7 triệu', '20-10-2023', N'Tốt nghiệp Trung cấp trở lên. Trình độ Tiếng Nhật N4, Tiếng Anh cơ bản.Giao tiếp tốt, chăm chỉ, cẩn thận. Vi tính văn phòng cơ bản',N'Đã Duyệt'),
('BD025', N'Nhân Viên Ngôn Ngữ Anh (Làm Việc Trong Tuần)', 'DN025', 'L014', N'Đón và trả học viên trước và sau buổi học.Quản lý tình hình lớp học, số lượng học viên, điểm danh sĩ số lớp.Chuẩn bị phòng học và các dụng cụ trước buổi học.Hỗ trợ chăm sóc học viên đang theo học tại trung tâm.Thực hiện các nhiệm vụ khác có liên quan do người quản lý giao,...',N'Môi trường làm việc chuyên nghiệp và thân thiện.Cơ hội phát triển nghề nghiệp.Đảm bảo công bằng và thăng tiến.Phúc lợi và chế độ bảo hiểm.Mức lương phụ hợp với năng lực.', N'Nhân Viên Ngôn Ngữ Anh',N'Ưu tiên ứng viên có kinh nghiệm làm việc trong lĩnh vực dịch vụ giáo dục. Sử dụng tốt tiếng Anh là một lợi thế (ielts 6.0 trở lên)', N'22 trở lên', N'Trên 3 triệu', '21-10-2023', N'Tác phong chuyên nghiệp, nhiệt tình, nhanh nhẹn, có khả năng giao tiếp và thuyết phục tốt. Sử dụng tốt tin học văn phòng. Sinh viên học các ngành liên quan đến giáo dục , ngôn ngữ. Ưu tiên ứng viên có kinh nghiệm làm việc trong lĩnh vực dịch vụ giáo dục. ',N'Đã Duyệt'),
('BD026', N'Trợ Giảng Ngôn Ngữ Anh IGEM English', 'DN026', 'L014', N'Chuẩn bị lớp học, giáo cụ giảng dạy, trợ giảng cho giáo viên nước ngoài.Thực hiện công tác giảng dạy, hướng dẫn học sinh theo chương trình ngôn ngữ Anh iGEM English cho học sinh từ mầm non đến phổ thông.Soạn giáo án, xây dựng cập nhật tài liệu dạy và học môn Ngôn ngữ Anh, làm giáo cụ.Trao đổi với phụ huynh về tình hình học tập của học sinh.Tham gia tổ chức các sự kiện của trung tâm.',N'Được đào tạo về chương trình, phương pháp giảng dạy và các kỹ năng làm việc.Được làm việc trong môi trường năng động, trẻ trung, có nhiều cơ hội thăng tiến.Các chính sách phụ cấp khác, thưởng theo quy định công tyThời gian làm việc: 6 ngày/tuần (4h/ngày)', N'Trợ Giảng',N'Ưu tiên các nhân sự có chứng nhận IELTS 6.0 trở lên.', N'22 trở lên', N'Thỏa thuận theo năng lực và thưởng chỉ tiêu chuyên môn', '21-10-2023', N'Sinh viên năm thứ 3 hay năm thứ 4, Đại học hay Cao đẳng sư phạm thuộc các chuyên ngành: Ngôn ngữ Anh, Sư phạm Tiếng Anh, Tiếng Anh Thương mại.Phát âm chuẩn tiếng Việt.Yêu trẻ và tâm huyết với nghề, yêu thích công việc liên quan đến giáo dục.Thành thạo kỹ năng vi tính văn phòng và tìm kiếm thông tin trên Internet.',N'Đã Duyệt'),
('BD027', N'Nhân Viên Sales - Bán Hàng Xuất Khẩu Thị Trường TRUNG QUỐC', 'DN027', 'L015', N'Hỗ trợ thông tin khách hàng trên gian hàng của Alibaba và đi tham gia hội chợ nước ngoài(Trung Quốc):Tìm kiếm khách hàng,Giao dịch, đàm phán các đơn hàng mới,...',N'Được đào tạo lại tại công ty trong thời gian 3 tháng.Hoa hồng 3 triệu/ cont + thưởng cuối năm theo kết quả lao động.Mức thu nhập tham khảo của 1 nhân viên bán hàng xuất khẩu tại thời điểm 6 tháng đầu năm 2023 là hơn 50 triệu/tháng( nhân viên tốt nghiệp đại học Ngoại thương,)Được tham gia đầy đủ các chế độ theo quy định của Công ty & Luật lao động: BHXH, BHYT, du lịch hàng năm.', N'Nhân Viên Sales',N'1 năm', N'25 – 35 tuổi.', N'Thu nhập hấp dẫn: bao gồm lương cứng (Từ 10 -15 triệu) + thưởng hoa hồng bán hàng 3 đến 5 triệu đồng cho 1 cont hàng.', '22-10-2023', N'Ngoại ngữ: PHẢI CÓ Tiếng Trung nghe, nói, đọc, viết, ưu tiên ứng viên có thêm tiếng Anh cơ bản.Chấp nhận học từ Trung Quốc hoặc Đài Loan - Trung Quốc về.Ưu tiên những bạn mới ra trường chưa có kinh nghiệm và học giỏi.',N'Đã Duyệt'),
('BD028', N'Phiên Dịch Tiếng Trung Quốc', 'DN028', 'L015', N'Phiên dịch tiếng Trung - Việt.Hỗ trợ Ban lãnh đạo xử lý các công việc hàng ngày và các thư từ thương mại.Chi tiết trao đổi khi phỏng vấn,...',N'Tăng lương theo vị trí và thâm niên.Môi trường làm việc hiện đại, chuyên nghiệp, ổn định lâu dài;Chính sách BHXH, BHYT, BHTN đầy đủ,...', N'Phiên Dịch Viên',N'Không yêu cầu kinh nghiệm', N'22 tuổi trở lên', N'Trên 13 triệu', '22-10-2023', N'Ưu tiên đã có kinh nghiệm phiên dịch tiếng Trung, chưa có kinh nghiệm được đào tạo.Thành thạo 4 kỹ năng: nghe, nói, đọc, viết.Thành thạo tin học văn phòng.Cẩn thận, siêng năng, trung thực, yêu nghề, nhiệt tình, chủ động trong công việc. Xu hướng gắn bó lâu dài cùng công ty sẽ được đào tạo và thỏa thuận các chế độ làm việc phù hợp với năng lực cá nhân.',N'Đã Duyệt'),
('BD029', N'Nhân Viên Video Editor', 'DN029', 'L016', N'Sản xuất và tạo dựng cho các mẫu Video sáng tạo và hiệu quả phục vụ nhu cầu quảng bá thương hiệu của công ty với nội dung và định dạng phù hợp trên kênh quảng cáo Online( Facebook, Youtube, Zalo,...).Phối hợp với các bộ phận và các team khác để nắm bắt, thấu hiểu, sản xuất và tạo dựng Video có nội dung truyền tải thông điệp thương hiệu và chiến dịch quảng cáo hiệu quả và sáng tạo.Các clip ngắn để đẩy mạnh các kênh Social của Công ty.Các clip ngắn để đẩy mạnh các kênh Social của Công ty, biết làm infographic.Quản lý kho hình ảnh,video của hệ thống team. Các hoạt động hỗ trợ khác theo phân công của cấp trên.',N'Hưởng đầy đủ các chế độ BHXH, BHYT, phép năm, du lịch,...Môi trường làm việc văn minh, chuyên nghiệp.Thu nhập cạnh tranh: Lương cứng 10 triệu (có thể hơn tùy năng lực) + Phụ cấp + Thưởng,...', N'Nhân Viên',N'Không yêu cầu kinh nghiệm', N'22 tuổi trở lên', N'10 - 15 triệu', '24-10-2023', N'Ưu tiên người có kinh nghiệm làm việc ở vị trí Video Editor hoặc tương tự từ 1 năm trở lên, biết chụp ảnh tốt.Sử dụng thành thạo phần mềm dựng Adobe Premiere, biết thêm After Effects, Photoshop, Illustrator (ở mức trên cơ bản) là một lợi thế.Khả năng tư duy hình ảnh, màu sắc và âm thanh tốt.Có kỹ năng quay, lấy góc máy, ánh sáng, bố cục tốt là một lợi thế.',N'Đã Duyệt'),
('BD030', N'Lập Trình Java', 'DN030', 'L016', N'Phát triển các chức năng theo nhu cầu của các dự án, tập trung chính về Java SpringBoot.Tối ưu luồng công việc đảm bảo tiến độ dự ánTham gia phát triển trong team Agile/Scrum.Báo cáo công việc cho cấp quản lý.Cộng tác với thành viên trong team, các team khác  để thiết kế và phát triển hệ thống.',N'Đối với ứng viên có kinh nghiệm sẽ thỏa thuận dựa trên năng lực, đảm bảo mức cạnh tranh so với thị trường.Hưởng 13 đến 15 tháng lương/năm.Hỗ trợ ăn trưa tại công ty.Định kỳ xét tăng lương 1 năm1 lần,...',N'Backend',N'4 năm', N'26 tuổi trở lên', N'Trên 13 triệu', '24-10-2023', N'Tối thiểu 04 năm làm dự án BackEnd, ít nhất 06 tháng kinh nghiệm làm về low - level design.Sử dụng thành thạo Java Spring Boot trong thời gian thực hiện dự án.Sử dụng thành thạo công cụ quản lý như Git, Jira,...Có kinh nghiệm sử dụng CSDL như Oracle, PostgreSQL,....',N'Đã Duyệt'),
('BD031', N'Chuyên Viên Công Nghệ Thông Tin ( IT Support )', 'DN031', 'L016', N'Bảo trì, khắc phục sự cố, chỉnh sửa phần mềm, hỗ trợ về phần mềm cho hội sở và chi nhánh.Quản trị, vận hành hệ quản trị CSDL.Hỗ trợ CBNV khi gặp các vấn đề về phần cứng và phần mềm.Xây dựng, thiết kế hệ thống mạng, lập kế hoạch, triển khai hệ thống mạng, hệ thống máy chủ,...',N'Chính sách phúc lợi hấp dẫn theo tiêu chuẩn của tập đoàn T&T.BHXH đầy đủ.Được cấp máy tính phục vụ công việc.Phụ cấp ăn trưa.', N'IT Support',N'3 năm', N'22 tuổi trở lên', N'Thoả thuận', '24-10-2023', N'Ưu tiên nhân sự làm việc trực tiếp tại Phú Thọ.Đại học chuyên ngành CNTT, Điện tử, Viễn thông.Có ít nhất 02 năm kinh nghiệm làm việc trong lĩnh vực Công nghệ thông tin, IT helpdesk... Có kiến thức nâng cao về một trong những hệ thống: Windows, Cisco, Linux, Exchange.Biết thiết kế website và quản trị web cơ bản: Wordpress, Joomla.Có kiến thức nâng cao về các dịch vụ: AD,DHCP, DNS, Web Servers, DNS, FTP...; Có kiến thức nâng cao về một trong những hệ thống: Windows, Cisco, Linux, Exchange.Có kiến thức về hệ thống điện thoại nội bộ Voip hoặc Analog, Camera giám sát.Kiến thức cơ bản về những hệ quản trị dữ liệu: MySQL, MS SQL, Oracle.',N'Đã Duyệt'),
('BD032', N'Bảo Mật Cloud - Kỹ Sư An Toàn Thông Tin','DN032', 'L017', N'Nghiên cứu, triển khai các giải pháp an toàn bảo mật cho các hệ thống ứng dụng trên Cloud.Xây dựng quy chế, quy định, quy trình bảo mật liên quan hệ thống Cloud/Devsecops',N'Thu nhập thỏa thuận theo năng lực ứng viên.Lương thưởng cuối năm hấp dẫn;Một năm xem xét điều chỉnh lương 1 lần;1 năm có 12 ngày phép, được hưởng chế độ du lịch hè, bảo hiểm theo luật lao động + bảo hiểm sức khỏe cho cá nhân, thưởng các ngày lễ.Được quyền tham gia chương trình vay ưu đãi của Ngân Hàng dành cho cán bộ nhân viên.Quyền lợi về đào tạo: được tham gia các chương trình đào tạo của ngân hàng.Được tham gia các chương trình team building của Ngân Hàng.', N'Kỹ Sư An Toàn Thông Tin',N'5 năm', N'22 tuổi trở lên', N'Thoả thuận', '24-10-2023', N'Bằng cấp: Tốt nghiệp Đại học một trong các chuyên ngành: Công nghệ thông tin, an toàn thông tin, mạng máy tính, an ninh mạng, điện tử viễn thông, toán tin.Có kiến thức kinh nghiệm tư vấn, xây dựng thiết kế hệ thống trên Cloud/CI/CD.Có kiến thức và kinh nghiệm làm việc với Docker, GitCó kinh nghiệm triển khai, áp dụng các giải pháp bảo mật trên hệ thống CI/CD Jenkins, Gitlab CI, Github,...Các chứng chỉ về ATTT: AWS Certified Security , CISSP, CEH, OSCP,... là 1 lợi thế.',N'Đã Duyệt'),
('BD033', N'Chuyên Viên Giám Sát An Toàn Thông Tin', 'DN033', 'L017', N'Triển khai, xây dựng và tối ưu các giải pháp giám sát ATTT, đảm bảo các sự kiện ATTT được ghi nhận đầy đủ, toàn vẹn.Xây dựng các case giám sát và thực hiện giám sát các sự kiện ATTT toàn hệ thống.Ghi nhận, phân tích các sự kiện ATTT bất thường, cảnh báo tới các bộ phân liên quan để xử lý kịp thời các sự kiện này.Tham gia phản ứng sự cố ANTT theo phân công.Thực hiện các nhiệm vụ khác theo phân công của cấp quản lý.',N'Cộng đồng những người làm nghề chính trực và dấn thân phụng sự.Thu nhập theo năng lựcTổ chức học tập và văn hóa sôi nổi.', N'Chuyên Viên Giám Sát An Toàn Thông Tin',N'2 năm', N'24 tuổi trở lên', N'Thoả thuận', '25-10-2023', N'Tốt nghiệp đại học chuyên ngành: CNTT, ĐTVT, ATTT...Có kiến thức An ninh mạng,kiến trúc an toàn thông tin,quản lý sự cố vi phạm mạng và dữ liệu.Có kinh nghiệm điều tra, truy vết các sự kiện tấn công mạng và xử lý sự cố ATTT.Có hiểu biết hoặc có kinh nghiệm vận hành các hệ thống an ninh bảo mật như: FW/IPS/WAF/Web-Filter, Sandbox,Enpoint-EDR, Threat Intelligent phòng chống tấn công APT,...',N'Đã Duyệt'),
('BD034', N'Nhân Viên Cơ Khí Chế Tạo Máy', 'DN034', 'L018', N'Trực tiếp tham gia thực hiện việc chế tạo và lắp ráp máy móc, thiết bị (MMTB) mới theo sự chỉ đạo của cấp trên.Phối hợp với các bộ phận sản xuất và trực tiếp tham gia thực hiện công việc cải tiến, sửa chữa, bảo trì, bảo dưỡng MMTB của công ty (máy dập, máy cắt, máy pen bàn, máy chấn tole, máy có sử dụng hệ thống thủy lực - khí nén, tời nâng, palang...).Thực hiện các nhiệm vụ phát sinh khác do cấp quản lý trực tiếp giao.Công việc cụ thể sẽ trao đổi trong buổi phỏng vấn.',N'Mức lương được thỏa thuận theo năng lực và kinh nghiệm làm việc của ứng viên.Chính sách tăng lương áp dụng định kì hoặc theo đánh giá năng lực.Chế độ BHXH theo luật định và các phúc lợi khác theo chính sách công ty (quà tặng sinh nhật, hiếu, hỷ, các hoạt động văn thể mỹ...).Lương tháng 13.Hỗ trợ cơm trưa tại công ty.Môi trường làm việc thân thiện, năng động, có nhiều cơ hội phát triển bản thân.', N'Nhân Viên Cơ Khí',N'2 năm', N'22 tuổi trở lên', N'10 - 16 triệu', '25-10-2023', N'Tốt nghiệp Trung Cấp / Cao Đẳng / Đại Học chuyên ngành kỹ thuật, cơ khí - chế tạo hoặc các ngành có liên quan.Có kinh nghiệm từ 03 trở lên ở các công ty về cơ khí , chế tạo máy, kỹ thuậtHiểu biết về các loại máy móc, thiết bị công nghiệp. Có kiến thức về chế tạo, lắp đặt, bảo trì MMTB công ty.Biết hàn điện, cắt gió đá. Biết đọc & hiểu bản vẽ kỹ thuật.Có khả năng làm việc độc lập, cẩn thận, có trách nhiệm cao trong công việc',N'Đã Duyệt'),
('BD035', N'Kỹ Sư Thiết Kế Máy', 'DN035', 'L018', N'Khảo sát, lên phương án, tư vấn, thiết kế sản phẩm cho khách hàng khi có yêu cầu.Trao đổi, giải quyết các vấn đề liên quan đến công nghệ, kỹ thuật với khách hàng và với các phòng ban, bộ phận liên quan.Nghiên cứu công nghệ mới, cải tiến thiết kế sản phẩm của công ty.Dự toán, báo giá các dự án được giao.Tham gia và hướng dẫn giám sát quá trình chế tạo sản phẩm.',N'Phụ cấp: phụ cấp ăn trưa, ăn nhẹ.Mức lương: Thỏa thuận cạnh tranh.Thưởng KPIs: Hàng thángThời gian làm việc: Làm 8h/ngày từ thứ 2 đến thứ 7.Ngày nghỉ: nghỉ các chủ nhật + 2 thứ 7 trong tháng;Làm tăng ca thêm giờ lương nhân theo hệ sốNghỉ ngày lễ theo quy định của nhà nước hưởng nguyên lương;Hưởng 12 ngày phép năm theo quy định.Đóng BHXH ngay sau khi hết thử việc.',N'Nhân Viên Thiết Kế Máy',N'3 năm', N'26 tuổi trở lên', N'15 - 25 triệu', '25-10-2023', N'Giới tính Nam.Tốt nghiệp Đại học, chuyên ngành cơ khí, tự động hóa.Am hiểu đặc tính các động cơ, các thiết bị tiêu chuẩn của Nhật bản.Sử dụng được phần mềm thiết kế inventor, solid work, ptc, auto cad...Hiểu biết về gia công, thiết bị tự động hóa.Giao tiếp tốt, nhiệt tình với công việc.Kinh nghiệm làm việc từ 3 năm.Biết ngoại ngữ là 1 lợi thế',N'Đã Duyệt'),
('BD036', N'Nhân Viên Kỹ Thuật Điện Năng Lượng Mặt Trời (Thu Nhập 9 - 12 Triệu)', 'DN036', 'L019', N'Bảo trì bảo dưỡng, sửa chữa, kinh doanh thiết bị.Hỗ trợ tư vấn cho bộ phận kinh doanh.Hỗ trợ tư vấn kĩ thuật cho khách hàng khi có nhu cầu.Địa điểm làm việc: 85 đường 12, P.An Khánh, TP.Thủ Đức, TP.HCM',N'Thu nhập: 9 - 12 triệu đồng ( LC + phụ cấp + %HH + Thưởng).Được hưởng đầy đủ BHXH, BHYT và BHTN theo Luật lao động hiện hành.Được tổ chức sinh nhật, party, du lịch,..Công việc ổn định lâu dài.Tham gia team building hàng năm và nhiều hoạt động khác theo quy chế Công ty.Được đào tạo bài bản về kiến thức, kỹ năng và yêu cầu cần thiết cho công việc.', N'Phiên Dịch Viên',N'Dưới 1 năm', N'22 tuổi trở lên', N'9 - 12 triệu', '26-10-2023', N'Giới tính: Nam.Tốt nghiệp Trung Cấp, Cao Đẳng chuyên ngành có liên quan: Điện/ Điện tử/ Điện lạnh/ Điện công nghiệp.Sử dụng thành thạo tin học văn phòng.Thành thạo kỹ năng bán hàng, có kỹ năng giao tiếp, đàm phán tới nhiều loại đối tượng khách hàng.Có trách nhiệm với công việc.Ham học hỏi.Ưu tiên người có kinh nghiệm kĩ thuật điện, bán hàng thiết bị điện.',N'Đã Duyệt'),
('BD037', N'Nhân Viên Kỹ Thuật Điện', 'DN037', 'L019', N'Đóng/ cắt điện khi có sự cố và ngừng cấp điện khi khách hàng chậm thanh toán tiền điện.Chốt chỉ số điện/ nước định kỳ hàng tháng.Checklist, kiểm tra, vệ sinh định kỳ các trạm biến áp theo định kỳTreo/ tháo công tơ, lập biên bản khi có đề nghị cấp điện mới, công tơ hết hạn kiểm định, công tơ hỏng.Đảm bảo an toàn trong quản lý vận hành điện nước, an toàn thiết bị được phân công theo dõi.Lập báo cáo và nhật ký vận hành hàng ngày, nghiệm thu công việc thực hiện.',N'Lương tốt, Thưởng tháng 13; Thưởng lễ tết theo quy định của Tập đoàn.Tham gia BHXH, BHYT đầy đủ theo quy định.Du lịch, nghỉ mát hàng năm.Môi trường tập đoàn chuyên nghiệp, nhiều cơ hội học hỏi, thăng tiến trong công việc.Trang thiết bị làm việc hiện đại, chuyên nghiệp.Tham gia khóa học đào tạo chuyên môn, An toàn điện,...', N'Nhân Viên Kỹ Thuật',N'2 năm', N'18 tuổi trở lên', N'9 - 11 triệu', '26-10-2023', N'Tốt nghiệp Cao đẳng Điện trở lên, ưu tiên chuyên ngành hệ thống điện/ tự động hóa.Trên 2 năm kinh nghiệm về lĩnh vực vận hành hệ thống điện/ kỹ thuật điệnAm hiểu và có kinh nghiệm treo tháo, sửa chữa công tơ điện.',N'Đã Duyệt'),
('BD038', N'Nhân Viên Kỹ Thuật Cơ Điện Tử', 'DN038', 'L020', N'Lắp đặt các thiết bị máy móc công nghiệp nhẹ tại của Cty cung cấp cho các nhà máy khách hàng.Hướng dẫn, đào tạo khách hàng sử dụng thiết bị, xử lý sự cố trên thiết bị.Báo cáo thực hiện công việc, thu thập ý kiến khách hàng và đề xuất các giải pháp cải tiến liên quan đến sửa chữa, bảo hành, bảo trì, lắp đặt thiết bị cho khách hàng.Thực hiện các công việc được phân công điều động của cấp quản lý.Sẵn sàng, chủ động đi công tác tại khách hàng và ngoài giớ khi có yêu cầu.',N'Thu nhập: Lương+PC đi lại+BHXHYTTN+ Thưởng bộ phận + Thưởng Lễ + Thưởng năm KQKD + Tháng 13.Chế độ tăng lương hàng năm và điều chỉnh trước hạn cho nhân viên giỏi, vượt yêu cầu.Được đào tạo về thiết bị và các kỹ năng chuyên môn trước khi vào việc.Phép năm hưởng lương 12 ngày + Bảo hiểm TN cộng thêm 24/7+ Đồng phục, Dụng cụ kỹ thuật,...', N'Nhân Viên Kỹ Thuật',N'1 năm', N'22 tuổi trở lên', N'Trên 12 triệu', '26-10-2023', N'Đại học ngành cơ điện tử. Hiểu biết về cơ khí,điện.Ngoại ngữ: tiếng Anh ( đọc tài liệu, soạn thảo văn bản, mail, báo cáo,.. giao tiếp là lợi thế).Ưu tiên có kinh nghiệm thi công lắp đăt hệ thống máy móc thiết bị, đi điện thiết bị công nghiệp.',N'Đã Duyệt'),
('BD039', N'Kỹ Sư Tự Động Hóa (14 - 18 Net)', 'DN039', 'L021', N'Lập kế hoạch thi công đúng tiến độ.Triển khai thi công.Giám sát công tác an toàn lao động.Giám sát chất lượng.Giám sát thi công.Phối hợp cùng phòng Kiểm soát nội bộ tiến hành nghiệm thu chất lượng theo từng giai đoạn, đảm bảo chất lượng mới chuyển sang giai đoạn tiếp theo.',N'Thu nhập từ 14 – 18 triệu đồng/tháng.Làm thêm giờ nhân theo hệ số luật lao động.Thưởng quý, năm, các dịp Lễ, Tết theo quy định của Công ty.Đóng bảo hiểm theo quy định của Pháp luật ngay khi ký hợp đồng chính thức.Được hướng dẫn, đào tạo nâng cao kiến thức chuyên môn và kỹ năng xử lý công việc,...', N'Nhân Viên Cơ Khí',N'1 năm', N'24 tuổi trở lên', N'23 – 39 tuổi', '27-10-2023', N'Tốt nghiệp Đại học các chuyên ngành về Tự động hóa, ...Ít nhất 1 năm kinh nghiệm ở vị trí tương đương.Sử dụng thành thạo phần mềm chuyên ngành: Autocad , PLC của Mitsubishi và các phần mềm văn phòng. Linh động, có thể đảm nhiệm nhiều vị trí công tác khác nhau từ lên ý tưởng đến khai triển kỹ thuật.Có thái độ cẩn thận tỉ mỉ, nhanh nhẹn, sẵn sàng,...Giới tính: Nam.Làm việc tại dự án - Vĩnh Phúc. ',N'Đã Duyệt'),
('BD040', N'Kỹ Sư Cơ Khí - Tự Động Hóa', 'DN040', 'L021', N'Nghiên cứu và phối hợp với ban tư vấn để thiết kế hệ thống nâng hạ tự động cho các sản phẩm nội thất thông minh, nội thất đa năng.Lắp ráp hệ thống sau khi gia công hoàn thiện.Phối hợp cùng bộ phận thiết kế ra bản vẽ kỹ thuật sản phẩm.Hỗ trợ thi công và giám sát chất lượng, tiến độ thi công của dự án.Nghiên cứu và phát triển công nghệ mới tự động cho các sản phẩm nội thất thông minh, nội thất đa năng của công ty',N'Thu nhập: lương cơ bản 10.000.000 – 15.000.000.Phụ cấp: ăn trưa 500.000 + gửi xe 100.000+ hỗ trợ xăng xe đi lại.Tháng lương thứ 13 thưởng các ngày lễ tết theo quy định chung (lễ 2/9, tết dương lịch, tết âm lịch, 10/3, 30/4, 1/5, 1/6, rằm trung thu).Đóng BHXH, BHYT, hưởng ngày nghỉ lễ và các chế độ đãi ngộ theo quy định của Nhà nước.Tham dự những chuyến du lịch hàng năm cùng công ty.', N'Nhân Viên Cơ Khí',N'2 năm', N'24 tuổi trở lên', N'10 - 15 triệu', '27-10-2023', N'Nam, tốt nghiệp Đại học trở lên chuyên ngành Kỹ thuật cơ khí- Chế tạo máy.Sử dụng thành thạo Autocad 2D, phần mềm thiết kế 3D Solidwork.Có kinh nghiệm vẽ cơ khí, thiết kế, lựa chọn linh kiện tiêu chuẩn, chế tạo máy tự động, bán tự động.Có hiểu biết về gia công cơ khí để tiến hành thiết kế đúng với yêu cầu thực tế.Có khả năng triển khai từ thiết kế đến khâu gia công hoàn thiện. - Ưu tiên biết tiếng Anh.',N'Đã Duyệt'),
('BD041', N'Kỹ Sư Kiểm Định Hóa Học Hữu Cơ', 'DN041', 'L022', N'Nhận mẫu từ bộ phận kinh doanh, tiến hành phân tích thử nghiệm và đánh giá tiêu chuẩn.Xuất báo cáo kết quả thử nghiệm.Thao tác máy móc phòng lab như: GC, GC-MS, ICP, UVis, SOP. Hỗ trợ các công việc khác dược giao. ',N'Được hưởng đầy đủ BHXH, BHYT và BHTN theo Luật lao động hiện hành.Môi trường làm việc chuyên nghiệp, năng động, được đào tạo với các chuyên gia huấn luyện, cơ hội nâng cao khả năng ngoại ngữ.Được tham gia các hoạt động chung của Công ty: du lịch, teambuilding, sự kiện.', N'Nhân Viên Kiểm Định',N'Dưới 1 năm', N'22 tuổi trở lên', N'8 - 15 triệu', '28-10-2023', N'Có kinh nghiệm làm việc việc với máy móc phòng lab như: GC, GC-MS, ICP, UVis, SOP... là một lợi thế.Tốt nghiệp chuyển ngành Hóa học hoặc các chuyên ngành khác có liên quan.Ưu tiên biết tiếng Anh hoặc tiếng Trung',N'Đã Duyệt'),
('BD042', N'Kỹ Sư Hóa Cao Phân Tử, Hóa Dầu', 'DN042', 'L022', N'Nghiên cứu, thử nghiệm các nguyên liệu mới, sản phẩm mới, thay đổi sản phẩm cũ dựa trên nền tảng kiến thức và nguyên tắc Hóa học;Nghiên cứu, biên soạn các tài liệu hướng dẫn an toàn lao động và xử lý sự cố khi công nhân viên có nguy cơ phải tiếp xúc với các hóa chất độc hại;Thử nghiệm các quy trình mới, thu thập dữ liệu cần thiết để thực hiện các cải tiến và sửa đổi;Tham gia nghiên cứu và lập báo cáo khả thi dự án;Tham gia triển khai dự án;Đề xuất ý tưởng, sáng kiến về kỹ thuật, công nghệ,...',N'Môi trường làm việc năng động, thân thiện.Được đảm bảo đầy đủ các chế độ dành cho người lao động theo quy định pháp luật lao động hiện hành như tiền lương, tiền thưởng, các khoản bổ sung lương, chế độ ốm đau, thai sản, nghỉ phép hàng năm.Được tham gia các hoạt động ngoại khóa như văn nghệ, thể thao, du lịch, nghỉ mát hàng năm của Công ty.', N'Kỹ Sư Hóa Cao Phân Tử, Hóa Dầu',N'Không yêu cầu kinh nghiệm', N'Tuổi dưới 40', N'Thoả thuận', '28-10-2023', N'Là Nam giới; Có quyền công dân;Tốt nghiệp Đại học trở lên các chuyên ngành Hóa cao phân tử, Hóa dầu. Ưu tiên trường Bách khoa, Khoa học tự nhiên hoặc có liên quan;Có đủ sức khỏe học tập, công tác; Phương tiện đi lại tự túc;Có tinh thần đoàn kết, chăm chỉ và nhiệt tình gắn bó với Công ty.',N'Đã Duyệt'),
('BD043', N'Thí Nghiệm Viên (Vật Liệu Xây Dựng)', 'DN043', 'L023', N'Triển khai công tác thí nghiệm tại Phòng thí nghiệm hiện trường.Quản lý trang thiết bị thí nghiệm.Tổ chức công việc, phối hợp các bên liên quan (Kỹ thuật thi công, Tư vấn giám sát,...) tiến hành các thí nghiệm trong phòng và ngoài hiện trường phục vụ thi công.Thực hiện các nhiệm vụ khác do Ban chỉ huy công trường nơi đang làm việc hoặc do Ban Giám đốc công ty giao',N'Mức lương: Thỏa thuận theo năng lực.Công ty hỗ trợ chỗ ở và ăn trưa.Cung cấp đầy đủ trang thiết bị làm việc.Phụ cấp công tác, thưởng thâm niên, thưởng các ngày Lễ Tết, cuối năm.Chế độ tăng lương, Du lịch, BHXH, BHYT, BHTN.', N'Thí Nghiệm Viên',N'Không yêu cầu kinh nghiệm', N'18 tuổi trở lên', N'Thoả thuận', '29-10-2023', N'Trình độ, chuyên môn: Trung cấp, cao đẳng trở lên chuyên ngành xây dựng, địa chất, vật liệu xây dựng. Tốt nghiệp có chứng chỉ hành nghề Thí nghiệm viên.Kinh nghiệm: Có kinh nghiệm là một lợi thế, không có sẽ được công ty đào tạo.Kiến thức và kĩ năng: Thành thạo các phép thử trong phòng và hiện trường; Kỹ năng quản lý, xây dựng hệ thống, đào tạo nhân viên, giao tiếp, thuyết trình; Kỹ năng tin học, kỹ năng tổng hợp, thống kê khoa học.Phẩm chất: Cẩn thận, trung thực và ham học hỏi.Thường xuyên phải làm việc trong những điều kiện ngoài trời.',N'Đã Duyệt'),
('BD044', N'Nhân Viên Kinh Doanh - Tư Vấn Vật Liệu Xây Dựng', 'DN044', 'L023', N'Duy trì, thiết lập những những mối quan hệ kinh doanh với các nhóm đối tượng khách hàng.Hiểu rõ và thuộc tính năng, giá cả, ưu nhược điểm của sản phẩm, sản phẩm tương tự, sản phẩm của đối thủ cạnh tranh. Nắm được quy trình tiếp xúc khách hàng, quy trình xử lý khiếu nại thông tin, quy trình nhận và giải quyết thông tin khách hàng.Trực tiếp thực hiện, đốc thúc thực hiện hợp đồng, bao gồm các thủ tục giao hàng, xuất hoá đơn, cùng khách hàng kiểm tra chất lượng sản phẩm giao.Công việc theo sự  chỉ đạo của cấp trên.Trao đổi thêm khi phỏng vấn.',N'Thu nhập lên tới 16 triệu/ tháng nếu đạt chỉ tiêu doanh số 400 triệu/ tháng.Vượt mức doanh số đề ra, hoa hồng tăng thêm 1%.Hưởng chế độ BHXH theo quy định.Ngày phép theo quy định.Thưởng lễ tết sinh nhật.Bạn có thể đề xuất mức chỉ tiêu cao hơn để tăng mức lương cứng, Cứ tăng thêm 1 triệu lương cứng khi đăng ký doanh số tăng thêm 100 triệu.Sản phẩm mới đa dạng về mẫu mã, giá cả cạnh tranh.', N'Nhân Viên',N'Dưới 1 năm', N'22 tuổi trở lên', N'8 - 16 triệu 13 triệu', '29-10-2023', N'Ưu tiên kinh nghiệm kinh doanh 6 tháng trở lên trong ngành Vật liệu xây dựng/ gạch / nội thất, bất động sản, bán hàng.Dưới 1 năm kinh nghiệm',N'Đã Duyệt'),
('BD045', N'Chuyên Viên Kỹ Thuật Dệt May (Pattern Maker)', 'DN045', 'L024', N'Ra rập , nhảy size, làm định mức.Hoàn thiện bộ tài liệu kỹ thuật sản xuất được phân công.Triển khai kỹ thuật cho sản xuất đại trà đối với các mã sản phẩm được phân công.Cải tiến, tinh chỉnh form dáng để phù hợp với nhu cầu của khách hàng.Triển khai và kiểm soát về form dáng, kỹ thuật đối với các mã được giao trong quá trình sản xuất.Triển khai TLKT đến đơn vị gia công, sử lý tình huống phát sinh trong quá trình sản xuất đại trà.Triển khai các công việc khác theo phân công của TBP Kỹ thuật.',N'Phụ cấp ăn trưa, xăng xe, điện thoại.Lộ trình thăng tiến và cơ hội phát triển cao, K&G không giới hạn khả năng, tôn trọng sự sáng tạo.Cơ hội tham gia 20 khóa huấn luyện, đào tạo phát triển/ năm (Training, coaching, OJT, e- learning…),...', N'Chuyên Viên Kỹ Thuật',N'2 năm', N'22 tuổi trở lên', N'Thu nhập từ 16-20.000.000đ', '30-10-2023', N'Tối thiểu kinh nghiệm 2 năm trở lên.Am hiểu về môi trường sản xuất, về ngành may.Có chuyên môn về kỹ thuật may, thiết bị máy móc chuyên ngành.Thành thạo về tính toán định mức, phương pháp test độ co.Biết chỉnh sửa rập.Biết sử dụng phần mềm chuyên dụng : Optitex.Có thể đi công tác, xử lý công việc tại đơn vị sản xuất.',N'Đã Duyệt'),
('BD046', N'Kỹ Sư Môi Trường ( Technical Support Engineer)', 'DN046', 'L025', N'Hỗ trợ tư vấn khách hàng: kiểm tra rà soát các bản vẽ xử lý nước thải và nước cấp, khí thải... của khách hàng, tư vấn thiết kế bản vẽ cho các dự án.Hỗ trợ tư vấn khách hàng quá trình thiết kế, lựa chọn thiết bị, lắp đặt và vận hành.Hỗ trợ khách hàng : hướng dẫn, đào tạo và chuyển giao công nghệ trong quá trình lắp đặt, vận hành, bảo trì các thiết bị của công ty cung cấp.Hỗ trợ giải đáp, đào tạo các vấn đề kỹ thuật liên quan cho các nhân viên phòng kinh doanh.Kiểm tra xử lý các trường hợp bảo hành sản phẩm.Thực hiện các công việc khác theo yêu cầu của trưởng phòng và Ban giám đốc.Thời gian làm việc: thứ 2 - thứ 6, từ 8:00AM - 5:00PM. Thứ 7: 8:00 -12:00.',N'Thưởng cuối năm theo doanh số bán hàng và hiệu quả kinh doanh của team kinh doanh (từ 2-4 tháng lương).Đãi ngộ khác: ăn trưa tại công ty, tham gia bảo hiểm theo quy định, một tháng được nghỉ 1 ngày phép, du lịch thường niên 1 lần/năm, được tổ chức sinh nhật, chế độ nghỉ cưới hỏi...theo quy định của công ty.Ứng viên sẽ được đào tạo về sản phẩm và tham gia các khóa đào tạo của các nhà sản xuất trong và ngoài nước.Được làm việc trong môi trường làm việc năng động, với những đồng nghiệp trẻ có năng lực và tinh thần làm việc theo nhóm tốt,...', N'Kỹ Sư Môi Trường',N'2 năm', N'24 tuổi trở lên', N'10 - 18 triệu', '30-10-2023', N'Tốt nghiệp chuyên ngành kỹ thuật môi trường.Có trên 2 năm kinh nghiệm ở vị trí tương tự hoặc ở vị trí kỹ sư thiết kế/thi công công trình.Có khả năng giao tiếp tốt, yêu thích công việc.Có kỹ năng làm việc độc lập, chủ động trong công việc.Trung thực, ham học hỏi nghiên cứu tài liệu kỹ thuật và cầu tiến, có tinh thần xây dựng cho công ty.Ứng viên thành thạo các phần mềm AUTOCAD và Revit là một lợi thế, có thể được đào tạo thêm.',N'Đã Duyệt'),
('BD047', N'Chuyên Viên Quan Trắc Môi Trường', 'DN047', 'L025', N'Quan trắc lấy mẫu nước, mẫu khí, đo nhanh các chỉ tiêu trong nước.Những công việc theo cấp trên chỉ đạo.Trao đổi kỹ hơn tại buổi phỏng vấn.',N'Trả lương theo cơ chế lương 3P (Theo dãy lương Chuyên Viên Cấp Cao).Được làm việc trong môi trường chuyên nghiệp, trẻ trung và năng động, nhiều cơ hội thăng tiến.Được đào tạo bài bản về kỹ năng.Được hưởng đầy đủ các chế độ theo quy định của pháp luật ( BHYT, BHXH, BHTN) và các chế độ phúc lợi theo nội quy, quy chế của Công ty ( tham quan, nghỉ mát, lương thưởng, nghỉ Tết lễ..).Được hưởng đầy đủ các chế độ thăm hỏi sức khỏe cho bản thân và gia đình theo chính sách đãi ngộ của Công ty.', N'Chuyên Viên Quan Trắc Môi Trường',N'1 năm', N'23 tuổi trở lên', N'7 - 18 triệu', '30-10-2023', N'Tốt nghiệp ngành môi trường, công nghệ sinh học, công nghệ hoá, địa chất.Chăm chỉ, trung thực, chịu được áp lực.Có tinh thần trách nhiệm, cẩn thận trong công việc.',N'Đã Duyệt'),
('BD048', N'Nhân Viên Môi Trường', 'DN048', 'L026', N'Quản lý vận hành hệ thống xử lý nước thải chăn nuôi, biogas, ép phân, ép bùn,...Hỗ trợ xử lý các sự cố Môi trường trong trang trại.Hỗ trợ các công việc khác trong trang trại.Các công việc khác theo chỉ đạo của BQL trại.Báo cáo công việc hàng ngày cho bộ phận chuyên môn.',N'Thưởng năng suất hàng tháng: dao động 20% - 25% mức lương.Chế độ BHXH, chế độ ốm đau, hiếu, hỉ đầy đủ. Tổ chức và tặng quà sinh nhật, thưởng Lễ Tết,...Công ty hỗ trợ ăn ở miễn phí 100%.Được đào tạo, nâng cao chuyên môn, nghiệp vụ.', N'Nhân Viên',N'1 năm', N'20 tuổi trở lên', N'11 - 16 triệu', '31-10-2023', N'Trình độ Cao đẳng, Đại học chuyên ngành Môi trường...Đã có kinh nghiệm 2 - 3 năm trong vận hành xử lý nước thải.Chịu được áp lực công việc, có tinh thần làm việc nhóm.Có thể ở lại trại chăn nuôi làm việc dài ngày (1 tháng về 4).Thành thạo máy tính để làm báo.Khả năng làm việc nhóm.Có kiến thức về công tác thiết kế hệ thống xử lý nước thải.Biết sử dụng: Auto CAD, Excel, Word Office...',N'Đã Duyệt'),
('BD049', N'Kỹ Sư Công Nghệ Sinh Học', 'DN049', 'L027', N'Chịu trách nhiệm kiểm tra, giám sát chất lượng sản phẩm tại khâu nguyên liệu, bán thành phẩm, đóng gói;Thực hiện sản xuất theo các tiêu chuẩn GMP, ISO9001, ISO22000, HACCP;Nhiệt độ trung bình tại chuyền sản xuất là 10 – 12 độ C và Công Ty có trang bị đồ bảo hộ thân thiệt;Chi tiết công việc sẽ được tư vấn lúc nhận CV;PHỎNG VẤN ONLINE',N'Hỗ trợ xe đưa rước hằng tuần tuyến Bình Phước – TPHCM, Bình Phước – Đồng Nai;Phụ cấp cơm 600 nghìn / tháng.Ký HĐLĐ chính thức ngay sau phỏng vấn đạt. Được hưởng 100% lương và đóng các loại bảo hiểm ( BHYT, BHXH, BHTN ) ngay trong tháng thử việc;Hỗ trợ 20 triệu VNĐ / năm chi phí khám chữa bệnh hiểm nghèo ( nếu có ),...', N'Kỹ Sư Công Nghệ Sinh Học',N'Không yêu cầu kinh nghiệm', N'24 tuổi trở lên', N'Trên 9 triệu', '31-10-2023', N'Không yêu cầu kinh nghiệm, sẽ được training trong thời gian thử việc;Đối tượng: sinh viên tốt nghiệp khối ngành Công nghệ thực phẩm, Sinh học, Hóa Học sẽ làm được nhiều vị trí như: Nhân viên Sản xuất / QC / QA / R&D / Kho Nguyên Liệu tại CPV Food Bình Phước;Nam / Nữ, tốt nghiệp trung cấp, cao đẳng, đại học, sau đại học khối ngành Công nghệ thực phẩm, Sinh học, Hóa Học;Riêng R&D cần ứng viên thành thạo tiếng anh vì sẽ phỏng vấn và làm việc bằng tiếng anh;Ưu tiên: ứng viên có kiến thức về các tiêu chuẩn GMP, ISO 9001, ISO 22000, HACCP.',N'Đã Duyệt'),
('BD050', N'Nhân Viên Phòng Thí Nghiệm - Công Nghệ Sinh Học', 'DN050', 'L027', N'Cập nhật quy trình, các tiêu chuẩn mới, phương pháp thử nghiệm mới. Tham gia xây dựng hồ sơ theo BRC và ISO 17025.Vận hành thiết bị phòng Lab (Nồi hấp khử trùng, micropipet, máy dập mẫu,...).Kiểm tra vi sinh trong thực phẩm. Thực hiện lấy mẫu vi sinh, phân tích và giải thích kết quả kiểm tra.Phân loại, lưu trữ và quản lý hồ sơ.Duy trì khu vực làm việc sạch sẽ và hợp vệ sinh.Theo dõi vật tư kiểm nghiệm vi sinh, đặt mua vật tư vi sinh.Thực hiện các nhiệm vụ liên qun khác khi cần thiết hoặc theo chỉ dẫn của cấp trên.',N'', N'Nhân Viên',N'1 năm', N'24 tuổi trở lên', N'Thoả thuận', '31-10-2023', N'Số lượng: 01 người.Kinh nghiệm làm việc: 1 - 3 năm.Hiểu rõ kiến thức về BRC.Siêng năng, nhanh nhẹn, hòa đồng.Báo cáo, thảo luận, liên hệ kịp thời cho người quản lý trong khi làm việc.',N'Đã Duyệt'),
('BD051', N'Quản Lý Cửa Hàng - Columbia Lotte Liễu Giai (Đi Làm Ngay)', 'DN051', 'L028', N'Thực hiện theo kế hoạch doanh số cửa hàng đã được giao.Hoàn thành các phân tích hàng tuần về hiệu suất bán hàng và các vấn đề liên quan.Hiểu rõ và theo đuổi các chỉ số KPI.Nắm vững và Phổ biến các chương trình khuyến mãi cho toàn bộ nhân viên cửa hàng sau khi nhận được thông báo từ cấp trên.Đảm bảo tất cả các hoạt động marketing, khuyến mãi được thực hiện theo như thông báo của Quản Lý Nhãn Hàng hoặc bộ phận Marketing,...',N'Thu nhập vô cùng hấp dẫn: Lương cứng + Phụ cấp + Thưởng doanh số.Thử việc 02 tháng hướng 100% lương.Chế độ BHXH đầy đủ, đóng BHXH full lương trong tháng làm việc đầu tiên.Bảo hiểm sức khỏe, bảo hiểm tai nạn 24/24.Đào tạo đầy đủ, cơ hội thăng tiến cao', N'Quản Lý ',N'2 năm', N'22 tuổi trở lên', N'9 - 15 triệu', '1-11-2023', N'Ít nhất 1 năm kinh nghiệm quản lý cửa hàng bán lẻ, ưu tiên nếu ứng viên có kinh nghiệm làm việc trong ngành bán lẻ Thời trang, Giày, Quần Áo, Thể Thao.Kỹ năng giao tiếp khéo léo, kĩ năng xử lý tình huống, quản lý nhân viên.Đam mê và có kiến thức về Thể Thao, Bán Lẻ, Giày, Quần Áo, thời trang.Ngoại hình ưa nhìn, năng động, nhanh nhẹn.Giao tiếp Tiếng Anh cơ bản.',N'Đã Duyệt'),
('BD052', N'Nhân Viên Bán Hàng Tại Cửa Hàng Thời Trang', 'DN052', 'L028', N'Thực hiện các bước trong quy trình bán hàng, giới thiệu và tư vấn cho khách hàng tại cửa hàng.Thuyết phục khách hàng đi đến chốt đơn.Thường xuyên kiểm tra cửa hàng, chăm chút hàng hoá.Soạn đơn, theo dõi đơn hàng. Sắp xếp trưng bày dọn dẹp cửa hàng.Xử lý các vấn đề của khách hàng.Hỗ trợ và phối hợp các Team khác làm việc.Kiểm kho và báo cáo cùng Cửa hàng trưởng.Địa điểm phỏng vấn: 45 Đinh Tiên Hoàng, Phường Bến Nghế, Quận 1, Thành Phố Hồ Chí Minh.',N'Lương cứng: 5.500.000.Tổng thu nhập = lương cứng + thưởng % doanh số từ 7.000.000 - 12.000.000.12 ngày nghỉ phép/ năm.Đóng BHXH, BHYT, BHTN theo quy định của nhà nước; lương tháng 13.', N'Nhân Viên Bán Hàng',N'Dưới 1 năm', N'22 tuổi trở lên', N'7 - 8 triệu', '1-11-2023', N'Tốt nghiệp từ trung cấp trở lên.Có ý định làm việc nghiêm túc và lâu dài ít nhất 6 tháng.Thân thiện, bình tĩnh xử lý các tình huống chuyên nghiệp với khách hàng.Năng động, nhiệt tình, có trách nhiệm trong công việc.Lý lịch rõ ràng.Trung thực, tuân thủ nội quy, nhiệt tình với công việc.Có thể sử dụng máy tính, smartphone.',N'Đã Duyệt'),
('BD053', N'Quản Lý Cửa Hàng', 'DN053', 'L029', N'Đảm bảo đầy đủ về hàng hóa phục vụ kinh doanh tại cửa hàng kinh.Đảm bảo về mặt hình ảnh theo quy chuẩn tại cửa hàng.Thực hiện các công việc khác thuộc phạm vi thẩm quyền giải quyết của quản lý cửa hàng cũng như yêu cầu từ cấp trên.Quản lý nhân viên cửa hàng, sắp xếp thời gian làm việc cho nhân viên bán hàng, thu ngân,...',N'Được tham gia đóng BHXH, BHYT và các phúc lợi khác theo quy định của công ty sau khi hoàn thành thời gian thử việc.Có nhiều cơ hội thăng tiến trong công việc.Thời gian đi làm linh hoạt.Thưởng phụ cấp quản lý.Hỗ trợ tiền ăn trưa.Thưởng doanh số bán hàng.', N'Quản Lý Cửa Hàng',N'1 năm', N'22 - 40 tuổi', N'9 - 12 triệu', '2-11-2023', N'Tốt nghiệp Trung cấp/Cao đẳng/Đại học.Tối thiểu 1 năm kinh nghiệm quản lý kinh doanh bán lẻ/dịch vụ khách hàng, ...Sử dụng cơ bản MS. Office.Kỹ năng giao tiếp, đàm phán, giải quyết khiếu nại.Kỹ năng làm việc nhóm, huấn luyện, động viên nhân viên.Nhiệt tình, trung thực, có tinh thần chịu trách nhiệm.Có chí cầu tiến và chịu áp lực công việc tốt.Có kinh nghiệm ở các chuỗi bán lẻ tương tự  là một lợi thế.',N'Đã Duyệt'),
('BD054', N'Trưởng Phòng Marketing / Marketing Manager Tại Hà Nội ', 'DN054', 'L030', N'Quản lý điều hành:Trình, cố vấn BQT công ty, thực hiện các kế hoạch marketing tổng thể theo năm/ quý/ tháng.Quản lý các bộ phận sale và marketing đảm bảo đạt KPI cho từng bộ phận online: bộ phận sàn thương mại điện tử, bộ phận facebook, bộ phận tiktok, offline: bán buôn và GT.Có kinh nghiệm chuyên môn về digital marketing đặc biệt trong các hoạt động sau: quản lý và chạy quảng cáo facebook, tối ưu quảng cáo facebook; quản lý các hoạt động thương mại điện tử trên sàn shopee, tiki, lazada: chạy quảng cáo, đăng ký các camp, tối ưu quảng cáo, duy trì điểm trên sàn cao; bố trí nhân sự cho livestream, sản xuất video có tính hiệu quả cao, kết nối hỗ trợ từ tiktokshop, làm việc với các kols, các camp live của koc trên tiktok...; tối ưu SEO trên website, hiểu các hoạt động google adw, google atl, ...; xây dựng video và phát triển kênh youtube,...',N'Được tham gia đóng BHXH, BHYT và các phúc lợi khác theo quy định của công ty sau khi hoàn thành thời gian thử việc.Có nhiều cơ hội thăng tiến trong công việc.Thời gian đi làm linh hoạt.Thưởng phụ cấp quản lý.Hỗ trợ tiền ăn trưa.Thưởng doanh số bán hàng.', N'Marketing Manager',N'3 năm', N'22 - 40 tuổi', N'Trên 20 triệu', '2-11-2023', N'Tốt nghiệp Trung cấp/Cao đẳng/Đại học.Tối thiểu 1 năm kinh nghiệm quản lý kinh doanh bán lẻ/dịch vụ khách hàng, ...Sử dụng cơ bản MS. Office.Kỹ năng giao tiếp, đàm phán, giải quyết khiếu nại,...',N'Đã Duyệt'),
('BD055', N'Kỹ Thuật Nhiệt Lạnh', 'DN055', 'L031', N'Thi công lắp đặt hệ thống lạnh.Lắp đặt hệ thống điện điều khiển, điện công nghiệp.Đi công trình, bàn giao, bảo hành máy móc theo điều động.Các công việc khác khi được yêu cầu.',N'Mức Lương: 7-9tr/ Gross.Xét duyệt tăng lương tùy vào năng lực không phụ thuộc thời gian.Tham gia BHXH/ BHYT/ BHTN, Phép năm: đầy đủ theo quy định Luật Lao Động.Môi trường làm việc thân thiện, cởi mở.', N'Nhân Viên Kĩ Thuật',N'Không yêu cầu kinh nghiệm', N'18 tuổi trở lên', N'6 - 9 triệu', '3-11-2023', N'Tốt nghiệp cao đẳng hoặc trung cấp nghề chuyên ngành điện lạnh.Biết hàn đường ống, thử xì, cân gas, chỉnh van và các yêu cầu trong ngành lạnh công nghiệp khác.Biết lắp đặt tủ điện điều khiển, tủ điện động lực.Có sức khỏe tốt.Ưu tiên sinh sống tại Quận 12, Thủ Đức, Dĩ An, Thuận An.Trung thực.',N'Đã Duyệt'),
('BD056', N'Nhân Viên Quản Lý Tài Sản', 'DN056', 'L032', N'Theo dõi quản lý và thực hiện các nghiệp vụ liên quan đến tài sản, công cụ lao động, trang thiết bị văn phòng. Kiểm soát đề xuất, cấp phát tài sản, công cụ,...Kiểm tra, kiểm soát định kỳ, tổng hợp báo cáo, đánh giá tình hình sử dụng các tài sản, trang thiết bị, xem xét và lên kế hoạch bảo dưỡng, bảo trì, sửa chữa định kỳ,...Xây dựng kế hoạch kiểm kê tài sản định kỳ và triển khai thực hiện sau khi được phê duyệt, Phối hợp xử lý các vấn đề liên quan sau kiểm kê.Tham gia xây dựng quy chế, quy định quản lý tài sản của nhà trường.Thực hiện các công việc khác theo quy định của trưởng bộ phận.',N'Mức thu nhập: 8-10 triệu (có thể cao hơn, tùy thuộc vào năng lực).Thử việc: tối đa 2 tháng.Thưởng các dịp lễ tết, sinh nhật, 12 ngày phép/năm.Các quyền lợi khác thoe quy chế chi tiêu nội bộ của nhà trường', N'Nhân Viên Quản Lý',N'Không yêu cầu kinh nghiệm', N'22 tuổi trở lên', N'8 - 10 triệu', '4-11-2023', N'Tốt nghiệp CĐ, ĐH, ưu tiên các khối ngành kỹ thuật, CNTT.Thành thạo tin học văn phòng.Có kinh nghiệm ở vị trí tương đương ít nhất 1 năm',N'Đã Duyệt'),
('BD057', N'Chuyên Viên Vận Hành Quản Lý Tài Sản', 'DN057', 'L032', N'Lập kế hoạch & đề xuất để đảm bảo các hợp đồng, hàng hoá, ấn phẩm thường xuyên phục vụ hoạt động kinh doanh theo định kỳ hàng tháng/ hàng quý;Theo dõi & đôn đốc tiến độ cấp phát hợp đồng, hàng hóa, ấn phẩm của Đối tác/ Công ty thành viên;Lên hồ sơ & hoàn thiện hồ sơ mua bán hàng hóa, ấn phẩm với các Đối tác/ Công ty thành viên;Theo dõi việc sử dụng hợp đồng, hàng hóa, ấn phẩm của các P. Kinh doanh,...',N'Mức lương thỏa thuận theo năng lực (13 tháng lương + thưởng hiệu quả công việc).Chế độ đãi ngộ hấp dẫn cạnh tranh: hỗ trợ cơm trưa, gửi xe, free cafe, daily food, ...Được Công ty mua Bảo hiểm sức khỏe cao cấp.Được tham gia các chương trình teambuilding, nghỉ mát, ... thường niên.Môi trường làm việc cởi mở, trẻ trung, nhiều cơ hội thăng tiến trong công việc.Làm việc tại Văn phòng Hạng A.', N'Nhân Viên Quản Lý',N'2 năm', N'24 tuổi trở lên', N'Thoả thuận', '4-11-2023', N'Chủ động, nhanh nhẹn, linh hoạt & có tinh thần trách nhiệm.Tỉ mỉ, cẩn thận, chi tiết.Thành thạo Microsoft Office, Google sheet,..Có ít nhất 01 năm kinh nghiệm làm việc, có kinh nghiệm làm việc ở vị trí tương tự là một lợi thế.',N'Đã Duyệt'),
('BD058', N'Kỹ Sư Khoa Học Dữ Liệu ( Data Scientist )', 'DN058', 'L033', N'Tham gia dự án thực tế về Data science, AI, Machine Learning trong lĩnh vực tài chính, viễn thông, ngân hàng, bảo hiểm, v.v..Tham gia các dự án phân tích dữ liệu & hành vi người dùng trên hệ thống để hiểu được insight.Nghiên cứu các mô hình ML & DL cơ bản áp dụng cho các bài toán trong lĩnh vực tài chính, viễn thông, ngân hàng, bảo hiểm v.v..',N'Nhân viên lương cứng 8 - 12 triệu theo năng lực.Sau khi ký hợp đồng chính thức sẽ được hưởng chế độ thưởng theo quy định Công ty.Nghỉ phép 12 ngày/năm, nghỉ ốm/nghỉ chế độ thai sản/hiếu hỉ... theo quy định pháp luật lao động, bảo hiểm xã hội.Review đánh giá công việc 2 lần/ năm,...', N'Nhân viên',N'Dưới 1 năm', N'23 tuổi trở lên', N'8 - 12 triệu', '5-11-2023', N'Trình độ đại học trở lên, học chuyên ngành công nghệ thông tin, hệ thống thông tin hoặc các chuyên ngành liên quan tại các trường Đại học Công Nghệ, Đại học Công Nghiệp, Học viện Bưu chính viễn thông, Đại học Bách Khoa v,v...Biết sử dụng các công cụ Tableau; ngôn ngữ truy vấn SQL, Python ...Có kiến thức cơ bản về các mô hình học máy.Có kĩ năng làm việc nhóm và độc lập.Nhanh nhẹn, ham học hỏi, chủ động, thẳng thắn và có tinh thần trách nhiệm cao.',N'Đã Duyệt'),
('BD059', N'Chuyên Viên Khoa Học Dữ Liệu ( Data Scientist )', 'DN059', 'L033', N'Khai thác, thu thập, tổng hợp và xử lý thông tin, dữ liệu tài chính, kinh doanh.Xử lý, tổng hợp, phân tích Dữ liệu.Xây dựng các báo cáo phân tích theo chuyên đề.Thực hiện các nhiệm vụ và trách nhiệm khác do Lãnh đạo phân công.',N'Môi trường làm việc chuyên nghiệp, cơ sở vật chất đầy đủ,được làm việc với các chuyên gia, đồng nghiệp có kinh nghiệm lâu năm,được đào tạo bài bản.Được hưởng mức lương cạnh tranh so với thị trường,được BIDV đóng BHYT, BHXH theo Luật Lao động,...', N'Nhân viên',N'2 năm', N'24 tuổi trở lên', N'Thoả thuận', '5-11-2023', N'Tốt nghiệp đại học, ưu tiên các chuyên ngành kinh tế, khoa học dữ liệu, quản lý thông tin.Hiểu về các mô hình phân tích dữ liệu (sẽ được đào tạo thêm).Có định hướng nghề nghiệp rõ ràng, năng động, chủ động, sáng tạo.Có tinh thần học hỏi, cầu tiến trong công việc, nâng cao kỹ năng chuyên môn.',N'Đã Duyệt'),
('BD060', N'Leader - Trưởng Nhóm Kênh Thương Mại Điện Tử (Thương Hiệu Hana Pet)', 'DN060', 'L034', N'Quản lý các kênh bán lẻ của ngành hàng trên các kênh thương mại điện tử (facebook, shopee, tiktok shop, lazada).Theo dõi và quản lý số liệu trực tuyến hàng ngày, đo lường hiệu quả của các chiến dịch và đề xuất các quyết định dựa trên dữ liệu. Xác định các vấn đề cần cải thiện và tối ưu hóa trong tiếp thị và bán hàng.Theo dõi tiến độ hàng hóa và lên kế hoạch đặt hàng với nhà cung cấp.Kết hợp với bộ phận khác như team sale đại lý, team kho để đảm bảo vận hành suôn sẻ và hỗ trợ các sáng kiến ​​tăng trưởng,...',N'Mức lương: cạnh tranh với thị trường.Lương tháng 13, thưởng tùy theo tình hình kinh doanh của công ty.Được nghỉ lễ tết theo quy định của nhà nước.Làm việc trong môi trường năng động, đồng nghiệp trẻ và luôn hỗ trợ nhau.Được hưởng discount riêng cho nhân viên', N'Trưởng nhóm',N'1 năm', N'22 tuổi trở lên', N'Thoả thuận', '5-11-2023', N'Ưu tiên ứng viên tốt nghiệp đại học chuyên ngành Kinh tế, Thương mại, Quản trị kinh doanh, Marketing và có kinh nghiệm quản lý Facebook fanpage, Shopee, Tiktok Shop... một năm trở lên.Có khả năng giao tiếp và làm việc bằng tiếng Anh tốt.Nhanh nhẹn, tự tin, giao tiếp tốt, có kỹ năng lãnh đạo, đàm phán, thuyết phục khách hàng, xử lý vấn đề linh hoạt.Đam mê kinh doanh, có khả năng làm việc độc lập.Chăm chỉ, có tinh thần cầu thị và học hỏi.Giờ làm việc linh hoạt, trao đổi cụ thể khi phỏng vấn.',N'Đã Duyệt')
GO
Select * From BAIDANG

--Duyet
INSERT INTO Duyet VALUES
('BD001','AD001','11-10-2023'),
('BD002','AD001','11-10-2023'),
('BD003','AD002','12-10-2023'),
('BD004','AD002','12-10-2023'),
('BD005','AD003','13-10-2023'),
('BD006','AD003','13-10-2023'),
('BD007','AD001','14-10-2023'),
('BD008','AD001','14-10-2023'),
('BD009','AD001','15-10-2023'),
('BD010','AD001','15-10-2023'),
('BD011','AD002','16-10-2023'),
('BD012','AD002','16-10-2023'),
('BD013','AD003','17-10-2023'),
('BD014','AD003','17-10-2023'),
('BD015','AD002','18-10-2023'),
('BD016','AD002','18-10-2023'),
('BD017','AD001','19-10-2023'),
('BD018','AD001','19-10-2023'),
('BD019','AD001','20-10-2023'),
('BD020','AD001','20-10-2023'),
('BD021','AD003','21-10-2023'),
('BD022','AD003','21-10-2023'),
('BD023','AD002','21-10-2023'),
('BD024','AD002','21-10-2023'),
('BD025','AD001','22-10-2023'),
('BD026','AD001','22-10-2023'),
('BD027','AD001','23-10-2023'),
('BD028','AD001','23-10-2023'),
('BD029','AD003','25-10-2023'),
('BD030','AD003','25-10-2023'),
('BD031','AD003','25-10-2023'),
('BD032','AD003','25-10-2023'),
('BD033','AD003','26-10-2023'),
('BD034','AD003','26-10-2023'),
('BD035','AD003','26-10-2023'),
('BD036','AD002','27-10-2023'),
('BD037','AD002','27-10-2023'),
('BD038','AD002','27-10-2023'),
('BD039','AD002','28-10-2023'),
('BD040','AD002','28-10-2023'),
('BD041','AD001','29-10-2023'),
('BD042','AD001','29-10-2023'),
('BD043','AD001','30-10-2023'),
('BD044','AD001','30-10-2023'),
('BD045','AD001','31-10-2023'),
('BD046','AD003','31-10-2023'),
('BD047','AD003','31-10-2023'),
('BD048','AD003','1-11-2023'),
('BD049','AD003','1-11-2023'),
('BD050','AD003','1-11-2023'),
('BD051','AD002','2-11-2023'),
('BD052','AD002','2-11-2023'),
('BD053','AD002','3-11-2023'),
('BD054','AD002','3-11-2023'),
('BD055','AD002','4-11-2023'),
('BD056','AD001','5-11-2023'),
('BD057','AD001','5-11-2023'),
('BD058','AD001','6-11-2023'),
('BD059','AD001','6-11-2023'),
('BD060','AD001','6-11-2023')




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
