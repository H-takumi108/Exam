<%@page contentType="text/html; charset=UTF-8" %>
<form action="SubjectCreateExecute.action" method="post">
<p>科目コード<input type="text" name="cdStr">${error}</p>
<p>科目名<input type="text" name="nameStr"></p>
<input type="submit" value="登録">
</form>