<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../_include/inc_header.jsp" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설문조사의 종류</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background: #333;
            color: #fff;
            padding: 1em 0;
            text-align: center;
            position: relative;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        header h1 {
            margin: 0;
            font-size: 2em;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
        }
        header .auth-buttons {
            position: absolute;
            top: 50%;
            right: 1em;
            transform: translateY(-50%);
        }
        header .auth-buttons button {
            background: #fff;
            color: #333;
            border: none;
            padding: 0.5em 1em;
            margin-left: 0.5em;
            border-radius: 5px;
            cursor: pointer;
        }
        header .auth-buttons button:hover {
            background: #ccc;
        }
        .container {
            max-width: 800px;
            margin: 2em auto;
            padding: 1em;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
        }
       
        a{
        	text-decoration: none;
        	color: black;
        }
    </style>
</head>
<body>
    <header>
        <h1>SUR</h1>
        <div class="auth-buttons">
             
            
             
             
		     <c:choose>
				<c:when test="${sessionScope.memberNo == null || sessionScope.memberNo == ''}" >
					<button type = "button" onClick = "goPage('join', '', '2' );">회원가입</button>
             		<button type = "button" onClick = "goPage('login', '', '' );">로그인</button>
				</c:when>
				
				<c:otherwise>
					<span>${memberName }님&nbsp;환영합니다.</span>&nbsp;&nbsp;&nbsp;&nbsp;
					<button type = "button" onClick = "goPage2('list');">내정보</button>
					<button type = "button" onClick = "goPage('logout');">로그아웃</button>
					<c:set var="memberNo" value = "${memberNo = sessionScope.memberNo }"/>
					<c:set var="memberId" value = "${memberId = sessionScope.memberId }"/>
					<c:set var="memberName" value = "${memberName = sessionScope.memberName }"/>
				</c:otherwise>
			</c:choose>
        </div>
    </header>
    <div class="container">
        <jsp:include page="../${folder}/${file}.jsp"></jsp:include>

    </div>
</body>
</html>



<script>
	function goPage(value1, value2, value3){
		location.href = '${path}/member/'+value1;
	}
</script>

<script>
	function goPage2(value1){
		location.href = '${path}/survey/'+value1;
	}
</script>

<script>
	function goPage3(value1, value2, value3){
		location.href = '${path}/surveyQnA/'+value1 + '?no=' + value2 + '&pageNumber=' + value3;
	}
</script>