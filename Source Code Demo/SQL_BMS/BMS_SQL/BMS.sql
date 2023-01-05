CREATE DATABASE BMS
GO

USE BMS
GO


CREATE TABLE Carousels
(
	CarouselId Int Identity(1,1) PRIMARY KEY,
	Caption nvarchar(Max),
	Text nvarchar(Max),
	Img nvarchar(Max),
	Link nvarchar(Max)
)
GO

CREATE TABLE Categories
(
	CategoryId int Identity(1,1) PRIMARY KEY,
	CategoryName nvarchar(255),
)
GO

CREATE TABLE HotProducts
(
	HotProductId int Identity(1,1) PRIMARY KEY,
	HotProductName nvarchar(255),
	CategoryId int,
	HPPrice float,
	HPAvatar nvarchar(255),
	HPDescription ntext,
	HPInStocks int,
	img1 nvarchar(255),
	CONSTRAINT FK_CategoryId FOREIGN KEY(CategoryId)
		REFERENCES Categories(CategoryId)
)
GO

CREATE TABLE Products
(
	ProductId int Identity(1,1) PRIMARY KEY,
	ProductName nvarchar(255),
	CategoryId int,
	Price float,
	Avatar nvarchar(255),
	Description ntext,
	InStocks int,
	CONSTRAINT FK_CategoryId_Products FOREIGN KEY(CategoryId)
		REFERENCES Categories(CategoryId),
	img1 nvarchar(255),
)
GO

CREATE TABLE Brands
(
	BrandId int PRIMARY KEY,
	BrandName nvarchar(255),
	BrandDescription nvarchar(255),
	BrandImg nvarchar(255)
)
GO

CREATE TABLE NewsCategories
(
	NewCateId int Identity(1,1) PRIMARY KEY,
	NewCateName nvarchar(255),
)
GO

CREATE TABLE News
(
	NewId int Identity(1,1) PRIMARY KEY,
	NewTitle nvarchar(255),
	NewComment nvarchar(255),
	NewImg nvarchar(255),
	NewLink nvarchar(255),
	NewCategory int,
	NewCategoryName nvarchar(255),
	CONSTRAINT FK_News_CateID FOREIGN KEY(NewCategory)
		REFERENCES NewsCategories(NewCateId)
)
GO



CREATE TABLE CustomerReviews
(
	CustomerReviewId int Identity(1,1) PRIMARY KEY,
	CustomerName nvarchar(255),
	CustomerEmail nvarchar(255),
	CustomerPhone nvarchar(255),
	DateReviews date,
	Star int,
	Content nvarchar(255),
)
GO

CREATE TABLE Founders
(
	FounderId int identity(1,1) PRIMARY KEY,
	FounderName nvarchar(255),
	FounderImg nvarchar(max),
	FounderComment nvarchar(max)
)
GO



CREATE TABLE Carts
(
	CartId int identity(1,1) PRIMARY KEY,
	ProductId int,
	ProductName nvarchar(255),
	Avatar nvarchar(255),
	Price float,
	Size int,
	Quantity int,
	UserName nvarchar(255),
)

CREATE TABLE Bills
(
	BillId int identity(1,1) PRIMARY KEY,
	CustomerName nvarchar(Max),
	UserName nvarchar(255),
	Phone nvarchar(255),
	Address nvarchar(Max),
	DayOrder datetime DEFAULT (getdate()),
	Total float,
	Status nvarchar(Max),
	Description nvarchar(Max)
)


CREATE TABLE CartDetails
(
	CartDetailId int identity(1,1) PRIMARY KEY,
	ProductName nvarchar(255),
	Avatar nvarchar(255),
	Size int,
	Quantity int,
	Price float,
	BillId int,
	ProductId int,
	CONSTRAINT FK_BillId FOREIGN KEY(BillId)
		REFERENCES Bills(BillId),
	CONSTRAINT FK_ProductId FOREIGN KEY(ProductId)
		REFERENCES Products(ProductId)
)
--CREATE TABLE ProductReviews
CREATE TABLE ProductReviews
(
	ProductReviewId int identity(1,1) PRIMARY KEY,
	CustomerName nvarchar(255),
	Star int,
	Content nvarchar(Max),
	ProductId int,
	CONSTRAINT FK_ProductReviews_ProductId FOREIGN KEY(ProductId)
		REFERENCES Products(ProductId)
)

CREATE TABLE Users
(
	USerId int identity(1,1) PRIMARY KEY,
	UserName nvarchar(255),
	Password nvarchar(255),
	FullName nvarchar(255),
	Email nvarchar(255),
	Phone nvarchar(255),
	Address nvarchar(Max),
	Avatar nvarchar(Max),
	DayCreated datetime DEFAULT (getdate()),
)

CREATE TABLE Charts
(
	ChartId int identity(1,1) PRIMARY KEY,
	ChartMonth nvarchar(255),
	ChartSumOfBill int,
)

CREATE TABLE MoneyCharts
(
	MoneyChartId int identity(1,1) PRIMARY KEY,
	MoneyChartMonth nvarchar(255),
	ChartSumOfMoney int,
)

CREATE TABLE UserCharts
(
	UserChartId int identity(1,1) PRIMARY KEY,
	UserChartMonth nvarchar(255),
	ChartSumOfUser int,
)



--carousel
Insert Into Carousels (Caption, Text, Img, Link)
Values(N'Mang lại giải pháp tốt nhất cho ngôi nhà của bạn',N'Chuyên cung cấp Vật liệu Xây dựng và Vật liệu Trang trí Nội - Ngoại thất uy tín chuyên nghiệp hàng đầu tại khu vực Đà Nẵng, Hội An, Tam Kỳ, Quảng Nam, Quảng Ngãi, Quy Nhơn và các tỉnh Miền Trung, Tây Nguyên...','https://bizweb.dktcdn.net/100/387/417/themes/765499/assets/slider_1.jpg?1664793449068', 'https://vatlieuxaydung24h.vn/gach-block-lat-via-he')
Insert Into Carousels (Caption, Text, Img, Link)
Values(N'Đa dạng các loại hình sản phẩm',N'Sản xuất và phân phối từ Gạch, cát, đá, xi măng, sắt, thép, ống nước và phụ kiện ống nước, bồn nước, bình nước nóng, máy năng lượng lặt trời, gạch men, gạch đá trang trí, thiết bị vệ sinh, sen vòi rửa, sơn, vật liệu chống thấm, gạch block, ngói lợp, tấm lợp, thiết bị xây dựng, dụng cụ thi công, thanh kèo thép nhẹ BlueScope, thiết bị hồ bơi, xông hơi, Spa…','https://bizweb.dktcdn.net/100/387/417/themes/765499/assets/slider_2.jpg?1664793449068', 'https://vatlieuxaydung24h.vn/may-xong-hoi')
Insert Into Carousels (Caption, Text, Img, Link)
Values(N'Nguồn nhân lực hàng đầu',N'Sáng lập bởi các cổ đông có nhiều năm kinh nghiệm trong lĩnh vực thiết kế kiến trúc, thi công xây dựng và cung cấp VLXD & TT NNT hàng đầu tại Đà Nẵng, Hội An, Quảng Nam, Quy Nhơn và các tỉnh thành khu vực Miền Trung, Tây Nguyên.','https://bizweb.dktcdn.net/100/387/417/themes/765499/assets/slider_3.jpg?1664793449068', 'https://vatlieuxaydung24h.vn/ngoi-lop-nha')
Insert Into Carousels (Caption, Text, Img, Link)
Values(N'Chiến lược trở thành cửa hàng hàng đầu trong lĩnh vực Phân phối Sỉ & Lẻ các loại vật liệu xây dựng và Trang trí Nội ngoại thất, thi công hoàn thiện công trình dân dụng và công nghiệp',N'Đặt mục tiêu lấy chất lượng, tiến độ, sự hài lòng của khách hàng làm nền tảng cho sự phát triển.','https://bizweb.dktcdn.net/100/387/417/themes/765499/assets/slider_4.jpg?1664793449068', 'https://vatlieuxaydung24h.vn/nha-may-san-xuat-gach-bong-gio-my-thuat-danatiles')
Insert Into Carousels (Caption, Text, Img, Link)
Values(N'Đáp ứng đầy đủ nhu cầu của khách hàng',N'Đội ngũ kỹ sư, công nhân của cửa hàng luôn năng động, chuyên nghiệp sẽ làm thoả mãn tất cả những khách hàng khó tính nhất và được các chủ đầu tư đánh giá cao.','https://bizweb.dktcdn.net/100/387/417/themes/765499/assets/slider_5.jpg?1664793449068', 'https://vatlieuxaydung24h.vn/nha-thau-tu-van-thiet-ke-thi-cong-xay-dung-ho-boi-be-boi')


--categories
Insert Into Categories(CategoryName)
values (N'Gạch trang trí')
Insert Into Categories(CategoryName)
values (N'Vật liệu thô')
Insert Into Categories(CategoryName)
values (N'Thiết bị ngành nước')
Insert Into Categories(CategoryName)
values (N'Ngói lợp nhà')
select * from HotProducts



