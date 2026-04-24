package scoremanager.main;

import bean.Teacher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class TestListStudentExecuteAction extends Action {
	public void execute (
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		HttpSession session = request.getSession();
		Teacher teacher = (Teacher)session.getAttribute("user");
		
		String studentNo = "";
		
		
		
		studentNo = request.getParameter("f4");
		
		request.getRequestDispatcher("test_list_student.jsp").forward(request, response);
	}
}