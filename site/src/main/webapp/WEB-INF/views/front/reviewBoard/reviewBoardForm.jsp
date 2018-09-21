<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>review.jsp</title>
 <link href="<%=request.getContextPath()%>/resources/css/board.css" rel="stylesheet" type="text/css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 </head>
 <style>
 	#reviewStyle{
		text-align:center; 
	 }
 </style>
 <script type="text/javascript">
 	$(document).ready(function() { 
		$("#writeForm").click(function(){
			 location.href="/review/reviewBoardWriteForm.do"
	 	});
	 
	 	$('a[name=reviewTitle]').click(function(){
	    	var idx = $('a[name=reviewTitle]').index(this);
	    	var rv_num = $("input[name=hidReviewNum]:eq("+idx+")").val();
	    	
	    	$("#reviewNum").val(rv_num);
	    	$("#hidfrm").attr("action", "/review/reviewBoardSelect.do");
	        $("#hidfrm").submit();

	 	});
	});
 
 </script>
 <body>
 <div class="w3-container" align="center">    
     <%--상단 메뉴--%>
     <div class="w3-container">
         <%@ include file="../common/top.jsp" %>
     </div>
            
     <%--리뷰 게시판 화면 내용--%>
     <div class="w3-container" style="max-width:1500px">
         <div id="help" >홈 > 리뷰게시판</div>
         <table id="tb" style="text-align: center;" width="960">
             <thead>
                 <tr>
                     <th style="background-color: #eeeee; text-align: center;">번호</th>
                     <th style="background-color: #eeeee; text-align: center;">제목</th>
                     <th style="background-color: #eeeee; text-align: center;">작성자</th>
                     <th style="background-color: #eeeee; text-align: center;">작성일</th>
                 </tr>
                 <c:choose> 
                 	<c:when test="${reviewList eq null }"> 
                 		<tr>
                 			<td colspan="4">  
                     			<div class="panel panel-default">
                          			<div class="panel-body">글이 없습니다.</div>
                         		</div>
                        	</td>
                    	</tr> 
                    </c:when>
                    <c:otherwise>
                    	<c:forEach var="reviewList" items="${reviewList }">
                    		<tr>
                            	<td>              
                            	    <div id="reviewStyle">${reviewList.reviewNum }</div>
                    				<input type="hidden" id="reviewStyle" name="hidReviewNum" value="${reviewList.reviewNum }">
                    			</td>
                    			<td>                 	
                    				<a href="#" id="reviewStyle" name="reviewTitle">${reviewList.reviewTitle }</a>
                    			</td>
                    			<td>                 	
                    				<div id="reviewStyle" name="reviewRegId">${reviewList.reviewRegId }</div>
                    			</td>
                    			<td>                 	
                    				<div id="reviewStyle" name="rivewRegDt">${reviewList.reviewRegDt }</div>
                    			</td>
                    		</tr>	
                    	</c:forEach>
                    </c:otherwise>
                 </c:choose>                        
            </thead>
         </table>    
         <c:if test="${sessionScope.loginUser.ratingCode ne null }">
         <button type="button" class="btn btn-primary" id="writeForm">글등록</button>
         </c:if>
         <form id="hidfrm" name="hidfrm" method="post">
         	<input type="hidden" id="reviewNum" name="reviewNum" value=""/>
         </form>
     </div>
 
  <%--FOOTER--%>
  <div class="w3-container"> 
  <%@ include file="../common/bottom.jsp" %>
  </div>		

</div> 
</body> 
</html>



