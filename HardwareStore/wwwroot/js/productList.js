$("#showMobileFilters").on("click", function () {
    $(".filterHolder").toggleClass("leftZero");
});

$("#closeFiltersBtn").on("click", function () {
    $(".filterHolder").toggleClass("leftZero");
});



$(window).resize(function () {
    if ($(".filterHolder").hasClass("leftZero") && $(window).width() >= 1000) {
        $(".filterHolder").removeClass("leftZero");
    }
});