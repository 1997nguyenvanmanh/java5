package controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import entity.Users;
import handle.UsersHandle;

@Controller
@RequestMapping("/admin/account")
public class UsersController {
	@RequestMapping(value = "/accountmanagerment")
	public String redirectToAccountManagerment(ModelMap mm) {
		mm.put("LIST_ACCOUNT", new UsersHandle().findAll());
		return "accountManagerment";
	}

	@RequestMapping(value = "/insert")
	public String insert(Users use, ModelMap mm) {
		new UsersHandle().insert(new Users(use.getUsername(), use.getPassword(), use.getFullname()));
		mm.put("LIST_ACCOUNT", new UsersHandle().findAll());
		return "accountManagerment";
	}

	@RequestMapping(value = "/update")
	public String openUpdateModal(Users use, ModelMap mm) {
		mm.put("SELECTED_ITEM", new Users(use.getUsername(), use.getPassword(), use.getFullname()));
		mm.put("LIST_ACCOUNT", new UsersHandle().findAll());
		return "accountManagerment";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Users use, ModelMap mm) {
		new UsersHandle().update(new Users(use.getUsername(), use.getPassword(), use.getFullname()));
		mm.put("LIST_ACCOUNT", new UsersHandle().findAll());
		return "accountManagerment";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam(value = "username") String userName,
			ModelMap mm) {
		new UsersHandle().delete(new Users(userName));
		mm.put("LIST_ACCOUNT", new UsersHandle().findAll());
		return "accountManagerment";
	}

}
