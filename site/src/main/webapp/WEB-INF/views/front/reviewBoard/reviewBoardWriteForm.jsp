<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>review.jsp</title>
 <link href="<%=request.getContextPath()%>/resources/css/board.css" rel="stylesheet" type="text/css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 </head>
 <body>
 <div class="w3-container" align="center">    
     <%--상단 메뉴--%>
     <div class="w3-container">
         <%@ include file="../common/top.jsp" %>
     </div>        
     <%--리뷰 게시판 화면 내용--%>
     <div class="w3-container">
         <div id="help" >홈 > 리뷰게시판 > 글쓰기</div>
         <form class="form-horizontal" action="/review/reviewBoardInsert.do" method="post" style="width:900px;">
             <div class="form-group" style="text-align:left;">
                 <label class="control-label col-sm-2" for="email">제목:</label>
                 <div class="col-sm-3">
                     <input type="text" class="form-control" id="reviewTitle" name="reviewTitle">
                 </div>
             </div>
             <div class="form-group">
                 <textarea class="form-control" rows="15" id="reviewContent" name="reviewContent"></textarea>
             </div>
             <input type="submit" class="btn btn-primary" id="writeInsert"/>
         </form>
     </div>
 
  <%--FOOTER--%>
  <div class="w3-container"> 
  <%@ include file="../common/bottom.jsp" %>
  </div>		

</div> 
</body> 
</html>



