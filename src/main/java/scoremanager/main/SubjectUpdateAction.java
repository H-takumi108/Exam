package scoremanager.main;
 
import bean.School;
import bean.Subject;
import bean.Teacher;
import dao.SubjectDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;
 
public class SubjectUpdateAction extends Action {
    public void execute(
            HttpServletRequest req, HttpServletResponse res
        ) throws Exception {
    	HttpSession session = req.getSession();
    	Teacher teacher = (Teacher)session.getAttribute("user");

    	School school = teacher.getSchool();
    		//subjectlist.jspから科目コードを取得
    		String cd = req.getParameter("no");
    		//科目コード、学校コードから科目情報を取得
    		SubjectDao dao = new SubjectDao();
    	    Subject subject = dao.get(cd,school);    
    	    
    	    //科目情報をセット
    	    req.setAttribute("school_cd", school.getCd());
    	    req.setAttribute("cd", subject.getCd());
    	    req.setAttribute("name", subject.getName());
    	    
    	//フォワード
        	req.getRequestDispatcher("subject_update.jsp").forward(req, res);
        }
}  