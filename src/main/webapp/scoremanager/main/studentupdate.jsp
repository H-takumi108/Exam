<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>

<h1>学生情報更新</h1>
<p>入学年度</p>
<p>${entYear}</p>
<p>学生番号</p>
<p>${no}</p>
<form action="StudentUpdateExecute.action" method="post">
<input type="hidden" name="entYeatStr" value="${entYear}">
<input type="hidden" name="noStr" value="${no}">
<p>氏名</p>
<p><input type="text" name="nameStr" value="${name}">${error1}</p>
<p>クラス</p>
<p><input type="text" name="classNumStr" value="${classNum}">${error2}</p>
<p>在学中<input type="checkbox" name="attendStr"
<% if ("on".equals(session.getAttribute("attend"))) { %>
    checked="checked"
<% } %>
></p>
<p><input type="submit" value="変更"></p>
<a href="xxxxxx">戻る</a> <%-- 学生管理一覧に戻る --%>
</form>

