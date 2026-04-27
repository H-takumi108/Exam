package scoremanager.main;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Subject;
import bean.Teacher;
import bean.Test;
import dao.ClassNumDao;
import dao.SubjectDao;
import dao.TestDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class TestRegistAction extends Action {
	public void execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception {

	    HttpSession session = request.getSession();
	    Teacher teacher = (Teacher) session.getAttribute("user");

	    String entYearStr = request.getParameter("f1");
	    String classNumStr = request.getParameter("f2");
	    String subjectCdStr = request.getParameter("f3");
	    String noStr = request.getParameter("f4");

	    School school = teacher.getSchool();
	    ClassNumDao cNumDao = new ClassNumDao();
	    List<String> cNumList = cNumDao.filter(school);

	    SubjectDao subDao = new SubjectDao();
	    List<Subject> subList = subDao.filter(school);

	    LocalDate today = LocalDate.now();
	    int year = today.getYear();

	    List<Integer> entYearSet = new ArrayList<>();
	    for (int i = year - 10; i <= year; i++) {
	        entYearSet.add(i);
	    }

	    List<Integer> nolist = List.of(1, 2);

	    request.setAttribute("ent_year_set", entYearSet);
	    request.setAttribute("class_num_set", cNumList);
	    request.setAttribute("sub_name_set", subList);
	    request.setAttribute("test_no_set", nolist);	



	    request.setAttribute("f1", entYearStr);
	    request.setAttribute("f2", classNumStr);
	    request.setAttribute("f3", subjectCdStr);
	    request.setAttribute("f4", noStr);

	    List<Test> list = new ArrayList<>();

	    if (entYearStr != null && !"0".equals(entYearStr)
	        && classNumStr != null && !"0".equals(classNumStr)
	        && subjectCdStr != null && !"0".equals(subjectCdStr)
	        && noStr != null && !"0".equals(noStr)) {

	        int entYear = Integer.parseInt(entYearStr);
	        int no = Integer.parseInt(noStr);

	        Subject subject = new Subject();
	        subject.setCd(subjectCdStr);

	        TestDao dao = new TestDao();
	        list = dao.filter(entYear, classNumStr, subject, no, school);
	        
	    }

	    request.setAttribute("test", list);

	    request.getRequestDispatcher("test_regist.jsp").forward(request, response);
	}
}