package controller;


import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.msk.Action;

import member.MemberDAO;
import member.MemberVO;
import school.SchoolDAO;
import school.SchoolVO;


public class ProjectController extends Action {
	//start 폴더
	public String signup(HttpServletRequest request,
			 HttpServletResponse response)  throws Throwable { 
		String index=null;
		String esname=request.getParameter("esname");
		if(esname==null){
			esname="Click";
		}
		String msname=request.getParameter("msname");
		if(msname==null){
			msname="Click";
		}
		String hsname=request.getParameter("hsname");
		if(hsname==null){
			hsname="Click";
		}
		
		String emtid=request.getParameter("emtid");
		String midid=request.getParameter("midid");
		String highid=request.getParameter("highid");
		
		request.setAttribute("index",index);
		request.setAttribute("esname",esname);
		request.setAttribute("msname",msname);
		request.setAttribute("hsname",hsname);
		request.setAttribute("emtid",emtid);
		request.setAttribute("midid",midid);
		request.setAttribute("highid",highid);
			 return "/start/signup.jsp"; 
			} 
	
	
	public String searchList(HttpServletRequest request,
			 HttpServletResponse response)  throws Throwable {
		 String esname=request.getParameter("esname");
		 String msname=request.getParameter("msname");
		 String hsname=request.getParameter("hsname");
		 String index= request.getParameter("index");
		 
		 String emtid=request.getParameter("emtid");
		 String midid=request.getParameter("midid");
		 String highid=request.getParameter("highid");
		 
		 
		 SchoolDAO schoolDB= SchoolDAO.getInstance();
		 List List=null;
		 
		 if(index.equals("1")){
			 List=schoolDB.getSchools(esname,"초등학교");
		 }
		 if(index.equals("2")){
			 List=schoolDB.getSchools(msname,"중학교");
		 }
		 if(index.equals("3")){
			 List=schoolDB.getSchools(hsname,"고등학교");
		 }
		 
		 request.setAttribute("List",List);
		 request.setAttribute("esname",esname);
		 request.setAttribute("msname",msname);
		 request.setAttribute("hsname",hsname);
		 request.setAttribute("index",index);
		 request.setAttribute("emtid",emtid);
		 request.setAttribute("midid",midid);
		 request.setAttribute("highid",highid);
		 
			 return "/start/searchList.jsp"; 
			} 
	
	public String signupPro(HttpServletRequest request,
 		 HttpServletResponse response)  throws Throwable { 
			
			MemberVO member = new MemberVO();
			member.setName(request.getParameter("name"));
			member.setBirthday(Integer.parseInt(request.getParameter("birthday")));
			member.setEmtid(request.getParameter("emtid"));
			member.setHighid(request.getParameter("highid"));
			member.setMidid(request.getParameter("midid"));
			member.setMemberid(request.getParameter("memberid"));
			member.setPassword(request.getParameter("password"));
			member.setSch_emt(request.getParameter("sch_emt"));
			member.setSch_mid(request.getParameter("sch_mid"));
			member.setSch_high(request.getParameter("sch_high"));
			MemberDAO dbPro = MemberDAO.getInstance();
			dbPro.insertMember(member);
			response.sendRedirect(request.getContextPath()+"/gon/loginForm");
			 return null; 
			} 
	
	public String loginForm(HttpServletRequest request,
			 HttpServletResponse response)  throws Throwable { 
			 return "/start/loginForm.jsp"; 
			} 
	
	
	public String logout(HttpServletRequest request,
			 HttpServletResponse response)  throws Throwable {
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect(request.getContextPath()+"/gon/loginForm");
			 return null; 
			} 
	
	public String loginPro(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String id=req.getParameter("memberid");
		String pass=req.getParameter("password");
		MemberDAO dbPro = MemberDAO.getInstance();
		
		//로그인
		int pwcheck = dbPro.login(id, pass);
		if(pwcheck==1) {
			MemberVO mVO=dbPro.getUserInfo(id);
			int reqCount = dbPro.reqeustCount(id);
			List reqList=dbPro.reqList(id);
			
			
			String name=mVO.getName();
			String schemt=mVO.getSch_emt();
			String schmid=mVO.getSch_mid();
			String schhigh=mVO.getSch_high();
			int birthday=mVO.getBirthday();
			HttpSession session = req.getSession();
		
			session.setAttribute("reqCount", reqCount);	
			session.setAttribute("reqList", reqList);	
			session.setAttribute("name", name);	
			session.setAttribute("schemt", schemt);	
			session.setAttribute("schmid", schmid);	
			session.setAttribute("schhigh", schhigh);	
			session.setAttribute("birthday", birthday);	
			session.setAttribute("myId",id);
			session.setAttribute("password",pass);
			res.sendRedirect(req.getContextPath()+"/gon/mainPage");
		}else {
			req.setAttribute("pwcheck",pwcheck);
			return "/start/loginPro.jsp";
		}
		return null;
	}
	
