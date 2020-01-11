using Microsoft.EntityFrameworkCore.Migrations;

namespace HardwareStore.Data.Migrations
{
    public partial class AddProductIdToTagValuesTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ProductId",
                table: "TagValues",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AlterColumn<string>(
                name: "Name",
                table: "Tags",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(30)",
                oldMaxLength: 100);

            migrationBuilder.CreateIndex(
                name: "IX_TagValues_ProductId",
                table: "TagValues",
                column: "ProductId");

            migrationBuilder.AddForeignKey(
                name: "FK_TagValues_Products_ProductId",
                table: "TagValues",
                column: "ProductId",
                principalTable: "Products",
                principalColumn: "ProductId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TagValues_Products_ProductId",
                table: "TagValues");

            migrationBuilder.DropIndex(
                name: "IX_TagValues_ProductId",
                table: "TagValues");

            migrationBuilder.DropColumn(
                name: "ProductId",
                table: "TagValues");

            migrationBuilder.AlterColumn<string>(
                name: "Name",
                table: "Tags",
                type: "nvarchar(30)",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldMaxLength: 100);
        }
    }
}
