GO
CREATE DATABASE eProject
GO
USE eProject
GO
CREATE TABLE bs_admin(
	bs_admin_id int PRIMARY KEY IDENTITY,
	bs_admin_fullname varchar(20) NOT NULL,
	bs_admin_username varchar(35) UNIQUE NOT NULL,
	bs_admin_password varchar(35) NOT NULL
)

GO
CREATE TABLE bs_admin_setting(
	bs_admin_setting_email varchar(50) NOT NULL,
	bs_admin_setting_payment_id varchar(50) NOT NULL,
	bs_admin_setting_date_format varchar(30) NOT NULL,
	bs_admin_setting_need_confirm_email int NOT NULL,
	bs_admin_setting_sitename varchar(50) NOT NULL,
	bs_admin_setting_siteurl varchar(50) NOT NULL,
	bs_admin_setting_favicon_url varchar(50) NOT NULL 
)

GO
CREATE TABLE bs_user(
	bs_user_id int PRIMARY KEY IDENTITY,
	bs_user_email varchar(50) UNIQUE NOT NULL,
	bs_user_firstname varchar(20) NOT NULL,
	bs_user_lastname varchar(20) NOT NULL,
	bs_user_status int NOT NULL,
	bs_user_username varchar(50) UNIQUE NOT NULL,
	bs_user_password varchar(35) NOT NULL,
	bs_user_date_registed datetime NOT NULL
)

GO
CREATE TABLE bs_addressbook(
	bs_addressbook_id int PRIMARY KEY IDENTITY,
	bs_addressbook_user_id int NOT NULL,
	bs_addressbook_firstname varchar(20) NOT NULL,
	bs_addressbook_lastname varchar(20) NOT NULL,
	bs_addressbook_address varchar(100) NOT NULL,
	bs_addressbook_city varchar(50) NOT NULL,
	bs_addressbook_country varchar(20) NOT NULL,
	bs_addressbook_phone varchar(20) NOT NULL,
	bs_addressbook_state varchar(20) NOT NULL,
	bs_addressbook_zipcode varchar(20) NOT NULL 
)

GO
CREATE TABLE bs_product(
	bs_product_id int PRIMARY KEY IDENTITY,
	bs_product_name varchar(50) NOT NULL,
	bs_product_price float NOT NULL,
	bs_product_description text NULL,
	bs_product_discount int,
	bs_product_image_url varchar(50),
	bs_product_in_stock int NOT NULL,
	bs_product_category_id int NULL
)

GO 
CREATE TABLE bs_product_info(
	bs_product_info_key varchar(20) NOT NULL,
	bs_product_info_value varchar(20) NOT NULL,
	bs_product_info_product_id int NOT NULL	
)

GO
CREATE TABLE bs_category(
	bs_category_id int PRIMARY KEY IDENTITY,
	bs_category_name varchar(50) NOT NULL,
	bs_category_parent_id int NULL,
	FOREIGN KEY	(bs_category_parent_id) REFERENCES bs_category(bs_category_id)
)

GO
CREATE TABLE bs_orders(
	bs_order_id int PRIMARY KEY,
	bs_order_email varchar(50) NOT NULL,
	bs_order_date datetime NOT NULL,
	bs_order_status int NOT NULL,
	bs_order_billing_address_id int NULL,
	bs_order_shipping_address_id int NULL,
	bs_order_payment_id int NOT NULL,
	bs_order_tracking_id int NOT NULL,
	bs_order_delivery_method_id int NULL,
	bs_order_user_id int NULL
)

GO
CREATE TABLE bs_orders_detail(
	bs_order_detail_id int PRIMARY KEY IDENTITY,
	bs_order_detail_quantity int NOT NULL,
	bs_order_detail_total float NOT NULL,
	bs_order_detail_product_id int NULL,
	bs_order_detail_order_id int NOT NULL
)

GO
CREATE TABLE bs_billing_address(
	bs_billing_address_id int PRIMARY KEY IDENTITY,
	bs_billing_address_address varchar(100) NOT NULL,
	bs_billing_address_city varchar(20) NOT NULL,
	bs_billing_address_country varchar(20) NOT NULL,
	bs_billing_address_firstname varchar(20) NOT NULL,
	bs_billing_address_lastname varchar(20) NOT NULL,
	bs_billing_address_state varchar(20) NOT NULL,
	bs_billing_address_zipcode varchar(20) NULL
)

GO
CREATE TABLE bs_shipping_address(
	bs_shipping_address_id int PRIMARY KEY IDENTITY,
	bs_shipping_address_address varchar(100) NOT NULL,
	bs_shipping_address_city varchar(20) NOT NULL,
	bs_shipping_address_country varchar(20) NULL,
	bs_shipping_address_firstname varchar(20) NOT NULL,
	bs_shipping_address_lastname varchar(20) NOT NULL,
	bs_shipping_address_state varchar(20) NOT NULL,
	bs_shipping_address_zipcode varchar(20) NULL,
	bs_shipping_address_phone varchar(20) NOT NULL
)

