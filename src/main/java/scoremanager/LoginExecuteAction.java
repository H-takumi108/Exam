package scoremanager;

import bean.Teacher;
import dao.TeacherDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class LoginExecuteAction extends Action {
    public void execute(
        HttpServletRequest req, HttpServletResponse res
    ) throws Exception {
    	
        HttpSession session = req.getSession();

        String id = req.getParameter("id");
        String password = req.getParameter("password");
        TeacherDAO dao = new TeacherDAO();
        Teacher teacher = dao.login(id, password);

        if (teacher != null) {
            session.setAttribute("id", id);
            res.sendRedirect("main/Menu.action");
        } else {
        req.getRequestDispatcher("/error.jsp")
		.forward(req, res);
        }
    }
}  