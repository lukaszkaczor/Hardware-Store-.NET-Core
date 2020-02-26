//Hot Shot scripts
var sold = $(".soldValue").text();
var left = $(".leftValue").text();
var total = parseInt(sold) + parseInt(left);
var percent = (sold / total) * 100;

setProgressBarWidth();

function setProgressBarWidth() {
    $(".progress").css("width", percent + "%");

    if (left == 0) {
        $(".timeLeft").text("");
        $(".timeCaption").text("Wyprzedano!");
    }
}

setInterval(() => {
    var endDate = new Date($("#endDate").val()).getTime() / 1000;
    var now = new Date().getTime() / 1000;

    var timeLeftInSeconds = endDate - now;

    var time = new Date(timeLeftInSeconds * 1000).toISOString().substr(11, 8);

    //alert(timeLeftInSeconds);
    $(".timeLeft").text(time);
}, 1000);