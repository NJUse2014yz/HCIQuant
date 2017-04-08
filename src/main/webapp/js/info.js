$(document).ready(function () {
    $(".btn-second").css("display","none");
    $(".btn-first").css("display","block");
    $(".choose-row").css("display","none");
});

function refresh() {
    window.location.reload();
}
function modifyInfo() {
    $(".info-input").attr("disabled",false);
    $(".btn-second").css("display","block");
    $(".btn-first").css("display","none");
}

function modifyInfoSave() {
    var name = $("#dynamic-info-name").val();
    var age = $("#dynamic-info-age").val();
    var address = $("#dynamic-info-address").val();
    var vId = $("#vId").val();

    var reg = /^[0-9]*$/;
    if(name==""){
        $("#error-dynamic-info").text("姓名不能为空！");
        setTimeout("$('#error-dynamic-info').text('');",1000);
        return false;
    }else if(!reg.test(age) || age<0 || age>100){
        $("#error-dynamic-info").text("年纪输入错误！");
        setTimeout("$('#error-dynamic-info').text('');",1000);
        return false;
    }

    $.ajax({
        type: "post",
        async: true,
        url: "/HotelWorld/modify_info",
        data: {
            "name": name,
            "age":age,
            "address":address,
            "vid":vId
        },
        success: function (result) {
            $('#error-dynamic-info').text(result);
            setTimeout("$('#error-dynamic-info').text('');",500);
            setTimeout(refresh,1200);
            return true;
        },
        error: function () {
            $('#error-dynamic-info').text('出故障了请稍候再试');
            setTimeout("$('#error-dynamic-info').text('');",1000);
        }
    });

}

function modifyCancel() {
    refresh();
}

