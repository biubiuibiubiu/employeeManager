package com.vcmy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vcmy.bean.Department;
import com.vcmy.bean.Employee;
import com.vcmy.dao.DepartmentDao;
import com.vcmy.dao.EmployeeDao;

@Service
public class EmployeeService {

	@Autowired
	EmployeeDao empDao;
	@Autowired
	DepartmentDao depDao;

	public void deleteEmp(Employee emp) {
		empDao.deleteEmp(emp);

	}

	public void addEmp(Employee emp) {
		empDao.addEmp(emp);
	}

	public Employee getEmpById(String id) {
		Employee emp = empDao.getEmpById(id);
		return emp;
	}

	public int updateEmp(Employee emp) {
		if (emp.getTime() == "") {
			emp.setTime(null);
		}
		if (emp.getAge() == "") {
			emp.setAge(null);
		}
		if ("null".equals(emp.getDep().getDep_id())) {
			emp.setDep(null);
		}
		Employee mEmp = empDao.getEmpById(emp.getEmp_id());
		int result;
		if (mEmp != null) {
			result = empDao.updateEmp(emp);
		} else {
			result = empDao.addEmp(emp);
		}
		return result;
	}

	public List<Employee> getEmpByDep(String id) {
		Department dep = empDao.getDepById(id);
		if (dep == null) {
			return null;
		} else {
			List<Employee> list = empDao.getEmpByDep(dep);
			return list;
		}
	}

	public List<Department> getDepList() {
		List<Department> list = depDao.getAllDep();
		return list;

	}

	public List<Employee> getAllEmp() {
		List<Employee> list = empDao.getAllEmp();
		return list;
	}

}
