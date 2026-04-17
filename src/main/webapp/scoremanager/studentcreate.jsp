<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>

<h1>学生登録画面</h1>
<form action="StudentCreateExecute.action" method="post">
<p>入学年度<input type="text" name="entYearStr">${error3}</p>
<p>学生番号<input type="text" name="noStr" value="${noStr}">${error1}</p>
<p>学生氏名<input type="text" name="nameStr" value="${nameStr}">${error2}</p>
<p>クラス番号<input type="text" name="classNumStr" value="${classNumStr}"></p>
<p>パスワード<input type="password" name="password"></p>
<p><input type="submit" value="登録"></p>
</form>

