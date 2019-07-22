package com.hrious.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hrious.crud.domain.Employee;
import com.hrious.crud.domain.Message;
import com.hrious.crud.service.EmployeeService;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value = "/emp/{ids}", method = RequestMethod.DELETE)
	@ResponseBody
	public Message deleteEmp(@PathVariable("ids") String ids) {
		if (ids.contains("-")) { // 批量删除
			List<Integer> list = new ArrayList<Integer>();
			for (String str : ids.split("-")) {
				list.add(Integer.parseInt(str));
			}
			employeeService.batchDeleteEmp(list);
			return Message.success();
		} else { // 单个删除
			employeeService.deleteEmpById(Integer.parseInt(ids));
			return Message.success();
		}
	}
	
	@RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
	@ResponseBody
	public Message updateEmp(Employee employee) {
		employeeService.updateEmp(employee);
		return Message.success();
	}
	
	@RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Message getEmp(@PathVariable("id") Integer id) {
		Employee emp = employeeService.getEmp(id);
		return Message.success().add("emp", emp);
	}
	
	@RequestMapping(value = "/checkUser", method = RequestMethod.GET)
	@ResponseBody
	public Message checkUser(@RequestParam("empName") String empName) {
		// 使用正则表达式对用户名的合法性进行校验
		String regName = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)";
		if (!empName.matches(regName)) { // 用户名不合法
			return Message.success().add("va_msg", "用户名必须是6-16位英文和数字组合或者是2-5位中文");
		}
		
		if (employeeService.checkUser(empName)) { // 用户不存在
			return Message.fail();
		} else { // 用户存在
			return Message.success().add("va_msg", "用户名不可用");
		}
	}
	
	@RequestMapping(value = "/emp", method = RequestMethod.POST)
	@ResponseBody
	public Message saveEmp(@Valid Employee employee, BindingResult result) {
		// 首先判断是否有异常, 及校验失败
		if (result.hasErrors()) { // 存在异常
			List<FieldError> errors = result.getFieldErrors();
			Map<String, Object> map = new HashMap<String, Object>();
			for (FieldError error : errors) {
				System.out.println("错误类型: " + error.getField());
				System.out.println("异常信息: " + error.getDefaultMessage());
				
				map.put(error.getField(), error.getDefaultMessage());
			}
			return Message.fail().add("errorFields", map);
		} else { // 不存在异常
			employeeService.save(employee);
			return Message.success();
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/emps", method = RequestMethod.GET)
	public Message getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 分页查询
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getAll();
		// 连续显示五页
		PageInfo<Employee> pageInfo = new PageInfo<>(emps, 5);
		return Message.success().add("pageInfo", pageInfo);
	}

	/*@RequestMapping(value = "/emps", method = RequestMethod.GET)
	public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			Map<String, Object> map) {
		// 分页查询
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getAll();
		// 连续显示五页
		PageInfo<Employee> pageInfo = new PageInfo<>(emps, 5);
		map.put("pageInfo", pageInfo);
		return "list";
	}*/
}
