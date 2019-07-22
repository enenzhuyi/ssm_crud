package com.hrious.crud.dao;

import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hrious.crud.domain.Employee;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-context.xml")
public class EmployeeMapperTest {

	@Autowired
	private EmployeeMapper employeeMapper;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void insertSelectiveTest() {
		// employeeMapper.insertSelective(new Employee(null, "小红", "M", "xiaohong@qq.com", 1));
		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		for (int i = 0; i < 1000; i++) {
			double random = Math.random();
			String gender = random > 0.5 ? "M" : "F";
			Integer dId = random > 0.5 ? 1 : 2;
			String empName = UUID.randomUUID().toString().substring(0, 5);
			String email = empName + "@qq.com";
			
			
			mapper.insertSelective(new Employee(null, empName, gender, email, dId));
		}
	}
	
	@Test
	public void selectByExampleWithDeptTest() {
		List<Employee> emps = employeeMapper.selectByExampleWithDept(null);
		System.out.println("size is " + emps.size());
		for (Employee emp : emps) {
			System.out.println("id: " + emp.getEmpId() + ", name: " + emp.getEmpName() 
				+ ", deptId: " + emp.getDepartment().getDeptId() + ", deptName: " + emp.getDepartment().getDeptName());
		}
	}
	
	@Test
	public void selectByPrimaryKeyWithDeptTest() {
		Employee emp = employeeMapper.selectByPrimaryKeyWithDept(5);
		System.out.println("id: " + emp.getEmpId() + ", name: " + emp.getEmpName() 
			+ ", deptId: " + emp.getDepartment().getDeptId() + ", deptName: " + emp.getDepartment().getDeptName());
	}
}
