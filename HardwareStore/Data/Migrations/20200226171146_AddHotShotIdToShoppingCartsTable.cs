using Microsoft.EntityFrameworkCore.Migrations;

namespace HardwareStore.Data.Migrations
{
    public partial class AddHotShotIdToShoppingCartsTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "HotShotId",
                table: "ShoppingCarts",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_ShoppingCarts_HotShotId",
                table: "ShoppingCarts",
                column: "HotShotId");

            migrationBuilder.AddForeignKey(
                name: "FK_ShoppingCarts_HotShots_HotShotId",
                table: "ShoppingCarts",
                column: "HotShotId",
                principalTable: "HotShots",
                principalColumn: "HotShotId",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ShoppingCarts_HotShots_HotShotId",
                table: "ShoppingCarts");

            migrationBuilder.DropIndex(
                name: "IX_ShoppingCarts_HotShotId",
                table: "ShoppingCarts");

            migrationBuilder.DropColumn(
                name: "HotShotId",
                table: "ShoppingCarts");
        }
    }
}
