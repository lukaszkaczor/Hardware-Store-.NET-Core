using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace HardwareStore.Data.Migrations
{
    public partial class AddHotShotsTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "HotShots",
                columns: table => new
                {
                    HotShotId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProductId = table.Column<int>(nullable: false),
                    NewPrice = table.Column<double>(nullable: false),
                    Quantity = table.Column<int>(nullable: false),
                    ItemsSold = table.Column<int>(nullable: false),
                    StartDate = table.Column<DateTime>(nullable: false),
                    EndDate = table.Column<DateTime>(nullable: false),
                    HasEnded = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_HotShots", x => x.HotShotId);
                    table.ForeignKey(
                        name: "FK_HotShots_Products_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Products",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_HotShots_ProductId",
                table: "HotShots",
                column: "ProductId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "HotShots");
        }
    }
}
