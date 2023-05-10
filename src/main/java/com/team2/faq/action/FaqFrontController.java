package com.team2.faq.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;

// 프로젝트에서 사용되는 주요 개념(명사) => 디비 테이블 구분

@WebServlet("*.fa")
public class FaqFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 페이지 정보 전달방식에 상관없이 한번에 처리하는 메서드
		System.out.println("doProcess() 호출!");
		
		// URL : http://localhost:8088/MVC7/itwill.bo
		// URI : /MVC7/itwill.bo
		
		/**********************1. 가상주소 계산****************************/
		System.out.println(" 1. 가상주소 계산 - 시작 ");
		
		String requestURI = request.getRequestURI();
		System.out.println(" requestURI : "+requestURI);
		String ctxPath = request.getContextPath();
		System.out.println(" ctxPath : "+ctxPath);
		String command = requestURI.substring(ctxPath.length());
		System.out.println(" command : "+command);
		
		System.out.println(" 1. 가상주소 계산 - 끝 ");
		/**********************1. 가상주소 계산****************************/
		
		/**********************2. 가상주소 매핑****************************/
		System.out.println("\n");
		System.out.println(" 2. 가상주소 매핑 - 시작 ");
		
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/FaqWrite.fa")) {
			System.out.println(" C : /FaqWrite.fa ");
			System.out.println(" C : 패턴1 - 디비 x, 연결된 뷰페이지 이동");
			
			forward = new ActionForward();
			forward.setPath("./faq/faqWriteForm.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/FaqWriteAction.fa")) {
			System.out.println(" C : /FaqWriteAction.fa 호출 ");
			System.out.println(" C : 패턴2 - DB사용O,페이지 이동");
			
			// BoardWriteAction 객체
			action = new FaqWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/FaqList.fa")) {
			System.out.println(" C : /FaqList.fa 호출 ");
			System.out.println(" C : 패턴3-DB사용O,view페이지 출력");
			// BoardListAction 객체 
			action = new FaqListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/FaqDeleteAction.fa")) {
			System.out.println(" C : /FaqDeleteAction.fa 호출 ");
			System.out.println(" C : DB사용 O, 페이지 이동 O (패턴2)");
			
			// MemberDeleteAction() 객체
			action = new FaqDeleteAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/FaqUpdate.fa")) {
			System.out.println(" C : /FaqUpdate.fa 호출");
			System.out.println(" C : DB 사용 O, view 이동 & 출력 (패턴3)");
			
			// MemberUpdateAction() 객체
				action = new FaqUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		else if(command.equals("/FaqUpdateProAction.fa")) {
			System.out.println(" C : /FaqUpdateProAction.fa 호출 ");
			System.out.println(" C : DB사용 O, 페이지 이동 O (패턴2)");
			
			// MemberUpdateProAction() 객체
			action = new FaqUpdateProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		System.out.println(" 2. 가상주소 매핑 - 끝 ");
		System.out.println("\n");
		/**********************2. 가상주소 매핑****************************/
		
		/**********************3. 가상주소 이동****************************/
		System.out.println(" 3. 가상주소 이동 - 시작 ");
		if(forward != null) { //이동정보가 있을때
			if(forward.isRedirect()) {
				// 페이지 이동방식 - true
				System.out.println(" C : sendRedirect방식 - "+forward.getPath()+"이동");
				response.sendRedirect(forward.getPath());
			}else {							
				// 페이지 이동방식 - false
				System.out.println(" C : forward방식 - "+forward.getPath()+"이동");
				RequestDispatcher dis = 
						request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}			
		}		
		System.out.println(" 3. 가상주소 이동 - 끝 ");
		/**********************3. 가상주소 이동****************************/
		
		System.out.println(" doProcess - 끝(컨트롤러 종료) ");
	}// doProcess
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" doGET_faq 호출");
		doProcess(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" doPOST_faq 호출");
		doProcess(request,response);
		
	}
}