--hot products
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Gạch men lát nền giả gỗ GR05 150x800',1, 500000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-men-gia-go-gr-15805-150x800.jpg?v=1664867655653', N'Với nhiều năm kinh nghiệm trong lĩnh vực phân phối các loại gạch men, gạch granite bóng kinh, gạch porcelain, gạch trang trí, gạch lát nền, thiết bị vệ sinh, phòng tắm... Công ty Hưng Gia Bình cam kết sẽ mang đến cho Quý khách hàng những sản phẩm gạch ốp lát và thiết bị phòng tắm, spa chuyên nghiệp, hàng chất lượng với giá cạnh tranh nhất.',7,'https://bizweb.dktcdn.net/100/387/417/products/gach-men-gia-go-gr-15805-150x800.jpg?v=1664867655653')
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Gạch Inax 255/VIZ-10',1, 525000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1455345gach-inax-255-viz-10-jpeg.jpg?v=1595666790067', N'Gạch inax 255/VIZ-10 khi thi công ốp gạch theo chiều ngang hay theo chiều dọc, gạch mosaic ngoại thất 225/viz này đều đem đến sức cuốn hút cho công trình với các họa tiết lượn sóng và vẻ ngoài gồ ghề, đẹp tự nhiên.Dòng Gạch 225/VIZ sử dụng công nghệ MicroGuard, là kỹ thuật mới nhất của Công ty gạch Inax với khả năng chống bám bẩn và tự làm sạch cao.',10,'https://media.bizwebmedia.net/sites/55916/data/Upload/2016/11/gach_inax_255_viz_10.jpg')
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Gỗ lát sân vườn B12 nâu đen',1, 85000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5616157thanh-gia-go-b12-den-jpeg.jpg?v=1595666821417', N'Gỗ lát sân vườn B12 Vĩnh Cửu còn được gọi là Thanh giả gỗ lát nền sân vườn B12. Sản phẩm có 2 tông màu chính là màu đen và màu nâu đất, với kích thước chuẩn 600x220x40 mm, độ dày 4cm được làm từ chất liệu bê tông xi măng cốt liệu... Đây là loại gạch lát nền sân vườn thường được sử dụng để thi công ốp lát trang trí sân vườn, ốp tường trang trí, tạo điểm nhấn cho sân vườn, lát lối đi công viên, bãi đậu xe, khu vui chơi công cộng...',19,'https://media.bizwebmedia.net/sites/55916/data/Upload/2017/2/go_lat_nen_san_vuon_b12_den.jpg')
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Gạch ống Đại Hưng 6 lỗ nhỏ',2, 1500,'https://media.bizwebmedia.net/sites/55916/data/Upload/2016/11/gach_ong_6_lo_nho_dai_hung.jpg', N'Gạch ống 6 lỗ nhỏ Đại Hưng 75x115x175 mm là loại gạch xây dựng được làm bằng gốm đất sét nung chất lượng cao tại xã Đại Đồng, huyện Đại Lộc, tỉnh Quảng Nam. Gạch Đại Hưng được sản xuất trên dây chuyền thiết bị hiện đại và công nghệ tiên tiến hàng đầu của Châu Âu.',21,'https://media.bizwebmedia.net/sites/55916/data/Upload/2016/11/gach_ong_6_lo_nho_dai_hung.jpg')
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Đá chẻ viên xây móng',2, 11600,'https://media.bizwebmedia.net/sites/55916/data/Upload/2016/3/da_che_vien_xay_mong.jpg', N'Công ty TNHH Vật Liệu Xây Dựng Hưng Gia Bình chúng tôi tự hào là nhà phân phối các loại đá xây dựng cho các công trình dân dụng và công nghiệp tại Đà Nẵng, hội An, Tam Kỳ, Quảng Nam như đá 1x2, đá 4x6, đá hộc, đá mi sàng, đá chẻ viên, bột đá, ...',2,'https://media.bizwebmedia.net/sites/55916/data/Upload/2016/3/da_che_vien_xay_mong.jpg')
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Xi măng trắng SCG Thái Lan PCW50',2, 265000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0636500xi-mang-trang-scg-thai-lan-pcw-50-jpeg.jpg?v=1595666985817', N'Xi măng trắng SCG Thái Lan PCW 50.I là loại Xi măng Trắng Portland. Do đó, sản phẩm này dùng cho các công trình có độ bền chắc cao. Loại xi măng trắng này có thể được sử dụng trên sàn và tường nhà, các vật liệu trang trí đúc sẵn và các công trình kết cấu. Với độ trắng nổi bật, Xi măng trắng SCG PCW50 này có thể hoàn thiện trí tưởng tượng của bạn trên tất cả các loại bề mặt trang trí như Gạch đá mài, Bột trét, Sản phẩm trang trí và Bê tông Kiến trúc đổ khuôn...',2,'https://media.bizwebmedia.net/sites/55916/data/Upload/2019/12/xi_mang_trang_scg_thai_lan_pcw_50_i.jpg')
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Bồn nước inox Tân Á Đại Thành 6000L',3, 16940000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2547397bon-nuoc-inox-tan-a-6000l-jpeg.jpg?v=1595666934033', N'Công ty Vật Liệu Xây Dựng Đà Nẵng | VLXD Hưng Gia Bình - Nhà phân phối bồn chứa nước Inox Tân Á Đại Thành, bồn chứa nước Toàn Mỹ, bồn nước Sơn Hà... uy tín chuyên nghiệp lớn nhất tại Đà Nẵng, Hội An, Quảng Nam và các tỉnh Miền Trung, Tây Nguyên.',90,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2547397bon-nuoc-inox-tan-a-6000l-jpeg.jpg?v=1595666934033')
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Máy nước nóng NLMT Tân Á GOLD 180L',3,5550000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0525170may-nuoc-nong-nlmt-tan-a-dai-thanh-jpeg.jpg?v=1595666751837', N'Công ty VLXD Hưng Gia Bình - Nhà phân phối chính thức và thi công lắp đặt máy nước nóng năng lượng mặt trời Tân Á Đại Thành tại Đà Nẵng, Hội An, Quảng Nam, Quảng Ngãi, Huế, Quảng Trị... với 3 dòng sản phẩm chính là máy nước nóng NLMT SILVER, máy nước nóng NLMT GOLD và máy nước nóng NLMT DIAMOND...Sản phẩm máy nước nóng năng lượng mặt trời Tân Á GOLD 180L là dòng sản phẩm máy nước nóng rất được ưa chuộng và bán chạy nhất trên thị trường hiện nay, phù hợp với nhu cầu sử dụng và kính tế của đa số hộ tiêu dùng trên thị trường hiện nay.',20,'https://media.bizwebmedia.net/sites/55916/data/Upload/2016/8/may_nuoc_nong_nang_luong_mat_troi_ta_a_180l.jpg')
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Thép cuộn Việt Hàn',3, 40000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2550748thep-cuon-viet-han-jpeg.jpg?v=1595666322233', N'Thép cuộn tròn của VPS được sản xuất theo tiêu chuẩn JIS G3505 (Nhật Bản) và tiêu chuẩn TCVN 1651 – 1985 (Việt Nam), kích cỡ của Thép cuộn tròn Việt Hàn gồm có: Φ5.5, Φ6, Φ8 và Φ10.Thép cuộn tròn Việt Hàn được sản xuất bằng dây chuyền 24 giá cán hoàn toàn tự động của Italia với tốc độ 60m/s và làm nguội trực tiếp bằng nước với áp lực lớn nên thép tròn cuộn của VPS có tiết diện tròn đều, bề mặt nhẵn bóng và có khả năng chống ôxy hoá.',89,'https://media.bizwebmedia.net/Sites/55916/Data/upload/2014/3/thep-cuon-viet-han.jpg')


