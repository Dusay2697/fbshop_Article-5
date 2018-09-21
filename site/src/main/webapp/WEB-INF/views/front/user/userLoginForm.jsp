<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>국내 스포츠 Online 스토어 1위! FB Word</title>
<script type="text/javascript">

	$(document).ready(function() {
		
	$("#userLogin").on("click",function(){
			
			var userId = $("#userId").val();
			userId = $.trim( userId );
            
			// ID작성 체크
            if( userId == "" ){
                alert("ID를 입력하세요.");
                $("#userId").focus();
                return; 
        	};
        	
        	var userPwd = $("#userPwd").val();
        	userPwd = $.trim( userPwd );
            
        	// PASSWORD작성 체크
            if( userPwd == "" ){
                alert("패스워드를 입력하세요.");
                $("#userPwd").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
        	};
        
	        var ajaxData = { "userId" : userId , "userPwd" : userPwd };
	        $.ajax({
	        	url : "userLogin.do",
	        	type : "POST",
	        	data : ajaxData,
	        	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	            dataType : "json",
	            success:function(data){
	                console.log("success");
	                if(data == 1){
	                	location.href="/main.do";
	                }else{
	                    alert("회원정보가 없습니다. 다시 로그인해주세요.");
	                }
	            },
	            error: function (XMLHttpRequest, textStatus, errorThrown){
            		alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.' );
            	}
	        });            
		});
	
	});

</script>
<style>
  #help {
   top: 60px;
   background-color: #1c205f;
   color: white;
   width: 1000px;
   height: 30px; 
   font-weight: bold;
   line-height: 30px;
 
  }  
</style>
</head>
<body>
<div class="w3-container" align="center">
<%--상단 메뉴--%>
    <div class="w3-container">
        <%@ include file="../common/top.jsp" %>
    </div>
           
    <%--로그인 화면 내용--%>
    <div class="w3-container" style="max-width:1200px">
        <div id="help" >홈 > 로그인</div>
         <form class="form-horizontal" action="/user/userLogin.do" method="post">
        <div class="w3-container" style="background-color:#EAEAEA;">
            <label class="w3-text"><b>아이디</b></label>
            <input class="w3-input w3-border" type="text" id="userId">
 
            <label class="w3-text"><b>비밀번호</b></label>
            <input class="w3-input w3-border" type="password" id="userPwd">

             <input type="button" class="w3-text" id="userLogin" value="로그인"/>
             <input type="button" class="w3-text" value="아이디/비밀번호 찾기"/>
        </div>
        </form>
    </div>
 
    <%--FOOTER--%>
        <div class="w3-container">  
            <%@ include file="../common/bottom.jsp" %>
        </div>    	
    </div>   	
</body>
</html>