package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import entity.Departs;
import handle.DepartsHandle;

@Controller
@RequestMapping("/admin/depart")
public class DepartsController {

	@RequestMapping(value = "/departmanagerment")
	public String redirectToDepartManagerment(ModelMap mm) {
		mm.put("LIST_DEPART", new DepartsHandle().findAll());
		return "departManagerment";
	}

	@RequestMapping(value = "/insert")
	public String insert(Departs dep, ModelMap mm) {
		new DepartsHandle().insert(new Departs(dep.getName()));
		mm.put("LIST_DEPART", new DepartsHandle().findAll());
		return "departManagerment";
	}

	@RequestMapping(value = "/update")
	public String openUpdateModal(Departs dep, ModelMap mm) {
		mm.put("SELECTED_ITEM", dep);
		mm.put("LIST_DEPART", new DepartsHandle().findAll());
		return "departManagerment";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Departs dep, ModelMap mm) {
		new DepartsHandle().update(dep);
		mm.put("LIST_DEPART", new DepartsHandle().findAll());
		return "departManagerment";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam(value = "id") int id, ModelMap mm) {
		new DepartsHandle().delete(new DepartsHandle().findById(id));
		mm.put("LIST_DEPART", new DepartsHandle().findAll());
		return "departManagerment";
	}
}
