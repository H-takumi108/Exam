package scoremanager;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class LoginAction extends Action {

    public void execute(
        HttpServletRequest req,
        HttpServletResponse res
    ) throws Exception {

        req.setAttribute("content", "/scoremanager/login.jsp");

        req.getRequestDispatcher("/scoremanager/common/base.jsp")
           .forward(req, res);
    }
}