	public String mainPage(HttpServletRequest request,
			 HttpServletResponse response)  throws Throwable { 
		HttpSession session = request.getSession();
		String pageId= request.getParameter("pageId");
		
		if(pageId==null) {
			pageId=(String)session.getAttribute("myId");
		}
		String myId= (String)session.getAttribute("myId");
		List friendList=null;
		MemberDAO dbPro = MemberDAO.getInstance();
		if(pageId.equals(myId)) {
			String schemt=(String)session.getAttribute("schemt");
			String schmid=(String)session.getAttribute("schmid");
			String schhigh=(String)session.getAttribute("schhigh");
			String aditemt=schemt.substring(0,schemt.length()-3);
			String aditmid=schmid.substring(0,schmid.length()-2);
			String adithigh=schhigh.substring(0,schhigh.length()-3);
			friendList=dbPro.friendList(myId);
			request.setAttribute("friendList", friendList);	
			request.setAttribute("aditemt", aditemt);
			request.setAttribute("aditmid", aditmid);
			request.setAttribute("adithigh", adithigh);
			return "/main/myPage.jsp"; 
		}
		else {
			MemberVO otherInfo=dbPro.getUserInfo(pageId);
			String schemt=otherInfo.getSch_emt();
			String schmid=otherInfo.getSch_mid();
			String schhigh=otherInfo.getSch_high();
			friendList=dbPro.friendList(pageId);
			request.setAttribute("friendList", friendList);	
			String name=otherInfo.getName();
			String aditemt=schemt.substring(0,schemt.length()-3);
			String aditmid=schmid.substring(0,schmid.length()-2);
			String adithigh=schhigh.substring(0,schhigh.length()-3);
			String addReq=request.getParameter("addReq");
			String acceptReq= request.getParameter("acceptReq");
			String statement= null;
			if(addReq==null) {
				addReq="0";
			}
			if(acceptReq==null) {
				acceptReq="0";
			}
			if(addReq.equals("1")) {
				dbPro.addRequest(myId, pageId);
			}
			if(acceptReq.equals("1")) {
				dbPro.acceptRequest(myId, pageId);
			}
			
			String status=dbPro.getStatus(myId, pageId);
			
			if(status==null) {
				statement="1";
			}else if(status.equals("1")){
				
				String identify1 = dbPro.identifyRequest(myId, pageId);
				String identify2 = dbPro.identifyRequest(pageId, myId);
				if(identify1==null) {
					identify1="";
				}else if(identify1.equals(myId)) {
					statement="2";
				}
				if(identify2==null) {
					identify2="";
				}else if(identify2.equals(pageId)) {
					statement="3";
				}
			}else {
				session.setAttribute("reqCount", dbPro.reqeustCount(myId));
				session.setAttribute("reqList", dbPro.reqList(myId));
				session.setAttribute("friendList", dbPro.friendList(myId));
				statement="4";
			}
			
			request.setAttribute("status", status);
			request.setAttribute("statement", statement);
			request.setAttribute("name", name);
			request.setAttribute("pageId", pageId);
			
			request.setAttribute("aditemt", aditemt);
			request.setAttribute("aditmid", aditmid);
			request.setAttribute("adithigh", adithigh);
			return "/main/otherPage.jsp";
		}
		
	} 
	public String updateLoginForm(HttpServletRequest request,
			 HttpServletResponse response)  throws Throwable { 
			 return "/update/updateLoginForm.jsp"; 
	} 
	
	public String updateLoginPro(HttpServletRequest request,
			 HttpServletResponse response)  throws Throwable { 
		HttpSession session = request.getSession();
		String pass=request.getParameter("password");
		String memberpass=(String)session.getAttribute("password");
		if(pass.equals(memberpass)){ 
			response.sendRedirect(request.getContextPath()+"/gon/updateForm");
		}else{
			request.setAttribute("pass", pass);
			request.setAttribute("memberpass", memberpass);
			return "/update/updateLoginPro.jsp"; 
		}
		
		return null;
		
		} 
	
	
	public String updateForm(HttpServletRequest request,
			 HttpServletResponse response)  throws Throwable { 
			 return "/update/updateForm.jsp"; 
	} 
	
	
	//보드 게시판
	public String schoolBoard(HttpServletRequest request,
			 HttpServletResponse response)  throws Throwable { 
		HttpSession session = request.getSession();
		String index= request.getParameter("index");
		if (index==null){
			index="1";
		}
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		String hakmungu=null;
		int pageSize = 5;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List articleList = null;
		MemberDAO dbPro = MemberDAO.getInstance();
		String schemt=(String) session.getAttribute("schemt");
		String schmid=(String)session.getAttribute("schmid");
		String schhigh=(String)session.getAttribute("schhigh");
		if(index.equals("1")){
			hakmungu=schemt; 
			count=dbPro.getSchoolmateCount("초등학교", schemt, schmid, schhigh);
			if(count>0){
			articleList = dbPro.getSchoolmate(startRow, endRow, schemt, "초등학교");
			}
		}
		if(index.equals("2")){
			hakmungu=schmid;
			count=dbPro.getSchoolmateCount("중학교", schemt, schmid, schhigh);
			if(count>0){
			articleList = dbPro.getSchoolmate(startRow, endRow, schmid, "중학교");
			}
		}
		if(index.equals("3")){
			hakmungu=schhigh;
			count=dbPro.getSchoolmateCount("고등학교", schemt, schmid, schhigh);
			if(count>0){
			articleList = dbPro.getSchoolmate(startRow, endRow, schhigh, "고등학교");
			}
		}
		number = count - (currentPage - 1) * pageSize;
		
		int bottomLine = 5;
		if (count > 0) {
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
			int endPage = startPage + bottomLine - 1;
			if (endPage > pageCount)
				endPage = pageCount;
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			}
		
		request.setAttribute("index", index);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("bottomLine", bottomLine);
		request.setAttribute("count", count);
		request.setAttribute("hakmungu", hakmungu);
		request.setAttribute("articleList", articleList);
		request.setAttribute("number", number);
		
		
		
			 return "/board/schoolBoard.jsp"; 
	} 
	
	//라운지
	public String lounge(HttpServletRequest request,
			 HttpServletResponse response)  throws Throwable { 
		HttpSession session=request.getSession();
		String name= (String) session.getAttribute("name");
		request.setAttribute("name", name);
			 return  "/lounge/lounge.jsp"; 
			}
	
	

}
