<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ADMINISTOR HYW FOOBALLSHOP</title>
    <link href="http://bootstrapk.com/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://bootstrapk.com/examples/dashboard/dashboard.css" rel="stylesheet">
    <script src="http://bootstrapk.com/assets/js/ie-emulation-modes-warning.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  </head>
  <body>
  <%@ include file="adminNavi.jsp" %>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="adminPage.do">회원관리 <span class="sr-only">(current)</span></a></li>
            <li><a href="/product/retrieveProduct.do">상품관리 <span class="sr-only">(current)</span></a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">회원관리</h1>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>회원ID</th>
                  <th>회원이름</th>
                  <th>회원주소</th>
                  <th>이메일</th>
                  <th>생년월일</th>
                </tr>
              </thead>
              <tbody>
              <c:choose>
			  <c:when test="${not empty userListAll }">
			  	<c:forEach items="${userListAll }" var="user">
			  	<tr>
			  		<td>${user.userId }</td>
			  		<td>${user.userName }</td>
			  		<td>${user.userAddr }</td>
			  		<td>${user.userEmail }</td>
			  		<td>${user.userBirth }</td>
			  	</tr>
			  	</c:forEach>
			  </c:when>
              <c:otherwise>
              	<tr>
              		<td colspan="5" align="center">조회된 데이터가 없습니다.</td>
              	</tr>
              </c:otherwise>
              </c:choose>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!--     <script src="../../dist/js/bootstrap.min.js"></script> -->
<!--     Just to make our placeholder images work. Don't actually copy the next line! -->
<!--     <script src="../../assets/js/vendor/holder.js"></script> -->
<!--     IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!--     <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script> -->
  </body>
</html>
