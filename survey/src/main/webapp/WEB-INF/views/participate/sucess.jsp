<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../_include/inc_header.jsp" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survey Completion</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        .container {
            text-align: center;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .image {
            width: 100%;
            max-width: 300px;
            border-radius: 10px;
        }
        .message {
            font-size: 1.2em;
            margin: 20px 0;
        }
        .points {
            color: #555;
            margin-bottom: 20px;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #f89a90;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #e07e7a;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="message">설문에 참여해 주셔서 감사합니다</div>
        <div class="points">500p가 누적되었습니다</div>
        <a href="${path }" class="button">메인으로 돌아가기</a>
    </div>
</body>
</html>
