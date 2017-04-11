$(document).ready(function(){
    $("body").on("focus()","input",function(){

    })
});

function tab(i){
    $("#logReg .switch-wrapper a").removeClass("active");
    $("#logReg .switch-wrapper").find("a").eq(i).addClass("active");
    if(i==0){
        $('#switch-content .login').css("display","block");
        $("#switch-content .register").css("display","none");

    }else if(i==1){
        $("#switch-content .register").css("display","block");
        $("#switch-content .login").css("display","none");
    }
}
function login(){
    var username = $("#username-login").val();
    var password = $("#password-login").val();

    if(username==""){
        $("#error-login").text("账号不能为空！");
        setTimeout("$('#error-login').text('');",1000);
        return false;
    }else if(password==""){
        $("#error-login").text("密码不能为空！");
        setTimeout("$('#error-login').text('');",1000);
        return false;
    }
    if(password.length>20||password.length<6){
        $("#error-login").text("密码长度为6-20！");
        setTimeout("$('#error-login').text('');",1000);
        return false;
    }
    window.location.href="first";

    return true;

}

function register() {
    var username = $("#username-register").val();
    var password = $("#password-register").val();
    var passwordA = $("#password-register-a").val();

    if(username==""){
        $("#error-register").text("账号不能为空！");
        setTimeout("$('#error-register').text('');",1000);
        return false;
    }else if(password==""||password==""){
        $("#error-register").text("密码不能为空！");
        setTimeout("$('#error-register').text('');",1000);
        return false;
    }else if(password.length>20||password.length<6){
        $("#error-register").text("密码长度为6-20！");
        setTimeout("$('#error-register').text('');",1000);
        return false;
    }else if(password!==passwordA){
        $("#error-register").text("前后密码不一致！");
        setTimeout("$('#error-register').text('');",1000);
        return false;
    }
    window.location.href="level-first-1";
    return true;
}

function forgetPwd() {
    $("#error-login").text("暂未实现，敬请期待！");
    setTimeout("$('#error-login').text('');",1000);
    return false;
}
