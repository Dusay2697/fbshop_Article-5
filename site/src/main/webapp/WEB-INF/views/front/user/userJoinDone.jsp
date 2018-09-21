<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>joinDone.jsp</title>
<meta name="viewport"
       content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Imagetoolbar" content="no" />
<link href="<%=request.getContextPath()%>/resources/css/joinDone.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.color_red {
		color: red;
	}
</style>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>

</head>
<body>
<%--상단 메뉴--%>
    <%@ include file="../common/top.jsp" %>  

 <%--회원가입완료 화면--%>
 <div id="banner" align="center">
   <img src="<%=request.getContextPath()%>/image/banner2.jpg" width="1000" height="110" >
 </div>
 <div id="help" >홈 > 회원가입</div>
 <div id="done">
    <h1 id=h1>회원가입이 완료되었습니다.</h1>

    <p id=p1>회원가입해주셔서 감사합니다.</p>
  </div>
    <a href="main.jsp"><button id="btn1" type="submit">메인으로 이동</button></a>
    <a href="login.jsp"><button id="btn2" type="submit">로그인</button></a>

 
  <%@ include file="../common/bottom.jsp" %>	
</body>
</html>