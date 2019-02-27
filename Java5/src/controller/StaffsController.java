package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Pager;
import bean.StaffPager;
import entity.Departs;
import entity.Staffs;
import handle.DepartsHandle;
import handle.StaffsHandle;

@Controller
@RequestMapping("/admin/staff")
public class StaffsController {
	@RequestMapping(value = "/staffmanagerment")
	public String redirectToStaffManagerment(
			StaffPager pager, ModelMap mm,HttpSession ss) {
		ss.setAttribute("PAGER", pager);
		mm.put("LIST_STAFF", new StaffsHandle().page(pager));
		mm.put("LIST_DEPART", new DepartsHandle().findAll());
		return "staffManagerment";
	}

	@RequestMapping(value = "/info")
	public String openInfoModal(@RequestParam(value = "id") Integer id,ModelMap mm,HttpSession ss) {
		mm.put("SELECTED_ITEM_INFO", new StaffsHandle().findById(id));
		mm.put("LIST_DEPART", new DepartsHandle().findAll());
		mm.put("LIST_STAFF", new StaffsHandle().page((StaffPager)ss.getAttribute("PAGER")));
		return "staffManagerment";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(@RequestParam(value = "name") String name,
			@RequestParam(value = "gender") String gender, @RequestParam(value = "birthday") String birthday,
			@RequestParam(value = "photo") String photo, @RequestParam(value = "email") String email,
			@RequestParam(value = "phone") String phone, @RequestParam(value = "salary") Double salary,
			@RequestParam(value = "notes") String notes, @RequestParam(value = "departId") int departId,
			ModelMap mm,HttpSession ss) {
		try {
			Staffs st = new Staffs(name, Boolean.parseBoolean(gender),
					new SimpleDateFormat("yyyy-MM-dd").parse(birthday), photo, email, phone, salary, notes,
					new Departs(departId));
			new StaffsHandle().insert(st);
		} catch (ParseException e) {
			JOptionPane.showMessageDialog(null, e);
			e.printStackTrace();
		}
		mm.put("LIST_STAFF", new StaffsHandle().page((StaffPager)ss.getAttribute("PAGER")));
		mm.put("LIST_DEPART", new DepartsHandle().findAll());
		return "staffManagerment";
	}

	@RequestMapping(value = "/update")
	public String openUpdateModal(@RequestParam(value = "id") Integer id, ModelMap mm,HttpSession ss) {
		mm.put("SELECTED_ITEM_EDIT", new StaffsHandle().findById(id));
		mm.put("LIST_DEPART", new DepartsHandle().findAll());
		mm.put("LIST_STAFF", new StaffsHandle().page((StaffPager)ss.getAttribute("PAGER")));
		return "staffManagerment";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@RequestParam(value = "id") int id, @RequestParam(value = "name") String name,
			@RequestParam(value = "gender") String gender, @RequestParam(value = "birthday") String birthday,
			@RequestParam(value = "photo") String photo, @RequestParam(value = "email") String email,
			@RequestParam(value = "phone") String phone, @RequestParam(value = "salary") Double salary,
			@RequestParam(value = "notes") String notes, @RequestParam(value = "departId") int departId,
			ModelMap mm,HttpSession ss) {
		try {
			new StaffsHandle().update(new Staffs(id, name, Boolean.parseBoolean(gender),
					new SimpleDateFormat("yyyy-MM-dd").parse(birthday), photo, email, phone, salary, notes,
					new Departs(departId)));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		mm.put("LIST_STAFF", new StaffsHandle().page((StaffPager)ss.getAttribute("PAGER")));
		mm.put("LIST_DEPART", new DepartsHandle().findAll());
		return "staffManagerment";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam(value = "id") int id, ModelMap mm,HttpSession ss) {
		new StaffsHandle().delete(new StaffsHandle().findById(id));
		mm.put("LIST_STAFF", new StaffsHandle().page((StaffPager)ss.getAttribute("PAGER")));
		mm.put("LIST_DEPART", new DepartsHandle().findAll());
		return "staffManagerment";
	}
}
