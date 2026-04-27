package scoremanager.main;

import java.util.List;

import bean.Student;
import bean.Teacher;
import bean.TestListStudent;
import dao.StudentDao;
import dao.TestListStudentDao;
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
		
		String no = "";
		Student student = null;
		List<TestListStudent> tlst = null;
		StudentDao sDao = new StudentDao();
		TestListStudentDao tlstDao = new TestListStudentDao();
		
		no = request.getParameter("f4");
		
		student = sDao.get(no);
		
		tlst = tlstDao.filter(student);
		
		request.setAttribute("f4", no);
		request.setAttribute("student", student);
		request.setAttribute("tlst", tlst);
		
		request.getRequestDispatcher("test_list_student.jsp").forward(request, response);
	}
}