GO
CREATE TABLE bs_tracking(
	bs_tracking_id int PRIMARY KEY IDENTITY,
	bs_tracking_link varchar(50) NOT NULL,
	bs_tracking_order_id int NOT NULL
)

GO
CREATE TABLE bs_shipping_service(
	bs_shipping_service_id int PRIMARY KEY IDENTITY,
	bs_shipping_service_name varchar(50) NOT NULL
)

GO
CREATE TABLE bs_region(
	bs_region_id int PRIMARY KEY IDENTITY,
	bs_region_name varchar(20) NOT NULL
)

GO
CREATE TABLE bs_country(
	bs_country_id int PRIMARY KEY IDENTITY,
	bs_country_code varchar(10) NOT NULL,
	bs_country_name varchar(20) NOT NULL UNIQUE,
	bs_country_region_id int NULL
)

GO
CREATE TABLE bs_shipping_price(
	bs_shipping_price_price float NOT NULL,
	bs_shipping_price_region_id int NOT NULL,
	bs_shipping_price_service_id int NOT NULL
)

GO
CREATE TABLE bs_admin_activity_log(
	bs_admin_activity_log_id int PRIMARY KEY IDENTITY,
	bs_admin_activity_log_username varchar(35) FOREIGN KEY REFERENCES bs_admin(bs_admin_username) ON UPDATE CASCADE ON DELETE SET NULL,
	bs_admin_activity_log_description varchar(200) NOT NULL,
	bs_admin_activity_log_time datetime NOT NULL
)

GO
CREATE TABLE bs_payment(
	bs_payment_id int PRIMARY KEY IDENTITY,
	bs_payment_name varchar(20)
)

GO
ALTER TABLE bs_addressbook ADD FOREIGN KEY (bs_addressbook_user_id) REFERENCES bs_user(bs_user_id) ON UPDATE CASCADE ON DELETE CASCADE

GO
ALTER TABLE bs_product ADD FOREIGN KEY (bs_product_category_id) REFERENCES bs_category(bs_category_id) ON UPDATE CASCADE ON DELETE SET NULL

GO
ALTER TABLE bs_product_info ADD FOREIGN KEY (bs_product_info_product_id) REFERENCES bs_product(bs_product_id) ON UPDATE CASCADE ON DELETE CASCADE

GO
ALTER TABLE bs_orders_detail ADD FOREIGN KEY (bs_order_detail_order_id) REFERENCES bs_orders(bs_order_id) ON UPDATE CASCADE ON DELETE CASCADE

GO
ALTER TABLE bs_orders_detail ADD FOREIGN KEY (bs_order_detail_product_id) REFERENCES bs_product(bs_product_id) ON UPDATE CASCADE ON DELETE SET NULL

GO

ALTER TABLE bs_tracking ADD FOREIGN KEY (bs_tracking_order_id) REFERENCES bs_orders(bs_order_id) ON UPDATE CASCADE ON DELETE CASCADE

GO
ALTER TABLE bs_shipping_address ADD FOREIGN KEY (bs_shipping_address_country) REFERENCES bs_country(bs_country_name) ON UPDATE CASCADE ON DELETE SET NULL

GO
ALTER TABLE bs_country ADD FOREIGN KEY (bs_country_region_id) REFERENCES bs_region(bs_region_id) ON UPDATE CASCADE ON DELETE SET NULL

GO
ALTER TABLE bs_orders ADD FOREIGN KEY (bs_order_billing_address_id) REFERENCES bs_billing_address(bs_billing_address_id)

GO
ALTER TABLE bs_orders ADD FOREIGN KEY (bs_order_shipping_address_id) REFERENCES bs_shipping_address(bs_shipping_address_id)


GO
ALTER TABLE bs_orders ADD FOREIGN KEY (bs_order_delivery_method_id) REFERENCES bs_shipping_service(bs_shipping_service_id) ON UPDATE CASCADE ON DELETE SET NULL

GO
ALTER TABLE bs_shipping_price ADD FOREIGN KEY (bs_shipping_price_region_id) REFERENCES bs_region(bs_region_id) ON UPDATE CASCADE ON DELETE CASCADE

GO
ALTER TABLE bs_shipping_price ADD FOREIGN KEY (bs_shipping_price_service_id) REFERENCES bs_shipping_service(bs_shipping_service_id) ON UPDATE CASCADE ON DELETE CASCADE