--Products
--Gạch trang trí
Insert Into Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch men lát nền giả gỗ GR05 150x800',1, 185000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-men-gia-go-gr-15805-150x800.jpg?v=1664867655653', N'Với nhiều năm kinh nghiệm trong lĩnh vực phân phối các loại gạch men, gạch granite bóng kinh, gạch porcelain, gạch trang trí, gạch lát nền, thiết bị vệ sinh, phòng tắm... Công ty Hưng Gia Bình cam kết sẽ mang đến cho Quý khách hàng những sản phẩm gạch ốp lát và thiết bị phòng tắm, spa chuyên nghiệp, hàng chất lượng với giá cạnh tranh nhất.',10,'https://bizweb.dktcdn.net/100/387/417/products/gach-men-gia-go-gr-15805-150x800.jpg?v=1664867655653')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch lát nền giả gỗ GR01 150x800',1, 180000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-lat-nen-gia-go-gr-15801-150x800.jpg?v=1664867182237', N'Với nhiều năm kinh nghiệm trong lĩnh vực phân phối các loại gạch men, gạch granite bóng kinh, gạch porcelain, gạch trang trí, gạch lát nền, thiết bị vệ sinh, phòng tắm... Công ty Hưng Gia Bình cam kết sẽ mang đến cho Quý khách hàng những sản phẩm gạch ốp lát và thiết bị phòng tắm, spa chuyên nghiệp, hàng chất lượng với giá cạnh tranh nhất.',10,'https://bizweb.dktcdn.net/100/387/417/products/gach-men-gia-go-gr-15805-150x800.jpg?v=1664867655653')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch men giả đá granite trắng GL 19602',1, 125000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-men-gia-da-granite-trang-gl-19602.jpg?v=1646380587090', N'Hưng Gia Bình - Nhà phân phối Gạch men giả đá granite trắng Glory GL 19602 và gạch men lát nền giá tốt nhất tại Đà Nẵng, Hội An, Quảng Nam... Giao hàng tận nơi với mọi số lượng',10,'https://bizweb.dktcdn.net/100/387/417/products/gach-men-gia-da-granite-trang-gl-19602.jpg?v=1646380587090')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch bông gió DanaTiles D06 màu trắng',1, 20000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-bong-gio-danatiles-d06-trang.jpg?v=1641541427627', N'Hưng Gia Bình - Nhà sản xuất và phân phối gạch bông gió DanaTiles D06 màu trắng tại Đà Nẵng, Hội An và Miền Trung, Tây Nguyên... Sản phẩm gạch DanaTiles đẹp, sắc nét - Giá tốt nhất - Giao hàng tận nơi với mọi số lượng.',10,'https://bizweb.dktcdn.net/100/387/417/products/gach-men-gia-da-granite-trang-gl-19602.jpg?v=1646380587090')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch bông gió DanaTiles D013 màu trắng',1, 20000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-bong-gio-danatiles-d-013-mau-trang.jpg?v=1640761896087', N'Hưng Gia Bình - Nhà phân phối gạch bông gió DanaTiles D013 màu trắng tại Đà Nẵng, Hội An, Quảng Nam và Miền Trung, Tây Nguyên... Sản phẩm gạch Dana Tiles luôn bền đẹp, sắc nét - Giá tốt - Giao hàng tận nơi với mọi số lượng.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-bong-gio-danatiles-d-013-mau-trang.jpg?v=1640761896087')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch Lamri ốp chân tường Prime 9109',1, 80000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-lamri-prime-9109.jpg?v=1640681354887', N'Hưng Gia Bình - Nhà phân phối Gạch lamri ốp chân tường Prime 9109 giá tốt nhất tại Đà Nẵng, Hội An, Quảng Nam... Giao hàng tận nơi với mọi số lượng.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-lamri-prime-9109.jpg?v=1640681354887')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch Porcelain Kim cương CMC KC89006',1, 290000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-porcelain-cmc-kc89006.jpg?v=1640668812197', N'Hưng Gia Bình - Nhà phân phối gạch CMC Porcelain kim cương siêu bóng KC89006, gạch men lát nền cao cấp tại Đà Nẵng, Hội An, Quảng Nam, Huế, Gia Lai, Kon Tum... Uy tín - Chuyên nghiệp - Tận tâm - Giao hàng tận nơi với mọi số lượng.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-porcelain-cmc-kc89006.jpg?v=1640668812197')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch Porcerlain kim cương CMC KC89004',1, 290000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-men-bong-kinh-cmc-kc8904.jpg?v=1640567623913', N'Hưng Gia Bình - Nhà phân phối gạch Porcelain men kim cương siêu bóng CMC VTH KC89004, gạch men lát nền cao cấp tại Đà Nẵng, Hội An, Quảng Nam, Huế, Gia Lai, Kon Tum... Uy tín - Chuyên nghiệp - Tận tâm - Giao hàng tận nơi với mọi số lượng.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-men-bong-kinh-cmc-kc8904.jpg?v=1640567623913')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch mosaic thủy tinh 48MT-058',1, 430000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-mosaic-48mt-058.jpg?v=1622265488697', N'Hưng Gia Bình - Nhà phân phối Gạch men giả đá granite trắng Glory GL 19602 và gạch men lát nền giá tốt nhất tại Đà Nẵng, Hội An, Quảng Nam... Giao hàng tận nơi với mọi số lượng',10,'https://bizweb.dktcdn.net/100/387/417/products/gach-men-gia-da-granite-trang-gl-19602.jpg?v=1646380587090')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch bông gió W',1, 125000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-bong-gio-w.jpg?v=16218281351900', N'Hưng Gia Bình - Nhà phân phối gạch bông gió đất nung W và gạch bông gió xi măng DanaTiles tại Đà Nẵng, Hội An và Miền Trung, Tây Nguyên... Sản phẩm đẹp, sắc nét đến từng chi tiết - Giá tốt - Giao hàng tận nơi với mọi số lượng..',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-bong-gio-w.jpg?v=1621828135190')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch mosaic đá tự nhiên MST-104',1, 950000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-mosaic-da-tu-nhien-mst-104.jpg?v=1621507979627', N'Hưng Gia Bình - Nhà phân phối gạch mosaic đá tự nhiên MST-104, gạch mosaic gốm sứ men rạng, gạch mosaic thủy tinh tại Đà Nẵng, Hội An, Quy Nhơn và các tỉnh Miền Trung, Tây Nguyên.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-mosaic-da-tu-nhien-mst-104.jpg?v=1621507979627')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch mosaic đá tự nhiên MST-103',1, 950000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-mosaic-da-tu-nhien-mst-103.jpg?v=1621507877997', N'Hưng Gia Bình - Nhà phân phối gạch mosaic đá tự nhiên, gốm sứ men rạng, gạch mosaic thủy tinh tại Đà Nẵng, Hội An, Quy Nhơn và các Tỉnh Miền Trung, Tây Nguyên.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-mosaic-da-tu-nhien-mst-103.jpg?v=1621507877997')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch bông gió DanaTiles D02 màu trắng',1, 20000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-bong-gio-danatiles-d02-trang.jpg?v=1602516146450', N'DanaTiles - Hưng Gia Bình - Nhà phân phối gạch bông gió DanaTiles D02 màu trắng tại Đà Nẵng, Hội An, Quy Nhơn và Miền Trung, Tây Nguyên... Sản phẩm đẹp, sắc nét - Giá tốt - Giao hàng tận nơi với mọi số lượng.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-bong-gio-danatiles-d02-trang.jpg?v=1602516146450')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch bông gió DanaTiles D01 màu trắng',1, 20000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-bong-gio-danatiles-d01-trang.jpg?v=1602417129827', N'Hưng Gia Bình - Nhà phân phối gạch bông gió DanaTiles D01 màu trắng tại Đà Nẵng, Hội An và Miền Trung, Tây Nguyên... Sản phẩm đẹp, sắc nét - Giá tốt - Giao hàng tận nơi với mọi số lượng.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-bong-gio-danatiles-d01-trang.jpg?v=1602417129827')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch bông gió Hoa cúc gốm 30x30 cm',1, 55000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-thong-gio-hoa-cuc-men-su.jpg?v=1598070855703', N'Gạch bông gió Hoa cúc gốm hay còn gọi là gạch thông gió Hoa cúc 30x30 là sản phẩm gạch gốm trang trí tráng men được nung nóng trong lò ở nhiệt cao nên có độ bền chắc, thích hợp với mọi mục đích sử dụng như trang trí chùa, chiền, nhà xây phong cách cổ, làm ô thông gió, trang trí tường, ô gió cửa sổ...',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-thong-gio-hoa-cuc-men-su.jpg?v=1598070855703')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch bông hoa văn tổng hợp BTH01',1, 420000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1742414gach-bong-hoa-van-tong-hop-bth01-jpeg.jpg?v=1595667020940', N'Công ty Hưng Gia Bình - Nhà phân phối vật liệu xây dựng trang trí nội và ngoại thất, gạch ốp tường, gạch lát sàn nhà…các loại gạch bông hoa văn cổ điển tại Đà Nẵng, Hội An, Quảng Nam và các tỉnh thành Miền Trung, Tây Nguyên.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1742414gach-bong-hoa-van-tong-hop-bth01-jpeg.jpg?v=1595667020940')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch bông trang trí BM03',1, 420000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5620279gach-bong-co-dien-trang-tri-bm03-jpeg.jpg?v=1595667019277', N'Công ty VLXD Hưng Gia Bình - Nhà phân phối vật liệu xây dựng, vật liệu trang trí nội và ngoại thất, gạch ốp tường, gạch lát sàn nhà…các loại gạch bông men tại Đà Nẵng, Hội An, Quảng Nam và các tỉnh thành khu vực Miền Trung, Tây Nguyên.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5620279gach-bong-co-dien-trang-tri-bm03-jpeg.jpg?v=1595667019277')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch bông trang trí BM02',1, 420000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4535079gach-bong-trang-tri-bm02-jpeg.jpg?v=1595667017387', N'Công ty TNHH Vật liệu Xây dựng Hưng Gia Bình - Nhà phân phối vật liệu xây dựng, vật liệu trang trí nội và ngoại thất, gạch ốp tường, gạch lát sàn nhà…các loại gạch bông trang trí tại Đà Nẵng, Hội An, Quảng Nam và các tỉnh thành khu vực Miền Trung, Tây Nguyên.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4535079gach-bong-trang-tri-bm02-jpeg.jpg?v=1595667017387')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch bông trang trí BM01',1, 420000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1934329gach-bong-trang-tri-bm01-jpeg.jpg?v=1595667015527', N'VLXD Hưng Gia Bình - Nhà phân phối vật liệu xây dựng, vật liệu trang trí nội và ngoại thất, gạch ốp tường, gạch lát sàn nhà… các loại gạch bông trang trí tại Đà Nẵng, Hội An, Quảng Nam và các tỉnh thành khu vực Miền Trung, Tây Nguyên.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1934329gach-bong-trang-tri-bm01-jpeg.jpg?v=1595667015527')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch cổ bìa 7x22 cm',1, 260000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0809234gach-co-bia-7x20-jpeg.jpg?v=1595666922173', N'Công ty Hưng Gia Bình - Nhà phân phối gạch cổ cắt ruột, gạch cổ cắt bìa 5x22 cm và gạch cổ bìa 7x22 cm tại Đà Nẵng, Hội An và các tỉnh Miền Trung, Tây Nguyên. Uy tín - Chuyên nghiệp - Tận tâm - Giao hàng tận nơi với mọi số lượng.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0809234gach-co-bia-7x20-jpeg.jpg?v=1595666922173')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch cổ cắt bìa 5x22 cm',1, 250000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/3313499gach-co-cat-bia-50x200-jpeg.jpg?v=1595666919633', N'Công ty Hưng Gia Bình - Nhà phân phối gạch cổ bìa 5x22 cm, gạch cổ cắt ruột 5x22 cm và gạch cổ bìa 7x22 cm tại Đà Nẵng, Hội An, Quy Nhơn và các tỉnh Miền Trung, Tây Nguyên. Uy tín - Chuyên nghiệp - Tận tâm - Giao hàng tận nơi với mọi số lượng.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/3313499gach-co-cat-bia-50x200-jpeg.jpg?v=1595666919633')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch Việt Nhật vân đá XMC-9921',1, 365000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2150777gach-viet-nhat-xmc-9921-jpeg.jpg?v=1595666894773', N'Công ty TNHH Vật Liệu Xây Dựng Hưng Gia Bình - Nhà phân phối gạch ốp lát trang trí, gạch Việt Nhật XMC-9921 tại Đà Nẵng, Hội An, Quảng Nam. Uy tín - Chuyên nghiệp - Tận tâm - Giao hàng tận nơi với mọi số lượng.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2150777gach-viet-nhat-xmc-9921-jpeg.jpg?v=1595666894773')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch mosaic mạ vàng MV-203',1, 1150000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1635941gach-mosaic-mv-203-jpeg.jpg?v=1595666874213', N'Hưng Gia Bình - Nhà phân phối Gạch mosaic mạ vàng MV-203 tại Đà Nẵng, Hội An, Quảng Nam... Giao hàng tận nơi với mọi số lượng',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1635941gach-mosaic-mv-203-jpeg.jpg?v=1595666874213')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch mosaic mạ vàng MV-204',1, 1150000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1635426gach-mosaic-mv-204-jpeg.jpg?v=1595666872017', N'Hưng Gia Bình - Nhà phân phối gạch mosaic thủy tinh mạ vàng MV-204 tại Đà Nẵng, Hội An, Quảng Nam... Giao hàng tận nơi với mọi số lượng',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1635426gach-mosaic-mv-204-jpeg.jpg?v=1595666872017')

