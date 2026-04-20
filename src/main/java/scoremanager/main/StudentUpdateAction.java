package scoremanager.main;
 
import bean.Student;
import dao.StudentDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;
 
public class StudentUpdateAction extends Action {
    public void execute(
            HttpServletRequest req, HttpServletResponse res
        ) throws Exception {
    	HttpSession session = req.getSession();
    		//studentlist.jspから学生番号を取得
    		String no = req.getParameter("no");
    		//学生番号から学生情報を取得
    		StudentDao dao = new StudentDao();
    	    Student student = dao.get(no);
    	    //学生情報をセッション
    	    session.setAttribute("entYear", student.getEntYear());
    	    session.setAttribute("no", student.getNo());
    	    session.setAttribute("name", student.getName());
    	    session.setAttribute("classNum", student.getClassNum());
    	    boolean Attend = student.isAttend();
    	    //在籍中ならチェックボックスをオンに変える
    	    if (Attend == true) {
    	    	session.setAttribute("attend", "on");
    	    }
    	
    	//フォワード
        	req.getRequestDispatcher("studentupdate.jsp").forward(req, res);
        }
}  