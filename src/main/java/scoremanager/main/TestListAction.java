package scoremanager.main;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import bean.Subject;
import bean.Teacher;
import dao.ClassNumDao;
import dao.SubjectDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class TestListAction extends Action {
	public void execute (
		HttpServletRequest request, HttpServletResponse response
		) throws Exception {
		HttpSession session = request.getSession();
		Teacher teacher = (Teacher)session.getAttribute("user");
		
    	LocalDate todaysDate = LocalDate.now();
    	int year = todaysDate.getYear();
    	ClassNumDao cNumDao = new ClassNumDao();
    	SubjectDao subDao = new SubjectDao();
    	
    
    	List<Integer> entYearSet = new ArrayList<>();
    	for (int i = year -10;i < year + 1; i++) {
    		entYearSet.add(i);
    	}
    	
    	List<String> cNum = cNumDao.filter(teacher.getSchool());
    	
    	List<Subject> subject = subDao.filter(teacher.getSchool());
    	
    	session.setAttribute("class_num_set", cNum);
    	session.setAttribute("sub_name_set", subject);
    	session.setAttribute("ent_year_set", entYearSet);
    	
    	request.getRequestDispatcher("test_list.jsp").forward(request, response);
    	// エラー表記未記入
	}
}