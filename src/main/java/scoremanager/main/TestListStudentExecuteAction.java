package scoremanager.main;

import java.util.List;

import bean.Student;
import bean.Subject;
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
		
		List<String> cNum = (List<String>) session.getAttribute("class_num_set");
		List<Subject> subject = (List<Subject>) session.getAttribute("sub_name_set");
		List<Integer> entYearSet = (List<Integer>) session.getAttribute("ent_year_set");
		
    	request.setAttribute("class_num_set", cNum);
    	request.setAttribute("sub_name_set", subject);
    	request.setAttribute("ent_year_set", entYearSet);
		
		String no = "";
		Student student = null;
		List<TestListStudent> tlst = null;
		StudentDao sDao = new StudentDao();
		TestListStudentDao tlstDao = new TestListStudentDao();
		
		no = request.getParameter("f4");
		
		student = sDao.get(no);
		if (student != null) {
		tlst = tlstDao.filter(student);
		} else {
			int a;  //ここにエラー処理を記入
		}
		
		request.setAttribute("f4", no);
		request.setAttribute("student", student);
		request.setAttribute("tlst", tlst);
		
		request.getRequestDispatcher("test_list_student.jsp").forward(request, response);
	}
}