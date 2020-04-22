<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>예외 발생</title>
</head>
<body>
요청을 처리하는 도중에 예외가 발생하였습니다:
${exception.message}
<%
	Throwable e = (Throwable)request.getAttribute("exception");
	e.printStackTrace();
%>

<p>
<a href="main.do"> [HOME] </a>을 클릭하시면, 홈으로 돌아갑니다.
</p>
</body>
</html>