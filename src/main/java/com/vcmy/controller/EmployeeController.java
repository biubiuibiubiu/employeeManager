package com.vcmy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vcmy.bean.Department;
import com.vcmy.bean.Employee;
import com.vcmy.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeService empService;

	@RequestMapping("/search")
	public String init(String key, String type, HttpSession session) {
		Map search = new HashMap<>();
		search.put("key", key);
		search.put("type", type);
		session.setAttribute("search", search);
		List<Department> list = empService.getDepList();
		session.setAttribute("depList", list);
		return search(session);

	}

	public String search(HttpSession session) {
		Map map = (Map) session.getAttribute("search");
		String type = (String) map.get("type");
		String key = (String) map.get("key");
		System.out.println(key);
		if ("dep".equals(type)) {
			return "/getEmpByDep?id=" + key;
		} else if ("emp".equals(type)) {
			return "/getEmpById?id=" + key;
		} else {
			return "/jsp/error.jsp";
		}
	}

	@RequestMapping("/getEmpById")
	public String getEmpById(String id, HttpSession session) {
		System.out.println(id + "|");
		System.out.println(id.equals("null"));
		if (id.equals("null")) {
			List<Employee> list = empService.getAllEmp();
			session.setAttribute("empList", list);
			return "/jsp/empList.jsp";
		}
		Employee emp = empService.getEmpById(id);
		if (emp == null) {
			return "/jsp/error.jsp";
		} else {
			session.setAttribute("emp", emp);
			return "/jsp/emp.jsp";
		}
	}

	@RequestMapping("/getEmpByDep")
	public String getEmpByDep(String id, HttpSession session) {
		List<Employee> list = empService.getEmpByDep(id);
		if (list == null) {
			return "/jsp/error.jsp";
		} else {
			session.setAttribute("empList", list);
			return "/jsp/empList.jsp";
		}
	}

	@RequestMapping("/deleteEmp")
	public String deleteEmp(Employee emp, HttpSession session) {
		empService.deleteEmp(emp);
		return search(session);
	}

	@RequestMapping("/updateEmp")
	public String updateEmp(Employee emp, HttpSession session) {
		int result = empService.updateEmp(emp);
		session.setAttribute("emp", emp);
		return search(session) + "&result=" + result;
	}

	@RequestMapping("/addEmp")
	public String addEmp(HttpSession session) {
		Employee emp = new Employee();
		session.setAttribute("emp", emp);
		return "/jsp/emp.jsp";
	}

}
