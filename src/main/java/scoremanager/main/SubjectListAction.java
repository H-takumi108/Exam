package scoremanager.main;
 
import java.util.List;

import bean.Subject;
import bean.Teacher;
import dao.SubjectDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;
 
public class SubjectListAction extends Action {
    public void execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {
    	HttpSession session = request.getSession();
    	Teacher teacher = (Teacher)session.getAttribute("user");
    	
    	SubjectDao subjectdao = new SubjectDao();
    	List<Subject> list = subjectdao.filter(teacher.getSchool());
    	
    	request.setAttribute("subjectlist",list );//名称かえるならここの左側
    	
    	request.getRequestDispatcher("subject_list.jsp").forward(request, response);
    	///jsp側では
    	//<c:forEach var="subject" items="${subjectList}">
        //${subject.name}
        //</c:forEach>
    	//のように記述
    	
    }
}  