GO
INSERT INTO bs_admin(bs_admin_fullname,bs_admin_username,bs_admin_password) VALUES('nguyen cong minh','minhnc','123456')
INSERT INTO bs_admin(bs_admin_fullname,bs_admin_username,bs_admin_password) VALUES('vu van tiep','tiepvv','123456')
INSERT INTO bs_admin(bs_admin_fullname,bs_admin_username,bs_admin_password) VALUES('trinh duc trung','trungtd','123456')

GO
INSERT INTO bs_user(bs_user_email,bs_user_firstname,bs_user_lastname,bs_user_status,bs_user_username,bs_user_password,bs_user_date_registed) VALUES('minhnc0507@gmail.com','minh','cong','1','user1','123456','05/20/2013')
INSERT INTO bs_user(bs_user_email,bs_user_firstname,bs_user_lastname,bs_user_status,bs_user_username,bs_user_password,bs_user_date_registed) VALUES('minhnc_c00608@fpt.aptech.ac.vn','minh','nguyen','1','user2','123456','05/19/2013')

GO
INSERT INTO bs_admin_activity_log(bs_admin_activity_log_username,bs_admin_activity_log_description,bs_admin_activity_log_time) VALUES('minhnc','update order','05/20/2013')
INSERT INTO bs_admin_activity_log(bs_admin_activity_log_username,bs_admin_activity_log_description,bs_admin_activity_log_time) VALUES('tiepvv','xoa order','05/20/2013')
INSERT INTO bs_admin_activity_log(bs_admin_activity_log_username,bs_admin_activity_log_description,bs_admin_activity_log_time) VALUES('trungtd','them order','05/20/2013')
GO

INSERT INTO bs_billing_address(bs_billing_address_address,bs_billing_address_city,bs_billing_address_country,bs_billing_address_firstname,bs_billing_address_lastname,bs_billing_address_state,bs_billing_address_zipcode,bs_billing_address_order_id) VALUES('bach dang','hanoi','US','minh','nguyen cong','NY','1000','3')

GO
INSERT INTO bs_category(bs_category_name) VALUES('Sach')
INSERT INTO bs_category(bs_category_name,bs_category_parent_id) VALUES('Sach Giao Khoa','1')
INSERT INTO bs_category(bs_category_name,bs_category_parent_id) VALUES('Sach Giao Khoa','1')
INSERT INTO bs_category(bs_category_name) VALUES('But')
INSERT INTO bs_category(bs_category_name,bs_category_parent_id) VALUES('But Bi','2')
INSERT INTO bs_category(bs_category_name,bs_category_parent_id) VALUES('But Chi','2')

GO
INSERT INTO bs_region(bs_region_name) VALUES('Euro')
INSERT INTO bs_region(bs_region_name) VALUES('Asia')
INSERT INTO bs_region(bs_region_name) VALUES('American')

GO
INSERT INTO bs_country(bs_country_code,bs_country_name,bs_country_region_id) VALUES('01','Anh','1')
INSERT INTO bs_country(bs_country_code,bs_country_name,bs_country_region_id) VALUES('02','Pháp','1')
INSERT INTO bs_country(bs_country_code,bs_country_name,bs_country_region_id) VALUES('03','Mĩ','3')
INSERT INTO bs_country(bs_country_code,bs_country_name,bs_country_region_id) VALUES('04','Nhật','2')

GO
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('sach tieng viet lop 1',30.000,'/img/1.jpg',1,3)
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('sach tieng anh lop 1',30.000,'/img/1.jpg',0,3)
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('sach tieng duc lop 1',30.000,'/img/1.jpg',1,3)
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('sach tieng cuba lop 1',30.000,'/img/1.jpg',1,3)
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('sach lop 1',40.000,'/img/1.jpg',1,4)
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('sach lop 1',50.000,'/img/1.jpg',1,4)
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('sach lop 1',60.000,'/img/1.jpg',1,4)
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('pen of minh',60.000,'/img/1.jpg',1,5)
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('pen of trung',60.000,'/img/1.jpg',1,5)
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('pen of tiep',60.000,'/img/2.jpg',1,5)
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('pencil of tiep',60.000,'/img/2.jpg',1,6)
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('pencil of tiep',60.000,'/img/2.jpg',1,6)

GO
INSERT INTO bs_shipping_service(bs_shipping_service_name) VALUES('DHL Express')
INSERT INTO bs_shipping_service(bs_shipping_service_name) VALUES('TNT Express')
INSERT INTO bs_shipping_service(bs_shipping_service_name) VALUES('UFO Express')

