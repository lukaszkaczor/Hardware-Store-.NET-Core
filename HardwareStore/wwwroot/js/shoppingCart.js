var inputs = $(".inputQuantity");
var prices = $(".price");
//var totals = $(".priceTimesQuantity");


function setPrices() {
    var total = 0;

    for (var i = 0; i < prices.length; i++) {
        let quantity = inputs[i].value;
        //let price = parseFloat(prices[i].textContent);
        let price = parseFloat(prices[0].textContent.replace(',', '.'));
        //totals[i].textContent = quantity * price;
        total += quantity * price;
    }

    $(".total").text(total.toString().replace(".", ","));
}


$(document).ready(function () {
    setPrices();
    var products = $(".productId");

    $(inputs).change(function () {
        SetQuantity(products[inputs.index(this)].value, this.value);
        setPrices();
    });

});

function SetQuantity(id, quantity) {
    var token = $("[name='__RequestVerificationToken']").val();

    $.ajax({
        url: "/ShoppingCart/SetQuantity",
        type: 'POST',
        data: { ProductId: id, quantity: quantity, __RequestVerificationToken: token }
    });
}