<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../_include/inc_header.jsp" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문과 답변</title>
    <style>
        .container {
            max-width: 600px;
            margin: 0 auto;
        }
        .question {
            font-size: 1.5em;
            margin-bottom: 20px;
            font-weight: bolder;
        }
        .answers {
            list-style-type: none;
            padding: 0;
        }
        .answers li {
            margin-bottom: 10px;
        }
        .answers input[type="radio"] {
            display: none;
        }
        .answers label {
            display: block;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 10px;
            cursor: pointer;
            user-select: none;
        }
        .answers input[type="radio"]:checked + label {
            background-color: #e0f7fa;
            border-color: #00796b;
        }
        .navigation {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .navigation a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #00796b;
            color: white;
            border-radius: 5px;
        }
        .navigation a.disabled {
            background-color: #ddd;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <c:if test="${list.size() == 0}">
        <div class="question">
            질문이 없습니다.           
        </div>
    </c:if>
    <c:if test="${list.size() != 0}">
        <c:choose>
            <c:when test="${empty param.pageIndex}">
                <c:set var="pageIndex" value="0"/>
            </c:when>
            <c:otherwise>
                <c:set var="pageIndex" value="${param.pageIndex}"/>
            </c:otherwise>
        </c:choose>
        <c:set var="dto" value="${list[pageIndex]}" />
        <div class="container">
        <form name="joinForm" >
            <div class="question">
            <c:if test="${dto.no  <= list.size()}">
            	${dto.no }/${list.size() }<br>
            	${dto.question}
            </c:if>	
             <input type="hidden" id="" name="selectedQuestion" value="${dto.surveyQnANo}">
            </div>
             <c:if test="${pageIndex <= list.size() - 1}">
                <ul class="answers">
                    <li>
                        <input type="radio" id="answer1" name="answer1" value="${dto.answer1}">
                        <label for="answer1">${dto.answer1}</label>
                    </li>
                    <li>
                        <input type="radio" id="answer2" name="answer2" value="${dto.answer2}">
                        <label for="answer2">${dto.answer2}</label>
                    </li>
                    <li>
                        <input type="radio" id="answer3" name="answer3" value="${dto.answer3}">
                        <label for="answer3">${dto.answer3}</label>
                    </li>
                    <li>
                        <input type="radio" id="answer4" name="answer4" value="${dto.answer4}">
                        <label for="answer4">${dto.answer4}</label>
                    </li>
                    <li>
                        <input type="radio" id="answer5" name="answer5" value="${dto.answer5}">
                        <label for="answer5">${dto.answer5}</label>
                    </li>
                </ul>
            </c:if>    
                <input type="hidden" name="pageIndex" value="${pageIndex}" />
                <div class="navigation">
                   
                    <c:if test="${pageIndex < list.size() - 1}">
                        <a href="#" onclick="navigateToNextPage(${pageIndex + 1}); return false;">다음</a>
                    </c:if>
                    <c:if test="${pageIndex == list.size() - 1}">
                     	<a href="#" onclick="navigateToNextPage(${pageIndex + 1}); return false;">다음</a>
                       
                    </c:if>
                    
                     <c:if test="${pageIndex > list.size() - 1}">
                     	모든 질문에 작성을 완료했습니다
                        <a href="#" onclick="insert();">제출</a>
                    </c:if>
                </div>
                 <input type="hidden" id="" name="question" value="${question}"><br>
                 <input type="hidden" id="" name="arrayAnswer1" value="${arrayAnswer1}"><br>
                 <input type="hidden" id="" name="arrayAnswer2" value="${arrayAnswer2}"><br>
                 <input type="hidden" id="" name="arrayAnswer3" value="${arrayAnswer3}"><br>
                 <input type="hidden" id="" name="arrayAnswer4" value="${arrayAnswer4}"><br>
                 <input type="hidden" id="" name="arrayAnswer5" value="${arrayAnswer5}"><br>
                 <input type="hidden" id="" name="surveyNo" value="${surveyNo}">
            </form>
        </div>
    </c:if>
    
    <script>
    function insert() {
    	if(confirm('설문조사를 저장하시겠습니까?')){
    		//document.DirForm.enctype = "multiplart/form-data";
    		document.joinForm.action = "${path}/participate/insertProc";
    		document.joinForm.method = "post"
    		document.joinForm.submit();
    	}
    }

    function navigateToNextPage(nextPageIndex) {
        var selectedAnswer = document.querySelector('input[name^="answer"]:checked');
        if (selectedAnswer) {
            document.joinForm.action = "${path}/participate/insert?surveyNo="+${surveyNo}+"&pageIndex=" + nextPageIndex;
            document.joinForm.method = "post";
            document.joinForm.submit();
        } else {
            alert('답변을 선택해 주세요.');
        }
    }
    </script>
</body>
</html>
