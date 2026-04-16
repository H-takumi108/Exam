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
    
    	boolean error = false;
    	if (noStr == null) {
    	   session.setAttribute("error1", "このフィードを入力して下さい");
    	   error = true;
    	}
    	if (nameStr == null) {
    		session.setAttribute("error2", "このフィードを入力して下さい");
     	   error = true;
    	}
    	if (error = true) {
    		req.getRequestDispatcher("studentcreate.jsp").forward(req, res);
    	}
        }
}  