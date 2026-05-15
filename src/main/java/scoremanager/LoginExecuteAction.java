package scoremanager;

import bean.Teacher;
import dao.TeacherDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class LoginExecuteAction extends Action {

    public void execute(
        HttpServletRequest req,
        HttpServletResponse res
    ) throws Exception {

        HttpSession session = req.getSession();

        String id = req.getParameter("id");
        String password = req.getParameter("password");

        TeacherDAO dao = new TeacherDAO();
        Teacher teacher = dao.login(id, password);

        // ログイン成功
        if (teacher != null) {

            session.setAttribute("user", teacher);

            res.sendRedirect("main/Menu.action");

        // ログイン失敗
        } else {

            req.setAttribute(
                "msg",
                "ログインに失敗しました。IDまたはパスワードが正しくありません。"
            );

            req.getRequestDispatcher(
                "/scoremanager/login.jsp"
            ).forward(req, res);
        }
    }
}