--Vật liệu thô
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Cát tô trắng',2, 450,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1000097cat-trang-jpeg.jpg?v=1595666987453', N'Cát trắng không chỉ được sử dụng để làm kính, đúc khuôn mẫu mà nó còn là một loại nguyên liệu rất được ưu chuộng trong công tác xây tô, thi công xây dựng hiện nay.',10,'https://media.bizwebmedia.net/sites/55916/data/Upload/2019/12/cat_to_trang.jpg')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Lưới thép B40 mạ kẽm',2, 23500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/luoi-thep-b40-ma-kem.jpg?v=1645668573490', N'Lưới thép B40 là sản phẩm lưới thép hàng rào truyền thống có mặt trên thị trường khá sớm, với sự tiện lợi về giá thành rẻ, dễ vận chuyển, thi công lắp đặt dễ dàng, không rỉ sét... đem lại hiệu quả rất lớn và thiết thực cho các công trình xây dựng lớn nhỏ.',10,'https://bizweb.dktcdn.net/100/387/417/files/luoi-thep-b40.jpg?v=1645668624391')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Thép hình chữ H',2, 50000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0639948hbeams-jpeg.jpg?v=1595666227043', N'Công dụng: Dùng trong công trình xây dựng cầu đường, xây dựng nhà xưởng, kết cấu nhà tiền chế, ngành cơ khí, …',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/51399892c-jpeg.jpg?v=1595666228833')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Xi măng trắng SCG Thái Lan PCW50',2, 265000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0636500xi-mang-trang-scg-thai-lan-pcw-50-jpeg.jpg?v=1595666985817', N'Xi măng trắng SCG Thái Lan PCW 50.I là loại Xi măng Trắng Portland. Do đó, sản phẩm này dùng cho các công trình có độ bền chắc cao. Loại xi măng trắng này có thể được sử dụng trên sàn và tường nhà, các vật liệu trang trí đúc sẵn và các công trình kết cấu. Với độ trắng nổi bật, Xi măng trắng SCG PCW50 này có thể hoàn thiện trí tưởng tượng của bạn trên tất cả các loại bề mặt trang trí như Gạch đá mài, Bột trét, Sản phẩm trang trí và Bê tông Kiến trúc đổ khuôn...',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0636500xi-mang-trang-scg-thai-lan-pcw-50-jpeg.jpg?v=1595666985817')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch ống Đại Hưng 6 lỗ nhỏ',2, 1500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5348404gach-ong-dai-hung-6-lo-jpeg.jpg?v=1595666759477', N'Gạch ống 6 lỗ nhỏ Đại Hưng 75x115x175 mm là loại gạch xây dựng được làm bằng gốm đất sét nung chất lượng cao tại xã Đại Đồng, huyện Đại Lộc, tỉnh Quảng Nam. Gạch Đại Hưng được sản xuất trên dây chuyền thiết bị hiện đại và công nghệ tiên tiến hàng đầu của Châu Âu.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5348404gach-ong-dai-hung-6-lo-jpeg.jpg?v=1595666759477')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Đá chẻ viên xây móng',2, 11600,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2529088da-che-vien-jpeg.jpg?v=1595666686017', N'Đá chẻ viên là loại đá xây dựng thường được sử dụng để thi công xây móng nhà, xây tường rào, xây vách ngăn, lát lối đi sân vườn. ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2529088da-che-vien-jpeg.jpg?v=1595666686017')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Cát san lấp',2, 140000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1930981gia-cat-san-lap-jpeg.jpg?v=1595666684107', N' Cát san lấp là loại vật liệu dùng làm lớp đệm cát sử dụng rất hiệu quả cho các nền đất yếu ở trạng thái bão hoà nước như nền đất sét nhão, đất sét pha nhão, đất cát pha, đất bùn, than bùn… và chiều dày các lớp đất yếu nhỏ hơn dưới 3m.',10,'0https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1930981gia-cat-san-lap-jpeg.jpg?v=1595666684107')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Xi măng Kim Đỉnh PCB40',2, 1570000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2321830xi-mang-kim-dinh-0141039-jpeg.jpg?v=1595666671430', N' Xi măng Kim Đỉnh PCB40 là dòng sản phẩm xi măng chất lượng cao, được sản xuất theo công nghệ lò quay, với quy trình nạp liệu khô, đây là dây chuyên công nghệ sản xuất xi măng tiên tiến và phổ biến hiện nay trên thế giới, với ưu thế vượt trội hơn so công nghệ bán khô lò đứng và công nghệ ướt lò quay. Hệ thống nguyên vật liệu bao gồm: đá vôi, đất sét, quặng sắt đều đạt được tính đồng nhất cao về thành phần hoá học và tiêu chuẩn kỹ thuật. Do vậy, chất lượng Clinker được ổn định sẽ quyết định nên chất lượng của sản phẩm xi măng đầu ra.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2321830xi-mang-kim-dinh-0141039-jpeg.jpg?v=1595666671430')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Cát đúc',2, 250000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5249008ban-cat-to-vang-4516499-jpeg.jpg?v=1595666598430', N'Công ty Vật Liệu Xây Dựng Hưng Gia Bình - Đà Nẵng là nhà cung cấp chuyên nghiệp các loại cát đá xây dựng như cát xây, cát đúc, cát tô vàng, cát tô trắng, cát san lấp... với số lượng lớn tận chân công trình tại Đà Nẵng, Hội An, Quảng Nam. ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5249008ban-cat-to-vang-4516499-jpeg.jpg?v=1595666598430')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Đá hộc',2, 280000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/3213308da-hoc-jpeg.jpg?v=1595666597307', N'Công ty VLXD Hưng Gia Bình chuyên vận chuyển và cung cấp các loại đá hộc xây móng nhà tận chân công trình tại các Quận thành TP. Đà Nẵng và các tỉnh lân cận như Hội An, Quảng Nam... ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/3213308da-hoc-jpeg.jpg?v=1595666597307')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Cát tô vàng',2, 250000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5249008ban-cat-to-vang-jpeg.jpg?v=1595666595303', N'Nhà cung cấp chuyên nghiệp các loại cát xây dựng, cát tô vàng tại Đà Nẵng, Hội An. Giao hàng tận nơi. Liên hệ ngay 0935090252 để được báo giá tốt nhất ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5249008ban-cat-to-vang-jpeg.jpg?v=1595666595303')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Xi măng Xuân Thành PCB40',2, 1290000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4450809xi-mang-xuan-thanh-jpeg.jpg?v=1595666587857', N'Đại lý phân phối xi măng Xuân Thành tại Đà Nẵng và khu vực Miền Trung. Giá rẻ nhất - Giao hàng tận nơi. Gọi ngay 0935.090.252 để được báo giá tốt nhất. ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4450809xi-mang-xuan-thanh-jpeg.jpg?v=1595666587857')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Đá mi sàng',2, 190000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2851656da-mi-sang-jpeg.jpg?v=1595666555667', N'Công ty TNHH VLXD Hưng Gia Bình là nhà cung cấp và Phân phối đá xây dựng, đá mi sàng, đá 0x5, đá 1x2, đá 4x6, đá hộc tại Đà Nẵng, Hội An. Công ty Hưng Gia Bình cam kết sẽ luôn giao hàng tận nơi, đúng chất lượng, số lượng, không lẫn tạp chất.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2851656da-mi-sang-jpeg.jpg?v=1595666555667')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Đá 4x6',2, 250000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4738502da-4x6-jpeg.jpg?v=1595666553750', N'Công ty VLXD Hưng Gia Bình chuyên cung cấp và phân phối đá 4x6, đá xây dựng các loại tận chân công trình tại các Quận Thành TP. Đà Nẵng và các tỉnh lân cận như Hội An, Quảng Nam... ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4738502da-4x6-jpeg.jpg?v=1595666553750')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch tuynel 6 lỗ tròn lớn Đại Hưng',2, 2280,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5513650gach-tuynel-6-lo-tron-dai-hung-jpeg.jpg?v=1595666542173', N'Gạch tuynel 6 lỗ Đại Hưng là loại gạch xây dựng được làm bằng gốm đất sét nung, được sản xuất trên dây chuyền thiết bị hiện đại và công nghệ tiên tiến hàng đầu của Châu Âu. Nhà máy sản xuất gạch Đại Hưng đặt tại xã Đại Đồng, huyện Đại Lộc, tỉnh Quảng Nam. ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5513650gach-tuynel-6-lo-tron-dai-hung-jpeg.jpg?v=1595666542173')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Đá 1x2 - Đá xây dựng',2,330000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4810945da-xay-dung-da-1x2-jpeg.jpg?v=1595666443460', N'Công ty Vật Liệu Xây Dựng Đà Nẵng | VLXD Hưng Gia Bình - Nhà cung cấp chuyên nghiệp các loại Đá xây dựng như đá 1x2, đá 2x3, đá 3x4, đá 4x6, đá hộc, đá dăm số lượng lớn tới chân công trình tại Đà Nẵng, Hội An, Quảng Nam. ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4810945da-xay-dung-da-1x2-jpeg.jpg?v=1595666443460')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Xi măng Sông Gianh PC30',2, 1465000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1630240xi-mang-song-gianh-pc30-jpeg.jpg?v=1595666441117', N'Xi măng Sông Gianh được sản xuất từ nhà máy Xi Măng Sông Gianh - Quảng Bình, trên dây chuyền thiết bị và công nghệ hiện đại của Cộng hòa Liên bang Đức. ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1630240xi-mang-song-gianh-pc30-jpeg.jpg?v=1595666441117')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Xi măng Sông Gianh PCB40',2, 1490000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2004305xi-mang-song-gianh-pcb40-jpeg.jpg?v=1595666439197', N'Sản phẩm xi măng Sông Gianh PCB40 là sản phẩm xi măng rất được ưa chuộng trên thị trường VLXD hiện nay, bởi giá thành hợp lý, chất lượng đảm bảo, được sản xuất theo tiêu chuẩn TCVN 6260-1997, TCVN 2682-1999, TCVN 6067-1995, TCVN 6067:2004. Chất lượng sản phẩm được đảm bảo bởi hệ thống quản lý chất lượng ISO 9001:2000; Hệ thống quản lý môi trường ISO 14001:2004 trên dây chuyền công nghệ sản xuất hiện đại của Cộng Hòa Liên Bang Đức. ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2004305xi-mang-song-gianh-pcb40-jpeg.jpg?v=1595666439197')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Xi măng Kim Đỉnh PC40',2, 1570000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2321830xi-mang-kim-dinh-jpeg.jpg?v=1595666431580', N' ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2321830xi-mang-kim-dinh-jpeg.jpg?v=1595666431580')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch tuynel Đại Lộc 6 lỗ',2, 1530,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4801958gach-tuynel-dai-loc-6-lo-tron-jpeg.jpg?v=1595666383473', N'Gạch tuynel Đại Lộc 6 lỗ là loại gạch xây nhà rất phù hợp cho các công trình biệt thự, nhà chuyên dụng với yêu cầu độ dày tường lớn, khả năng cách âm, cách nhiệt tốt. Gạch tuynel 6 lỗ Đại Lộc loại lớn thường được dùng để xây tường 200mm. ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4801958gach-tuynel-dai-loc-6-lo-tron-jpeg.jpg?v=1595666383473')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Thép cuộn Việt Hàn',2, 40000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2550748thep-cuon-viet-han-jpeg.jpg?v=1595666322233', N'Thép cuộn tròn của VPS được sản xuất theo tiêu chuẩn JIS G3505 (Nhật Bản) và tiêu chuẩn TCVN 1651 – 1985 (Việt Nam), kích cỡ của Thép cuộn tròn Việt Hàn gồm có: Φ5.5, Φ6, Φ8 và Φ10. ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2550748thep-cuon-viet-han-jpeg.jpg?v=1595666322233')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch tuynel Điện Bàn 6 lỗ',2, 1620,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0418055gach-tuynel-dien-ban-6-lo-jpeg.jpg?v=1595666301743', N' Gạch tuynel Điện Bàn 6 lỗ loại lớn là loại gạch ống xây tường rất phù hợp với các công trình nhà phố, biệt thự, nhà chuyên dụng với yêu cầu độ dày của tường lớn, khả năng cách âm, cách nhiệt tốt. Gạch tuynel 6 lỗ loại lớn thường dùng để xây tường 200mm hoặc 400mm.',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0418055gach-tuynel-dien-ban-6-lo-jpeg.jpg?v=1595666301743')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Thép tròn',2, 10000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5044681thep-tron-vn-20110404-222410-jpeg.jpg?v=1595666202553', N'Thép vằn, thép cây tại Đà Nẵng, Hội An, Quảng Nam, Huế. Gọi ngay: (0511)3701.393 - 0935.090.252 - Mr Bình',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5044681thep-tron-vn-20110404-222410-jpeg.jpg?v=1595666202553')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Thép hình chữ U',2, 45000,'Thép hình chữ U tại Đà Nẵng, Hội An, Quảng Nam, Huế. Gọi ngay: (0511)3701.393 - 0935.090.252 - Mr Bình', N'Thép hình chữ U tại Đà Nẵng, Hội An, Quảng Nam, Huế. Gọi ngay: (0511)3701.393 - 0935.090.252 - Mr Bình ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/00425472c-jpeg.jpg?v=1595666215910')

