<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>join.jsp</title>
<meta name="viewport"
       content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Imagetoolbar" content="no" />

<link href="<%=request.getContextPath()%>/resources/css/userJoinForm.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.color_red {
		color: red;
	}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript">
var rand;
 
//캡차 이미지 요청 (캐쉬문제로 인해 이미지가 변경되지 않을수있으므로 요청시마다 랜덤숫자를 생성하여 요청)
function changeCaptcha() {
       rand = Math.random();
       $('#catpcha').html('<img src="simple/CaptChaImg.jsp?rand=' + rand + '"/>');
}
 
$(document).ready(function() {
      
       changeCaptcha(); //캡차 이미지 요청
      
       $('#reLoad').click(function(){ changeCaptcha(); }); //새로고침버튼에 클릭이벤트 등록
      
       //확인 버튼 클릭시
       $('#frmSubmit').click(function(){
             if ( !$('#answer').val() ) {
                    alert('이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.');
             } else {
                    $.ajax({
                           url: 'simple/captchaSubmit.jsp',
                           type: 'POST',
                           dataType: 'text',
                           data: 'answer=' + $('#answer').val(),
                           async: false,      
                           success: function(resp) {
                                 alert(resp);
                                 $('#reLoad').prop("disabled", true);
                                 $('#answer').prop("disabled", true);
                                 $('#answerChk').val("Y");
                                 $('#frmSubmit').prop("disabled", true);
                           }
                    });
             }
       });
});
</script>
<script type="text/javascript">
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('member_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('member_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('member_address2').focus();
            }
        }).open();
    };
    
	$(document).ready( function() {
        
		// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
        // 다시 중복체크를 하도록 한다.
        $("input[name=member_id]").on("keyup",function(){
        	$("#idConfirm").val("N");
        });
		
		$("#idCheck").on("click",function(){
			
			var uId = $("#uId").val();
			uId = $.trim( uId );
            
            if( uId == "" ){
                alert("ID를 입력하세요.");
                $("#uId").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
        	};
        
	        var ajaxData = { "uId" : uId };
	        $.ajax({
	        	url : "idCheck.do",
	        	type : "POST",
	        	data : ajaxData,
	        	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	            dataType : "json",
	            success:function(data){
	                console.log("success");
	                alert(decodeURIComponent(data.msg));
	                $("#idConfirm").val("Y");
	            },
	            error: function (XMLHttpRequest, textStatus, errorThrown){
            		alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.' );
            	}
	        });            
		});
		
        $("#join").on("click",function(){
            //Validation Check
            // input 태그는 반드시 val()을 써준다.
            var uId = $("#uId").val();
            uId = $.trim( uId );
            
            if( uId == "" ){
                alert("ID를 입력하세요.");
                $("#uId").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
            
            //중복체크 여부
            if( $("#idConfirm").val() == 'N'){
                alert("아이디 중복체크를 하세요.");
                $("#uId").focus();   
                return;
            };
            
            var uPwd = $("#uPwd").val();
            uPwd = $.trim( uPwd );
            
            if( uPwd == "" ){
                alert("패스워드를 입력하세요.");
                $("#uPwd").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
            
            var uPwdChk = $("#uPwdChk").val();
            uPwdChk = $.trim( uPwdChk );
            
            if( uPwdChk == "" ){
                alert("패스워드확인을 입력하세요.");
                $("#uPwdChk").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
            
            if( uPwdChk != uPwd ){
                alert("패스워드가 불일치합니다.");
                $("#uPwdChk").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
          
            var uName = $("#uName").val();
            uName = $.trim( uName );
            
            if( uName == "" ){
                alert("이름을 입력하세요.");
                $("#uName").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
            
            var member_postcode = $("input[name=member_postcode]").val();
            member_postcode = $.trim( member_postcode );
            
            if( member_postcode == "" ){
                alert("우편번호를 입력하세요.");
                $("input[name=member_postcode]").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
            
            var member_address = $("input[name=member_address]").val();
            member_address = $.trim( member_address );
            
            if( member_address == "" ){
                alert("주소를 입력하세요.");
                $("input[name=member_address]").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
            
            $("#uAddr").val( "["+member_postcode+"]"+ member_address );
            
            var uPhone = $("#uPhone").val();
            uPhone = $.trim( uPhone );
            
            if( uPhone == "" ){
                alert("휴대폰 번호를 입력하세요.");
                $("#uPhone").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
            
            var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

            if ( !regExp.test( uPhone ) ) {
                  alert("잘못된 휴대폰 번호입니다. 숫자, - 를 포함한 숫자만 입력하세요.");
                  $("#uPhone").focus();
                  return;
            };
            
            var uEmail = $("#uEmail").val();
            uEmail = $.trim( uEmail );
            
            if( uEmail == "" ){
                alert("이메일을 입력하세요.");
                $("#uEmail").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
            
            var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 

            if ( !regExp.test( uEmail ) ) {
                  alert("잘못된 이메일입니다. 이메일 형식은 ex) abc123@naver.com ");
                  $("#uEmail").focus();
                  return;
            };
            
            $("#uCheer").val( $("#uCheerSel option:selected").val());
//             if ( $("#answerChk").val() == 'N' ){
//             	alert("자동등록 방지를 입력하고 확인버튼을 클릭해주세요.")
//             	return;
//             }
            
            $("#dataform").submit();
            
      	});
	});
</script>
</head>
<body>
<%--상단 메뉴--%>
    <%@ include file="../common/top.jsp" %>  
 <%--회원가입 화면 내용--%>
 <div id="help" >홈 > 회원가입</div>
 <p id="ment21">회원 정보</p>
 <p id="line1"></p>
<form id="dataform" name="dataform" action="insertUser.do" method="post"><!-- 회원가입 완료 시 메인화면인 main.jsp파일로 넘어간다. -->
 <table id="form"  width="720" align="center" style=" position : relative; top: 80px; background-color: rgb(246, 239, 239);">
  <tr>
   <td align="left">아이디<span class="color_red">*</span></td>
   <td>
   		<input type="text" name="userId" id="uId"> <input id="idCheck" type="button" value="아이디 중복확인"/>
   		<input id="idConfirm" type="hidden" value="N"/>   
   </td>
  </tr>
  <tr>
   <td align="left">비밀번호<span class="color_red">*</span></td>
   <td><input type="password" name="userPwd" id="uPwd"></td>
  </tr>
  <tr>
   <td align="left">비밀번호 확인<span class="color_red">*</span></td>
   <td><input type="password" name="uPwdChk" id="uPwdChk"></td>
  </tr>
  <tr>
   <td align="left" >이름<span class="color_red">*</span></td>
   <td><input type="text" name="userName" id="uName"></td>
  </tr>
  <tr>
   <td align="left" >주소<span class="color_red">*</span></td>
   <td>
   		<input type="text" id="member_postcode" name="member_postcode" placeholder="우편번호">
		<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="member_address" name="member_address" placeholder="주소">
		<input type="text" id="member_address2" name="member_address2" placeholder="상세주소">
		<input type="hidden" id="uAddr" name="userAddr">
	</td>
  </tr>
  <tr>
   <td align="left" >휴대 전화<span class="color_red">*</span></td>
   <td><input type="text" name="userPhone" id="uPhone"></td>
  </tr>
  <tr>
   <td align="left" >이메일<span class="color_red">*</span></td>
   <td><input type="text" name="userEmail" id="uEmail"></td>
  </tr>
 </table>
 <p id="ment21">추가정보</p>
 <p id="line1"></p>
 <table width="720" align="center" style="background-color: rgb(246, 239, 239); position : relative; top: 80px;">
  <tr>
   <td align="left" style="width: 186px;" >응원하는 팀</td>
   <td>
   <select id="uCheerSel">
   	<c:forEach items="${teamList }" var="team">
   		<option value="${team.TEAM_CODE }">${team.TEAM_NM }</option>
   	</c:forEach>
   </select>
   <input type="hidden" name="userCheer" id="uCheer" />
   </td>
  </tr>
  <tr>
   <td align="left" style="width: 186px;">생년월일</td>
   <td><input type="text" name="userBirth" id="uBirth" placeholder="YYYY-MM-DD"></input></td>
  </tr>
 </table>
 <br/>
 <table width="720" align="center" style="background-color: rgb(246, 239, 239); position : relative; top: 80px;">
 	<tr>
	   <td align="left">이메일 수신동의</td>
	   <td><input type="checkbox" name="userMailfg" id="uMailfg" checked="checked" value="Y"/><small>정보 메일을 받겠습니다.</small></td>
	  </tr>
	  <tr>
	   <td align="left">sms수신 동의</td>
	   <td><input type="checkbox" name="userSmsfg" id="uSmsfg" checked="checked" value="Y"/><small>휴대폰 문자 메시지를 받겠습니다.</small></td>
	  </tr>
	  <tr>
	   <td align="left">자동등록 방지</td>
	   <td>
	   	<div id="catpcha"></div>
	       <div id="audiocatpch" style="display: block;"></div>
	 
	       <input id="reLoad" type="button" value="새로고침" />
	       <br />
	       <input type="text" id="answer" name="answer" value="" />
	       <input type="hidden" id="answerChk" name="answerChk" value="N" />
	       <input type="button" id="frmSubmit" value="확인" />	   	
	   <br/>
	   	<small>자동등록 방지 숫자를 순서대로 입력하세요.</small>
	   </td>
	  </tr>
 </table>
 </form>
 <br/>
 <div style="position: relative; top: 100px; left: 600px;">
	<button id="join" type="button" style="font-size: 16px; color: rgb(241, 196, 15); text-align: center; line-height: 2.5em; background-color: rgb(28, 32, 95);">회원가입</button>
	<button id="cancel" type="button" style="font-size: 16px; color: rgb(241, 196, 15); text-align: center; line-height: 2.5em; background-color: rgb(28, 32, 95);">취소</button> 
 </div>
<!-- </form> -->
 
  <%@ include file="../common/bottom.jsp" %>	
</body>
</html>