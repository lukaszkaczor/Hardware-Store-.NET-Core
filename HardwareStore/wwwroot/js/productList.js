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



var checkedInputs = $(".brandInput");
var brandsId = $(".brandId");
var brandString = new Set();


$(checkedInputs).on('click', function () {
    for (var i = 0; i < checkedInputs.length; i++) {
        if (checkedInputs[i].checked) {
            brandString.add(brandsId[i].value);
            //continue;
        }
        else {
            brandString.delete(brandsId[i].value);
        }
    }
    console.log(brandString);
    var brands = Array.from(brandString).join(',');

    $("#brandText").val(brands);
});


var categoryInputs = $(".categoryInput");
var categoryId = $(".categoryId");
var categoryString = new Set();


$(categoryInputs).on('click', function () {
    for (var i = 0; i < categoryInputs.length; i++) {
        if (categoryInputs[i].checked) {
            categoryString.add(categoryId[i].value);
            //continue;
        }
        else {
            categoryString.delete(categoryId[i].value);
        }
    }
    console.log(categoryString);
    var categories = Array.from(categoryString).join(',');

    console.log(categories);
    $("#categoryText").val(categories);
});

$("#maxPrice").on('change', function () {
    $("#maxPriceText").val($("#maxPrice").val());

});

$("#minPrice").on('change', function () {
    $("#minPriceText").val($("#minPrice").val());
});

//function checkPrices(min, max) {
//    if (min > max) {
//        $("#filterBtn").prop('disabled', true)
//    } else {
//        $("#filterBtn").prop('disabled', false)

//    }


//}