--Thiết bị nghành nước
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Máy bơm nước hồ bơi Emaux SB30',3, 11950000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/may-bom-nuoc-emaux-sb30.jpg?v=1636075493153', N'Máy bơm nước bể bơi Emaux SB 30 – Emaux model SB30 là một mẫu máy bơm nước hồ bơi được ưa chuộng nhất mang thương hiệu Emaux với lưu lượng cao và khả năng tiết kiệm năng lượng vượt trội, bơm thích hợp sử dụng cho bể bơi công nghiệp. Đầu kết nối ống nước 2 inch với nắp đậy trong suốt, dễ dàng quan sát thiết bị và rọ lọc. Thiết kế phốt không rỉ nước khi bơm hút nước và tối đa hóa hiệu quả hút.',10,'https://bizweb.dktcdn.net/100/387/417/files/may-bom-nuoc-ho-boi-emaux-sb30.jpg?v=1636705784082')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Bình nước nóng Rossi Saphir 22L ngang',3, 2250000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/3149542binh-nuoc-nong-rossi-saphir-22l-ngang-jpeg.jpg?v=1595667013713', N'Bình nước nóng Rossi Saphir 22L ngang là thương hiệu bình nước nóng cao cấp của Tập đoàn Tân Á Đại Thành. Sản phẩm mang phong cách thiết kế Ý và là sản phẩm bán chạy nhất trên thị trường hiện nay. Bình nước nóng Rossi tích hợp những tính năng hiện đại của một bình nước nóng thế hệ mới với mục tiêu mang đến cho khách hàng trải nghiệm cao cấp từ cuộc sống tiện nghi.',10,'https://media.bizwebmedia.net/sites/55916/data/Upload/2020/4/binh_nuoc_nong_rossi_saphir_22l_ngang.jpg')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Bồn Inox Tân Á Đại Thành 1500 lít',3,4640000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1542314bon-nuoc-tan-a-jpeg.jpg?v=1595666625917', N'Sản phẩm bồn inox Tân Á Đại Thành là loại buồn chứa nước nước inox rất được ưa chộng trên thị trường VLXD hiện nay, được nhiều khách hàng đối tác tin tưởng và sử dụng.',10,'https://media.bizwebmedia.net/sites/55916/data/Upload/2015/5/bon_nuoc_inox_dai_thanh_2000_lit.jpg')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Máy bơm nước hồ bơi Emaux SB20',3,9900000,' https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/may-bom-nuoc-emaux-sb20.jpg?v=1636075176507', N'Máy bơm nước bể bơi Emaux SB20 là một mẫu máy bơm được ưa chuộng nhất mang thương hiệu Emaux với lưu lượng cao và khả năng tiết kiệm năng lượng vượt trội, bơm thích hợp sử dụng cho bể bơi gia đình và bể bơi công nghiệp. Đầu kết nối ống 2 inch với nắp đậy trong suốt, dễ dàng quan sát thiết bị và rọ lọc. Thiết kế phốt không rỉ nước khi bơm hút nước và tối đa hóa hiệu quả hút.  ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/may-bom-nuoc-emaux-sb20.jpg?v=1636075176507 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Máy bơm nước hồ bơi Emaux SB15',3,8990000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/may-bom-nuoc-emaux-sb15.jpg?v=1636074979213 ', N'Máy bơm nước bể bơi Emaux SB15 là một mẫu máy bơm nước có bộ lọc rác được ưa chuộng nhất mang thương hiệu Emaux với lưu lượng cao và khả năng tiết kiệm năng lượng vượt trội, bơm thích hợp sử dụng cho bể bơi gia đình. Đầu kết nối ống 2 inch với nắp đậy trong suốt, dễ dàng quan sát thiết bị và rọ lọc. Thiết kế phốt không rỉ nước khi bơm hút nước và tối đa hóa hiệu quả hút.  ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/may-bom-nuoc-emaux-sb15.jpg?v=1636074979213 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Máy bơm nước hồ bơi Emaux SB10',3,51990000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/may-bom-nuoc-emaux-sb10.jpg?v=1636074902463 ', N' Máy bơm bể bơi SB – Emaux model SB10 là một mẫu máy bơm được ưa chuộng nhất mang thương hiệu Emaux với lưu lượng cao và khả năng tiết kiệm năng lượng vượt trội, bơm thích hợp sử dụng cho bể bơi công nghiệp. Đầu kết nối ống 2 inch với nắp đậy trong suốt, dễ dàng quan sát thiết bị và rọ lọc. Thiết kế phốt không rỉ nước khi bơm hút nước và tối đa hóa hiệu quả hút. ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/may-bom-nuoc-emaux-sb10.jpg?v=1636074902463 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Vòi sen nóng lạnh Rossi R709S',3,9600000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/voi-sen-rossi-r709s.jpg?v=1620354293943 ', N' Vòi sen nóng lạnh Rossi R709S của Tập đoàn Tân Á Đại Thành được sản xuất dựa trên dây chuyền công nghệ nhập ngoại cao cấp, tiên tiến, đạt tiêu chuẩn Châu Âu, sản phẩm thiết kế tinh xảo và sang trọng. Tất cả những dòng sen vòi cao cấp Rossi của Tập đoàn Tân Á Đại thành được làm từ 100% đồng nguyên chất giúp cho chất lượng sản phẩm bền vững. Sản phẩm vòi sen tắm được phủ lớp Crom cao cấp tạo nên độ bóng vượt trội, độ bền vĩnh viễn, sự sang trọng và hiện đại cho sản phẩm.Linh kiện nhập khẩu chính hãng Tây Ban Nha với thành phần Đồng chiếm 59% cho sản phẩm có độ bền, bóng cao, tôn thêm vẻ sang trọng cho ngôi nhà bạn. ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/voi-sen-rossi-r709s.jpg?v=1620354293943 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Máy nước nóng Rossi Saphir RS 16SQ',3,2200000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5530669binh-nuoc-nong-rossi-rs-16-sq-jpeg.jpg?v=1595666983697 ', N'Công ty TNHH Vật Liệu Xây Dựng Hưng Gia Bình - Nhà phân phối bình bình nước nóng tại Đà Nẵng như máy nóng lạnh Rossi, bình nước nóng Ferolli, máy nước nóng Ariston nhập khẩu chính hãng tại Đà Nẵng, Hội An và các tỉnh Miền Trung, Tây Nguyên.  ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5530669binh-nuoc-nong-rossi-rs-16-sq-jpeg.jpg?v=1595666983697 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Bồn nước inox Tân Á Đại Thành 6000L',3,16940000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2547397bon-nuoc-inox-tan-a-6000l-jpeg.jpg?v=1595666934033 ', N'VLXD Hưng Gia Bình - Nhà phân phối chuyên nghiệp các loại Bồn chứa nước Inox, bồn nhựa, máy nước nóng năng lượng mặt trời, bình nước nóng lạnh Ariston, Rosssi, máy lọc nước ... tại Đà Nẵng, Hội An và các tỉnh Miền Trung, Tây Nguyên.  ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2547397bon-nuoc-inox-tan-a-6000l-jpeg.jpg?v=1595666934033 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Máy lọc nước RO Tân Á Pro+ 9 cấp lọc',3,4950000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2412030may-loc-nuoc-ro-tan-a-jpeg.jpg?v=1595666837580 ', N'VLXD Hưng Gia Bình - Nhà phân phối Máy lọc nước RO Tân Á Pro+ 9 cấp lọc nước chính hãng của Tập đoàn Tân Á Đại Thành tại thị trường Đà Nẵng, Hội An, Quảng Nam và các tỉnh Miền Trung, Tây Nguyên...  ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2412030may-loc-nuoc-ro-tan-a-jpeg.jpg?v=1595666837580 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Bồn Inox Tân Á Đại Thành 3000 lít',3,8630000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4856378bon-nuoc-inox-tan-a-3000l-jpeg.jpg?v=1595666764887 ', N'Công ty VLXD Hưng Gia Bình chúng tôi tự hào là nhà phân phối chính thức bồn nước inox Tân Á Đại Thành 3000 lít cũng như các loại sản phẩm khác của Tập đoàn Tân Á Đại Thành tại Đà Nẵng, Hội An, Quảng Nam, Quảng Ngãi, Huế, Quảng Trị và các tỉnh thành Miền Trung, Tây Nguyên như bồn nước inox, bồn nhựa, chậu rửa Rossi, bình nước nóng, máy nước nóng năng lượng mặt trời...  ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4856378bon-nuoc-inox-tan-a-3000l-jpeg.jpg?v=1595666764887 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Bồn Inox Tân Á Đại Thành 1500 lít',3,7380000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4219360bon-nuoc-inox-tan-a-2500l-jpeg.jpg?v=1595666764273 ', N'Công ty TNHH VLXD Hưng Gia Bình chúng tôi tự hào là nhà phân phối chính thức bồn nước inox tại Đà Nẵng, Hội An, Quảng Nam, Quảng Ngãi, Huế, Quảng Trị và các tỉnh thành Miền Trung, Tây Nguyên... với các dung tích sử dụng như bồn nước inox 2500l, 300L, 500L, 700L, bồn inox 1000L, 1500L, 2000L, bồn inox 3000L, 3500L, 4000L, 5000L, 6000L, 10.000L, ... v.v  ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4219360bon-nuoc-inox-tan-a-2500l-jpeg.jpg?v=1595666764273')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Bồn Inox Tân Á Đại Thành 1000L',3,3010000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2003940bon-inox-tan-a-1000l-jpeg.jpg?v=1595666526543 ', N'Công ty TNHH Vật Liệu Xây Dựng Hưng Gia Bình – Nhà cung cấp thiết bị điện nước và VLXD uy tín chuyên nghiệp lớn nhất tại Đà Nẵng, Hội An, Quảng Nam... Công ty Hưng Gia Bình chuyên phân phối các loại Bồn nước inox tại Đà Nẵng chất lượng cao như Bồn nước inox Sơn Hà, bồn nước inox Tân Á Đại Thành, bồn nước inox Quốc Thành, Bồn nước Hawata, bồn nước Toàn Mỹ ... vv.  ',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2003940bon-inox-tan-a-1000l-jpeg.jpg?v=1595666526543 ')

