<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../_include/inc_header.jsp" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DDV 설문조사</title>
    <style>
        .container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .logo {
            margin-bottom: 20px;
        }
        .image {
            width: 100%;
            max-width: 300px;
            margin-bottom: 20px;
        }
        .description {
            font-size: 18px;
            margin-bottom: 20px;
        }
        .sub-description {
            color: #888;
            margin-bottom: 30px;
            
        }
        .button-container {
            display: flex;
            justify-content: space-around;
        }
        .button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .cancel-button {
            background-color: #f8d7da;
            color: #721c24;
        }
        .cancel-button:hover {
            background-color: #f5c6cb;
        }
        .start-button {
            background-color: #d4edda;
            color: #155724;
        }
        .start-button:hover {
            background-color: #c3e6cb;
        }
    </style>
</head>
<body>
    <div class="container">
       
        <div class="description"><h3>${resultDTO.surveyTitle }</h3></div>
        <div class="sub-description"><h4>${resultDTO.surveySubTitle }</h4></div>
        <div class="button-container">
            <button class="button cancel-button"><a href = "${path }">취소</a></button>
            <button class="button start-button" onClick = "participate('qnalist','${resultDTO.surveyNo }')">시작</button>
        </div>
    </div> 
<script>
	function participate(value1, value2) {
	    location.href = '${path}/participate/' + value1 + '?surveyNo=' + value2;
	}
</script> 
</body>
</html>

 
