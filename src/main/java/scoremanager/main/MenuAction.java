package scoremanager.main;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MenuAction{
	public void doGet (
			HttpServletRequest request, HttpServletResponse response
		) throws ServletException, IOException {
			
			request.getRequestDispatcher("Menu.jsp")
				.forward(request, response);
		}
}  