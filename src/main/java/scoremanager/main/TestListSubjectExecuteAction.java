package scoremanager.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.Subject;
import bean.Teacher;
import bean.TestListSubject;
import dao.SubjectDao;
import dao.TestListSubjectDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class TestListSubjectExecuteAction extends Action {
	public void execute (
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		HttpSession session = request.getSession();
		Teacher teacher = (Teacher)session.getAttribute("user");
		
		List<String> cNum = (List<String>) session.getAttribute("class_num_set");
		List<Subject> subject = (List<Subject>) session.getAttribute("sub_name_set");
		List<Integer> entYearSet = (List<Integer>) session.getAttribute("ent_year_set");
    	
    	Map<String, String> errors = new HashMap<>();
    	
    	TestListSubjectDao tlsbDao = new TestListSubjectDao();
    	SubjectDao subDao = new SubjectDao();
    	Integer year = 0;
    	String classNum = "0";
    	String subCd = null;
    	
    	year = Integer.parseInt(request.getParameter("f1"));
    	classNum = request.getParameter("f2");
    	subCd = request.getParameter("f3");
    	
    	Subject sub = subDao.get(subCd, teacher.getSchool());
    	
    	if (year != 0 && !classNum.equals("0") && !subCd.equals("0")) {
    		List<TestListSubject> tlsb = tlsbDao.filter(year, classNum, sub, teacher.getSchool() );
    		request.setAttribute("tlsb", tlsb);
    	} else {
    		request.setAttribute("errors", "入学年度とクラスと科目を選択してください");
    	}
    	
    	request.setAttribute("f1", year);
    	request.setAttribute("f2", classNum);
    	if (sub != null) {
    		request.setAttribute("f3", sub.getName());
    	} else {
    		request.setAttribute("f3", subCd);
    	}
    	request.setAttribute("class_num_set", cNum);
    	request.setAttribute("sub_name_set", subject);
    	request.setAttribute("ent_year_set", entYearSet);
    	
    	request.getRequestDispatcher("test_list_subject.jsp").forward(request, response);
    	
	}
}