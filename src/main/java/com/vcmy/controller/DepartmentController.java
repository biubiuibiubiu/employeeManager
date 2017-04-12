package com.vcmy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vcmy.bean.Department;
import com.vcmy.service.DepartmentService;

@Controller
public class DepartmentController {

	@Autowired
	DepartmentService depService;

	@RequestMapping("/getDepList")
	public String getDepList(String result, HttpSession session) {
		List<Department> list = depService.getAllDep();
		session.setAttribute("depList", list);
		return "/jsp/depList.jsp?result" + result;
	}

	@RequestMapping("/getDepById")
	public String getDepById(String dep_id, HttpSession session) {
		Department dep = depService.getdepById(dep_id);
		session.setAttribute("dep", dep);
		return "/jsp/dep.jsp";
	}

	@RequestMapping("/deleteDep")
	public String deleteDep(String dep_id, HttpServletRequest req) {
		int result = depService.deleteDep(dep_id);
		req.setAttribute("result", result);
		return "/getDepList";

	}

	@RequestMapping("/updateDep")
	public String updateDep(Department dep, HttpServletRequest req) {
		int result = depService.updateDep(dep);
		if (result == 0) {
			req.setAttribute("result", result);
			return "/jsp/dep.jsp";
		} else {
			return "/getDepList";
		}
	}

	@RequestMapping("/addDep")
	public String addDep(HttpSession session) {
		Department dep = new Department();
		session.setAttribute("dep", dep);
		return "/jsp/dep.jsp";

	}

}