GO
INSERT INTO bs_shipping_price VALUES(0,'2','1')
INSERT INTO bs_shipping_price VALUES(0,'2','2')
INSERT INTO bs_shipping_price VALUES(0,'2','3')
INSERT INTO bs_shipping_price VALUES(10.000,'1','1')
INSERT INTO bs_shipping_price VALUES(10.000,'1','2')
INSERT INTO bs_shipping_price VALUES(10.000,'1','3')
INSERT INTO bs_shipping_price VALUES(200.000,'3','1')
INSERT INTO bs_shipping_price VALUES(10.000,'3','2')
INSERT INTO bs_shipping_price VALUES(300.000,'3','3')

GO
INSERT INTO bs_product_info VALUES('Langugage','Vietnamese',1)
INSERT INTO bs_product_info VALUES('Pages','300',1)
INSERT INTO bs_product_info VALUES('Langugage','English',2)
INSERT INTO bs_product_info VALUES('Pages','400',2)
INSERT INTO bs_product_info VALUES('Langugage','Vietnamese',3)
INSERT INTO bs_product_info VALUES('Pages','3500',3)
INSERT INTO bs_product_info VALUES('Langugage','Vietnamese',4)
INSERT INTO bs_product_info VALUES('Pages','3600',4)
INSERT INTO bs_product_info VALUES('Langugage','Vietnamese',5)
INSERT INTO bs_product_info VALUES('Pages','3070',5)
INSERT INTO bs_product_info VALUES('Langugage','Vietnamese',6)
INSERT INTO bs_product_info VALUES('Pages','3030',6)
INSERT INTO bs_product_info VALUES('Langugage','Vietnamese',7)
INSERT INTO bs_product_info VALUES('Pages','3010',7)

GO
--view chi tiet san pham
CREATE PROCEDURE ViewProduct
	@product_id int
AS
BEGIN 
	SELECT bs_product_id AS ProductId,
	bs_product_name AS Name,
	bs_product_price AS Price,
	bs_product_description AS Descriptions,
	bs_product_discount AS Discount,
	bs_product_image_url AS ImageURL,
	bs_product_in_stock AS InStock,
	bs_product_category_id AS CategoryId
	FROM bs_product
	WHERE bs_product_id = @product_id
END

GO
--lay info cua product
CREATE PROCEDURE GetProductInfo
	@product_id int
AS
BEGIN
	SELECT bs_product_info_key AS InfoKey,bs_product_info_value AS InfoValue
	FROM bs_product_info
	WHERE bs_product_info_product_id = @product_id
END

GO
--lay 5 san pham random trong cung sub-category
CREATE PROCEDURE GetRelatedProductInSubcategory
	@product_id int
AS
BEGIN
	SELECT TOP 5 bs_product_id AS ProductId,
	bs_product_name AS Name,
	bs_product_price AS Price,
	bs_product_description AS Descriptions,
	bs_product_discount AS Discount,
	bs_product_image_url AS ImageURL,
	bs_product_in_stock AS InStock,
	bs_product_category_id AS CategoryId
	FROM bs_product
	WHERE bs_product_category_id = (SELECT bs_product_category_id FROM bs_product WHERE bs_product_id = @product_id)
	ORDER BY NEWID()
END

GO
--lay san pham trong cung category
CREATE PROCEDURE GetCategoryIdByParentId
	@category_id int
AS
BEGIN
	SELECT bs_category_id FROM bs_category WHERE bs_category_parent_id=@category_id
END

GO
--lay id 10 sp ban chay cung category
CREATE PROCEDURE GetHotProductId
	@product_id int
AS
BEGIN
	SELECT TOP 10 bs_product.bs_product_id, COUNT(bs_orders_detail.bs_order_detail_order_id) AS COUNT
	FROM bs_category 
	INNER JOIN
	bs_product ON bs_category.bs_category_id = bs_product.bs_product_category_id 
	INNER JOIN
    bs_orders_detail ON bs_product.bs_product_id = bs_orders_detail.bs_order_detail_product_id
	GROUP BY bs_product.bs_product_id, bs_category.bs_category_id
	HAVING bs_category.bs_category_id = (SELECT bs_product_category_id FROM bs_product WHERE bs_product_id = @product_id)
END
--lay thong tin tu id cua 3 sp hot vua tim dc
GO
CREATE PROCEDURE ViewHotProduct
	@product_id_1 int,
	@product_id_2 int,
	@product_id_3 int,
	@product_id_4 int,
	@product_id_5 int,
	@product_id_6 int,
	@product_id_7 int,
	@product_id_8 int,
	@product_id_9 int,
	@product_id_10 int
