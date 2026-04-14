package scoremanager;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginAction{
	public void doGet (
			HttpServletRequest request, HttpServletResponse response
		) throws ServletException, IOException {
			
			request.getRequestDispatcher("login.jsp")
				.forward(request, response);
		}
}  