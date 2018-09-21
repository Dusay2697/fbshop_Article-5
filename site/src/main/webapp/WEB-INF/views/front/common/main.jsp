<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>국내 스포츠 Online 스토어 1위! FB Word</title>
</head>
<style>
		.line{     
	            width: 1500px;
    			height: 7px;
    			background-color: #1c205f;
    			} 
    			
	div#Bitem{
	   			width: 150px;
    			height: 40px;
    			color: #fff;
    			font-size: 15px;
    			margin-top: 8px;
    			border: 1px solid #1c205f;
    			background-color: #1c205f;
			}
</style>
<body>
 <%--상단 메뉴--%>
 <%@ include file="top.jsp" %>
<div class="w3-container" align="center" height="100%">
  <%--메인 내용--%>
	<div>
	    <img src="<%=request.getContextPath()%>/resources/image/banner.png" style= "max-width:900px;"/>
	</div>
	<hr class="line">
	<div id="Bitem">
		<h3 >New Item</h3>
	</div>
	<table style="text-align:center;">
		<tr>
			<th>
				<a href="#none"><dl><dt><img src="<%=request.getContextPath()%>/resources/image/M.png" style="height:150px;"/></dt><dd>Mancity 17/18 home kit</dd><dd>price: 120,000</dd></dl></a>
			</th>
			<th>
				<a href="#none"><dl><dt><img src="<%=request.getContextPath()%>/resources/image/L.png" style="height:150px;"/></dt><dd>Liverpool 17/18 Away kit</dd><dd>price: 100,000</dd></dl></a>
			</th>
			<th>
				<a href="#none"><dl><dt><img src="<%=request.getContextPath()%>/resources/image/C.png" style="height:150px;"/></dt><dd>Chelsea 17/18 home kit</dd><dd>price: 120,000 </dd></dl></a>
			</th>
		</tr>
		<tr>	
			<c:forEach var="productList" items="${productList}">
				<th>
					<a href="#none"><dl><dt><img src="<%=request.getContextPath()%>/resources/image/A.png" style="height:150px;"/></dt><dd>${productList.productNm }</dd><dd>price: ${productList.productPrice } </dd></dl></a>
				</th>
			</c:forEach>
	 	</tr>
	</table>
</div>
<%@ include file="../common/bottom.jsp" %>	
</body>
</html>