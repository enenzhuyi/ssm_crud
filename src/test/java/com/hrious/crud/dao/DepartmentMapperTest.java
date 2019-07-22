package com.hrious.crud.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hrious.crud.domain.Department;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-context.xml")
public class DepartmentMapperTest {

	@Autowired
	private DepartmentMapper departmentMapper;

	@Test
	public void insertSelectiveTest() {
		System.out.println(departmentMapper);
		departmentMapper.insertSelective(new Department(null, "研发部"));
	}
}
