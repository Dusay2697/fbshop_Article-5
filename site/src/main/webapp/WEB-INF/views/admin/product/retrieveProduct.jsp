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
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  </head>
  <body>
  <%@ include file="../common/adminNavi.jsp" %>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="/admin/adminPage.do">회원관리 <span class="sr-only">(current)</span></a></li>
            <li class="active"><a href="/product/retrieveProduct.do">상품관리 <span class="sr-only">(current)</span></a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">상품관리</h1>
          <div class="table-responsive">
            <button type="button" class="btn btn-info" id=retrieveProduct>상품조회</button>
            <button type="button" class="btn btn-info" id="insertProduct">상품등록</button>
            <button type="button" class="btn btn-info" id="updateProduct">상품수정</button>
          </div>
        </div>
      </div>
    </div>
    
<!--   여기서부터 작성   -->
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>상품이름</th>
                  <th>판매가격</th>
                  <th>소비자가격</th>
                  <th>수량</th>
                  <th>사이즈</th>
                  <th>세일상품</th>
                  <th>적립금</th>
                </tr>
              </thead>
              <tbody>
              <c:choose>
			  <c:when test="${not empty productList }">
			  	<c:forEach items="${productList }" var="product">
			  	<tr>
			  		<td>${product.productNm }</td>
			  		<td>${product.productPrice }원</td>
			  		<td>${product.productSprice }원</td>
			  		<td>${product.productCnt }</td>
			  		<td>${product.productSize }</td>
			  		<td>${product.productSalefg }</td>
			  		<td>${product.productSavemony }원</td>
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


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">
		$("#insertProduct").on("click", function(){
			var url = "insertFormProduct.do"; 
			$(location).attr('href',url);
		});
		
		$("#retrieveProduct").on("click", function(){
			var url = "retrieveProduct.do"; 
			$(location).attr('href',url);
		});
		
	</script>
<!--     <script src="../../dist/js/bootstrap.min.js"></script> -->
<!--     Just to make our placeholder images work. Don't actually copy the next line! -->
<!--     <script src="../../assets/js/vendor/holder.js"></script> -->
<!--     IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!--     <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script> -->
  </body>
</html>
