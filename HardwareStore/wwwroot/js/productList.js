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
var str = new Set();


$(checkedInputs).on('click', function () {
    for (var i = 0; i < checkedInputs.length; i++) {
        if (checkedInputs[i].checked) {
            str.add(brandsId[i].value);
            //continue;
        }
        else {
            str.delete((brandsId[i].value));
        }
    }
    console.log(str);
    var tej = Array.from(str).join(',');

    console.log(tej);
    $("#brandText").val(tej);
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
            categoryString.delete((categoryId[i].value));
        }
    }
    console.log(categoryString);
    var teje = Array.from(categoryString).join(',');

    console.log(teje);
    $("#categoryText").val(teje);
});
