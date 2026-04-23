package scoremanager.main;
 
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Teacher;
import dao.ClassNumDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;
 
public class StudentCreateAction extends Action {
    public void execute(
            HttpServletRequest req, HttpServletResponse res
        ) throws Exception {
    	HttpSession session = req.getSession();
    		Teacher teacher = (Teacher)session.getAttribute("user");
    		
    		
    		
        	LocalDate todaysDate = LocalDate.now();
        	int year = todaysDate.getYear();
        	
        	List<Integer> entYearSet = new ArrayList<>();
        	for (int i = year -10;i < year + 1; i++) {
        		entYearSet.add(i);
        	}    	
        	
        	School school = teacher.getSchool();
    	    ClassNumDao cdao = new ClassNumDao();
    	    List<String> classList = cdao.filter(school);
    	
        	req.setAttribute("classList",classList);
        	req.setAttribute("ent_year_set", entYearSet);
    	
    	
        	req.getRequestDispatcher("student_create.jsp").forward(req, res);
        }
}

