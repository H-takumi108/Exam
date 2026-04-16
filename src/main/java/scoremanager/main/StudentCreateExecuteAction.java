package scoremanager.main;
 
import bean.Teacher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;
 
public class StudentCreateExecuteAction extends Action {
    public void execute(
            HttpServletRequest req, HttpServletResponse res
        ) throws Exception {
    	HttpSession session = req.getSession();
    	Teacher teacher = (Teacher)session.getAttribute("user");
    	
    	String entYearStr = "";
    	String noStr = "";
    	String nameStr ="";
    	String classNumStr ="";
    	
    	entYearStr = req.getParameter("entYearStr");
    	noStr = req.getParameter("noStr");
    	nameStr = req.getParameter("nameStr");
    	classNumStr = req.getParameter("classNumStr");
    
    	if (noStr == null || noStr.trim().isEmpty()) {
    	   pass
    	} else if (nameStr == null || nameStr.trim().isEmpty()) {
    	     pass
    	}

    	if () {
    	    req.setAttribute("error", errorMessage);
    	    req.getRequestDispatcher("student_create.jsp").forward(req, res);
    	    return;
    	}
        }
}  