using Microsoft.EntityFrameworkCore.Migrations;

namespace HardwareStore.Data.Migrations
{
    public partial class AddAccountHotShotsTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AccountHotShots",
                columns: table => new
                {
                    IdentityUserId = table.Column<string>(nullable: false),
                    HotShotId = table.Column<string>(nullable: false),
                    HotShotId1 = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AccountHotShots", x => new { x.IdentityUserId, x.HotShotId });
                    table.ForeignKey(
                        name: "FK_AccountHotShots_HotShots_HotShotId1",
                        column: x => x.HotShotId1,
                        principalTable: "HotShots",
                        principalColumn: "HotShotId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_AccountHotShots_AspNetUsers_IdentityUserId",
                        column: x => x.IdentityUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_AccountHotShots_HotShotId1",
                table: "AccountHotShots",
                column: "HotShotId1");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AccountHotShots");
        }
    }
}