AS
BEGIN
	SELECT bs_product_id AS ProductId,
	bs_product_name AS Name,
	bs_product_price AS Price,
	bs_product_description AS Descriptions,
	bs_product_discount AS Discount,
	bs_product_image_url AS ImageURL,
	bs_product_in_stock AS InStock,
	bs_product_category_id AS CategoryId
	FROM bs_product
	WHERE bs_product_id = @product_id_1 
	OR bs_product_id = @product_id_2 
	OR bs_product_id = @product_id_3 
	OR bs_product_id = @product_id_4 
	OR bs_product_id = @product_id_5
	OR bs_product_id = @product_id_6
	OR bs_product_id = @product_id_7
	OR bs_product_id = @product_id_8
	OR bs_product_id = @product_id_9
	OR bs_product_id = @product_id_10
END

--lay category id cua 1 sp
GO
CREATE PROCEDURE GetCategoryIdByProductId
	@product_id int
AS
BEGIN
	SELECT bs_product_category_id
	FROM bs_products
	WHERE bs_product_id = @product_id
END	

--Add product
GO
CREATE PROCEDURE AddProduct
	@bs_product_name varchar(50),
	@bs_product_price float,
	@bs_product_description text,
	@bs_product_discount int,
	@bs_product_image_url varchar(50),
	@bs_product_in_stock int,
	@bs_product_category_id int
AS
BEGIN
	INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_description,bs_product_discount,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES(@bs_product_name,@bs_product_price,@bs_product_description,@bs_product_discount,@bs_product_image_url,@bs_product_in_stock,@bs_product_category_id)
END

--Update product
GO
CREATE PROCEDURE UpdateProduct
	@bs_product_id int,
	@bs_product_name varchar(50),
	@bs_product_price float,
	@bs_product_description text,
	@bs_product_discount int,
	@bs_product_image_url varchar(50),
	@bs_product_in_stock int,
	@bs_product_category_id int
AS
BEGIN
	UPDATE bs_product
	SET bs_product_name=@bs_product_name,
	bs_product_price=@bs_product_price,
	bs_product_description=@bs_product_description,
	bs_product_discount=@bs_product_discount,
	bs_product_image_url=@bs_product_image_url,
	bs_product_in_stock=@bs_product_in_stock,
	bs_product_category_id=@bs_product_category_id
	WHERE bs_product_id=@bs_product_id
END

--Delete product
GO
CREATE PROCEDURE DeleteProduct
	@product_id int
AS
BEGIN
	DELETE FROM bs_product
	WHERE bs_product_id = @product_id
END

--thong ke thu nhap trong 1 khoang
GO
CREATE PROCEDURE Statistics_income
	@date_from datetime, --ngay bat dau
	@date_to datetime --ngay ket thuc
AS
BEGIN
	SELECT bs_orders.bs_order_date, SUM(bs_orders_detail.bs_order_detail_total) AS Income
	FROM bs_orders INNER JOIN bs_orders_detail ON bs_orders.bs_order_id = bs_orders_detail.bs_order_detail_order_id
	GROUP BY bs_orders.bs_order_date
	HAVING bs_orders.bs_order_date BETWEEN @date_from AND @date_to
END
--Vi du cho cai tren
--SELECT     bs_orders.bs_order_date, SUM(bs_orders_detail.bs_order_detail_total) AS Income
--FROM         bs_orders INNER JOIN
--                      bs_orders_detail ON bs_orders.bs_order_id = bs_orders_detail.bs_order_detail_order_id
--GROUP BY bs_orders.bs_order_date
--HAVING      (bs_orders.bs_order_date BETWEEN '20130526' AND '20130530')

--thong ke san pham ban chay
GO
CREATE PROCEDURE Statistics_hotproduct
	@number int
AS
BEGIN
	SELECT TOP (@number) bs_product.bs_product_name, bs_product.bs_product_id, COUNT(DISTINCT bs_orders_detail.bs_order_detail_order_id) AS CountOrder
	FROM bs_orders INNER JOIN
		 bs_orders_detail ON bs_orders.bs_order_id = bs_orders_detail.bs_order_detail_order_id INNER JOIN
		 bs_product ON bs_orders_detail.bs_order_detail_product_id = bs_product.bs_product_id INNER JOIN
         bs_product_info ON bs_product.bs_product_id = bs_product_info.bs_product_info_product_id
	GROUP BY bs_product.bs_product_name, bs_product.bs_product_id
END
--Vi du cho cai tren
--SELECT     TOP (3) bs_product.bs_product_name, bs_product.bs_product_id, COUNT(DISTINCT bs_orders_detail.bs_order_detail_order_id) AS CountOrder
--FROM         bs_orders INNER JOIN
--                      bs_orders_detail ON bs_orders.bs_order_id = bs_orders_detail.bs_order_detail_order_id INNER JOIN
--                      bs_product ON bs_orders_detail.bs_order_detail_product_id = bs_product.bs_product_id INNER JOIN
--                      bs_product_info ON bs_product.bs_product_id = bs_product_info.bs_product_info_product_id
--GROUP BY bs_product.bs_product_name, bs_product.bs_product_id

