var shippingMethods = $(".shippingMethod");
var shippingInputs = $(".shippingInput");
var payingMethods = $(".payingMethods");
var payingInputs = $(".payingInput");
var payingBoxes = $(".payingBox");

$(shippingMethods).on('click', function () {
    var index = shippingMethods.index(this);
    var currentShippingId = shippingInputs[index].value;
    $("#shippingId").val(currentShippingId);

    for (var j = 0; j < shippingMethods.length; j++) {
        $(shippingMethods[j]).removeClass("boxActive");
    }
    $(shippingMethods[index]).addClass("boxActive");
    for (var i = 0; i < payingBoxes.length; i++) {
        $(payingBoxes[i]).removeClass("boxActive");
    }
    $(payingMethods[index].children[0]).addClass("boxActive");

    for (var w = 0; w < payingMethods.length; w++) {
        $(payingMethods[w]).css("display", "none");
    }
    $(payingMethods[index]).css("display", "grid");

    $("#payingId").val(payingMethods[index].children[0].children[3].value);
});

$(payingBoxes).on('click', function () {
    $("#payingId").val(payingInputs[payingBoxes.index(this)].value);

    for (var i = 0; i < payingBoxes.length; i++) {
        $(payingBoxes[i]).removeClass("boxActive");
    }
    $(payingBoxes[payingBoxes.index(this)]).addClass("boxActive");

}); 