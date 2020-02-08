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




//Disable transitions on resize
let resizeTimer;
window.addEventListener("resize", () => {
    document.body.classList.add("resize-animation-stopper");
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(() => {
        document.body.classList.remove("resize-animation-stopper");
    }, 400);
});