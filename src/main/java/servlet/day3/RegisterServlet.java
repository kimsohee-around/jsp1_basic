package servlet.day3;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import project.dao.TblCustomerDao;
import project.vo.CustomerVo;

@WebServlet(urlPatterns = {"/register.cc"},description = "고객 등록")
public class RegisterServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private static final Logger logger = 
			LoggerFactory.getLogger(RegisterServlet.class);
	
	//화면을 보여주는 서블릿이므로 GET
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("[MyInfo]고객등록 화면 요청되었습니다.");
		//forward 만 필요합니다.
		RequestDispatcher dispatcher = request.getRequestDispatcher("/day3/register.jsp");
		dispatcher.forward(request, response);
	
	}
	
	//register.jsp 화면에서 입력된 값을 post 방식으로 전달 받기
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("[MyInfo]고객등록 데이터 저장이 요청되었습니다.");
		
		//POST : 요청값 인코딩 필수
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String temp = request.getParameter("age");
	//나이가 필수 입력이 아니라면 값이 비어있을 수도 있음.. 그 때 parseInt 결과 확인합시다.=> 오류
		int age = 0;
		//form 태그 요소의 name="age" 가 있으므로 temp 가 null 일 경우는 없습니다. 
		if(temp.length() != 0) 	age=Integer.parseInt(temp);
		
		//dao 의 메소드 인자로 전달할 vo 객체 생성하기
		CustomerVo vo = new CustomerVo(userid, name, email, age, null);
		logger.info("\t 입력 값 vo : {}",vo);
		
		//db 에 저장하기
		TblCustomerDao dao = new TblCustomerDao();
		dao.join(vo);   // pk 아이디 중복값있으면 무결성 오류
		
		//서버가 클라이언트에게 "customers.cc 로 요청을 다시 보내라." 응답을 보냅니다. 
		response.sendRedirect("customers.cc");
		//리다이렉트는 웹페이지의 자바스크립트, out.print 출력을 못합니다.
		
		
	}
	
}
/*
 
		//회원가입 결과 alert 을 출력하려면 다음과 같이 합니다.
		
		String message = "회원가입이 완료되었습니다.";
		if(result ==0) 
			message = "회원가입 오류가 생겼습니다.";
		
		 response.setContentType("text/html; charset=UTF-8");
		 PrintWriter out = response.getWriter();
		 out.print("<script>");
		 out.print("alert('"+message+"');");
		 out.print("location.href='register.cc';");
		 out.print("</script>"); 
 */



