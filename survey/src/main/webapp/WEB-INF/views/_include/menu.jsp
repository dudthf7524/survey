<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../_include/inc_header.jsp" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리 페이지</title>
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }
        .sidebar {
            width: 200px;
            background-color: #f2f2f2;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }
        .sidebar h2 {
            font-size: 1.2em;
            margin-bottom: 10px;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
        }
        .sidebar ul li {
            margin: 10px 0;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: #333;
            display: block;
            padding: 5px;
            border-radius: 3px;
        }
        .sidebar ul li a:hover {
            background-color: #888;
            color: #fff;
        }
        .main {
            flex: 1;
            display: flex;
            flex-direction: column;
        }
        .navbar {
            background-color: #333;
            color: white;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar input[type="text"] {
            padding: 5px;
            border: none;
            border-radius: 3px;
        }
        .content {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .main .navbar a{
        	text-decoration: none;
            color: white;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>마이 페이지</h2>
        <ul>
            <li><a href="#" onClick="goPage('view', '${memberNo }', '');">내 정보</a></li>
            
        </ul>
        <br>
        <h2>설문조사</h2>
        <ul>
            <li><a href="#" onClick="goPage2('insert', '', '');">설문등록</a></li>
            <li><a href="${path}/survey/list">설문목록</a></li>
        </ul>
        <br>
        <c:if test="${rank == 5}">
                     
                 
        <h2>관리자 페이지</h2>
        <ul>
            <li><a href="#" onClick="goPage('list', '', '');">회원정보</a></li>
            <li><a href="${path}/result/surveylist">설문결과</a></li>
        </ul>
        </c:if>
    </div>
    <div class="main">
        <div class="navbar">
            <div><a href = "${path }">SUR</a></div>
            <div>
            	<c:if test="${rank == 5}">
            	(관리자) ${memberName }님&nbsp;환영합니다
            	</c:if>
            	<c:if test="${rank != 5}">
            	${memberName }님&nbsp;환영합니다
            	</c:if>
                <!-- <input type="text" placeholder="검색...">
                <button>검색</button> -->
            </div>
        </div>
        <div class="content">
            <jsp:include page="../${folder}/${file}.jsp"></jsp:include>
        </div>
    </div>

    <script>
        function goPage(value1, value2, value3) {
            location.href = '${path}/member/' + value1 + '?memberNo=' + value2 + '&pageNumber=' + value3;
        }
    </script>

    <script>
        function goPage2(value1, value2, value3) {
            location.href = '${path}/survey/' + value1 + '?surveyNo=' + value2 + '&pageNumber=' + value3;
        }
    </script>
</body>
</html>
