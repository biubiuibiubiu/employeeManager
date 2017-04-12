package com.vcmy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.vcmy.bean.Department;
import com.vcmy.bean.Employee;

@Mapper
@Repository
public interface EmployeeDao {
	public Employee getEmpById(String emp_id);

	public int addEmp(Employee emp);

	public List<Employee> getAllEmp();

	public int updateEmp(Employee emp);

	public int deleteEmp(Employee emp);

	public List<Employee> getEmpByDep(Department dep);

	public Department getDepById(String id);

}
