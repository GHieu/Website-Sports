$.ajaxSetup({
    headers: {
        "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
    },
});
function loadMore() {
    const load = $("#load").val();
    $.ajax({
        type: "POST",
        dataType: "JSON",
        data: { load },
        url: "/services/load-product",
        success: function (result) {
            if (result.html !== "") {
                $("#loadProducts").append(result.html);
                $("#load").val(load + 1);
            } else {
                alert("Đã load xong sản phẩm");
                $("#loadDone").css("display", "none");
            }
        },
    });
}
