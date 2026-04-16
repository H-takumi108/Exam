<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>

<h1>学生登録画面</h1>
<form action="StudentCreateExecute.action" method="post">
<p>入学年度<input type="text" name="entYearStr"></p>
<p>学生番号<input type="text" name="noStr">${error1}</p>
<p>学生氏名<input type="text" name="nameStr"></p>
<p>クラス番号<input type="text" name="classNumStr"></p>
<p>パスワード<input type="password" name="password"></p>
<p><input type="submit" value="登録"></p>
</form>

