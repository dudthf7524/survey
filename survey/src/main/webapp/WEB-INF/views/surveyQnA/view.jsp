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
            background-color: yellow;
        	color: black;
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
		<input type="hidden" name = "surveyNo" value = "${surveyQnADTO.surveyNo}" readonly>
	<div class="container">
	    <div class="form-group">
	        <input type="text" id = "question" placeholder="질문입력" name = "question" value = "${surveyQnADTO.question}" readonly>
	    </div>
	    
	   
	    <div class="form-group">
	        <input type="text" placeholder="선택지 1. 내용 입력" name = "answer1" value = "${surveyQnADTO.answer1}" readonly>
	    </div>
	    <div class="form-group">
	        <input type="text" placeholder="선택지 2. 내용 입력" name = "answer2" value = "${surveyQnADTO.answer2}" readonly>
	    </div>
	    <div class="form-group">
	        <input type="text" placeholder="선택지 3. 내용 입력" name = "answer3" value = "${surveyQnADTO.answer3}" readonly>
	    </div>
	    <div class="form-group">
	        <input type="text" placeholder="선택지 4. 내용 입력" name = "answer4" value = "${surveyQnADTO.answer4}" readonly>
	    </div>
	    <div class="form-group">
	        <input type="text" placeholder="선택지 5. 내용 입력" name = "answer5" value = "${surveyQnADTO.answer5}" readonly>
	    </div>
	   	<button type="button" class="submit-btn" onClick="goPage('update', '${surveyQnADTO.surveyQnANo}', '');">수정</button>
	   	<br>
	   	<button type="button" class="submit-btn" onClick="sakje();">삭제</button>
	</div>
</form>

<script>
function goPage(value1, value2, value3){
		location.href = '${path}/surveyQnA/'+value1 + '?surveyQnANo=' + value2 + '&pageNumber=' + value3;
	}
	
</script>

<script>
    function sakje() {
    	if(confirm('삭제하시겠습니까?')){
    		//document.SaveForm.enctype = "multiplart/form-data";
    		document.SaveForm.action = "${path}/surveyQnA/deleteProc?surveyQnANo=" + ${surveyQnADTO.surveyQnANo};
    		document.SaveForm.method = "post"
    		document.SaveForm.submit();
    	}
    }
</script>

</body>
</html>
