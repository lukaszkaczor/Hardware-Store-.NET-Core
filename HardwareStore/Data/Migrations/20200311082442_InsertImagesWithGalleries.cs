using Microsoft.EntityFrameworkCore.Migrations;

namespace HardwareStore.Data.Migrations
{
    public partial class InsertImagesWithGalleries : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql(@"
            INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Apple iPhone 7 32GB Black1.jpg', N'/Assets/IMG/Apple iPhone 7 32GB Black/Apple iPhone 7 32GB Black1.jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Apple iPhone 7 32GB Black2.jpg', N'/Assets/IMG/Apple iPhone 7 32GB Black/Apple iPhone 7 32GB Black2.jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Apple iPhone 7 32GB Black3.jpg', N'/Assets/IMG/Apple iPhone 7 32GB Black/Apple iPhone 7 32GB Black3.jpg')
INSERT [dbo].[Galleries] ([Name]) VALUES ( N'Apple iPhone 7 32GB Black')
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (1, 1, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (1, 2, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (1, 3, 3)

INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'1.jpg', N'/Assets/IMG/Apple iPhone 7 128GB Silver/1.jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'2.jpg', N'/Assets/IMG/Apple iPhone 7 128GB Silver/2.jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'3.jpg', N'/Assets/IMG/Apple iPhone 7 128GB Silver/3.jpg')
INSERT [dbo].[Galleries] ([Name]) VALUES ( N'Apple iPhone 7 128GB Silver')
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (2, 4, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (2, 5, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (2, 6, 3)


INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Apple MacBook Pro1.jpg', N'/Assets/IMG/Apple MacBook Pro/Apple MacBook Pro1.jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Apple MacBook Pro2.jpg', N'/Assets/IMG/Apple MacBook Pro/Apple MacBook Pro2.jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Apple MacBook Pro3.jpg', N'/Assets/IMG/Apple MacBook Pro/Apple MacBook Pro3.jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Apple MacBook Pro4.jpg', N'/Assets/IMG/Apple MacBook Pro/Apple MacBook Pro4.jpg')
INSERT [dbo].[Galleries] ([Name]) VALUES ( N'Apple MacBook Pro')
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (3, 7, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (3, 8, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (3, 9, 3)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (3, 10, 4)



INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Apple Watch 31.jpg', N'/Assets/IMG/Apple Watch 3/Apple Watch 31.jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Apple Watch 32.jpg', N'/Assets/IMG/Apple Watch 3/Apple Watch 32.jpg')
INSERT [dbo].[Galleries] ([Name]) VALUES ( N'Apple Watch 3')
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (4, 11, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (4, 12, 2)


INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Apple Magic Mouse 2 1.jpg', N'/Assets/IMG/Apple Magic Mouse 2/Apple Magic Mouse 2 1.jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Apple Magic Mouse 2 2.jpg', N'/Assets/IMG/Apple Magic Mouse 2/Apple Magic Mouse 2 2.jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Apple Magic Mouse 2 3.jpg', N'/Assets/IMG/Apple Magic Mouse 2/Apple Magic Mouse 2 3.jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Apple Magic Mouse 2 4.jpg', N'/Assets/IMG/Apple Magic Mouse 2/Apple Magic Mouse 2 4.jpg')
INSERT [dbo].[Galleries] ([Name]) VALUES ( N'Apple Magic Mouse 2')
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (5, 13, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (5, 14, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (5, 15, 3)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (5, 16, 4)


INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'ASUS X543UA-DM1898 4417U8GB2561.jpg', N'/Assets/IMG/ASUS X543UA-DM1898 4417U8GB256/ASUS X543UA-DM1898 4417U8GB2561.jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'ASUS X543UA-DM1898 4417U8GB2562.jpg', N'/Assets/IMG/ASUS X543UA-DM1898 4417U8GB256/ASUS X543UA-DM1898 4417U8GB2562.jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'ASUS X543UA-DM1898 4417U8GB2563.jpg', N'/Assets/IMG/ASUS X543UA-DM1898 4417U8GB256/ASUS X543UA-DM1898 4417U8GB2563.jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'ASUS X543UA-DM1898 4417U8GB2564.jpg', N'/Assets/IMG/ASUS X543UA-DM1898 4417U8GB256/ASUS X543UA-DM1898 4417U8GB2564.jpg')
INSERT [dbo].[Galleries] ([Name]) VALUES ( N'ASUS X543UA-DM1898 4417U8GB256')
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (6, 17, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (6, 18, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (6, 19, 3)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (6, 20, 4)


INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Dell Alienware AW2518H (1).jpg', N'/Assets/IMG/Dell Alienware AW2518H/Dell Alienware AW2518H (1).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Dell Alienware AW2518H (2).jpg', N'/Assets/IMG/Dell Alienware AW2518H/Dell Alienware AW2518H (2).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Dell Alienware AW2518H (3).jpg', N'/Assets/IMG/Dell Alienware AW2518H/Dell Alienware AW2518H (3).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Dell Alienware AW2518H (4).jpg', N'/Assets/IMG/Dell Alienware AW2518H/Dell Alienware AW2518H (4).jpg')
INSERT [dbo].[Galleries] ([Name]) VALUES ( N'Dell Alienware AW2518H')
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (7, 21, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (7, 22, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (7, 23, 3)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (7, 24, 4)


INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny (1).jpg', N'/Assets/IMG/ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny/ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny (1).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny (2).jpg', N'/Assets/IMG/ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny/ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny (2).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny (3).jpg', N'/Assets/IMG/ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny/ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny (3).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny (4).jpg', N'/Assets/IMG/ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny/ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny (4).jpg')
INSERT [dbo].[Galleries] ([Name]) VALUES ( N'ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny')
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (8, 25, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (8, 26, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (8, 27, 3)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (8, 28, 4)


INSERT [dbo].[Images] ([Name], [Url]) VALUES (N' Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6 (1).jpg', N'/Assets/IMG/Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6/ Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6 (1).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N' Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6 (2).jpg', N'/Assets/IMG/Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6/ Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6 (2).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N' Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6 (3).jpg', N'/Assets/IMG/Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6/ Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6 (3).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N' Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6 (4).jpg', N'/Assets/IMG/Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6/ Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6 (4).jpg')
INSERT [dbo].[Galleries] ([Name]) VALUES ( N'Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6')
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (9, 29, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (9, 30, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (9, 31, 3)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (9, 32, 4)


INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N' ASUS ROG PG258Q (1).jpg', N'/Assets/IMG/ASUS ROG PG258Q/ ASUS ROG PG258Q (1).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N' ASUS ROG PG258Q (2).jpg', N'/Assets/IMG/ASUS ROG PG258Q/ ASUS ROG PG258Q (2).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N' ASUS ROG PG258Q (3).jpg', N'/Assets/IMG/ASUS ROG PG258Q/ ASUS ROG PG258Q (3).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N' ASUS ROG PG258Q (4).jpg', N'/Assets/IMG/ASUS ROG PG258Q/ ASUS ROG PG258Q (4).jpg')
INSERT [dbo].[Galleries] ([Name]) VALUES ( N'ASUS ROG PG258Q')
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (10, 33, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (10, 34, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (10, 35, 3)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (10, 36, 4)


INSERT [dbo].[Images] ([Name], [Url]) VALUES (N' Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB (1).jpg', N'/Assets/IMG/Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB/ Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB (1).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N' Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB (2).jpg', N'/Assets/IMG/Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB/ Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB (2).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N' Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB (3).jpg', N'/Assets/IMG/Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB/ Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB (3).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N' Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB (4).jpg', N'/Assets/IMG/Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB/ Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB (4).jpg')
INSERT [dbo].[Galleries] ([Name]) VALUES ( N'Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB')
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (11, 37, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (11, 38, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (11, 39, 3)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (11, 40, 4)


INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'ASUS PRIME B360M-A (1).jpg', N'/Assets/IMG/ASUS PRIME B360M-A/ASUS PRIME B360M-A (1).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'ASUS PRIME B360M-A (2).jpg', N'/Assets/IMG/ASUS PRIME B360M-A/ASUS PRIME B360M-A (2).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'ASUS PRIME B360M-A (3).jpg', N'/Assets/IMG/ASUS PRIME B360M-A/ASUS PRIME B360M-A (3).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'ASUS PRIME B360M-A (4).jpg', N'/Assets/IMG/ASUS PRIME B360M-A/ASUS PRIME B360M-A (4).jpg')
INSERT [dbo].[Galleries] ([Name]) VALUES ( N'ASUS PRIME B360M-A')
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (12, 37, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (12, 38, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (12, 39, 3)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (12, 40, 4)


INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Dell P2719H (1).jpg', N'/Assets/IMG/Dell P2719H/Dell P2719H (1).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Dell P2719H (3).jpg', N'/Assets/IMG/Dell P2719H/Dell P2719H (3).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Dell P2719H (4).jpg', N'/Assets/IMG/Dell P2719H/Dell P2719H (4).jpg')
INSERT [dbo].[Galleries] ([Name]) VALUES ( N'Dell P2719H')
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (13, 41, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (13, 42, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (13, 43, 3)


INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Gigabyte B450 AORUS PRO (1).jpg', N'/Assets/IMG/Gigabyte B450 AORUS PRO/Gigabyte B450 AORUS PRO (1).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Gigabyte B450 AORUS PRO (2).jpg', N'/Assets/IMG/Gigabyte B450 AORUS PRO/Gigabyte B450 AORUS PRO (2).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES ( N'Gigabyte B450 AORUS PRO (3).jpg', N'/Assets/IMG/Gigabyte B450 AORUS PRO/Gigabyte B450 AORUS PRO (3).jpg')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N'Gigabyte B450 AORUS PRO (4).jpg', N'/Assets/IMG/Gigabyte B450 AORUS PRO/Gigabyte B450 AORUS PRO (4).jpg')
INSERT [dbo].[Galleries] ([Name]) VALUES (N'Gigabyte B450 AORUS PRO')
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (14, 44, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (14, 45, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (14, 46, 3)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (14, 47, 4)


INSERT [dbo].[Images] ([Name], [Url]) VALUES (N'apple.png', N'/Assets/IMG/00brands/apple.png')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N'asus.png', N'/Assets/IMG/00brands/asus.png')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N'brands.txt', N'/Assets/IMG/00brands/brands.txt')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N'dell.png', N'/Assets/IMG/00brands/dell.png')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N'gigabyte.png', N'/Assets/IMG/00brands/gigabyte.png')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N'msi.png', N'/Assets/IMG/00brands/msi.png')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N'panasonic.png', N'/Assets/IMG/00brands/panasonic.png')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N'playstation.png', N'/Assets/IMG/00brands/playstation.png')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N'razer.png', N'/Assets/IMG/00brands/razer.png')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N'sony.png', N'/Assets/IMG/00brands/sony.png')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N'switch.png', N'/Assets/IMG/00brands/switch.png')
INSERT [dbo].[Images] ([Name], [Url]) VALUES (N'xbox.png', N'/Assets/IMG/00brands/xbox.png')
INSERT [dbo].[Galleries] ([Name]) VALUES (N'00brands')
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (15, 48, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (15, 49, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (15, 50, 3)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (15, 51, 4)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (15, 52, 5)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (15, 53, 6)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (15, 54, 7)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (15, 55, 8)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (15, 56, 9)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (15, 57, 10)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (15, 58, 11)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (15, 59, 12)

");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {

        }
    }
}
