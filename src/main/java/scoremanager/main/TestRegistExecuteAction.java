package scoremanager.main;

import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Student;
import bean.Subject;
import bean.Teacher;
import bean.Test;
import dao.TestDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class TestRegistExecuteAction extends Action {
	public void execute (
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		HttpSession session = request.getSession();
		Teacher teacher = (Teacher)session.getAttribute("user");
		School school = teacher.getSchool();

	        String[] entYearList = request.getParameterValues("entYearList");
	        String[] classNumList = request.getParameterValues("classNumList");
	        String[] noList = request.getParameterValues("noList");
	        String[] nameList = request.getParameterValues("nameList");
	        String[] pointList = request.getParameterValues("pointList");

	        String subjectCd = request.getParameter("subjectCd");
	        String testNoStr = request.getParameter("testNo");

	        int testNo = Integer.parseInt(testNoStr);

	        Subject subject = new Subject();
	        subject.setCd(subjectCd);

	        TestDao dao = new TestDao();
	        List<Test> list = new ArrayList<>();

	        for (int i = 0; i < entYearList.length; i++) {
	            Test test = new Test();

	            Student student = new Student();
	            student.setClassNum(classNumList[i]);
	            student.setEntYear(Integer.parseInt(entYearList[i]));
	            student.setNo(noList[i]);
	            student.setName(nameList[i]);

	            test.setStudent(student);
	            test.setSubject(subject);
	            test.setSchool(school);
	            test.setNo(testNo);


	            if (pointList[i] != null && !pointList[i].isEmpty()) {
	            	int point = Integer.parseInt(pointList[i]);
	            	if (point > 100 || point < 0) {
	            		String entYearStr = request.getParameter("f1");
	            	    String classNumStr = request.getParameter("f2");
	            	    String subjectCdStr = request.getParameter("f3");
	            	    String noStr = request.getParameter("f4");

	            	    int entYear = Integer.parseInt(entYearStr);
	            	    int no = Integer.parseInt(noStr);

	            	    Subject sub = new Subject();
	            	    sub.setCd(subjectCdStr);

	            	    List<Test> reloadList = dao.filter(entYear, classNumStr, sub, no, school);

	            	    request.setAttribute("f1", entYearStr);
	            	    request.setAttribute("f2", classNumStr);
	            	    request.setAttribute("f3", subjectCdStr);
	            	    request.setAttribute("f4", noStr);
	            	    request.setAttribute("test", reloadList);

	            	    request.setAttribute("error2", "0～100の範囲で入力してください");

	            	    request.getRequestDispatcher("test_regist.jsp").forward(request, response);
	            	    return;
	            	}
	                test.setPoint(point);
	            } else {
	                test.setPoint(0);
	            }
	            list.add(test);
	        }
	        dao.save(list);
	        
	        request.getRequestDispatcher("test_regist_done.jsp").forward(request, response);
	    }
	}