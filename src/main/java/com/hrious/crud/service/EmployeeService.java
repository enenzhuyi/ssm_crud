package com.hrious.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrious.crud.dao.EmployeeMapper;
import com.hrious.crud.domain.Employee;
import com.hrious.crud.domain.EmployeeExample;
import com.hrious.crud.domain.EmployeeExample.Criteria;

@Service
public class EmployeeService {
	
	@Autowired
	private EmployeeMapper employeeMapper;

	public List<Employee> getAll() {
		EmployeeExample employeeExample = new EmployeeExample();
		employeeExample.setOrderByClause("emp_id");
		return employeeMapper.selectByExampleWithDept(employeeExample);
	}

	public void save(Employee employee) {
		employeeMapper.insertSelective(employee);
	}

	public boolean checkUser(String empName) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		return employeeMapper.countByExample(example) == 0;
	}

	public Employee getEmp(Integer id) {
		return employeeMapper.selectByPrimaryKey(id);
	}

	public void updateEmp(Employee employee) {
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	public void deleteEmpById(Integer id) {
		employeeMapper.deleteByPrimaryKey(id);
	}

	public void batchDeleteEmp(List<Integer> empList) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdIn(empList);
		employeeMapper.deleteByExample(example);
	}

}
