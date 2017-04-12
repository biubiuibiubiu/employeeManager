package com.vcmy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.vcmy.bean.Department;

@Mapper
@Repository
public interface DepartmentDao {
	public List<Department> getAllDep();

	public Department getDepById(String dep_id);

	public int addDep(Department dep);

	public int updateDep(Department dep);

	public int deleteDep(Department dep);

}
