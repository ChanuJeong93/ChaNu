package com.team2.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.notice.db.NoticeDAO;
import com.team2.notice.db.NoticeDTO;

public class NoticeUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
			// 한글처리
			request.setCharacterEncoding("UTF-8");
		

			// 세션정보 제어(로그인 + 관리자일때만 사용)
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			
			ActionForward forward = new ActionForward();
			if(id == null || !id.equals("admin")) {
				forward.setPath("./MemberLogin.me");
				forward.setRedirect(true);
				return forward;
			}
				
		    // 파일이 저장되는 실제 경로
			String realPath = request.getRealPath("/upload");
			
			// 파일 최대 사이즈 (10메가)
			int maxSize = 10 * 1024 * 1024;
			
			// MultipartRequest 객체 생성(업로드)
			MultipartRequest multi = new MultipartRequest(request,realPath,maxSize,"UTF-8", new DefaultFileRenamePolicy());
			
			
			// 전달정보 저장 - NoticeDTO 생성
			NoticeDTO dto = new NoticeDTO();
			dto.setNoticeNo(Integer.parseInt(multi.getParameter("noticeNo")));
			dto.setNoticeTitle(multi.getParameter("noticeTitle"));
			dto.setNoticeContents(multi.getParameter("noticeContents"));
			
			// 첨부파일명 저장
			dto.setNoticeFile(multi.getFilesystemName("noticeFile"));
			
			System.out.println(dto);
			
			// NoticeDAO 객체생성
			NoticeDAO dao = new NoticeDAO();
			dao.updateNotice(dto);
			
			// 페이지 이동
		    // forward = new ActionForward(); // 위에 있으니까 안적어도 되는거
			
			
			
			System.out.println("글 수정 완료");
			
			forward.setPath("./noticeList.no");
			forward.setRedirect(true);
			
			return forward;
	}
	
	

}
