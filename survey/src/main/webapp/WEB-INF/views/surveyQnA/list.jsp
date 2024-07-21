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


<h1>질문목록</h1>

<table border = "1">
        <tr>
            <th>
                질문
            </th>
            <th>
                보기1
            </th>
            <th>
                보기2
            </th>
            <th>
                보기3
            </th>
            <th>
               	보기4
            </th>
            <th>
                보기5
            </th>
        </tr>
        
    <c:forEach var = "surveyQnADTO" items = "${surveyQnADTOlist}">		
	<tr>
		<td><a href = "#" onClick = "goPage3('view', '${surveyQnADTO.surveyQnANo }');">${surveyQnADTO.question }</a></td>
		<td>${surveyQnADTO.answer1 }</td>
		<td>${surveyQnADTO.answer2 }</td>
		<td>${surveyQnADTO.answer3 }</td>
		<td>${surveyQnADTO.answer4 }</td>
		<td>${surveyQnADTO.answer5 }</td>
	</tr>
	</c:forEach>   

    </table>



<script>
function goPage3(value1, value2, value3){
		location.href = '${path}/surveyQnA/'+value1 + '?surveyQnANo=' + value2 + '&pageNumber__=' + value3;
	}
	
</script>
</body>
</html>