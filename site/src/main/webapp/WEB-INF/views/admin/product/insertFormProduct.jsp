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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <script type="text/javascript">

    	$(document).ready(function() {
		    $("#content").summernote({
		      placeholder: '상품의 이미지와 내용 입력하세요.',
		      tabsize: 2,
		      height: 1000,
		      minHeight: null,
	          maxHeight: null,
	          focus: true,
	          callbacks: {
	            onImageUpload: function(files, editor, welEditable) {
	              for (var i = files.length - 1; i >= 0; i--) {
	                sendFile(files[i], this);
	          		 }
	            	}
		    }});	    
    
	    	$("#submitBtn").on("click", function(){
	    		if ( confirm("[안내] 상품을 등록하시겠습니까? ") ) {
		    		$("#dataForm").submit();
				};
	    	});
	    	
	    	function sendFile(file, el) {
	    	      var form_data = new FormData();
	    	      form_data.append('file', file);
	    	      $.ajax({
	    	        data: form_data,
	    	        type: "POST",
	    	        url: '/admin/image.do',
	    	        cache: false,
	    	        contentType: false,
	    	        enctype: 'multipart/form-data',
	    	        processData: false,
	    	        success: function(url) {
	    	          $(el).summernote('editor.insertImage', url);
	    	          $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
	    	        }
	    	      });
	    	}
	    	
    		});
    </script>
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
            <button type="button" class="btn btn-info" id="retrieveProduct">상품조회</button>
            <button type="button" class="btn btn-info" id="insertProduct">상품등록</button>
            <button type="button" class="btn btn-info" id="updateProduct">상품수정</button>
          </div>
        </div>
      </div>
    </div>
    
<!--   여기서부터 작성   -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	          <form id="dataForm" class="form-horizontal" action="insertProduct.do" method="post">
		          <div class="form-group">
				    <label for="pdtNm">상품명</label>
				    <input type="text" class="form-control" id="pdtNm" name="productNm">
				  </div>
				  
				  <div class="form-group">
		          <textarea id="content" name="productContent"></textarea>
				  </div>
			  
			      <div class="form-group">
				    <label for="pdtPrice" class="col-sm-2 control-label">판매가</label>
				    <div class="col-sm-3">
				      <input type="text" class="form-control" id="pdtPrice" name="productPrice">
				    </div>
				  </div>
			      <div class="form-group">
				    <label for="pdtSprice" class="col-sm-2 control-label">세일가</label>
				    <div class="col-sm-3">
				      <input type="text" class="form-control" id="pdtSprice" value="0" disabled="disabled" name="productSprice">
				    </div>
				    <div class="col-sm-3">
				      <div class="checkbox">
				        <label>
				          <input type="checkbox" id="productSalefg" name="productSalefg" value="N"> sale product
				        </label>
				      </div>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="pdtSize" class="col-sm-2 control-label">사이즈</label>
				    <div class="col-sm-3">
				      <input type="text" class="form-control" id="pdtSize" name="productSize">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="pdtCnt" class="col-sm-2 control-label">수량</label>
				    <div class="col-sm-3">
				      <input type="text" class="form-control" id="pdtCnt" name="productCnt">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="pdtSavemony" class="col-sm-2 control-label">적립금</label>
				    <div class="col-sm-3">
				      <input type="text" class="form-control" id="pdtSavemony" name="productSavemony">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="button" class="btn btn-default" id="submitBtn">제출</button>
				    </div>
				  </div>
			</form>
          </div>
        </div>
	</div>
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
	<script type="text/javascript">
		$("#insertProduct").on("click", function(){
			var url = "insertFormProduct.do"; 
			$(location).attr('href',url);
		});
		
		$("#retrieveProduct").on("click", function(){
			var url = "retrieveProduct.do"; 
			$(location).attr('href',url);
		});
		
		$("#productSalefg").on("click", function(){
			if( $('input:checkbox[id="productSalefg"]').is(":checked") ){
				$("#productSalefg").val("Y");
				$("#pdtSprice").attr("disabled", false);
			} else {
				$("#pdtSprice").val("0");
				$("#pdtSprice").attr("disabled", true);
			};
		});
		
	</script>	
  </body>
</html>
