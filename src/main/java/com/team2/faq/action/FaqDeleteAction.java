package com.team2.faq.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.commons.JSForward;
import com.team2.faq.db.FaqDAO;

public class FaqDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" D : FaqDeleteAction_execute() 호출 ");
		
		// 세션정보 제어(로그인)
		HttpSession session = request.getSession();
		
		ActionForward forward = new ActionForward();
//		if(id == null) {
//			forward.setPath("./MainMain.park");
//			forward.setRedirect(true);
//			return forward;
//		}
		// 정보 저장(id,pw)
		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		System.out.println("faqNO : " + faqNo);
		
		request.setCharacterEncoding("UTF-8");
		
		// 회원탈퇴 - DAO 객체 - deleteMemember()
		FaqDAO dao = new FaqDAO();
		int result = dao.deletefaq(faqNo);
		
		// 삭제 결과에 따른 페이지 이동(JS)
		// JSFoward jsFoward = new JSFoward(); 
		// result == 1

		JSForward.alertAndMove(response, "글 삭제 완료!", "./FaqList.fa");
		
		return null;
	}

}
