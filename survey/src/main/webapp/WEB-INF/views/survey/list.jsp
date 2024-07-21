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


<h1>내가 작성한 설문목록</h1>

<table border = "1">
        <tr>
            <th>
                설문제목
            </th>
            <th>
                설문부제목
            </th>
            
            <th>
                설문 종료일
            </th>
        </tr>
        
    <c:forEach var = "surveyDTO" items = "${surveylist}">		
	<tr>
		<td><a href = "#" onClick = "goPage2('view', '${surveyDTO.surveyNo }');">${surveyDTO.surveyTitle }</a></td>
		<td>${surveyDTO.surveySubTitle }</td>
		
		<td>${surveyDTO.finalDate }</td>
	</tr>
	</c:forEach>   

    </table>



<script>
function goPage2(value1, value2, value3){
		location.href = '${path}/survey/'+value1 + '?surveyNo=' + value2 + '&pageNumber__=' + value3;
	}
	
</script>
</body>
</html>