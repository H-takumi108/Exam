package scoremanager.main;

import bean.School;
import bean.Subject;
import bean.Teacher;
import dao.SubjectDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class SubjectDeleteExecuteAction extends Action {
	public void execute(
			HttpServletRequest req, HttpServletResponse res
			) throws Exception {
		HttpSession session = req.getSession();
		Teacher teacher = (Teacher)session.getAttribute("user");
		
		School school = teacher.getSchool(); 
		
		String cdStr = "";
		String nameStr = "";
		
		cdStr = req.getParameter("cdStr");
		nameStr = req.getParameter("nameStr");
		
		Subject subject = new Subject();
		subject.setSchool(school);
		subject.setCd(cdStr);
		subject.setName(nameStr);
		
		SubjectDao dao = new SubjectDao();
		boolean result = dao.delete(subject);
		if (result == true) {
			req.getRequestDispatcher("subject_delete_done.jsp").forward(req, res);
		} else {
			req.getRequestDispatcher("/error.jsp").forward(req, res);
		}
	}
}