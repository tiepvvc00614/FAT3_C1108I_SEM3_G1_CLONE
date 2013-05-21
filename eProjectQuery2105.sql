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
	bs_user_email varchar(50) NOT NULL,
	bs_user_firstname varchar(20) NOT NULL,
	bs_user_lastname varchar(20) NOT NULL,
	bs_user_status int NOT NULL,
	bs_user_username varchar(50) NOT NULL,
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
	bs_billing_address_zipcode varchar(20) NULL,
	bs_billing_address_order_id int NOT NULL
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
	bs_shipping_address_phone varchar(20) NOT NULL,
	bs_shipping_address_order_id int NOT NULL
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

DROP TABLE bs_country

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
ALTER TABLE bs_admin ADD UNIQUE(bs_admin_username)

GO
ALTER TABLE bs_orders ADD bs_order_user_id int NULL

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
ALTER TABLE bs_billing_address ADD FOREIGN KEY (bs_billing_address_order_id) REFERENCES bs_orders(bs_order_id) ON UPDATE CASCADE ON DELETE CASCADE

GO
ALTER TABLE bs_shipping_address ADD FOREIGN KEY (bs_shipping_address_order_id) REFERENCES bs_orders(bs_order_id) ON UPDATE CASCADE ON DELETE CASCADE

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

INSERT INTO bs_admin(bs_admin_fullname,bs_admin_username,bs_admin_password) VALUES('nguyen cong minh','minhnc','123456')
INSERT INTO bs_admin(bs_admin_fullname,bs_admin_username,bs_admin_password) VALUES('vu van tiep','tiepvv','123456')
INSERT INTO bs_admin(bs_admin_fullname,bs_admin_username,bs_admin_password) VALUES('trinh duc trung','trungtd','123456')

INSERT INTO bs_user(bs_user_email,bs_user_firstname,bs_user_lastname,bs_user_status,bs_user_username,bs_user_password,bs_user_date_registed) VALUES('minhnc0507@gmail.com','minh','cong','1','user1','123456','05/20/2013')
INSERT INTO bs_user(bs_user_email,bs_user_firstname,bs_user_lastname,bs_user_status,bs_user_username,bs_user_password,bs_user_date_registed) VALUES('minhnc_c00608@fpt.aptech.ac.vn','minh','nguyen','1','user2','123456','05/19/2013')

INSERT INTO bs_admin_activity_log(bs_admin_activity_log_username,bs_admin_activity_log_description,bs_admin_activity_log_time) VALUES('minhnc','update order','05/20/2013')
INSERT INTO bs_admin_activity_log(bs_admin_activity_log_username,bs_admin_activity_log_description,bs_admin_activity_log_time) VALUES('tiepvv','xoa order','05/20/2013')
INSERT INTO bs_admin_activity_log(bs_admin_activity_log_username,bs_admin_activity_log_description,bs_admin_activity_log_time) VALUES('trungtd','them order','05/20/2013')

INSERT INTO bs_billing_address(bs_billing_address_address,bs_billing_address_city,bs_billing_address_country,bs_billing_address_firstname,bs_billing_address_lastname,bs_billing_address_state,bs_billing_address_zipcode,bs_billing_address_order_id) VALUES('bach dang','hanoi','US','minh','nguyen cong','NY','1000','3')

INSERT INTO bs_category(bs_category_name) VALUES('sách')
INSERT INTO bs_category(bs_category_name,bs_category_parent_id) VALUES('sách giáo khoa','3')
INSERT INTO bs_category(bs_category_name,bs_category_parent_id) VALUES('sách tham khảo','3')
INSERT INTO bs_category(bs_category_name) VALUES('bút')
INSERT INTO bs_category(bs_category_name,bs_category_parent_id) VALUES('bút bi','6')
INSERT INTO bs_category(bs_category_name,bs_category_parent_id) VALUES('bút chì','6')

INSERT INTO bs_region(bs_region_name) VALUES('Euro')
INSERT INTO bs_region(bs_region_name) VALUES('Asia')
INSERT INTO bs_region(bs_region_name) VALUES('American')

INSERT INTO bs_country(bs_country_code,bs_country_name,bs_country_region_id) VALUES('01','Anh','1')
INSERT INTO bs_country(bs_country_code,bs_country_name,bs_country_region_id) VALUES('02','Pháp','1')
INSERT INTO bs_country(bs_country_code,bs_country_name,bs_country_region_id) VALUES('03','Mĩ','3')
INSERT INTO bs_country(bs_country_code,bs_country_name,bs_country_region_id) VALUES('04','Nhật','2')

INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('sach tieng viet lop 1',30.000,'./img/sanpham/bia_sach_tieng_viet_lop_mot.jpg',1,4)
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('sach tieng anh lop 1',30.000,'./img/sanpham/bia_sach_tieng_viet_lop_mot.jpg',0,4)
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('sach tieng duc lop 1',30.000,'./img/sanpham/bia_sach_tieng_viet_lop_mot.jpg',1,4)
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('sach tieng cuba lop 1',30.000,'./img/sanpham/bia_sach_tieng_viet_lop_mot.jpg',1,4)
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('sach lop 1',40.000,'./img/sanpham/bia_sach_tieng_viet_lop_mot.jpg',1,4)
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('sach lop 1',50.000,'./img/sanpham/bia_sach_tieng_viet_lop_mot.jpg',1,4)
INSERT INTO bs_product(bs_product_name,bs_product_price,bs_product_image_url,bs_product_in_stock,bs_product_category_id) VALUES('sach lop 1',60.000,'./img/sanpham/bia_sach_tieng_viet_lop_mot.jpg',1,4)

INSERT INTO bs_shipping_price VALUES(0,'2','1')
INSERT INTO bs_shipping_price VALUES(0,'2','2')
INSERT INTO bs_shipping_price VALUES(0,'2','3')
INSERT INTO bs_shipping_price VALUES(10.000,'1','1')
INSERT INTO bs_shipping_price VALUES(10.000,'1','2')
INSERT INTO bs_shipping_price VALUES(10.000,'1','3')
INSERT INTO bs_shipping_price VALUES(200.000,'3','1')
INSERT INTO bs_shipping_price VALUES(10.000,'3','2')
INSERT INTO bs_shipping_price VALUES(300.000,'3','3')


INSERT INTO bs_shipping_service(bs_shipping_service_name) VALUES('DHL Express')
INSERT INTO bs_shipping_service(bs_shipping_service_name) VALUES('TNT Express')
INSERT INTO bs_shipping_service(bs_shipping_service_name) VALUES('UFO Express')

