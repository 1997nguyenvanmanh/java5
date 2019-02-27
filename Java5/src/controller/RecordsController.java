package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bean.Pager;
import bean.RecordPager;
import bean.StaffPager;
import entity.Records;
import entity.Staffs;
import handle.DepartsHandle;
import handle.RecordsHandle;
import handle.StaffsHandle;

@Controller
@RequestMapping("/admin/record")
public class RecordsController {
	@RequestMapping(value = "/recordstaffmanagerment")
	public String redirectToStaffRecordManagerment(ModelMap mm, RecordPager pager, HttpSession ss) {
		ss.setAttribute("PAGER", pager);
		mm.put("LIST_REPORTRECORD", new RecordsHandle().pagerReportByStaffs(pager));
		return "recordStaffManagerment";
	}

	@RequestMapping(value = "/recordstaffmanagerment/{id}")
	public String staffRecordDetail(@PathVariable(value = "id") Integer id, ModelMap mm, RecordPager pager,
			HttpSession ss) {
		pager.setStaffId(id);
		ss.setAttribute("PAGER", pager);
		mm.put("LIST_REPORTRECORD", new RecordsHandle().pagerReportByStaffs(pager));
		mm.put("SELECTED_STAFFRECORD", new StaffsHandle().findById(id));
		mm.put("LIST_RECORD", new RecordsHandle().pagerRecords(pager));
		return "recordStaffManagerment";
	}

	@RequestMapping(value = "/recorddepartmanagerment")
	public String redirectToDepartRecordManagerment(ModelMap mm, RecordPager pager, HttpSession ss) {
		ss.setAttribute("PAGER", pager);
		mm.put("LIST_REPORTRECORD", new RecordsHandle().pagerReportByDeparts());
		return "recordDepartManagerment";
	}

	@RequestMapping(value = "/insert/{id}")
	public String getViewsInsert(@PathVariable(value = "id") Integer id, ModelMap mm, HttpSession ss) {
		mm.put("INSERT_RECORD_ITEM", new StaffsHandle().findById(id));
		mm.put("LIST_STAFF", new StaffsHandle().page((StaffPager) ss.getAttribute("PAGER")));
		mm.put("LIST_DEPART", new DepartsHandle().findAll());
		return "staffManagerment";
	}

	@RequestMapping(value = "/insert")
	public String insertRecord(@RequestParam(value = "type") String type, @RequestParam(value = "reason") String reason,
			@RequestParam(value = "staffId") Integer staffId, ModelMap mm, HttpSession ss) {
		new RecordsHandle().insert(new Records(Boolean.parseBoolean(type), reason, new Date(), new Staffs(staffId)));
		mm.put("LIST_STAFF", new StaffsHandle().page((StaffPager) ss.getAttribute("PAGER")));
		mm.put("LIST_DEPART", new DepartsHandle().findAll());
		return "staffManagerment";
	}

	@RequestMapping(value = "/update/{id}")
	public String openUpdateModal(@PathVariable(value = "id") Integer id, ModelMap mm, RecordPager pager,
			HttpSession ss) {
		ss.setAttribute("PAGER", pager);
		mm.put("SELECTED_ITEM", new RecordsHandle().findById(id));
		mm.put("LIST_REPORTRECORD", new RecordsHandle().pagerReportByStaffs(pager));
		return "recordStaffManagerment";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@RequestParam(value = "id") Integer id, @RequestParam(value = "type") String type,
			@RequestParam(value = "reason") String reason, @RequestParam(value = "date") String date,
			@RequestParam(value = "staffId") Integer staffId, ModelMap mm, RecordPager pager, HttpSession ss) {
		ss.setAttribute("PAGER", pager);
		try {
			new RecordsHandle().update(new Records(id, Boolean.parseBoolean(type), reason,
					new SimpleDateFormat("yyyy-MM-dd").parse(date), new Staffs(staffId)));
		} catch (Exception e) {
			e.printStackTrace();
		}
		mm.put("LIST_REPORTRECORD", new RecordsHandle().pagerReportByStaffs(pager));
		return "recordStaffManagerment";
	}

	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable(value = "id") int id, ModelMap mm, RecordPager pager, HttpSession ss) {
		ss.setAttribute("PAGER", pager);
		new RecordsHandle().delete(new RecordsHandle().findById(id));
		mm.put("LIST_REPORTRECORD", new RecordsHandle().pagerReportByStaffs(pager));
		return "recordStaffManagerment";
	}

}
