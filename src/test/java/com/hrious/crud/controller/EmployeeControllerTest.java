package com.hrious.crud.controller;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.hrious.crud.domain.Employee;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-context.xml", "classpath:spring-mvc.xml"})
@WebAppConfiguration
public class EmployeeControllerTest {

	// 模拟mvc请求, 获取请求结果
	private MockMvc mockMvc;
	
	// SpringMVC的 IOC 容器
	@Autowired
	private WebApplicationContext context;
	
	@Before
	public void initMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void getEmpsTest() throws Exception {
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "5")).andReturn();
		PageInfo<Employee> pageInfo = (PageInfo<Employee>) result.getRequest().getAttribute("pageInfo");
		List<Employee> emps = pageInfo.getList();
		for (Employee emp : emps) {
			System.out.println("id: " + emp.getEmpId() + ", name: " + emp.getEmpName());
		}
		System.out.println("当前页码: " + pageInfo.getPageNum());
		System.out.println("共 " + pageInfo.getPages() + " 页");
		System.out.println("记录总数: " + pageInfo.getTotal());
		
		int[] nums = pageInfo.getNavigatepageNums();
		for (int i : nums) {
			System.out.print(i + " ");
		}
	}
	
}
