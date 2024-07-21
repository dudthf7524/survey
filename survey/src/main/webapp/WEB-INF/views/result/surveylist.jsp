<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../_include/inc_header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border = "1">
	<tr>
		<th>제목</th>
		<th>부제목</th>
		<th>종료일</th>
		
	</tr>
	
	<c:forEach var = "dto" items = "${surveylist}">		
	<tr>
		<td><a href = "#" onClick = "goPage4('surveyview', '${dto.surveyNo }');">${dto.surveyTitle }</td>
		<td>${dto.surveySubTitle }</td>
		<td>${dto.finalDate }</td>
		
	</tr>
	</c:forEach>
</table>

<script>
function goPage4(value1, value2){
		location.href = '${path}/result/'+value1 + '?surveyNo=' + value2;
	}
	
</script>
</body>
</html>