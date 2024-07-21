<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../_include/inc_header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .colored-hr {
        border: none;
        border-top: 1px solid #00796b; /* 원하는 색상으로 변경 */
        margin: 10px 0; /* 상하 여백 설정 */
    }
</style>
</head>
<body>
    <table align ="center">
    <tr>
        <th>질문</th>
        <th>선택지</th>
        <th>선택인원</th>
       
    </tr>
    
    <c:forEach var="dto" items="${ResultDTOList}">
        <tr>
            <td>${dto.question}</td>
             <td>
                1. ${dto.answerContent1}<hr class="colored-hr">
                2. ${dto.answerContent2}<hr class="colored-hr">
                3. ${dto.answerContent3}<hr class="colored-hr">
                4. ${dto.answerContent4}<hr class="colored-hr">
                5. ${dto.answerContent5}
            </td>
            <td>
               ${dto.answer1}<hr class="colored-hr">
               ${dto.answer2}<hr class="colored-hr">
               ${dto.answer3}<hr class="colored-hr">
               ${dto.answer4}<hr class="colored-hr">
               ${dto.answer5}
            </td>
        </tr>
    </c:forEach>
    </table>
</body>
</html>
