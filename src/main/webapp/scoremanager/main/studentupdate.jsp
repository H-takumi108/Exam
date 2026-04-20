<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>

<h1>学生情報更新</h1>
<p>入学年度</p>
<p>${entYear}</p>
<p>学生番号</p>
<p>${no}</p>
<form action="StudentUpdateExecute.action" method="post">
<input type="hidden" name="entYearStr" value="${entYear}">
<input type="hidden" name="noStr" value="${no}">
<p>氏名</p>
<p><input type="text" name="nameStr" value="${name}">${error1}</p>
<p>クラス</p>
<select name="classNumStr">
    <c:forEach var="c" items="${classList}">
        <option value="${c}">${c}</option>
    </c:forEach>
</select>
<p>在学中<input type="checkbox" name="attendStr"
<% if ("on".equals(session.getAttribute("attend"))) { %>
    checked="checked"
<% } %>
></p>
<p><input type="submit" value="変更"></p>
<a href="StudentList.action">戻る</a> <%-- 学生管理一覧に戻る --%>
</form>

