package com.vcmy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vcmy.bean.Department;
import com.vcmy.bean.Employee;
import com.vcmy.dao.DepartmentDao;
import com.vcmy.dao.EmployeeDao;

@Service
public class DepartmentService {

	@Autowired
	DepartmentDao depDao;
	@Autowired
	EmployeeDao empDao;

	public Department getdepById(String id) {
		Department dep = depDao.getDepById(id);
		return dep;
	}

	public int deleteDep(String dep_id) {
		Department dep = depDao.getDepById(dep_id);
		List<Employee> list = empDao.getEmpByDep(dep);
		for (Employee emp : list) {
			emp.setDep(null);
			empDao.updateEmp(emp);
		}
		return depDao.deleteDep(dep);

	}

	public int updateDep(Department dep) {
		Department mDep = depDao.getDepById(dep.getDep_id());
		if (mDep != null) {
			return depDao.updateDep(dep);
		} else {
			return depDao.addDep(dep);
		}

	}

	public List<Department> getAllDep() {
		List<Department> list = depDao.getAllDep();
		return list;
	}

}
