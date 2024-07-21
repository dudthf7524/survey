<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../_include/inc_header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문 입력</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .header img {
            height: 40px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"]
        {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .radio-group {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
        }
        .radio-group input {
            margin-right: 5px;
            
        }
        #question{
            
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: none;
            border-bottom: 2px solid #ccc;
            outline: none;
            transition: border-color 0.3s;
            font-size: larger;
            font-weight: bolder;
        }
        #question:focus{
            border-bottom: 2px solid #007BFF;
        }
        .submit-btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #a781ee;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .submit-btn:hover {
            background-color: #9765f5;
        }
    </style>
</head>
<body>

<form name = "SaveForm">
	<div class="container">
	   <input type="hidden" name = "surveyNo" value = "${surveyNo }">
		
	    <div class="form-group">
	        <input type="text" id = "question" placeholder="질문입력" name = "question">
	    </div>
	    
	   
	    <div class="form-group">
	        <input type="text" placeholder="선택지 1. 내용 입력" name = "answer1">
	    </div>
	    <div class="form-group">
	        <input type="text" placeholder="선택지 2. 내용 입력" name = "answer2">
	    </div>
	    <div class="form-group">
	        <input type="text" placeholder="선택지 3. 내용 입력" name = "answer3">
	    </div>
	    <div class="form-group">
	        <input type="text" placeholder="선택지 4. 내용 입력" name = "answer4">
	    </div>
	    <div class="form-group">
	        <input type="text" placeholder="선택지 5. 내용 입력" name = "answer5">
	    </div>
	   	<button type="button" class="submit-btn" onClick="save();">저장</button>
	</div>
</form>

<script>
    function save() {
    	if(confirm('질문을 입력하시겠습니까?')){
    		//document.SaveForm.enctype = "multiplart/form-data";
    		document.SaveForm.action = "${path}/surveyQnA/insertProc";
    		document.SaveForm.method = "post"
    		document.SaveForm.submit();
    	}
    }
</script>

</body>
</html>