--Ngói lợp nhà
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói tráng men Marusugi Eagle-Exa',4,45500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/ngoi-trang-men-marusugi-kent.jpg?v=1648955161637', N'Ngói tráng men Marusugi còn gọi là ngói Kent, là loại ngói tráng men cao cấp được nhập khẩu nguyên đai, nguyên kiện từ Nhật Bản. Sản phẩm được thiết kế tinh xảo với các gờ chắn nước, móc khóa ngói, lớp men cao cấp không phai màu.Ngói nhật nhập khẩu Marusugi Eagle Exa là loại ngói lợp nhà, vật liệu lợp mái nhập khẩu. Ngói Marusugi được thiết kế tinh xảo bằng các chốt lắp khóa để khóa ngói trên và ngói dưới một cách chắc chắn. Có khả năng chống thiên tai, để bảo vệ ngôi nhà của bạn khỏi vụ tốc mái.',10,'https://bizweb.dktcdn.net/100/387/417/files/ngoi-trang-men-marusugi-eagle-extra-mau-do.jpg?v=1648961172419')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói tráng men Mikado R15 màu xanh rêu',4,23500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/ngoi-trang-men-mikado-r15-xanh-reu.jpg?v=1601979547277', N'Ngói sóng tráng men cao cấp MIKADO là loại vật liệu xây dựng thân thiện với môi trường, được sản xuất trên dây chuyền hiện đại, với các nguyên liệu chất lượng cao, được nung ở nhiệt độ 1110 độ C -1180 độ C. Sản phẩm ngói tráng men Mikado đạt tiêu chuẩn TCVN 9133:2011 có độ bền cao, bề mặt bóng mịn, tự làm sạch khi mưa, không mất màu theo thời gian',1,'https://bizweb.dktcdn.net/100/387/417/files/ngoi-trang-men-mikado-r15-mau-xanh-reu.jpg?v=1601979090106')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói màu Ruby RD09 - Màu xanh đen',4,25500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1649454ngoi-nhat-ruby-rd09-jpeg.jpg?v=1595666946813 ', N'Ngói Nhật Ruby RD09 màu xanh đen là dòng ngói bê tông màu cao cấp được sản xuất dựa trên hệ thống dây chuyền thiết bị sản xuất tự động hóa từ khâu cung cấp nguyên vật liệu, phối liệu cho đến việc tạo hình viên ngói nên đảm bảo độ chính xác cao. Cùng với công nghệ sơn hấp gia nhiệt theo chu trình khép kín qua hai buồng xử lý (2 sơn 3 hấp), với lớp phủ Acrylic tinh chất đặc chế theo công nghệ polyme tiên tiến, kết cấu tạo liên kết ngang cho bề mặt sơn rắn chắc, không bong tróc, không phai màu...',14,'https://media.bizwebmedia.net/sites/55916/data/Upload/2018/8/ngoi_nhat_ruby_rd09_mau_xanh_den.jpg')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói nóc lớn Viglacera Hạ Long',4,31000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2511861ngoi-noc-ha-long-viglacera-jpeg.jpg?v=1595666420680 ', N'Ngói nóc Hạ Long còn được gọi là ngói bò Hạ Long, thường được sử dụng để ốp trên đỉnh mái ngói, nơi giao nhau cao nhất trên mái ngói đất nung. Ngói nóc Viglacera Hạ Long cũng được sử dụng cho vị trí ngói diềm bên hông mái. Nên ngói úp nóc Hạ Long còn được gọi là ngói rìa Hạ Long. ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2511861ngoi-noc-ha-long-viglacera-jpeg.jpg?v=1595666420680 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói đất nung Viglacera Hạ Long',4,13800,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/ngoi-viglacera-ha-long.jpg?v=1646635131777 ', N'VLXD Hưng Gia Bình - Nhà phân phối chuyên nghiệp các loại gạch ngói đất nung tại Đà Nẵng, Hội An, Quảng Nam, Thừa Thiên Huế, Quảng Trị... như ngói Đất Việt, ngói viglacera Hạ Long, ngói Đại Hưng, ngói Đông Triều, ... ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/ngoi-viglacera-ha-long.jpg?v=1646635131777 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói màu Ruby RD13 - Nâu Socola',4,25500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4021776ngoi-mau-ruby-rd-13-jpeg.jpg?v=1595666706563 ', N' Ngói màu RUBY RD13 màu Nâu Socola là dòng ngói bê tông màu cao cấp được sản xuất dựa trên hệ thống dây chuyền thiết bị sản xuất tự động hóa từ khâu cung cấp nguyên vật liệu, phối liệu và tạo hình viên ngói nên đảm bảo độ chính xác cao. Cùng với công nghệ sơn hấp gia nhiệt theo chu trình khép kín qua hai buồng xử lý (2 sơn 3 hấp), với lớp phủ Acrylic tinh chất đặc chế theo công nghệ polyme tiên tiến, kết cấu tạo liên kết ngang cho bề mặt sơn rắn chắc, không bong tróc, không phai màu...',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4021776ngoi-mau-ruby-rd-13-jpeg.jpg?v=1595666706563 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Tấm lợp Fibro xi măng',4,75000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/3642259tam-lop-fibro-xi-mang-jpeg.jpg?v=1595666530237 ', N'VLXD Hưng Gia Bình - Chuyên phân phối Sỉ & Lẻ các loại Tấm lợp Fibro xi măng tại Đà Nẵng, Hội An, Quảng Nam, Huế... Giao hàng tận nơi - Uy tín - Chuyên nghiệp - Tận tâm. ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/3642259tam-lop-fibro-xi-mang-jpeg.jpg?v=1595666530237 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói âm dương tráng men xanh',4,35000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2403162ngoi-trang-men-xanh-jpeg.jpg?v=1595666636797 ', N'Ngói âm dương tráng men xanh hay còn gọi là ngói lưu ly tráng men. Đây là loại ngói tráng men thường sử dụng để lợp mái ngói ở các đình, chùa và lăng tẩm xưa... ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2403162ngoi-trang-men-xanh-jpeg.jpg?v=1595666636797 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N' Ngói mũi hài lớn Đất Việt 270 ',4,9700,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0541084ngoi-mui-hai-dat-viet-270-lon-jpeg.jpg?v=1595666667753 ', N'Ngói mũi hài Đất Việt 270 loại lớn là loại ngói gốm đất nung được sản xuất từ nguồn đất sét chất lượng cao tại tỉnh Quảng Ninh. Ngói còn có tên gọi khác là ngói hài lớn Đất Việt hay ngói hài to Đất Việt. ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0541084ngoi-mui-hai-dat-viet-270-lon-jpeg.jpg?v=1595666667753 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói Viglacera Đông Triều',4,11500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0001483ngoi-viglacera-dong-trieu-jpeg.jpg?v=1595666697900 ', N'Ngói đất sét nung Viglacera Đông Triều là dòng sản phẩm ngói lợp nhà được sản xuất từ nguồn đất sét nung chất lượng cao tại Đông Triều, Quảng Ninh. Trên dây chuyền công nghệ sản xuất hiện đại, bán tự động. Vì vậy, Ngói Đông Triều đã được rất nhiều khách hàng tín nhiệm và tin dùng trong hầu hết các công trình xây dựng nhà ở. ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0001483ngoi-viglacera-dong-trieu-jpeg.jpg?v=1595666697900 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói màu Ruby RD03 - Đỏ đậm ',4,25500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/3026503ngoi-mau-ruby-rd-03-jpeg.jpg?v=1595666714870 ', N'Ngói màu RUBY RD03 màu đỏ đậm là dòng ngói bê tông màu cao cấp được sản xuất dựa trên hệ thống dây chuyền thiết bị sản xuất tự động hóa từ khâu cung cấp nguyên vật liệu, phối liệu và tạo hình viên ngói nên đảm bảo độ chính xác cao. Cùng với công nghệ sơn hấp gia nhiệt theo chu trình khép kín qua hai buồng xử lý (2 sơn 3 hấp), với lớp phủ Acrylic tinh chất đặc chế theo công nghệ polyme tiên tiến, kết cấu tạo liên kết ngang cho bề mặt sơn rắn chắc, không bong tróc, không phai màu... ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/3026503ngoi-mau-ruby-rd-03-jpeg.jpg?v=1595666714870 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Thanh Xà gồ Zacs',4,39200,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1830739xa-go-zacs-jpeg.jpg?v=1595666899890 ', N'Xà gồ Zacs được làm từ thép mạ hợp kim nhôm kẽm cao cấp BlueScope Zacs hàng đầu của Úc. Sản phẩm Thanh kèo BlueScope Zacs có cường độ chịu lực cao, trọng lượng siêu nhẹ, không bị rỉ rét ăn mòn, từ lâu đã được biết đến và tin dùng bởi nhiều khách hàng cao cấp và khó tính nhất. Thanh kèo Zacs với các thanh được dập định hình tối ưu theo công nghệ tiên tiến hàng đầu của Úc, đảm bảo mái ngói luôn bền chắc trên 20 năm. ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1830739xa-go-zacs-jpeg.jpg?v=1595666899890 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói màu SCG Thái Lan M003',4,17500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/ngoi-scg-m003.jpg?v=1621041436383 ', N'Vật Liệu Xây Dựng 24h Đà Nẵng tự hào là nhà phân phối trực tiếp sản phẩm ngói màu Thái Lan hiệu con voi từ nhà máy đến người tiêu dùng (không qua đại lý). Vì vậy, chúng tôi cam kết sẽ cung cấp cho Quý khách hàng những sản phẩm ngói lợp nhà, vật liệu lợp mái uy tín, chất lượng, hàng chính hãng với giá cả cạnh tranh nhất. ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/ngoi-scg-m003.jpg?v=1621041436383 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói màu Sao Việt Nhật SJVC DT-07',4,12200,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4709802ngoi-lop-sjvc-dt-07-jpeg.jpg?v=1595666881517 ', N'Công ty TNHH Vật Liệu Xây Dựng Hưng Gia Bình chúng tôi tự hào là nhà phân phối chính thức sản phẩm ngói màu SJVC Sao Việt Nhật màu đỏ tươi DT-07 tại Đà Nẵng, Hội An, Quảng Nam và các tỉnh thành Miền Trung, Tây Nguyên, ... Uy tín - Chuyên nghiệp - Tận tâm - Giao hàng tận nơi với mọi số lượng. ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4709802ngoi-lop-sjvc-dt-07-jpeg.jpg?v=1595666881517 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói màu Sao Việt Nhật SJVC XD-11',4,12200,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0227360ngoi-lop-sjvc-xd-11-jpeg.jpg?v=1595666883430 ', N'Ngói màu SJVC màu xanh đen XD-11 được sản xuất hoàn toàn tự động theo công nghệ tiên tiến của Nhật Bản, quy trình sơn hấp khép kín đảm bảo độ bền màu cao và có thời hạn sử dụng lâu dài. ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0227360ngoi-lop-sjvc-xd-11-jpeg.jpg?v=1595666883430 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói lợp Đồng Tâm NLL S905',4,14500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4711735ngoi-mau-dong-tam-nll-s905-jpeg.jpg?v=1595666944833 ', N'Ngói lợp Đồng Tâm NLL S905 được sản xuất hoàn toàn tự động theo công nghệ tiên tiến của Nhật Bản, quy trình sơn hấp khép kín đảm bảo độ bền màu cao và có thời hạn sử dụng lâu dài ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4711735ngoi-mau-dong-tam-nll-s905-jpeg.jpg?v=1595666944833 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói Pháp Onduvilla',4,85000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1501441ngoi-onduvilla-jpeg.jpg?v=1595666911740 ', N'Hưng Gia Bình - Nhà phân phối ngói pháp Onduvilla và thi công lợp mái ngói chuyên nghiệp bằng hệ thanh kèo thép nhẹ smartruss không rỉ của BlueScope tại Đà Nẵng, Thừa Thiên Huế, Hội An, Quảng Nam, Quảng Ngãi, Quy Nhơn, Bình Định, Gia Lai, Kon Tum, Dak Lak và các tỉnh Thành Miền Trung, Tây Nguyên. ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1501441ngoi-onduvilla-jpeg.jpg?v=1595666911740 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói lợp Đồng Tâm NLL S906',4,14500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4711142ngoi-lop-dong-tam-nll-s906-jpeg.jpg?v=1595666941763 ', N'Ngói lợp Đồng Tâm NLL S906 được sản xuất hoàn toàn tự động theo công nghệ tiên tiến của Nhật Bản, quy trình sơn hấp khép kín đảm bảo độ bền màu cao và có thời hạn sử dụng lâu dài  ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4711142ngoi-lop-dong-tam-nll-s906-jpeg.jpg?v=1595666941763 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói màu Ruby RD05 - Xanh mực',4,25500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/3832539ngoi-mau-ruby-rd-05-jpeg.jpg?v=1595666857670 ', N'Hưng Gia Bình - Nhà phân phối chính thức ngói bê tông màu cao cấp RUBY - Công nghệ Nakano Nhật Bản và thi công mái ngói kèo thép nhẹ chuyên nghiệp tại Đà Nẵng, Hội An, Quảng Nam, Huế, Quảng Trị, Quảng Bình... ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/3832539ngoi-mau-ruby-rd-05-jpeg.jpg?v=1595666857670 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói màu Sao Việt Nhật SJVC TT-03',4,12200,' https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5220481ngoi-mau-sjvc-tt-03-jpeg.jpg?v=1595666798687', N'Công ty TNHH Vật Liệu Xây Dựng Hưng Gia Bình là nhà phân phối chính thức ngói màu Sao Việt Nhật SJVC màu tím than TT-03 tại Đà Nẵng, Hội An, Quảng Nam và các tỉnh thành Miền Trung, Tây Nguyên, ... ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5220481ngoi-mau-sjvc-tt-03-jpeg.jpg?v=1595666798687 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói màu Sao Việt Nhật SJVC CD-01  ',4,12200,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/3332960ngoi-mau-sjvc-cd-01-jpeg.jpg?v=1595666797693 ', N'Công ty TNHH Vật Liệu Xây Dựng Hưng Gia Bình là nhà phân phối chính thức ngói màu Sao Việt Nhật SJVC tại Đà Nẵng, Hội An, Quảng Nam và các tỉnh thành Miền Trung, Tây Nguyên, ... ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/3332960ngoi-mau-sjvc-cd-01-jpeg.jpg?v=1595666797693 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói lưu ly tráng men vàng',4,32000,' https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5720855ngoi-am-duong-trang-men-vang-jpeg.jpg?v=1595666676883', N'Ngói âm dương tráng men vàng hay còn gọi là ngói lưu ly tráng men màu vàng. Đây là loại ngói tráng men thường sử dụng để lợp mái ngói ở các nhà thờ, nhà cổ, văn miếu, đình, chùa và lăng tẩm xưa... ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5720855ngoi-am-duong-trang-men-vang-jpeg.jpg?v=1595666676883 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói màu Ruby RD02 - Đỏ tươi',4,25500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4912699ngoi-ruby-rd-02-jpeg.jpg?v=1595666712953 ', N'Ngói màu Ruby RD02 màu đỏ tươi là dòng ngói Nhật bằng bê tông màu cao cấp được sản xuất dựa trên hệ thống dây chuyền thiết bị sản xuất tự động hóa từ khâu cung cấp nguyên vật liệu, phối liệu và tạo hình viên ngói nên đảm bảo độ chính xác cao. Cùng với công nghệ sơn hấp gia nhiệt theo chu trình khép kín qua hai buồng xử lý (2 sơn 3 hấp), với lớp phủ Acrylic tinh chất đặc chế theo công nghệ polyme tiên tiến, kết cấu tạo liên kết ngang cho bề mặt sơn rắn chắc, không bong tróc, không phai màu... ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4912699ngoi-ruby-rd-02-jpeg.jpg?v=1595666712953 ')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói màu Ruby RD01 - Đỏ cam  ',4,25500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4652317ngoi-ruby-rd-01-jpeg.jpg?v=1595666712027 ', N'Ngói màu RUBY RD01 màu đỏ cam hay màu đỏ ngói đất là dòng ngói bê tông màu cao cấp được sản xuất dựa trên hệ thống dây chuyền thiết bị sản xuất tự động hóa từ khâu cung cấp nguyên vật liệu, phối liệu và tạo hình viên ngói nên đảm bảo độ chính xác cao. Cùng với công nghệ sơn hấp gia nhiệt theo chu trình khép kín qua hai buồng xử lý (2 sơn 3 hấp), với lớp phủ Acrylic tinh chất đặc chế theo công nghệ polyme tiên tiến, kết cấu tạo liên kết ngang cho bề mặt sơn rắn chắc, không bong tróc, không phai màu... ',14,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/4652317ngoi-ruby-rd-01-jpeg.jpg?v=1595666712027 ')