--thong ke order
GO
CREATE PROCEDURE Statistics_order
	@date_from datetime,
	@date_to datetime
AS
BEGIN
	SELECT bs_order_date, COUNT(bs_order_id) AS CountOrder
	FROM bs_orders
	GROUP BY bs_order_date
	HAVING bs_orders.bs_order_date BETWEEN @date_from AND @date_to 
END
--Vi du
--SELECT     bs_order_date, COUNT(bs_order_id) AS CountOrder
--FROM         bs_orders
--GROUP BY bs_order_date
--HAVING      (bs_orders.bs_order_date BETWEEN '20130526' AND '20130530') 

--Load categories
GO
CREATE PROCEDURE LoadCategories
AS
BEGIN
select root.bs_category_id as root_id
	 , root.bs_category_name as root_name
	 , down1.bs_category_id as down1_id
     , down1.bs_category_name as down1_name
     , down2.bs_category_id as down2_id
     , down2.bs_category_name as down2_name
  from bs_category as root
left outer
  join bs_category as down1
    on down1.bs_category_parent_id = root.bs_category_id
left outer
  join bs_category as down2
    on down2.bs_category_parent_id = down1.bs_category_id
 where root.bs_category_parent_id is null
 order 
    by root_name 
     , down1_name
     , down2_name
END

--Load 8 random product
GO
CREATE PROCEDURE LoadProduct
	@number int
AS
BEGIN
	SELECT TOP (@number) bs_product_id, bs_product_name, bs_product_price, bs_product_description, bs_product_discount, bs_product_image_url, bs_product_in_stock, bs_product_category_id
	FROM bs_product
	ORDER BY NEWID()
END

--edit 04/06/2013
--Load thong tin thu nhap trong 1 ngay
GO
CREATE PROCEDURE GetDetailIncomeByPeriod
	@date_from datetime,
	@date_to datetime
AS
BEGIN
	SELECT bs_orders_detail.bs_order_detail_order_id, bs_billing_address.bs_billing_address_firstname, bs_billing_address.bs_billing_address_lastname, SUM(bs_orders_detail.bs_order_detail_total) AS Income, bs_orders.bs_order_date
	FROM bs_billing_address INNER JOIN
         bs_orders ON bs_billing_address.bs_billing_address_id = bs_orders.bs_order_billing_address_id INNER JOIN
         bs_orders_detail ON bs_orders.bs_order_id = bs_orders_detail.bs_order_detail_order_id
	GROUP BY bs_orders_detail.bs_order_detail_order_id, bs_orders.bs_order_date, bs_billing_address.bs_billing_address_firstname, bs_billing_address.bs_billing_address_lastname
	HAVING (bs_orders.bs_order_date BETWEEN @date_from AND @date_to)
END

--exec GetDetailIncomeByPeriod '20130527','20130529'
--SELECT     bs_orders_detail.bs_order_detail_order_id, bs_billing_address.bs_billing_address_firstname, bs_billing_address.bs_billing_address_lastname, SUM(bs_orders_detail.bs_order_detail_total) AS Income, bs_orders.bs_order_date
--FROM            bs_billing_address INNER JOIN
--                         bs_orders ON bs_billing_address.bs_billing_address_id = bs_orders.bs_order_billing_address_id INNER JOIN
--                         bs_orders_detail ON bs_orders.bs_order_id = bs_orders_detail.bs_order_detail_order_id
--GROUP BY bs_orders_detail.bs_order_detail_order_id, bs_orders.bs_order_date, bs_billing_address.bs_billing_address_firstname, bs_billing_address.bs_billing_address_lastname
--HAVING      (bs_orders.bs_order_date BETWEEN '20130527' AND '20130528')

--Tim kiem san pham
GO
CREATE PROCEDURE SearchProduct
	@input varchar(50)
AS
BEGIN
	SELECT * 
	FROM bs_product 
	WHERE bs_product_name LIKE '%'+@input+'%' OR bs_product_price LIKE '%'+@input+'%' OR bs_product_description LIKE '%'+@input+'%' OR bs_product_discount LIKE '%'+@input+'%' OR bs_product_category_id LIKE '%'+@input+'%'
END

--Tim kiem don hang theo status
GO
CREATE PROCEDURE SearchOrderByStatus
	@date_from datetime,
	@date_to datetime,
	@status varchar(50)
AS
BEGIN
	SELECT bs_order_id, bs_order_date, bs_order_status, bs_order_user_id 
	FROM bs_orders 
	WHERE bs_order_status = @status AND bs_order_date BETWEEN @date_from AND @date_to
END

