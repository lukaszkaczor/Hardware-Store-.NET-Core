var ratingStars = $(".ratingStar");
var productId = $("#productId").val();
$(ratingStars).on('click',
    function () {
        var token = $("[name='__RequestVerificationToken']").val();

        $.ajax({
            url: "/Products/SetRatings",
            type: 'POST',
            data: { productId: productId, rating: ratingStars.index(this) + 1, __RequestVerificationToken: token },
            success: function () {
                window.location.reload();
            }
        });

    });