--Brand Footer
Insert into Brands (BrandId, BrandName, BrandDescription, BrandImg)
values (1, N'Về chúng tôi', N'Chúng tôi đặt mục tiêu lấy chất lượng, tiến độ, sự hài lòng của khách hàng làm nền tảng cho sự phát triển.', 'https://cdn-icons-png.flaticon.com/512/4832/4832450.png')
Insert into Brands (BrandId, BrandName, BrandDescription, BrandImg)
values (2, N'Hệ thống cửa hàng', N'Hệ thống cửa hàng chúng tôi trải dài trên khắp Việt Nam, mang trong mình thương hiệu được khách hàng tin tưởng trong suốt nhiều năm qua cùng với những dịch vụ tận tâm nhất. ', 'https://images.unsplash.com/photo-1577208288347-b24488f3efa5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXMlMjBzaG9wfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80')



--News
Insert into NewsCategories(NewCateName)
values(N'Tin tức vật liệu xây dựng')
Insert into NewsCategories(NewCateName)
values(N'Thông tin Tuyển dụng Nhân sự')
Insert into NewsCategories(NewCateName)
values(N'Kinh Nghiệm Xây Nhà Đẹp')
Insert into NewsCategories(NewCateName)
values(N'Tin tức Dự án Bất động sản')


--Tin tức vật liệu xây dựng
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Thi công mái ngói tại Đà Nẵng, Hội An, Quy Nhơn - Hệ xà gồ Zacs Bluescope VN', N'Công ty TNHH Vật Liệu Xây Dựng Hưng Gia Bình chuyên cung cấp và tư vấn thi công mái ngói bằng hệ thanh kèo thép mạ hợp kim nhôm kẽm trọng lượng nhẹ mang thương hiệu Zacs BlueScope Lysaght Việt Nam...','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/thi-cong-lop-mai-ngoi-hung-gia-binh.jpg?v=1597131146467','https://vatlieuxaydung24h.vn/thi-cong-mai-ngoi-tai-da-nang-he-xa-go-zacs-bluescope-vn',1, N'Tin tức vật liệu xây dựng')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Giải pháp chống nóng cho sân thượng hiệu quả?', N'Giải pháp chống nóng cho sân thượng hiệu quả? Kinh nghiệm thi công sàn mái sân thượng. Vật Liệu Xây Dựng Đà Nẵng, VLXD Đà Nẵng.','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/chong-nong-san-thuong-hieu-qua.jpg?v=1655262958037','https://vatlieuxaydung24h.vn/giai-phap-chong-nong-cho-san-thuong-hieu-qua',1, N'Tin tức vật liệu xây dựng')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'3 dòng gạch lát vỉa hè, lát sân vườn phổ biến nhất hiện nay', N'Hiện nay, sản phẩm gạch lát vỉa hè không chỉ được sử dụng phổ biến trong các công trình công cộng mà còn được dùng cho các dự án nhà ở tư nhân với các tính năng vượt trội về độ bền chắc cũng như tí..','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/2020519104225226.jpg?v=1593579396097','https://vatlieuxaydung24h.vn/3-dong-gach-lat-via-he-san-vuon-pho-bien-nhat-hien-nay',1, N'Tin tức vật liệu xây dựng')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Nhà Máy Sản Xuất Gạch Bông Gió DanaTiles', N'Nhà máy sản xuất Gạch trang trí mỹ thuật DANA TILES tự hào là nhà sản xuất gạch terrazzo lát vỉa hè và gạch bông gió xi măng mỹ thuật Danatiles hàng đầu tại Đà Nẵng, Hội An, Quy Nhơn và các tỉnh M...','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/gach-bong-gio-xi-mang-dana-tiles.jpg?v=1595772221033','https://vatlieuxaydung24h.vn/nha-may-san-xuat-gach-bong-gio-my-thuat-danatiles',1, N'Tin tức vật liệu xây dựng')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Quy trình từng bước thi công lắp đặt hồ bơi, bể bơi tại Hưng Gia Bình', N'Hướng dẫn từng bước Quy trình kỹ thuật thi công lắp đặt hồ bơi, bể bơi tại Công ty Hưng Gia Bình Để đảm bảo cho hồ bơi, bể bơi hoạt động hiệu quả và bền bỉ thì đơn vị nhà...','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/thi-cong-sat-thep-day-ho-boi.jpg?v=1613719338857','https://vatlieuxaydung24h.vn/quy-trinh-tung-buoc-thi-cong-lap-dat-ho-boi-be-boi',1, N'Tin tức vật liệu xây dựng')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Thi công lợp mái ngói Biệt thự nhà anh Tuấn, Quận Liên Chiểu, Đà Nẵng', N'Thi công lợp mái ngói Biệt thự nhà anh Tuấn, Đường Bàu Mạc 4, Phường Hòa Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng bằng hệ thanh kèo thép mạ hợp kim nhôm kẽm trọng lượng nhẹ không rỉ BlueScope ...','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/201882314014548.jpg?v=1588743371287','https://vatlieuxaydung24h.vn/thi-cong-lop-mai-ngoi-biet-thu-nha-anh-tuan-quan-lien-chieu-da-nang',1, N'Tin tức vật liệu xây dựng')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Nhà phân phối sắt thép xây dựng hàng đầu tại Đà Nẵng', N'Công ty TNHH VLXD Hưng Gia Bình tự hào là nhà phân phối sắt thép xây dựng hàng đầu tại Đà Nẵng, Hội An, Quảng Nam... như Thép Pomina, Hòa Phát, Dana Ý, Việt Úc, Việt Mỹ, Việt Ý...','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/2015916112554605.jpg?v=1588743365763','https://vatlieuxaydung24h.vn/nha-phan-phoi-sat-thep-xay-dung-hang-dau-tai-da-nang',1, N'Tin tức vật liệu xây dựng')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Mục tiêu 100% sử dụng Vật liệu không nung sau năm 2015', N'Theo quy định của Bộ Xây dựng, từ 15/1/2013, các công trình xây dựng tại các đô thị loại 3 trở lên phải sử dụng 100% vật liệu xây dựng không nung hay Gạch block xây tường không nung; các khu vực cò...','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/2014611165830521.jpg?v=1588743362347','https://vatlieuxaydung24h.vn/muc-tieu-100-su-dung-vat-lieu-khong-nung-sau-nam-2015',1, N'Tin tức vật liệu xây dựng')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Sàn nhẹ panen - công nghệ mới cho xây dựng hiện đại', N'Hiện nay cùng với sự phát triển mạnh của các khu đô thị lớn, các tòa nhà cao tầng mọc lên trên khắp đất nước. Để bắt kịp xu thế phát triển đó, nhiều doanh nghiệp xây dựng ngày càng hướng tới việc s...','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/20121008032530103461.jpg?v=1588743360560','https://vatlieuxaydung24h.vn/san-nhe-panen-cong-nghe-moi-cho-xay-dung-hien-dai',1, N'Tin tức vật liệu xây dựng')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Chuyên cung cấp Xi măng giá rẻ nhất tại Đà Nẵng', N'Chuyên cung cấp xi măng giá rẻ nhất tại Đà Nẵng, Hội An, Quảng Nam như Xi măng Sông Gianh, Xi măng Vicem Hải Vân, Xi măng Kim Đỉnh. Giao hàng nhanh với mọi khối lượng. Call: 0935.090.252','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/20146623017820.jpg?v=1588743361660','https://vatlieuxaydung24h.vn/chuyen-cung-cap-xi-mang-gia-re-nhat-tai-da-nang',1, N'Tin tức vật liệu xây dựng')

