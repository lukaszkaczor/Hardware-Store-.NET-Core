//Navbar
$(".hamburgerMenu").on("click", function () {
    $(".mobileMenuBtn").toggleClass("mobileMenuBtnTransform");
    $(".mobileSections").toggleClass("leftZero");

});

$(".menuItem .fa-search").on("click", function () {
    $(".searchForm").toggleClass("showSearchForm");
});

$(window).resize(function () {
    if ($(window).width() > 768)
        $(".searchForm").removeClass("showSearchForm");

    // if (($window).width() > 1000 && $(".mobileSections").hasClass("leftZero"))
    if ($(".mobileSections").hasClass("leftZero") && $(window).width() >= 1200) {
        $(".mobileSections").removeClass("leftZero");
        $(".mobileMenuBtn").toggleClass("mobileMenuBtnTransform");
    }
});

//BoxShadow for navbar after scrolling
$(window).on('scroll', function () {

    if (window.scrollY > 50)
        $("nav").addClass("showBoxShadow");

    else
        $("nav").removeClass("showBoxShadow");
});


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

    $(".timeLeft").text(time);
}, 1000);

//Disable transitions on resize
let resizeTimer;
window.addEventListener("resize", () => {
    document.body.classList.add("resize-animation-stopper");
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(() => {
        document.body.classList.remove("resize-animation-stopper");
    }, 400);
});