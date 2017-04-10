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
    var name = $("#info-name").val();
    var age = $("#info-age").val();
    var address = $("#info-address").val();
    var des = $("#info-des").val();
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
    $("#info-name").val(name);
    $("#info-age").val(age);
    $("#info-address").val(address);
    $("#info-des").val(des);
    $(".btn-second").css("display","none");
    $(".btn-first").css("display","block");
    $(".choose-row").css("display","none");
}

function modifyCancel() {
    refresh();
}

function modifyPsw() {
    clear();
    $(".modify-psw-row").css("display","block");
}

function modifyPswSave() {
    var password = $("#modify-psw-password").val();
    var passwordN = $("#modify-psw-password-new").val();
    var passwordNA = $("#modify-psw-password-new-again").val();
    var vId = $("#vId").val();
    if(password==""){
        $("#error-modify-psw").text("原密码不能为空！");
        setTimeout("$('#error-modify-psw').text('');",1000);
        return false;
    }else if(passwordN=="" || passwordNA==""){
        $("#error-modify-psw").text("新密码不能为空！");
        setTimeout("$('#error-modify-psw').text('');",1000);
        return false;
    }else if(passwordNA!=passwordN){
        $("#error-modify-psw").text("前后密码不一致！");
        setTimeout("$('#error-modify-psw').text('');",1000);
        return false;
    }

    $('#error-modify-psw').text("修改成功");
    setTimeout("$('#error-modify-psw').text('');",500);
    setTimeout(refresh,1200);
}

function clear(){
    $('.choose-row .reg-input').val("");
}