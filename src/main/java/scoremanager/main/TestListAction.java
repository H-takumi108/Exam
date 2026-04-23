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
		
		String entYearStr="";
    	int entYear = 0;
    	LocalDate todaysDate = LocalDate.now();
    	int year = todaysDate.getYear();
    	ClassNumDao cNumDao = new ClassNumDao();
    	SubjectDao subDao = new SubjectDao();
    	 
    	entYearStr = request.getParameter("f1");
    	
    	if (entYearStr != null) {
    		entYear = Integer.parseInt(entYearStr);
    	}
    
    	List<Integer> entYearSet = new ArrayList<>();
    	for (int i = year -10;i < year + 1; i++) {
    		entYearSet.add(i);
    	}
    	
    	List<String> cNum = cNumDao.filter(teacher.getSchool());
    	
    	List<Subject> subject = subDao.filter(teacher.getSchool());
    	
    	request.setAttribute("f1", entYear);
    	request.setAttribute("f2", cNum);
    	request.setAttribute("f3", subject);
    	
    	request.setAttribute("class_num_set", cNum);
    	request.setAttribute("sub_name_set", subject);
    	request.setAttribute("ent_year_set", entYearSet);
    	
    	request.getRequestDispatcher("test_list.jsp").forward(request, response);
    	// エラー表記未記入
	}
}