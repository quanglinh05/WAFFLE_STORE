use master
go
create database VansStore

use VansStore
go
set ansi_nulls on
go
set quoted_identifier on
go
create table Account(
	id int identity(1,1) not null,
	username nvarchar(255) null,
	[password] nvarchar(255) null,
	displayName nvarchar(255) null,
	[address] nvarchar(255) null,
	email nvarchar(255) null,
	phone nvarchar(255) null,
constraint [PK_Account] primary key clustered 
(
	id asc
)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]
)on [primary]
go
set ansi_nulls on
go
set quoted_identifier on
go

create table Category (
	id INT identity(1,1) not null,
	name NVARCHAR(255)
constraint [PK_Category] primary key clustered 
(
	id asc
)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]
)on [primary]
go
set ansi_nulls on
go
set quoted_identifier on
go

create table OrderDetail(
	id int identity(1,1) not null,
	order_id int null,
	productName nvarchar(255) null,
	productImage nvarchar(255) null,
	productPrice float null,
	quantity int null
constraint [PK_OrderDetail] primary key clustered 
(
	id asc
)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]
)on [primary]
go
set ansi_nulls on
go
set quoted_identifier on
go

create table Orders(
	id int identity(1,1) not null,
	account_id int null,
	totalPrice float null,
	note text null,
	created_date date null,
	shipping_id int null
constraint [PK_Orders] primary key clustered 
(
	id asc
)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]
)on [primary] textimage_on [primary]
go
set ansi_nulls on
go
set quoted_identifier on
go

create table Product (
	id INT IDENTITY(1,1) NOT NULL,
	name NVARCHAR(255) NULL,
	quantity INT NULL,
	price float NULL,
	description NVARCHAR(255) NULL,
	imageUrl NVARCHAR(255) NULL,
	category_id INT NULL
constraint [PK_Product] primary key clustered 
(
	id asc
)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]
)on [primary]
go
set ansi_nulls on
go
set quoted_identifier on
go

create table Shipping(
	id int identity(1,1) not null,
	[name] nvarchar(255) null,
	phone nvarchar(255) null,
	[address] nvarchar(255) null,
constraint [PK_Shipping] primary key clustered 
(
	id asc
)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]
)on [primary]
go

set identity_insert Category on

insert into Category (id, name) values (1, 'Vans Authentic');
insert into Category (id, name) values (2, 'Vans Old skool');
insert into Category (id, name) values (3, 'Vans Slip-on');
insert into Category (id, name) values (4, 'Vans SK8 - Hi');
insert into Category (id, name) values (5, 'Vans Vault');
set identity_insert Category off
go

SET IDENTITY_INSERT [dbo].[product] ON

insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (1, N'Vans Unisex UA Authentic Trainers', 17, 91.0, N'Displaced fracture of glenoid cavity of scapula, left shoulder, initial encounter for closed fracture', N'https://m.media-amazon.com/images/I/611qjqHZu2L._AC_UL320_.jpg', 1);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (2, N'Vans Unisex Authentic Skateboarding Shoes', 18, 96.7, N'Sympathetic uveitis', N'https://m.media-amazon.com/images/I/517yFca4vaL._AC_UL320_.jpg', 1);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (3, N'Vans Unisex-Adult Ua Authentic Trainers', 13, 60.7, N'Unspecified soft tissue disorder related to use, overuse and pressure, unspecified hand', N'https://m.media-amazon.com/images/I/610Jme9NlYL._AC_UL320_.jpg', 1);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (4, N'Basics Old Skool', 16, 73.0, N'Auditory recruitment, right ear', N'https://images.vans.com/is/image/Vans/VN000D3HY28-ALT1?hei=392&wid=390&qlt=85', 2);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (5, N'Canvas Old Skool', 6, 87.7, N'White, Disorders of visual pathways in (due to) inflammatory disorders, left side', N'https://images.vans.com/is/image/Vans/VN000D3HW00-ALT1?hei=392&wid=390&qlt=85', 2);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (6, N'Color Theory Old Skool', 18, 89.1, N'Other disorders of continuity of bone, left pelvic region and thigh', N'https://images.vans.com/is/image/Vans/VN0A5KRSYQW-HERO?hei=392&wid=390&qlt=85', 2);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (7, N'Old Skool Tapered', 9, 87.3, N'Multiple endocrine neoplasia [MEN] type IIA', N'https://images.vans.com/is/image/Vans/VN0A54F4BD2-HERO?hei=392&wid=390&qlt=85', 2);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (8, N'Old Skool Platform', 15, 54.6, N'Plasmodium vivax malaria with other complications', N'https://images.vans.com/is/image/Vans/VN0A5KRGBML-HERO?hei=392&wid=390&qlt=85', 2);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (9, N'Checkerboard Slip-on', 17, 96.0, N'Nondisplaced fracture of greater trochanter of unspecified femur, subsequent encounter for closed fracture with nonunion', N'https://images.vans.com/is/image/Vans/VN000EYEBWW-HERO?hei=700&wid=700&qlt=85', 3);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (10, N'Comfycush Slip-on, A', 6, 76.7, N'Complication of unspecified artery following a procedure, not elsewhere classified', N'https://images.vans.com/is/image/Vans/VN0A3WMDVND-ALT1?hei=392&wid=390&qlt=85', 3);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (11, N'Perf Leather Slip-on', 9, 62.3, N'Pneumonia due to Methicillin resistant Staphylococcus aureus', N'https://images.vans.com/is/image/Vans/VN000XG8DJ6-ALT1?hei=392&wid=390&qlt=85', 3);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (12, N'Classisc Slip-on', 11, 77.7, N'Laceration without foreign body of right index finger with damage to nail, initial encounter', N'https://images.vans.com/is/image/Vans/VN0A4U38IYP-ALT1?hei=392&wid=390&qlt=85', 3);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (13, N'Retro Floral Classic Slip-on', 18, 75.5, N'Salter-Harris Type I physeal fracture of unspecified calcaneus, sequela', N'https://images.vans.com/is/image/Vans/VN0A5JMHB0G-ALT1?hei=392&wid=390&qlt=85', 3);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (14, N'Canvas SK8-Hi', 20, 51.1, N'Corrosion of first degree of unspecified palm, subsequent encounter', N'https://images.vans.com/is/image/Vans/VN000TS9BJ4-ALT1?hei=392&wid=390&qlt=85', 4);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (15, N'Classic Sport SK8-Hi', 12, 85.1, N'Unspecified occupant of pick-up truck or van injured in collision with other motor vehicles in traffic accident', N'https://images.vans.com/is/image/Vans/VN0A32QG9YG-ALT1?hei=392&wid=390&qlt=85', 4);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (16, N'Canvas SK8-Hi Tapered', 7, 62.5, N'Superficial foreign body of right back wall of thorax', N'https://images.vans.com/is/image/Vans/VN0A4U16L5R-ALT1?hei=392&wid=390&qlt=85', 4);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (17, N'SK8-Hi Tapered', 16, 79.7, N'Unspecified injury of bladder, subsequent encounter', N'https://images.vans.com/is/image/Vans/VN0A4U16FS8-ALT1?hei=392&wid=390&qlt=85', 4);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (18, N'Made For the Maker SK8-Hi Reissue UC', 11, 82.2, N'Osteochondropathy, unspecified, left lower leg', N'https://images.vans.com/is/image/Vans/VN0A3MV5V7W-ALT1?hei=392&wid=390&qlt=85', 4);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (19, N'Eco Theory SK8-Hi Tapered', 13, 77.1, N'Indeterminate colitis', N'https://images.vans.com/is/image/Vans/VN0A4U16ASW-ALT1?hei=392&wid=390&qlt=85', 4);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (20, N'Lucid Skate SK8-Hi', 12, 95.8, N'Other intraarticular fracture of lower end of unspecified radius, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with nonunion', N'https://images.vans.com/is/image/Vans/VN0A5FCCAPH-ALT1?hei=392&wid=390&qlt=85', 4);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (21, N'Daniel Johnston Skate SK8-Hi', 10, 65.0, N'Unspecified injury of muscle and tendon of long flexor muscle of toe at ankle and foot level, left foot, initial encounter', N'https://images.vans.com/is/image/Vans/VN0A5FCCAO7-ALT1?hei=392&wid=390&qlt=85', 4);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (22, N'Vans Vault Old Skool Black 2022 - VN0A4P3XOIU', 17, 81.2, N'Palindromic rheumatism, hip', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/haven-vans-vault-ua-og-old-skool.jpg?v=1622881946000', 5);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (23, N'Vans Style 36 Decon Marshmallow, The', 10, 72.4, N'Abnormal histological findings in specimens from other organs, systems and tissues', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/32a1446346073fb4b75b4e35ed11c68c-jpeg.jpg?v=1654107484000', 5);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (24, N'Vans Vault OG Sk8 Black White', 18, 79.5, N'Legal intervention involving injury by rubber bullet, bystander injured', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/haven-vans-vault-ua-og-sk8-hi-lx-suede-canvas-black-true-white-1-2048x2048-progressive.jpg?v=1622881884000', 5);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (25, N'Vans Vault Slip On Checkerboard (2019)', 13, 60.9, N'Unspecified ectropion of right lower eyelid', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/8e1476794a3fa01540c1ce6d485300395b64d830.jpg?v=1620547494000', 5);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (26, N'Vans Vault Epoch Black / True White', 16, 90.5, N'Toxic effect of ketones, assault, subsequent encounter', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/4f27e6e2-c7f8-4bdd-9145-3cc4cbf4055b.jpg?v=1645344790000', 5);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (27, N'Vans Vault OG Authentic LX Antique White', 14, 78.4, N'Laceration of other muscles, fascia and tendons at forearm level, unspecified arm, sequela', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/9d9845b5-f335-4441-b006-b236ed4f029b.jpg?v=1643466052000', 5);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (28, N'Vans Vault OG Era LX Black Mulberry', 11, 83.1, N'Superficial foreign body of anus, sequela', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/f9ee4587-f56c-466c-8eaf-f471da25aa6a.jpg?v=1640950040000', 5);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (29, N'Vans Vault OG Style 36 LX Old Gold', 6, 72.5, N'Unspecified speech disturbances', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/cab0be68-2022-4403-bf71-0933c50fed22.jpg?v=1637165199000', 5);
insert into Product (id, [name], quantity, price, [description], imageUrl, category_id) values (30, N'Vans Vault Authentic Sweet Leaf Green', 8, 54.8, N'Pressure ulcer of head', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/5a4d152a-2d83-401b-81e5-8ac372170e37.jpg?v=1625739728000', 5);
SET IDENTITY_INSERT [dbo].[product] OFF

go
alter table OrderDetail with check add constraint FK_OrderDeta_order_30F848ED foreign key (order_id)
references Orders (id)
go
alter table OrderDetail check constraint FK_OrderDeta_order_30F848ED
go
alter table Orders with check add constraint FK_Orders_account_2F10007B foreign key (account_id)
references Account (id)
go
alter table Orders check constraint FK_Orders_account_2F10007B
go
alter table Orders with check add constraint FK_Orders_shipping_30042484 foreign key (shipping_id)
references Shipping (id)
go
alter table Orders check constraint FK_Orders_shipping_30042484
go
alter table Product with check add constraint FK_Product_categor_267ABA7A foreign key (category_id)
references Category (id)
go
alter table Product check constraint FK_Product_categor_267ABA7A
go 
use master
go
alter database VansStore set read_write
go




