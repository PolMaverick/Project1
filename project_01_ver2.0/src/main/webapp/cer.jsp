<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
document.cookie = "crossCookie=bar; SameSite=None; Secure";
let IMP = window.IMP;
IMP.init("iamport"); 
IMP.certification({ 
    merchant_uid: "ORD20180131-0000011"
  }, function (rsp) { 
    if (rsp.success) {/* 본인인증 성공시 */
      	alert("인증에 성공하였습니다");/* 성공메세지출력 */
  		location.href="member_create.jsp?cerMsg=본인인증 성공"/* cerMsg를 가지고 회원가입 화면으로 이동 */
    } else {		/* 본인인증 실패시 */
    	alert("인증에 실패하였습니다. 에러 내용: " +  rsp.error_msg);/* 실패+에러 메세지출력 */
    	location.href="member_create.jsp?cerMsg='본인인증 실패'"/* cerMsg를 가지고 회원가입 화면으로 이동 */
    }
  });
</script>
</head>
<body>
</body>
</html>