--Tim don hang trong 1 khoang
GO
CREATE PROCEDURE SearchOrderByTime
	@date_from datetime,
	@date_to datetime
AS
BEGIN
	SELECT bs_order_id, bs_order_date, bs_order_status, bs_order_user_id 
	FROM bs_orders 
	WHERE bs_order_date BETWEEN @date_from AND @date_to
END

--Sua don hang
GO
CREATE PROCEDURE UpdateStatusOrder
	@order_id int,
	@status int
AS
BEGIN
	UPDATE bs_orders
	SET bs_order_status = @status
	WHERE bs_order_id = @order_id
END

--Edit 0506
--Lay order qua id
GO
CREATE PROCEDURE GetOrderById
	@id int
AS
BEGIN
	SELECT bs_order_id AS ID, bs_order_email AS Email, bs_order_date AS OrderDate, bs_order_status AS OrderStatus, bs_order_billing_address_id AS BillingID, bs_order_shipping_address_id AS ShippingID, bs_order_payment_id AS PaymentID, bs_order_delivery_method_id AS DeliveryID, bs_order_user_id AS UserID
	FROM bs_orders
	WHERE bs_order_id = @id
END

--Phan trang sp theo category
GO
CREATE PROCEDURE GetPageProductByCategory
@currPage int,-- trang hiện tại
@recodperpage int, -- số dòng trên 1 trang
@categoryId int
AS
Begin
    Begin
    WITH Temp AS
    (
    SELECT ROW_NUMBER()
    OVER(ORDER BY bs_product_id ) AS Row,bs_product_id, bs_product_name, bs_product_price, bs_product_description, bs_product_discount, bs_product_image_url, bs_product_in_stock, bs_product_category_id
    FROM bs_product
	WHERE bs_product_category_id = @categoryId
    ) 
    Select * From Temp
    Where Row Between (@currPage - 1)*@recodperpage+1 AND @currPage*@recodperpage
    END
END
--execute GetPageProductByCategory 1,2,5

--Phan trang order theo status
GO
CREATE PROCEDURE GetPageStatusOrder
@currPage int,-- trang hiện tại
@recodperpage int, -- số dòng trên 1 trang
@date_from datetime,
@date_to datetime
AS
Begin
    Begin
    WITH Temp AS
    (
    SELECT ROW_NUMBER()
    OVER(ORDER BY bs_order_status ) AS Row, bs_order_id AS ID, bs_order_email AS Email, bs_order_date AS OrderDate, bs_order_status AS OrderStatus, bs_order_billing_address_id AS BillingID, bs_order_shipping_address_id AS ShippingID, bs_order_payment_id AS PaymentID, bs_order_delivery_method_id AS DeliveryID, bs_order_user_id AS UserID
    FROM bs_orders
	WHERE bs_order_date BETWEEN @date_from AND @date_to
    ) 
    Select * From Temp
    Where Row Between (@currPage - 1)*@recodperpage+1 AND @currPage*@recodperpage
    END
END
--exec GetPageStatusOrder 2,2,'20130527','20130528'

--Register
GO
CREATE PROCEDURE Regiter
	@email varchar(50),
	@firstname varchar(20),
	@lastname varchar(20),
	@status int,
	@username varchar(50),
	@password varchar(35),
	@date datetime
AS
BEGIN
	INSERT INTO bs_user(bs_user_email,bs_user_firstname,bs_user_lastname,bs_user_status,bs_user_username,bs_user_password,bs_user_date_registed) VALUES(@email,@firstname,@lastname,@status,@username,@password,@date)
END

--Them shipping
GO
CREATE PROCEDURE AddShippingAddress
	@address varchar(100),
	@city varchar(20),
	@country varchar(20),
	@firstname varchar(20),
	@lastname varchar(20),
	@state varchar(20),
	@zipcode varchar(20),
	@phone varchar(20)
AS
BEGIN
	INSERT INTO bs_shipping_address(bs_shipping_address_address,bs_shipping_address_city,bs_shipping_address_country,bs_shipping_address_firstname,bs_shipping_address_lastname,bs_shipping_address_state,bs_shipping_address_zipcode,bs_shipping_address_phone) VALUES(@address,@city,@country,@firstname,@lastname,@state,@zipcode,@phone)
END

--Them billing
GO
CREATE PROCEDURE AddBillingAddress
	@address varchar(100),
	@city varchar(20),
	@country varchar(20),
	@firstname varchar(20),
	@lastname varchar(20),
	@state varchar(20),
	@zipcode varchar(20)
AS
BEGIN
	INSERT INTO bs_billing_address(bs_billing_address_address,bs_billing_address_city,bs_billing_address_country,bs_billing_address_firstname,bs_billing_address_lastname,bs_billing_address_state,bs_billing_address_zipcode) VALUES(@address,@city,@country,@firstname,@lastname,@state,@zipcode)
