package com.team2.reservation.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;

@WebServlet("*.res")
public class ResFrontController extends HttpServlet {

	//http://localhost:8088/Team2/Main.park
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doProcess()");
		
		/************************* 가상주소 계산 *****************************/
		System.out.println("가상주소 계산 - 시작");
		
		String requestURI = request.getRequestURI();
		System.out.println("requestURI: " + requestURI);
		String ctxPath = request.getContextPath();
		System.out.println("ctxPath: " + ctxPath);
		String command = requestURI.substring(ctxPath.length());
		System.out.println("command: " + command);
		 
		System.out.println("가상주소 계산 - 끝");
		/************************* 가상주소 계산 *****************************/
		
		/************************* 가상주소 매핑 *****************************/
		System.out.println("가상주소 매핑 - 시작");
		
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/Main.res")) {
			System.out.println("C: /Main.res 호출");
			
			forward = new ActionForward();
			forward.setPath("./reservation/main.jsp");
			forward.setRedirect(false);
			
		} //if(Main)
		//예약
		else if(command.equals("/Reservation.res")) {
			System.out.println("C: /Reservation.res 호출");
			
			forward = new ActionForward();
			forward.setPath("./reservation/reservationForm.jsp");
			forward.setRedirect(false);
			
		} //if(Reservation.res)
		//예약페이지
		else if(command.equals("/ReservationAction.res")) {
			System.out.println("C: /ReservationAction.res 호출");
			
			action = new ReservationAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} //try
			
		} //if(ReservationAction)
		
		//예약가능자리조회(JSON) - /Available.res
		else if(command.equals("/Available.res")) {
			System.out.println("C: /Available.res 호출");
			
			//AvailableAction()
			action = new AvailableAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} //try
			
		} //if(Available)
		
		//결제 - /PayAction.res
		else if(command.equals("/PayAction.res")) {
			System.out.println("C: /PayAction.res 호출");
			
			//PayAction() 호출
			action = new PayAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} //if(PayAction)
		
		
		System.out.println("가상주소 매핑 - 끝");
		/************************* 가상주소 매핑 *****************************/
		
		/************************* 가상주소 이동 *****************************/
		System.out.println("가상주소 이동 - 시작");
		
		if(forward != null) {
			if(forward.isRedirect()) {
				System.out.println("redirect 방식 이동 - " + forward.getPath());
				response.sendRedirect(forward.getPath());
			} else {
				System.out.println("forward 방식 이동 - " + forward.getPath());
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		} //if(null 아닐때)
		
		System.out.println("가상주소 이동 - 끝");
		/************************* 가상주소 이동 *****************************/
		
		
	} //doProcess()
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");
		doProcess(request, response);
	} //doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost()");
		doProcess(request, response);
	} //doPost()
	
} //FrontController