--Thông tin Tuyển dụng Nhân sự
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Tuyển dụng Nhân viên kinh doanh VLXD tại Đà Nẵng', N'Công ty TNHH Vật Liệu Xây Dựng Hưng Gia Bình cần tuyển dụng gấp Nhân viên kinh doanh Vật Liệu Xây Dựng tại Đà Nẵng tháng 06/2020','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/201461191110940.jpg?v=1588743399567','https://vatlieuxaydung24h.vn/tuyen-dung-nhan-vien-kinh-doanh-vlxd-tai-da-nang',2,N'Thông tin Tuyển dụng Nhân sự')
--Kinh nghiệm xây nhà đẹp
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Hướng dẫn từng bước thi công ốp gạch mosaic hồ bơi', N'Công ty TNHH VLXD Hưng Gia Bình xin giới thiệu bài viết “Hướng dẫn tường bước thi công ốp gạch mosaic, gạch hồ bơi” được đút kết từ quá trình thi công ốp gạch mosaic','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/201492316161796.jpg?v=1588743383770','https://vatlieuxaydung24h.vn/huong-dan-tung-buoc-thi-cong-op-gach-mosaic',3,N'Kinh Nghiệm Xây Nhà Đẹp')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Ngũ hành của vật liệu xây dựng theo phong thủy hiện đại', N'Hiểu được những boăn khoăn của khách hàng, công ty VLXD Hưng Gia Bình xin giới thiệu đến Quý khách hàng bài viết: “Ngũ hành của vật liệu xây dựng theo phong thủy hiện đại','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/2014121011432598.jpg?v=1588743384580','https://vatlieuxaydung24h.vn/ngu-hanh-cua-vat-lieu-xay-dung-theo-phong-thuy-hien-dai',3,N'Kinh Nghiệm Xây Nhà Đẹp')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Hướng dẫn các bước cơ bản thi công sơn lại nhà cũ', N'vatlieuxaydung24h.vn xin chia sẻ đến Quý khách bài viết “Hướng dẫn các bước cơ bản khi sơn sửa lại ngôi nhà”, sẽ giúp ích cho những ai đang có nhu cầu sơn sửa lại ngôi nhà','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/201526174218839.jpg?v=1588743385633','https://vatlieuxaydung24h.vn/huong-dan-cac-buoc-co-ban-thi-cong-son-lai-nha',3,N'Kinh Nghiệm Xây Nhà Đẹp')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Kinh nghiệm chọn mua và sử dụng bồn nước Inox và bồn nhựa', N'Công ty VLXD Hưng Gia Bình xin chia sẻ một số kinh nghiệm chọn mua và sử dụng bồn chứa nước như Bồn Inox, bồn nhựa.','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/20153615288144.jpg?v=1588743386200','https://vatlieuxaydung24h.vn/kinh-nghiem-chon-mua-va-su-dung-bon-nuoc-inox-va-bon-nhua',3,N'Kinh Nghiệm Xây Nhà Đẹp')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Hướng dẫn cách bảo quản xi măng bao đúng cách', N'Làm sao để bảo quản xi măng bao một cách tốt nhất sau khi mua hàng về, tiết kiệm kinh tế, giảm hao phí... Xin chia sẻ bài viết: “Hướng dẫn cách bảo quản xi măng bao đúng cách”','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/201553164355864.jpg?v=1588743387950','https://vatlieuxaydung24h.vn/huong-dan-cach-bao-quan-xi-mang-bao-dung-cach',3,N'Kinh Nghiệm Xây Nhà Đẹp')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Kỹ Thuật Xây Tường Bằng Gạch Tuynel', N'Vật Liệu Xây Dựng 24h Đà Nẵng xin giới thiệu đến Quý khách hàng bài viết "Kỹ thuật xây tường bằng gạch tuynel", huy vọng bài viết sẽ hữu ích cho những ai đang có ý định tự mình sửa chữa ngôi nhà củ...','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/201431422510537.jpg?v=1588743380287','https://vatlieuxaydung24h.vn/ky-thuat-xay-tuong-bang-gach-tuynel',3,N'Kinh Nghiệm Xây Nhà Đẹp')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Tìm hiểu về Gạch bê tông khí chưng áp (ACC)', N'Gạch bê tông khí chưng áp còn được gọi là gạch block bê tông nhẹ hay Gạch bê tông nhẹ: Siêu nhẹ - siêu bền – siêu cách âm – cách nhiệt – chống cháy ưu việt.','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/2014316115317540.jpg?v=1588743380773','https://vatlieuxaydung24h.vn/tim-hieu-ve-gach-be-tong-khi-chung-ap',3,N'Kinh Nghiệm Xây Nhà Đẹp')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Tìm hiểu về Đá Bazan?', N'Đá Bazan (tiếng Anh: basalt) là loại đá mắc ma màu xám hay màu đen, hình thành do mắc ma phun trào ra ngoài từ miệng núi lửa rồi nguội đi.','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/2014330165343674.jpg?v=1588743381470','https://vatlieuxaydung24h.vn/tim-hieu-ve-da-bazan',3,N'Kinh Nghiệm Xây Nhà Đẹp')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Hướng dẫn chi tiết từng bước thi công ốp gạch INAX', N'Vật Liệu Xây Dựng Đà Nẵng - vatlieuxaydung24h.vn xin thiệu đến quý khách hàng bài viết "Hướng dẫn chi tiết tường bước thi công ốp gạch INAX". Huy vọng bài viết trên sẽ giải đáp được phần nào những ...','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/2014723122411726.jpg?v=1588743383063','https://vatlieuxaydung24h.vn/huong-dan-chi-tiet-tung-buoc-thi-cong-op-gach-inax',3,N'Kinh Nghiệm Xây Nhà Đẹp')

--Founder
insert into Founders(FounderName, FounderImg, FounderComment)
values (N'Cường Chu - Founder', 'https://scontent.fdad3-5.fna.fbcdn.net/v/t1.6435-9/126217454_1534882196695741_5648368659554910574_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=174925&_nc_ohc=EKDfA2rCsMUAX-Ipw1k&tn=xKt1AG8JDbpebTqO&_nc_ht=scontent.fdad3-5.fna&oh=00_AT9NsbQODai4hxuhtsGnGOAfsRqOaSL-vr8LVEtodrAovw&oe=61EEC5AC', N'Là một doanh nghiệp trẻ, được hình thành trong bối cảnh thị trường ngành xây dựng đang có nhiều diễn biến phức tạp. Đặc biệt là lĩnh vực thi công xây dựng nhà ở dân dụng, đang còn nhiều vấn đề chưa được quan tâm đúng mức như: chất lượng công trình, nguyên vật liệu thi công, dự toán công trình, và các vấn đề liên quan đến quyền lợi của Quý khách hàng… Vì vậy, tầm nhìn của Shop là cải thiện cơ cấu tổ chức và quy trình quản lý chất lượng, nhằm khắc phục các vấn đề trên và mang lại cho khách hàng hiệu quả cao nhất trong việc đầu tư xây dựng, đồng thời đây cũng là nền tảng cho sự phát triển bền vững của công ty chúng tôi.' )
insert into Founders(FounderName, FounderImg, FounderComment)
values (N'Thịnh Hà - CoFounder', 'https://scontent.fdad3-4.fna.fbcdn.net/v/t1.15752-9/264093341_1236977680124008_6659438362288855389_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=ae9488&_nc_ohc=QDCaXbwxirAAX8Y8XG3&tn=xKt1AG8JDbpebTqO&_nc_ht=scontent.fdad3-4.fna&oh=03_AVKVCe5mHvgJsMgq_qWimsyZGwNZwJ_WqegLqJj7V_IBsg&oe=61EF2FFD', N'Cửa hàng là nơi quy tụ đội ngũ kỹ sư xây dựng và kiến trúc sư được đào tạo tại các trường đại học danh tiếng và đã trải qua nhiều năm kinh nghiệm thực tế tại các công trình lớn. Vì vậy, chúng tôi luôn sẵn sàng tiếp nhận mọi yêu cầu công việc phức tạp nhất mà khách hàng tin tưởng giao phó. Với phương châm “Sự tin cậy của khách hàng là nền tảng của sự phát triển” toàn thể cán bộ, công nhân viên của cửa hàng BMS luôn cố gắng, nổ lực nâng cao năng lực bản thân và cải thiện chất lượng dịch vụ ngày một tốt hơn, để đáp lại sự tín nhiệm và tin cậy của khách hàng đã dành cho chúng tôi.' )
insert into Founders(FounderName, FounderImg, FounderComment)
values (N'Đạt Nguyễn - CoFounder', 'https://scontent.fdad3-4.fna.fbcdn.net/v/t1.6435-9/126513844_2790081497975764_7882114598137046604_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=abk4Gmu7Sd0AX8M8C3v&_nc_ht=scontent.fdad3-4.fna&oh=00_AT-gZPNTzCKM5pamGRVf-hacDKh85sJHs4JM99ZkL_mpHQ&oe=61E34466', N'Với mong muốn đó, cửa hàng đã không ngừng nỗ lực hoàn thiện và cho ra đời website BMS - Vật Liệu Xây Dựng Đà Nẵng. Đây là website Bán lẻ VLXD và Trang trí Nội Ngoại thất online uy tín chuyên nghiệp lớn nhất tại Đà Nẵng, Hội An, Tam Kỳ và các tỉnh khu vực Miền Trung, Tây Nguyên.' )
insert into Founders(FounderName, FounderImg, FounderComment)
values (N'Linh Phạm - CoFounder', 'https://scontent-sin6-1.xx.fbcdn.net/v/t1.6435-9/107696389_181429943336568_4189917246555326764_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=174925&_nc_ohc=V_RYYismMjIAX9DTIsh&_nc_ht=scontent-sin6-1.xx&oh=00_AT_s9A4aT0hOHpLKr76VmfPfqoujeGukw6M88f9GBogiag&oe=61EDD828', N'Mục tiêu của website là cung cấp một giải pháp: Mua hàng Dễ dàng Ngay tại Nhà (Easiest Way to Shop from Home).' )
insert into Founders(FounderName, FounderImg, FounderComment)
values (N'Tài Nguyễn - CoFounder', 'https://scontent.fdad3-4.fna.fbcdn.net/v/t1.15752-9/263360769_385088706747165_8413112806528853842_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=ae9488&_nc_ohc=fwurBh3xThAAX_1lvJD&tn=xKt1AG8JDbpebTqO&_nc_ht=scontent.fdad3-4.fna&oh=03_AVK4u00RpdrWYUPp_6UeP0Tfc-pVBUCssZKhCHCLRCCrfA&oe=61E40979', N'Xin cảm ơn sự tin tưởng và ủng hộ của quý khách trong thời gian qua. Trân trọng!' )

 
--chart
insert into Charts(ChartMonth,ChartSumOfBill)
values(N'Tháng 11 - 2022', 20)
insert into Charts(ChartMonth,ChartSumOfBill)
values(N'Tháng 12 - 2022', 30)
insert into Charts(ChartMonth,ChartSumOfBill)
values(N'Tháng 1 - 2023', 20)

--money chart
insert into MoneyCharts(MoneyChartMonth,ChartSumOfMoney)
values(N'Tháng 11 - 2022', 40)
insert into MoneyCharts(MoneyChartMonth,ChartSumOfMoney)
values(N'Tháng 12 - 2022', 30)
insert into MoneyCharts(MoneyChartMonth,ChartSumOfMoney)
values(N'Tháng 1 - 2023', 20)

--user chart
insert into UserCharts(UserChartMonth,ChartSumOfUser)
values(N'Tháng 11 - 2022', 40)
insert into UserCharts(UserChartMonth,ChartSumOfUser)
values(N'Tháng 12 - 2022', 30)
insert into UserCharts(UserChartMonth,ChartSumOfUser)
values(N'Tháng 1 - 2023', 20)

--trigger insert
create trigger giamsoluong_insert
on CartDetails
for insert
as
update Products
set products.InStocks=products.InStocks
-inserted.Quantity
from products inner join inserted
on products.ProductId=inserted.ProductId
