function changePassowrd(){
	var oldPass=$("#oldPass").val();
	var newPass=$("#newPass1").val();
	var newPass2=$("#newPass2").val();
	if(newPass.length == 0 || newPass2.length == 0 || oldPass.length == 0)
	{
		alert('请将数据填写完整');
	}
	else
	{
		if(newPass == newPass2)
		{
			$.ajax({
				 type: "GET",
				 url: "changePassword.action",
				 data: "oldPassword=" + oldPass + "&newPassword=" + newPass ,
				 success: function(msg){
					 alert('密码修改成功');
				 },
				error:function(){alert('密码修改失败');}
				}); 
		}
		else
		{
			alert('两次输入的密码不一致');
		}
	}
}