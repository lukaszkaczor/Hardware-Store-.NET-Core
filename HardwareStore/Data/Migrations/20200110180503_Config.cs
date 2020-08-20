using Microsoft.EntityFrameworkCore.Migrations;

namespace HardwareStore.Data.Migrations
{
    public partial class Config : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.Sql(@"
            //    INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a74c01af-339a-4969-9ef6-532c51f31ef9', N'admin@test.pl', N'ADMIN@TEST.PL', N'admin@test.pl', N'ADMIN@TEST.PL', 0, N'AQAAAAEAACcQAAAAEE5LqQvWPZ+/+7IwjpRPy+3svR2AvSwejCERvO+dhFm2reDqYzzpfEpVUOpjGAaLjw==', N'I5FJXOTOCRO5CVNPUTM633CYMAR3A4UP', N'95be3db6-f8c1-41e9-ab24-10aba6eb7bf3', NULL, 0, 0, NULL, 1, 0)
            //    INSERT INTO [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'be54a320-81ab-41d3-a035-52c5283c3236', N'Admin')
            //    INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a74c01af-339a-4969-9ef6-532c51f31ef9', N'be54a320-81ab-41d3-a035-52c5283c3236')
            //");

            //migrationBuilder.Sql(@"
            //    insert into Sections(name, Icon) values('Podzespoły komputerowe', 'fas fa-hdd');
            //    insert into Sections(name, Icon) values('Tablety i laptopy', 'fas fa-laptop');
            //    insert into Sections(name, Icon) values('Telefony i GPS', 'fas fa-mobile');
            //    insert into Sections(name, Icon) values('Urządzenia peryferyjne', 'fas fa-keyboard');
            //    insert into Sections(name, Icon) values('RTV', 'fas fa-tv');
            //    insert into Sections(name, Icon) values('Oprogramowanie', 'fab fa-windows');
            //");

            //migrationBuilder.Sql(@"
            //    SET IDENTITY_INSERT [dbo].[Categories] ON
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (1,N'Akcesoria', 2);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (2,N'Akcesoria GSM', 3);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (3,N'Aparaty', 5);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (4,N'Drukarki', 4);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (5,N'Dyski HDD i SSD', 1);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (6,N'Głośniki', 4);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (7,N'Kamery', 5);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (8,N'Karty graficzne', 1);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (9,N'Klawiatury', 4);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (10,N'Laptopy', 2);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (11,N'Monitory', 4);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (12,N'Myszki', 4);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (13,N'Nawigacje GPS', 3);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (14,N'Obudowy komputerowe', 1);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (15,N'Pamięci RAM', 1);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (16,N'Płyty główne', 1);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (17,N'Procesory', 1);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (18,N'Projektory', 5);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (19,N'Programy antywirusowe', 6);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (20,N'Programy biurowe', 6);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (21,N'Programy edukacyjne', 6);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (22,N'Programy graficzne', 6);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (23,N'Słuchawki', 4);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (24,N'Smartfony', 3);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (25,N'Smartwatche', 3);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (26,N'Sprzęt audio', 5);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (27,N'Systemy operacyjne', 6);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (28,N'Tablety', 2);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (29,N'Telewizory', 5);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (30,N'Torby i etui', 2);
            //    INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [SectionID]) VALUES (31,N'Zasilacze komputerowe', 1);
            //    SET IDENTITY_INSERT [dbo].[Categories] OFF
            //");

            //migrationBuilder.Sql(@"
            //    SET IDENTITY_INSERT [dbo].[Tags] ON
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (1, N'Przekątna ekranu')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (2, N'Pamięć RAM')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (3, N'Procesor')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (4, N'Grafika')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (5, N'Matryca')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (6, N'Rozdzielczość')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (7, N'Chipset')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (8, N'Gniazdo procesora')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (9, N'Format')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (10, N'Typ obsługiwanej pamięci');
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (11, N'Liczba banków pamięci');
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (12, N'Maksymalna wielkość pamięci RAM')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (13, N'Złącza')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (14, N'Układ audio')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (15, N'Szerokość')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (16, N'Wysokość')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (17, N'Gwarancja')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (18, N'Układ')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (19, N'Pamięć')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (20, N'Rodzaj pamięci')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (21, N'Częstotliwość odświeśania')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (22, N'Format ekranu')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (23, N'Czas reakcji')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (24, N'Liczba wyświetlanych kolorów')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (25, N'Jasność')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (26, N'Kontrast')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (27, N'Głośniki')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (28, N'Tuner TV')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (29, N'Waga')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (30, N'Pobór mocy podczas pracy')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (31, N'Pobór mocy podczas spoczynku')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (32, N'Szyna pamięci')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (33, N'Taktowanie pamięci')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (34, N'Rekomendowana moc zasilacza')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (35, N'Długość')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (36, N'Rodzaj złącza')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (37, N'Kamera internetowa')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (38, N'System operacyjny')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (39, N'Kolor dominujący')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (40, N'Dołączone akcesoria')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (41, N'Bateria')
            //    INSERT INTO [dbo].[Tags] ([TagId], [Name]) VALUES (42, N'Rozdzielczość aparatu')
            //    SET IDENTITY_INSERT [dbo].[Tags] OFF
            //");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {

        }
    }
}
