$(function(){
    //jquery.validate
	$("#loginForm").validate({
		submitHandler: function() {
			//$("#loginForm").submit();
			this.submit();
		}
	});

	$("#registerForm").validate({
		submitHandler: function() {
			this.submit();
		}
	});

	$("#comment-form").validate({
        submitHandler: function() {
            this.submit();
        }
	})
});

//配置错误提示的节点，默认为label，这里配置成 span （errorElement:'span'）
$.validator.setDefaults({
	errorElement:'span'
});
	
//配置通用的默认提示语
$.extend($.validator.messages, {
    equalTo: "请再次输入相同的密码",
	email:"请输入正确的邮箱"
});
	
jQuery.validator.addMethod("email", function (value, element) {
	var mail = /^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$/;
	return this.optional(element) || (mail.test(value));
}, "邮箱格式不正确");