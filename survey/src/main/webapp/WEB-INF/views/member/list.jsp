<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "../_include/inc_header.jsp" %>

<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    .pagination {
        margin: 20px 0;
        text-align: center;
    }
    .pagination a, .pagination b {
        margin: 0 5px;
        padding: 8px 16px;
        text-decoration: none;
        border: 1px solid #ddd;
        color: #007BFF;
    }
    .pagination b {
        font-weight: bold;
        color: #000;
    }
</style>

<table>
    <tr>
        <td colspan="6">
            <h1>회원목록</h1>
        </td>
    </tr>
    <tr>
        <td colspan="6" height="50" align="center">
            <form name="searchForm">
                <select name="searchOption">
                    <option value="" <c:if test="${searchOption == ''}">selected</c:if>>선택안함</option>
                    <option value="memberId" <c:if test="${searchOption == 'memberId'}">selected</c:if>>아이디</option>
                    <option value="memberName" <c:if test="${searchOption == 'memberName'}">selected</c:if>>이름</option>
                    <option value="memberId_memberName" <c:if test="${searchOption == 'memberId_memberName'}">selected</c:if>>아이디+이름</option>
                </select>
                &nbsp;
                <input type="text" name="searchData" value="${searchData}">
                &nbsp;
                <button type="button" onclick="search();">검색</button>
            </form>
            <script>
                function search() {
                    if (confirm('검색OK?')) {
                        document.searchForm.action = "${path}/member/list";
                        document.searchForm.method = "get";
                        document.searchForm.submit();
                    }
                }
            </script>
        </td>
    </tr>
    <tr>
        <th>순번</th>
        <th>아이디/이름</th>
        <th>가입일</th>
        <th>이메일</th>
    </tr>
    
    <c:forEach var="dto" items="${list}" varStatus="status">        
    <tr>
        <td>${status.index + 1}</td>
        <td><a href="#" onClick="goPage('view', '${dto.memberNo}');">${dto.memberId}/${dto.memberName}</a></td>
        <td>${dto.joinDate}</td>
        <td>${dto.memberEmail1}@${dto.memberEmail2}</td>
    </tr>
    </c:forEach>
    
    
</table>


<c:if test="${totalRecord > 0}">
        
                <div class="pagination">
                    <a href="#" onClick="goPage('list', '', '1', '${searchOption}', '${searchData}');">[첫페이지]</a>
                    &nbsp;
                    <c:if test="${startPage > blockSize}">
                        <a href="#" onClick="goPage('list', '', '${startPage - blockSize}', '${searchOption}', '${searchData}');">[이전10개]</a>
                    </c:if>
                    <c:if test="${startPage <= blockSize}">
                        [이전10개]
                    </c:if>
                    &nbsp;&nbsp;
                    
                    <c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
                        <c:if test="${i == pageNumber}">
                            <b>[${i}]</b>
                        </c:if>
                        <c:if test="${i != pageNumber}">
                            <a href="#" onClick="goPage('list', '', '${i}', '${searchOption}', '${searchData}');">[${i}]</a>
                        </c:if>
                    </c:forEach>
                    
                    <c:if test="${lastPage < totalPage}">
                        <a href="#" onClick="goPage('list', '', '${startPage + blockSize}', '${searchOption}', '${searchData}');">[다음 10개]</a>
                    </c:if>
                    <c:if test="${lastPage >= totalPage}">
                        [다음10개]
                    </c:if>
                    &nbsp;&nbsp;
                    <a href="#" onClick="goPage('list', '', '${totalPage}', '${searchOption}', '${searchData}');">[끝페이지]</a>
                </div>
        
    </c:if>

