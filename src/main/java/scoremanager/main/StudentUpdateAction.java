package scoremanager.main;
 
import java.util.List;

import bean.School;
import bean.Student;
import dao.ClassNumDao;
import dao.StudentDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;
 
public class StudentUpdateAction extends Action {
    public void execute(
            HttpServletRequest req, HttpServletResponse res
        ) throws Exception {
    		 
    		//studentlist.jspから学生番号を取得
    		String no = req.getParameter("no");
    		//学生番号から学生情報を取得
    		StudentDao dao = new StudentDao();
    	    Student student = dao.get(no);
    	    //学校コードからクラス一覧を取得
    	    School school = student.getSchool();
    	    ClassNumDao cdao = new ClassNumDao();
    	    List<String> classList = cdao.filter(school);
    	    req.setAttribute("classList", classList);
    	    
    	    
    	    //学生情報をセット
    	    req.setAttribute("entYear", student.getEntYear());
    	    req.setAttribute("no", student.getNo());
    	    req.setAttribute("name", student.getName());
    	    req.setAttribute("classNum", student.getClassNum());
    	    
      	    boolean Attend = student.isAttend();
    	    //在籍中ならチェックボックスをオンに変える
    	    if (Attend == true) {
    	    	req.setAttribute("attend", "on");
    	    }
    	
    	//フォワード
        	req.getRequestDispatcher("student_update.jsp").forward(req, res);
        }
}  