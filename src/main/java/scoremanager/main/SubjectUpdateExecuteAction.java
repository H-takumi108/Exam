package scoremanager.main;
 
import bean.School;
import bean.Subject;
import bean.Teacher;
import dao.SubjectDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;
 
public class SubjectUpdateExecuteAction extends Action {
    public void execute(
            HttpServletRequest req, HttpServletResponse res
        ) throws Exception {
    	HttpSession session = req.getSession();
    	Teacher teacher = (Teacher)session.getAttribute("user");
    	
    	//Schoolの取得
    	School school = teacher.getSchool();
    	
    	//変数の定義
    	String cdStr = "";
    	String nameStr ="";
    	
    	//jspからの入力
    	cdStr = req.getParameter("cdStr");
    	nameStr = req.getParameter("nameStr");
    	
 
    	// 登録を行う
   	    Subject subject = new Subject();
   	    subject.setSchool(school);
   	    subject.setCd(cdStr);
   	    subject.setName(nameStr);

        SubjectDao dao = new SubjectDao();
        boolean result = dao.save(subject);
        if (result == true) {
        	req.getRequestDispatcher("subject_update_done.jsp").forward(req, res);
        } else {
        	req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}
    	    

