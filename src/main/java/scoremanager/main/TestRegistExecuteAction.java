package scoremanager.main;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Student;
import bean.Subject;
import bean.Teacher;
import bean.Test;
import dao.ClassNumDao;
import dao.SubjectDao;
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
	        
	        List<String> errors = new ArrayList<>();
	        boolean hasError = false;

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

	            String error = "";

	            if (pointList[i] != null && !pointList[i].isEmpty()) {

	                try {
	                    int point = Integer.parseInt(pointList[i]);

	                    if (point < 0 || point > 100) {
	                        error = "0～100の範囲で入力してください";
	                        hasError = true;
	                    } else {
	                        test.setPoint(point);
	                    }

	                } catch (NumberFormatException e) {
	                    error = "0～100の範囲で入力してください";
	                    hasError = true;
	                }

	            } else {
	                test.setPoint(0);
	            }

	            errors.add(error);
	            list.add(test);
	        }
	        
	        if (hasError) {

	            request.setAttribute("errors", errors);

	            request.setAttribute("f1", request.getParameter("f1"));
	            request.setAttribute("f2", request.getParameter("f2"));
	            request.setAttribute("f3", request.getParameter("f3"));
	            request.setAttribute("f4", request.getParameter("f4"));
	            
	            ClassNumDao cNumDao = new ClassNumDao();
	            List<String> cNumList = cNumDao.filter(school);

	            SubjectDao subDao = new SubjectDao();
	            List<Subject> subList = subDao.filter(school);

	            LocalDate today = LocalDate.now();
	            int year = today.getYear();

	            List<Integer> entYearSet = new ArrayList<>();
	            for (int j = year - 10; j <= year; j++) {
	                entYearSet.add(j);
	            }

	            List<Integer> nolist = List.of(1, 2);

	            request.setAttribute("ent_year_set", entYearSet);
	            request.setAttribute("class_num_set", cNumList);
	            request.setAttribute("sub_name_set", subList);
	            request.setAttribute("test_no_set", nolist);

	            request.setAttribute("test", list);

	            request.getRequestDispatcher("test_regist.jsp")
	                   .forward(request, response);

	            return;
	        }
	        dao.save(list);
	        
	        request.getRequestDispatcher("test_regist_done.jsp").forward(request, response);
	    }
	}