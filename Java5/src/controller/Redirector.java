package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bean.RecordPager;
import entity.Users;
import handle.RecordsHandle;
import handle.UsersHandle;

@Controller
public class Redirector {
	
	@RequestMapping(value = "/admin")
	public String redirectToAdminPage(ModelMap mm,RecordPager pager,HttpSession ss) {
		pager.setKeyword("top10");
		ss.setAttribute("PAGER", pager);
		mm.put("ITEM", new RecordsHandle().pagerReportByStaffs(pager));
		return "top10";
	}

	@RequestMapping(value = "/login")
	public String redirectToLoginPage() {
		return "login";
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession ss) {
		ss.removeAttribute("ADMIN");
		return "login";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.POST)
	public String login(@RequestParam(value = "user") String user,
			@RequestParam(value = "pass") String pass, HttpSession ss) {
		Users us = new UsersHandle().checkLogin(user, pass);
		if (us != null) {
			ss.setAttribute("ADMIN", us);
			
			return "top10";
		}
		return "login";
	}

}