END





CREATE PROCEDURE LoginPROC
	@email_login varchar(50),
	@password_login varchar(35)
AS
BEGIN
	SELECT bs_user_email AS 'Email', 
			bs_user_id AS 'ID', 
			bs_user_firstname AS 'First Name', 
			bs_user_lastname AS 'Last Name',
			bs_user_status AS 'Status',
			bs_user_username AS 'Username',
			bs_user_date_registed AS 'Date Registered'
	FROM bs_user WHERE bs_user_email = @email_login AND bs_user_password = @password_login
END

EXEC LoginPROC 'minhnc0507@gmail.com', '1924658211'

--------END LOGIN

--------BEGIN CHANGE PASSWORD
CREATE PROCEDURE ChangePassword
	@email_login varchar(50),
	@password_login varchar(35),
	@new_password varchar(35)
AS
BEGIN
	UPDATE bs_user SET bs_user_password = @new_password 
	WHERE
		bs_user_email = @email_login AND
		bs_user_password = @password_login
END

EXEC ChangePassword 'minhnc0507@gmail.com', '123456', '1924658211'
--------END CHANGE PASSWORD

--------BEGIN UPDATE STATUS 
CREATE PROCEDURE ChangeStatus
	@user_id int,
	@new_status int
AS
BEGIN
	UPDATE bs_user SET bs_user_status = @new_status
	WHERE bs_user_id = @user_id
END


---------BEGIN GET BILLING ORDER
CREATE PROCEDURE GetBilling
	@order_id int 
AS
BEGIN
	SELECT bs_billing_address.bs_billing_address_id AS 'ID',
		   bs_billing_address.bs_billing_address_address AS 'Address',
		   bs_billing_address.bs_billing_address_city AS 'City',
		   bs_billing_address.bs_billing_address_country AS 'Country',
		   bs_billing_address.bs_billing_address_firstname AS 'First Name',
		   bs_billing_address.bs_billing_address_lastname AS 'Last Name',
		   bs_billing_address.bs_billing_address_state AS 'State',
		   bs_billing_address.bs_billing_address_zipcode AS 'Zipcode'
	FROM bs_billing_address INNER JOIN bs_orders ON bs_billing_address.bs_billing_address_id = bs_orders.bs_order_billing_address_id
	WHERE        (bs_orders.bs_order_id = @order_id)
END




CREATE PROCEDURE GetShipping
	@order_id int 
AS
BEGIN
	SELECT          bs_shipping_address.bs_shipping_address_id AS 'ID', 
					bs_shipping_address.bs_shipping_address_address AS 'Address', 
					bs_shipping_address.bs_shipping_address_city AS 'City', 
					bs_shipping_address.bs_shipping_address_country AS 'Country', 
					bs_shipping_address.bs_shipping_address_firstname AS 'First Name', 
					bs_shipping_address.bs_shipping_address_lastname AS 'Last Name', 
					bs_shipping_address.bs_shipping_address_state AS 'State', 
					bs_shipping_address.bs_shipping_address_zipcode AS 'Zipcode', 
					bs_shipping_address.bs_shipping_address_phone AS 'Phone'
	FROM            bs_orders INNER JOIN
					bs_shipping_address ON bs_orders.bs_order_shipping_address_id = dbo.bs_shipping_address.bs_shipping_address_id
	WHERE        (bs_orders.bs_order_id = @order_id)
END




CREATE PROCEDURE GetOrderDetail
	@order_id int 
AS
BEGIN
	SELECT bs_order_detail_id AS 'ID',
		   bs_order_detail_quantity AS 'Quantity',
		   bs_order_detail_total AS 'Total',
		   bs_order_detail_product_id AS 'Product Id'
	FROM bs_orders_detail WHERE bs_order_detail_id = @order_id
END


CREATE PROCEDURE SearchProductWithCategoryId
	@input varchar(50),
	@categoryId int 

AS
BEGIN
	SELECT * 
	FROM bs_product 
	WHERE (bs_product_name LIKE '%'+@input+'%' OR bs_product_price LIKE '%'+@input+'%' OR bs_product_description LIKE '%'+@input+'%' OR bs_product_discount LIKE '%'+@input+'%') AND bs_product_category_id = @categoryId
END

EXEC SearchProductWithCategoryId 'sach', 3

CREATE PROCEDURE GetAllCategory

AS
BEGIN
	SELECT * 
	FROM bs_category WHERE bs_category_parent_id IS null
END



CREATE PROCEDURE GetRandomProduct
	@total_item int
AS
BEGIN
	SET Rowcount @total_item
	SELECT * FROM bs_product ORDER BY NEWID()
END

EXEC GetRandomProduct 8