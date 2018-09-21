<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" type="text/css">
<style>
/* body {font-family: "Raleway", Arial, sans-serif} */
.w3-row img {margin-bottom: -8px}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}
li {
    float: left;
    padding-left:200px;
    padding-top:40px;
}

li a {
   text-decoration: none;
   font-size: 20px;
   font-weight: bold;
}
</style>
</head>
<body>

<div class="w3-content" style="max-width:1500px">
<!-- Header -->
  <header class="w3-container w3-xlarge w3-padding-24">
    <a href="#" class="w3-left w3-button w3-white">NOTICE</a>
    <a href="/faq/faqForm.do" class="w3-left w3-button w3-white">FAQ</a>
    <a href="/review/reviewForm.do" class="w3-left w3-button w3-white">REVIEW</a>
    <c:choose>
    <c:when test="${sessionScope.loginUser.ratingCode eq null }">
    	<a href="/user/userJoinAgreeForm.do" class="w3-right w3-button w3-white">회원가입</a>
    	<a href="/user/userLoginForm.do" class="w3-right w3-button w3-white">로그인</a>
    </c:when>
    <c:when test="${sessionScope.loginUser.ratingCode eq 'A' }">
    	<a href="/admin/adminPage.do" class="w3-right w3-button w3-white">Admin</a>
    	<a href="/user/userLogout.do" class="w3-right w3-button w3-white">로그아웃</a> 
    </c:when>
    <c:otherwise>
    	<a href="/user/userJoinForm.do" class="w3-right w3-button w3-white">장바구니</a>
    	<a href="/review/reviewForm.do" class="w3-right w3-button w3-white">주문조회</a> 
    	<a href="/user/userLogout.do" class="w3-right w3-button w3-white">로그아웃</a>    
    </c:otherwise>
    </c:choose>
      </header>
  
   <div class="w3-row">
    <div class="w3-half" style="width:100%;text-align:center;">
     <a href="/main.do"><img src="<%=request.getContextPath()%>/resources/image/logo.gif" style="width:400px;"></a>
    </div>
   </div>
   
  <ul style="height:100px; background-color: #1c205f; color: white;">
      <li><a href="#home">소개</a></li>
      <li><a href="/front/product/productForm.do">클럽몰</a></li>
      <li><a href="#contact">단체관람</a></li>
      <li><a href="#about">특별세일</a></li>
      <li><a href="#about">이벤트</a></li>
  </ul>   
  
    <div style="text-align:center;padding-top:20px;">
		<img src="<%=request.getContextPath()%>/resources/image/banner2.jpg" style="height:100px;"/>
	</div> 
</div>
</body>
</html>