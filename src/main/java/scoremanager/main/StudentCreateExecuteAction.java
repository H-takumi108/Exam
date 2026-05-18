package scoremanager.main;
 
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Student;
import bean.Teacher;
import dao.ClassNumDao;
import dao.StudentDao;
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
    	 
    	//エラーを未発生に設定
    	boolean error = false;
    	boolean yearerror = false;
    	boolean noerror = false;
    	boolean nameerror = false;
    	// 学生番号が未入力なら
    	if (noStr == null || noStr.trim().isEmpty()) {
    		//jspに表示
    	   req.setAttribute("error1", "このフィードを入力して下さい");
    	   //エラーを発生に変更
    	   error = true;
    	   noerror = true;
    	} else {
    		//入力されていたら
    		//文字が含まれてないかを確認
    		if (!noStr.matches("\\d+")) {
    		    // 数字以外が含まれている場合
    		    req.setAttribute("error1", "学生番号は数字のみで入力してください");
    		    error = true;
    		    noerror = true;
    		} else {
    		//重複していないかを確認
    		StudentDao dao = new StudentDao();
    	    Student student = dao.get(noStr);
    	    //重複していたら
    	    if (student != null) {
    	    	//jspに表示
    	        req.setAttribute("error1", "学生番号が重複しています");
    	        req.setAttribute("no", noStr);    	      //エラーを発生に変更
    	        error = true;
    	        noerror = true;
    	    }
    	    }
    	}
    	//学生氏名が未入力なら
    	if (nameStr == null || nameStr.trim().isEmpty()) {
    		//jspに表示
    		req.setAttribute("error2", "このフィルードを入力して下さい");
    		//エラーを発生に変更
    	   error = true;
    	   nameerror = true;
    	}
    	//入学年度が未入力なら
    	if (entYearStr == null || entYearStr.trim().isEmpty()) {
    		//jspに表示
    	    req.setAttribute("error3","入学年度を選択してください");
    	  //エラーを発生に変更
    	    error = true;
    	    yearerror = true;
    	} else {
    		//入学年度をint型に変換
    	    try {
    	    	entYear = Integer.parseInt(entYearStr);
    	    } catch (NumberFormatException e) {
    	    	//jspに表示
    	        req.setAttribute("error3", "入学年度は数字で入力してください");
    	      //エラーを発生に変更
    	        error = true;
    	        yearerror = true;
    	    }
    	}
    	//エラーが発生になっていたら
    	if (error) {
        	LocalDate todaysDate = LocalDate.now();
        	int year = todaysDate.getYear();
        	
        	List<Integer> entYearSet = new ArrayList<>();
        	for (int i = year -10;i < year + 11; i++) {
        		entYearSet.add(i);
        	}    	
        	  
        	School school = teacher.getSchool();
    	    ClassNumDao cdao = new ClassNumDao();
    	    List<String> classList = cdao.filter(school);
    	
        	req.setAttribute("classList",classList);
        	req.setAttribute("ent_year_set", entYearSet);
        	req.setAttribute("selectedclassNum",classNumStr);
        	
        	if (!yearerror) {
        		req.setAttribute("selectedyear",entYear);
        	}
        	
        	if (!noerror) {
        		req.setAttribute("no",noStr);
        	}
        	
        	if (!nameerror) {
        		req.setAttribute("name",nameStr);
        	}
        	
        	
    		//入力用のjspに戻る
    		req.getRequestDispatcher("student_create.jsp").forward(req, res);
    		return;
    	} else {
    	//エラーが発生していなかったら
    		// 登録を行う
    	    Student student = new Student();

    	    student.setNo(noStr);
    	    student.setName(nameStr);
    	    student.setEntYear(entYear);
    	    student.setClassNum(classNumStr);
    	    student.setAttend(true);

    	    student.setSchool(teacher.getSchool());

    	    StudentDao dao = new StudentDao();
    	    dao.save(student);
    	    
    	    //登録完了ページに移動
    	    req.getRequestDispatcher("student_create_done.jsp").forward(req, res);
    	}
    }
}  