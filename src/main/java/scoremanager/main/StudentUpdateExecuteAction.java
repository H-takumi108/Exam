package scoremanager.main;
 
import bean.Student;
import bean.Teacher;
import dao.StudentDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;
 
public class StudentUpdateExecuteAction extends Action {
    public void execute(
            HttpServletRequest req, HttpServletResponse res
        ) throws Exception {
    	HttpSession session = req.getSession();
    	Teacher teacher = (Teacher)session.getAttribute("user");
    	
    	
    	
    	//変数の定義
    	String entYearStr = "";
    	String noStr = "";
    	String nameStr ="";
    	String classNumStr ="";
    	int entYear = 0;
    	
    	
    	//jspからの入力
    	entYearStr = req.getParameter("entYearStr");
    	noStr = req.getParameter("noStr");
    	nameStr = req.getParameter("nameStr");
    	classNumStr = req.getParameter("classNumStr");
    	String attendStr = req.getParameter("attendStr");
    	boolean attend;//チェックボックスの判定
    	if (attendStr != null) {
    	    attend = true;
    	} else {
    	    attend = false;
    	}
    	
    	//入学年度をint型に変換
    	entYear = Integer.parseInt(entYearStr);
    	//エラーを未発生に設定
    	boolean error = false;
    	//学生氏名が未入力なら
    	if (nameStr == null) {
    		//jspに表示
    		req.setAttribute("error1", "このフィードを入力して下さい");
    		//エラーを発生に変更
    	   error = true;
    	}

    	//エラーが発生になっていたら
    	if (error == true) {
    		//入力用のjspに戻る
    		req.getRequestDispatcher("studentupdate.jsp").forward(req, res);
    	}
    	//エラーが発生していなかったら
    	if (error == false) {
    		// 登録を行う
    	    Student student = new Student();

    	    student.setNo(noStr);
    	    student.setName(nameStr);
    	    student.setEntYear(entYear);
    	    student.setClassNum(classNumStr);
    	    student.setAttend(attend);

    	    student.setSchool(teacher.getSchool());

    	    StudentDao dao = new StudentDao();
    	    dao.save(student);
    	    
    	    //登録完了ページに移動
    	    req.getRequestDispatcher("xxxxxx.jsp").forward(req, res);
    	}
    }
}  