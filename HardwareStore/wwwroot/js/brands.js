const quantity = $(".brand").length;
var elementsInOneBox = getElementsInTheBox(); //5
var brandBoxWidth = getBrandBoxWidth(); //230
var position = 0;

var elementsPerOneLine = parseInt(quantity / elementsInOneBox);
var constElementsPerOneLine = elementsPerOneLine;
var rest = quantity % elementsInOneBox;

var contentWidth = document.querySelector(".content").offsetWidth; //SZEROKOSC CONTENTU
var restWidth = contentWidth * (rest / 100); //szerokosc "reszty"
var brandsLineWidth = parseInt((contentWidth * (elementsPerOneLine - 1) + restWidth)); //szerokosc jednego "paska (z elementsInTheBox sztuk*szerokosc contentu )  //plus szerokosc reszty"


$(".next").on('click', function () {
    if (position < brandsLineWidth) {
        if (elementsPerOneLine - 1 > 0) {
            position += elementsInOneBox * brandBoxWidth;
            elementsPerOneLine--;
        } else {
            position += rest * brandBoxWidth;
        }
        translateBrands();
    }
});

$(".prev").on('click', function () {
    if (position > 1) {
        if (rest == 0 || elementsPerOneLine < constElementsPerOneLine) {
            position -= elementsInOneBox * brandBoxWidth;
            elementsPerOneLine++;
        } else {
            position -= rest * brandBoxWidth;
        }
        translateBrands();
    }
});

//dostosowanie wszystkich ustawien do szerokosci contentu i zresetowanie pozycji do 0 w celu unikniecia bugów 
$(window).resize(function () {
    elementsInOneBox = getElementsInTheBox();
    brandBoxWidth = getBrandBoxWidth();
    elementsPerOneLine = parseInt(quantity / elementsInOneBox);
    position = 0;
    contentWidth = document.querySelector(".content").offsetWidth;
    restWidth = contentWidth * (rest / 100);
    brandsLineWidth = parseInt((contentWidth * (elementsPerOneLine - 1) + restWidth));
    constElementsPerOneLine = elementsPerOneLine;
    rest = quantity % elementsInOneBox;
    translateBrands();
});

function getElementsInTheBox() {
    let contentWidth = $(".content").width();

    if (contentWidth >= 1150) {
        return 5;
    } else if (contentWidth >= 950) {
        return 4;
    } else if (contentWidth >= 700) {
        return 3;
    } else {
        return 2;
    }
}

function getBrandBoxWidth() {
    return $(".brand").width();
}

function translateBrands() {
    $(".brands").css("transform", "translateX(" + (-position) + "px)");
    $(".prev").css("transform", "translateX(" + position + "px)");
    $(".next").css("transform", "translateX(" + position + "px)");
}