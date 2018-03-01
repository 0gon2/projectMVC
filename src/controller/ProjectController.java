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
			 return "/start/signupPro.jsp"; 
			} 
	
	public String loginForm(HttpServletRequest request,
			 HttpServletResponse response)  throws Throwable { 
			 return "/start/loginForm.jsp"; 
			} 
	public String lab(HttpServletRequest request,
			 HttpServletResponse response)  throws Throwable { 
			 return "/start/lab.jsp"; 
			} 
	@SuppressWarnings("null")
	public String loginPro(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String id=req.getParameter("memberid");
		String pass=req.getParameter("password");
		String pages=req.getParameter("page");
		MemberDAO dbPro = MemberDAO.getInstance();
		
		//로그인
		int pwcheck = dbPro.login(id, pass);
		if(pwcheck==1) {
			MemberVO mVO=dbPro.getUserInfo(id);
			String name=mVO.getName();
			String schemt=mVO.getSch_emt();
			String schmid=mVO.getSch_mid();
			String schhigh=mVO.getSch_high();
			int birthday=mVO.getBirthday();
			HttpSession session = req.getSession();
			session.setAttribute("name", name);	
			session.setAttribute("schemt", schemt);	
			session.setAttribute("schmid", schmid);	
			session.setAttribute("schhigh", schhigh);	
			session.setAttribute("birthday", birthday);	
			session.setAttribute("myId",id);
			session.setAttribute("password",pass);
			res.sendRedirect(req.getContextPath()+"/project/lab");
		}else {
			req.setAttribute("pwcheck",pwcheck);
			return "/start/loginPro.jsp";
		}
		return null;
	}

	
	

	


}
