<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>

<h1>学生登録画面</h1>
<form action="StudentCreateExecute.action" method="post">
<p>入学年度<select name="entYearStr">
    <c:forEach var="year" items="${ent_year_set}">
        <option value="${year}">${year}</option>
    </c:forEach>
</select>
${error3}</p>
<p>学生番号<input type="text" name="noStr" value="${noStr}">${error1}</p>
<p>学生氏名<input type="text" name="nameStr" value="${nameStr}">${error2}</p>
<p>クラス番号
<select name="classNumStr">
    <c:forEach var="classNum" items="${classList}">
        <option value="${classNum}">${classNum}</option>
    </c:forEach>
</select>
</p>
<p><input type="submit" value="登録"></p>
</form>

