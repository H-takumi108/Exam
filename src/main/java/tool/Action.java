package tool;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public abstract class Action {
<<<<<<< HEAD
	public abstract void execute(HttpServletRequest request, HttpServletResponse response
    ) throws Exception;
}
=======
	public abstract String execute(
			HttpServletRequest request, HttpServletResponse response
	) throws Exception; 
}
>>>>>>> branch 'master' of https://github.com/H-takumi108/Exam
