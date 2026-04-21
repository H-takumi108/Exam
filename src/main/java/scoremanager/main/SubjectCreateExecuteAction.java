package scoremanager.main;
 
import bean.School;
import bean.Subject;
import bean.Teacher;
import dao.SubjectDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;
 
public class SubjectCreateExecuteAction extends Action {
    public void execute(
            HttpServletRequest req, HttpServletResponse res
        ) throws Exception {
    	HttpSession session = req.getSession();
    	Teacher teacher = (Teacher)session.getAttribute("user");
    	
    	
    	//変数の定義
    	School school = teacher.getSchool();
    	
    	String cdStr = "";
    	String nameStr ="";
    	
    	//jspからの入力
    	cdStr = req.getParameter("cdStr");
    	nameStr = req.getParameter("nameStr");
    	
    	//エラーを未発生に設定
    	boolean error = false;
    	//科目コードが3文字か判定
    	if (cdStr == null || cdStr.length() != 3) {
    		//jspに表示
    	   req.setAttribute("error", "科目コードは３文字で入力してください");
    	   //エラーを発生に変更
    	   error = true;
    	} else {
    		//重複していないかを確認
    		SubjectDao dao = new SubjectDao();
    	    Subject subject = dao.get(cdStr,school);

    	    //重複していたら
    	    if (subject != null) {
    	    	//jspに表示
    	        req.setAttribute("error", "科目コードが重複しています");
    	      //エラーを発生に変更
    	        error = true;
    	    }
    	}
    	//エラーが発生になっていたら
    	if (error == true) {
    		//入力用のjspに戻る
    		req.getRequestDispatcher("subject_create.jsp").forward(req, res);
    		return;
    	}
    	//エラーが発生していなかったら
    	if (error == false) {
    		// 登録を行う
    	    Subject subject = new Subject();

    	    subject.setSchool(school);
    	    subject.setCd(cdStr);
    	    subject.setName(nameStr);

    	    SubjectDao dao = new SubjectDao();
    	    dao.save(subject);
    	    
    	    //登録完了ページに移動
    	    req.getRequestDispatcher("subject_create_done.jsp").forward(req, res);
    	}
    }
}  