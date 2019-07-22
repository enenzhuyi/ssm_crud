package com.hrious.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrious.crud.dao.DepartmentMapper;
import com.hrious.crud.domain.Department;

@Service
public class DepartmentService {
	
	@Autowired
	private DepartmentMapper departmentMapper;

	public List<Department> getAll() {
		return departmentMapper.selectByExample(null);
	}
	
}
