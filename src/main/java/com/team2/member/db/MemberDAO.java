package com.team2.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.team2.admin.db.ResDTO;

// DB에 연결해서 처리하는 모든동작 수행
public class MemberDAO {
	// 공통변수 선언
	private Connection con = null;  		//디비 연결정보 저장(관리)
	private PreparedStatement pstmt = null; //SQL 작성, 실행
	private ResultSet rs = null; 			//select결과 데이터 저장
	private String sql ="";					//SQL구문 저장

	//디비 연결 메서드
	private Connection getCon() throws Exception{
		// Context 객체생성
		Context initCTX = new InitialContext();
		// 디비연결정보 불러와서 사용
		DataSource ds 
		   = (DataSource) initCTX.lookup("java:comp/env/jdbc/c7d2301t2");
		// 디비연결
		con = ds.getConnection();
		System.out.println(" DAO : 디비연결 성공! "+con);
		
		return con;
	}
	
	// 자원해제
	public void closeDB() {
		try {
			if(rs != null)  rs.close();
			if(pstmt != null)  pstmt.close();
			if(con != null)  con.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	
	
	//----------------------------------------------------------------------------	
	// 회원가입 - memberJoin()
	public void memberJoin(MemberDTO dto) {
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. SQL작성 & pstmt 객체
			sql = "insert into member(id,pw,memname,birth,tel,email,regdate) "
					+ "values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getMemname());
			pstmt.setDate(4, dto.getBirth());
			pstmt.setString(5, dto.getTel());
			pstmt.setString(6, dto.getEmail());
			pstmt.setDate(7, dto.getRegdate());
			
			// 4. SQL 실행
			pstmt.executeUpdate();
			System.out.println(" DAO : 회원가입 성공! ");			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}		
	}// 회원가입 - memberJoin()	
	

	//----------------------------------------------------------------------------	
	// 로그인 - memberLogin()
	public int memberLogin(MemberDTO dto) {
		int result = -1; // 처리결과에 따른 상태 
		                 // -1(아이디없음) 0(아이디는 있지만 비밀번호 오류) 
		                 // 1(로그인 성공)
		
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql 작성 & pstmt 객체
			sql = "select pw from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			if(rs.next()) {
				// rs.next()는 회원이라는 뜻
				if(dto.getPw().equals(rs.getString("pw"))) {
					// 본인
					result = 1;
				} else {
					// 비밀번호 오류
					result = 0;
				}
			} else {
				// 비회원이라는 뜻
				 result = -1;
			}
		
			System.out.println(" DAO : 로그인 처리 결과" + result);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}// 로그인 - memberLogin()
	
	
	//----------------------------------------------------------------------------	
	// 아이디 찾기 - memberFindid()
		public String memberFindid(MemberDTO dto) {
		    String id = null;
		    System.out.println("아이디찾기 : "+dto);
		    try {
		        // 1.2. 디비연결
		        con = getCon();

		        // 3. sql 작성 & pstmt 객체
		        sql = "select id from member where memname=? and email=?";
		        pstmt = con.prepareStatement(sql);
		        pstmt.setString(1, dto.getMemname());
		        pstmt.setString(2, dto.getEmail());

		        // 4. sql 실행
		        rs = pstmt.executeQuery();
		        // 5. 데이터 처리
		        if (rs.next()) {
		        	System.out.println("여기들어옴");
		            id = rs.getString("id");
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        closeDB();
		    }

		    System.out.println("아이디는(dao)" + id);
		    
		    return id;

		}
		// 아이디 찾기 - memberFindid()
		
		
		//----------------------------------------------------------------------------	
		// 비밀번호 찾기 - memberFindpw()
		public String memberFindpw(MemberDTO dto) {
			String pw = null;
			System.out.println("비밀번호 찾기(dao) : "+dto);
			
			try {
				// 1+2 디비연결
				con = getCon();
				
				// 3. sql & pstmt
				sql = "select pw from member where id=? and email=?";
				pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getId());
					pstmt.setString(2, dto.getEmail());
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터 처리
				if (rs.next()) {
		            System.out.println("5.데이터처리 들어옴");
		            pw = rs.getString("pw");

		            // 비밀번호 뒷자리 4개를 ****로 대체
		            int length = pw.length();
		            if (length >= 8) {
//		                String asterisks = "";
		            	StringBuilder maskedPw = new StringBuilder(pw);
//		                for (int i = 0; i < length - 4; i++) {
//		                    asterisks += "*";
//		                }
//		                pw = pw.substring(0, length - 4) + asterisks;
//		            } else {
//		                pw = "****";
//		            }
//		        } else {
		                for (int i = length - 4; i < length; i++) {
		                    maskedPw.setCharAt(i, '*');
		                }
		                pw = maskedPw.toString();
		            } else {
		                pw = "****";
		            }
		        } else {
		            System.out.println("5.데이터처리 안들어옴");
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        closeDB();
		    }

		    System.out.println("비밀번호는(dao)" + pw);

		    return pw;
		}
		// 비밀번호 찾기 - memberFindpw()
	
	
	//-----------------------------------------------------------------------
	// 회원정보 보기 - getMember() 
	public MemberDTO getMember(String id) {
		MemberDTO dto = null;
	
		try {
			// 1+2 디비연결
			con = getCon();
			
			// 3 sql & pstmt
			sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
				// ???
			pstmt.setString(1, id);
			
			// 4 sql 실행
			rs = pstmt.executeQuery();
			
			// 5 데이터 처리
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setBirth(rs.getDate("birth"));
				dto.setEmail(rs.getString("email"));
				dto.setId(rs.getString("id"));
				dto.setMemname(rs.getString("memname"));
				dto.setPw(rs.getString("pw"));
				dto.setRegdate(rs.getDate("regdate"));
				dto.setTel(rs.getString("tel"));
			}
			
			System.out.println("DAO : 회원정보 저장완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return dto;
	}// 회원정보 보기 - getMember() 

	
	
	//-----------------------------------------------------------------------
	// id 중복확인
	public List<MemberDTO> memberList() {
		
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		
		try {
			// 1+2 디비연결
			con = getCon();
			
			// 3 sql & pstmt
			sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			// ???
			
			// 4 sql 실행
			rs = pstmt.executeQuery();
			
			// 5 데이터 처리
			while(rs.next()) {
				
				MemberDTO dto = new MemberDTO();
				
				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				
				memberList.add(dto);
			}
			
			System.out.println("DAO : 회원리스트 저장완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return memberList;
	}// id 중복확인
	
		
	//-----------------------------------------------------------------------
	// 내 정보 보기 및 수정 - memberUpdate(dto)
	public int memberUpdate(MemberDTO dto) {
		int result = -1; 
		
		try {
			// 1+2 디비연결
			con = getCon();
			
			// 3. sql & pstmt 객체
			sql = "select pw from member where id=?";
			pstmt = con.prepareStatement(sql);
				// ???
				pstmt.setString(1, dto.getId());
			
			// 4. sql 실행(select)
			rs = pstmt.executeQuery();
			
			// 5. 데이터처리
			if(rs.next()) { 
				// 회원
				if(dto.getPw().equals(rs.getString("pw"))) {
					// 3. sql 작성 & pstmt 객체
					sql = "update member set tel=? where id=?";
					pstmt = con.prepareStatement(sql);
						/// ???
						pstmt.setString(1, dto.getTel());
						pstmt.setString(2, dto.getId());
						
					// 4. sql 실행(select)
					result = pstmt.executeUpdate(); // result = 1 // result에 저장
					
				}else {
					// 비밀번호 오류
					result = 0;
				}
				
			}else {
				// 비회원
				result = -1;
			}
			
			System.out.println(" DAO : 회원정보 수정 완료("+result+")");
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return result;
		
	}// 내 정보 보기 및 수정 - memberUpdate(dto)
		
		

	
	
	//-----------------------------------------------------------------------
	// 비밀번호 변경
	public int MemberPasswordUpdate(MemberDTO dto) {
		int result = -1; 
		

		try {
			// 1+2 디비연결
			con = getCon();
			
			// 3. sql & pstmt 객체
			sql = "select pw from member where id=?";
			pstmt = con.prepareStatement(sql);
			// ???
			pstmt.setString(1, dto.getId());
			
			// 4. sql 실행(select)
			rs = pstmt.executeQuery();
			
			// 5. 데이터처리
			if(rs.next()) { 
				// 회원
	            if (dto.getPw().equals(rs.getString("pw"))) {
					// 3. sql 작성 & pstmt 객체
					sql = "update member set pw=? where id=?";
					pstmt = con.prepareStatement(sql);
						/// ???
						pstmt.setString(1, dto.getNewpw());
						pstmt.setString(2, dto.getId());
						
					// 4. sql 실행(select)
					result = pstmt.executeUpdate(); // result = 1 // result에 저장
					
				}else {
					// 비밀번호 오류
					result = 0;
				}
				
			}else {
				// 비회원
				result = -1;
			}
			
			System.out.println(" DAO : 회원정보 수정 완료("+result+")");
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return result;
		
	}// 비밀번호 변경
	
	
	//-----------------------------------------------------------------------
	// 회원 탈퇴 - memberDelete(id, pw)
	
	public int deleteMember(String id, String pw) {
		int result = -1;
		
		try {
			// 1+2 디비연결
			con = getCon();
			
			 // 외래 키 제약 조건 해제
	        Statement stmt = con.createStatement();
	        stmt.execute("SET FOREIGN_KEY_CHECKS = 0");

			
			// 3. sql 작성 & pstmt 객체
			sql = "select pw from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터처리
			if(rs.next()) {
				if(pw.equals(rs.getString("pw"))) {
					// 삭제 처리
					// 3. sql 작성 & pstmt 객체
					sql = "delete from member where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					
					// 4. sql 실행
					result = pstmt.executeUpdate(); // 1
					
				}else {
					result = 0;
				}
				
			}else { // 회원정보 X
				result = -1;
			}
			System.out.println("DAO : 삭제 완료 "+result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
	        // 외래 키 제약 조건 활성화
	        try {
	            Statement stmt = con.createStatement();
	            stmt.execute("SET FOREIGN_KEY_CHECKS = 1");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        closeDB();
	    }

		
		
		return result;
	}// 회원 탈퇴 - memberDelete(id, pw)

	
	//----------------------예약내역 조회------------------------
	public List<ResDTO> getResList(String id) {
		List<ResDTO> resList = new ArrayList<>();
		
		try {
			con = getCon();
			
			sql = "SELECT * FROM reservation "
					+ " WHERE id=? "
					+ " ORDER BY resDate DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ResDTO dto = new ResDTO();
				
				dto.setCarNo(rs.getString("carNo"));
				dto.setId(id);
				dto.setParkingCode(rs.getString("parkingCode"));
				dto.setParkingPosition(rs.getInt("parkingPosition"));
				dto.setParkInTime(rs.getTime("parkInTime"));
				dto.setParkOutTime(rs.getTime("parkOutTime"));
				dto.setPrice(rs.getInt("price"));
				dto.setResDate(rs.getDate("resDate"));
				dto.setResNo(rs.getInt("resNo"));
				dto.setResStatus(rs.getInt("resStatus"));
				
				resList.add(dto);
			}
			
			System.out.println("DAO: 조회 완료_예약 내역 " + resList.size() + "건");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return resList;
	} //예약내역 조회 - getResLog(id)
	
	
	
	

}//DAO