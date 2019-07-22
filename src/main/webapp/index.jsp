<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<title>Insert title here</title>
</head>
<body>

	<!-- 修改员工信息模态框 -->
	<div class="modal fade" id="emp_update_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">修改</h4>
	      </div>
	      <div class="modal-body">
	       <form class="form-horizontal">
			  <div class="form-group">
			    <label for="empName_update" class="col-sm-2 control-label">lastName</label>
			    <div class="col-sm-8">
			      <p id="empName_updata" class="form-control-static"></p>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="gender" class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-8">
			      <label class="radio-inline">
					  <input type="radio" name="gender" id="inlineRadio1" value="M" checked="checked"> 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="gender" id="inlineRadio2" value="F"> 女
					</label>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="email_update" class="col-sm-2 control-label">Email</label>
			    <div class="col-sm-8">
			      <input type="email" class="form-control" id="email_update" placeholder="Email" name="email">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="dId" class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			      <select class="form-control" name="dId" id="dId"></select>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 添加员工信息模态框 -->
	<div class="modal fade" id="emp_add_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加</h4>
	      </div>
	      <div class="modal-body">
	       <form class="form-horizontal">
			  <div class="form-group">
			    <label for="empName_add" class="col-sm-2 control-label">lastName</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" id="empName_add" placeholder="lastName" name="empName">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="gender" class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-8">
			      <label class="radio-inline">
					  <input type="radio" name="gender" id="inlineRadio1" value="M" checked="checked"> 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="gender" id="inlineRadio2" value="F"> 女
					</label>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="email_add" class="col-sm-2 control-label">Email</label>
			    <div class="col-sm-8">
			      <input type="email" class="form-control" id="email_add" placeholder="Email" name="email">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="dId" class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			      <select class="form-control" name="dId" id="dId"></select>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 系统提示对话框 -->
	<div id="system_message_modal" class="modal fade" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">系统提示</h4>
	      </div>
	      <div class="modal-body">
	        <p></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<!-- 删除提示对话框 -->
	<div id="delete_message_modal" class="modal fade" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">删除用户</h4>
	      </div>
	      <div class="modal-body">
	        <p></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal" id="to_delete_btn">删除</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>ssm_crud</h1>
			</div>
		</div>
		<!-- 操作 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button type="button" class="btn btn-info" id="emp_add_btn">添加</button>
				<button type="button" class="btn btn-danger" id="emp_del_all_btn">删除</button>
			</div>
		</div>
		<!-- 查询结果 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th>#</th>
							<th>name</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
		<!-- 统计 -->
		<div class="row">
			<div class="col-md-6" id="page_info"></div>
			<div class="col-md-6" id="page_nav"></div>
		</div>
	</div>
	<script type="text/javascript">
		// 保存当前pages
		var pages = 0, pageNum = 0;
		// 当页面加载完成之后填充数据
		$(function() {
			to_page(1);		
		});
		
		function to_page(pn) {
			$.ajax({
				   url: '${pageContext.request.contextPath}/emps',
				   type: 'get',
				   data: 'pn=' + pn,
				   success: function(data){
					   // 填充表格内部元素
					   build_emps_table(data);
					   // 解析分页信息
					   build_page_info(data);
					   // 填充分页条
					   build_page_nav(data);
				   }
			});
		}
		
		// 解析表格数据
		function build_emps_table(data) {
			// 首先清空数据
			$('#emps_table tbody').empty();
			var emps = data.extend.pageInfo.list;
			$.each(emps, function(i, emp) {
				//  checkbox
				var checkboxEle = $('<td><input type="checkbox" class="check_item"/></td>');
				// id
				var empIdTd = $('<td></td>').append(emp.empId);
				// name
				var empNameTd = $('<td></td>').append(emp.empName);
				// gender
				var genderTd = $('<td></td>').append(emp.gender == 'M' ? '男' : '女');
				// email
				var emailTd = $('<td></td>').append(emp.email);
				// deptName
				var deptNameTd = $('<td></td>').append(emp.department.deptName);
				// 修改按钮
				var updBtn = $('<button></button>').attr('edit-id', emp.empId).addClass('btn btn-info btn-sm edit_btn')
					.append($('<span></span>').addClass('glyphicon glyphicon-pencil'))
					.append('修改');
				// 删除按钮
				var delBtn = $('<button></button>').attr('del-id', emp.empId).addClass('btn btn-danger btn-sm del_btn')
					.append($('<span></span>').addClass('glyphicon glyphicon-trash'))
					.append('删除');
				var btnTd = $('<td></td>').append(updBtn).append('&nbsp;').append(delBtn);
				// 创建tr
				var tr = $('<tr></tr>')
							.append(checkboxEle)
							.append(empIdTd)
							.append(empNameTd)
							.append(genderTd)
							.append(emailTd)
							.append(deptNameTd)
							.append(btnTd);
				$('#emps_table tbody').append(tr);
			})
		}
		
		// 解析分页条
		function build_page_nav(data) {
			// 清空数据
			$('#page_nav').empty();
			var ulEle = $('<ul></ul>').addClass('pagination');
			
			// 首页
			var firstPage = $('<li></li>').append($('<a></a>').append('首页').attr('href', '#'));
			if (!data.extend.pageInfo.hasPreviousPage) { // 没有上一页
				firstPage.addClass('disabled');
				// 只添加首页
				ulEle.append(firstPage);
			} else { // 有上一页
				// 上一页
				var previousPage = $('<li></li>')
					.append($('<a></a>')
							.attr('href', '#')
							.append($('<span></span>')
									.append('&laquo;')));
				// 全部添加
				ulEle.append(firstPage).append(previousPage);
				
				// 添加事件
				firstPage.click(function() {
					to_page(1);
				});
				previousPage.click(function() {
					to_page(data.extend.pageInfo.pageNum - 1);
				});
			}
			
			// 添加中间页
			$.each(data.extend.pageInfo.navigatepageNums, function(i, it) {
				var liEle = $('<li></li>').append($('<a></a>').append(it).attr('href', '#'));
				if (it == data.extend.pageInfo.pageNum) {
					liEle.addClass('active');
				} else {
					liEle.click(function() {
						to_page(it);
					})
				}
				ulEle.append(liEle);
			})
			
			// 末页
			var lastPage = $('<li></li>').append($('<a></a>').append('末页').attr('href', '#'));
			
			if (!data.extend.pageInfo.hasNextPage) { // 没有下一页
				lastPage.addClass('disabled');
				// 只添加末页
				ulEle.append(lastPage);
			} else {
				// 下一页
				var previousPage = $('<li></li>')
				.append($('<a></a>').attr('href', '#')
						.append($('<span></span>').append('&raquo;')));
				
				// 全部添加
				ulEle.append(previousPage).append(lastPage);
				
				// 添加事件
				previousPage.click(function() {
					to_page(data.extend.pageInfo.pageNum + 1);
				});
				lastPage.click(function() {
					to_page(data.extend.pageInfo.pages);
				});
			}
			
			$('<nav></nav>').append(ulEle).appendTo($('#page_nav'));
		}
		
		// 解析分页信息
		function build_page_info(data) {
			// 保存
			pages = data.extend.pageInfo.pages;
			pageNum = data.extend.pageInfo.pageNum;
			// 清空数据
			$('#page_info').empty();
			$('#page_info').append('当前 ' + data.extend.pageInfo.pageNum 
					+ ' 页, 总 ' + data.extend.pageInfo.pages 
					+ ' 页, 共 ' + data.extend.pageInfo.total + ' 条记录');
		}
		
		// 清空form表单样式
		function remove_form(formEle) {
			// 重置表单的input输入框
			$(formEle)[0].reset();
			// 清除表单内的错误提示
			$(formEle).find('*').removeClass('has-success has-error');
			$(formEle).find('.help-block').text('');
		}
		
		// 点击新增按钮
		$('#emp_add_btn').click(function() {
			// 清空表单
			remove_form('#emp_add_modal form');
			// 点击对话框之后查询所有的部门信息
			getDepts('#emp_add_modal select', true);
			$('#emp_add_modal').modal({
				backdrop: 'static'
			});
		});
		
		// ele: 把查出的部门信息添加到哪一个select标签中
		// async: 是否同步
		function getDepts(ele, async) {
			// 清空数据
			$(ele).empty();
			$.ajax({
				url: '${pageContext.request.contextPath}/depts',
				type: 'get',
				async: async,
				success: function(data) {
					$.each(data.extend.depts, function(i, it) {
						var optionEle = $('<option></option>').append(it.deptName).attr('value', it.deptId);
						optionEle.appendTo($(ele));
					});
				}
			});
		}
		
		// content 系统提示内容
		// 点击退出按钮执行的回调函数
		function system_message(content, fn) {
			// 清空对话框的内容
			$('#system_message_modal .modal-body p').empty();
			// 在提示对话框中填充数据
			$('#system_message_modal .modal-body p').append(content);
			// 展示提示对话框
			$('#system_message_modal').modal({
				backdrop: 'static'
			});
			$('#system_message_modal button').click(fn);
		}
		
		function validata_form_data() {
			// 获取员工姓名和邮箱
			var empName = $('#empName_add').val();
			var email = $('#email_add').val();
			
			// 正则表达式
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			
			if (!regName.test(empName)) { // 用户名不合法
				validata_hint_msg('#empName_add', 'error', '用户名必须为6-16位英文、数字或者2-5中文');
				return false;
			} else { // 用户名校验成功
				validata_hint_msg('#empName_add', 'success', '');
			}
			
			if (!regEmail.test(email)) { // 邮箱不合法
				validata_hint_msg('#email_add', 'error', '电子邮箱格式错误');
				return false;
			} else { // 邮箱校验成功
				validata_hint_msg('#email_add', 'success', '');
			}
			
			return true;
		}
		
		function validata_hint_msg(ele, status, msg) {
			// 清空样式
			$(ele).parent().removeClass('has-success has-error');
			$(ele).next('span').text('');
			// 设置样式
			if ('success' == status) { // 校验成功
				$(ele).parent().addClass('has-success');
			} else if ('error' == status) { // 校验失败
				$(ele).parent().addClass('has-error');
				$(ele).next('span').text(msg);
			}
		}
		
		// 点击对新增话框内部的保存按钮
		$('#emp_save_btn').click(function() {
			// 先判断用户名是否存在, 否则一律不执行
 			if ($(this).attr('ajax_va') == 'error') {
 				return;
 			}
			
			// 校验表单的信息，这里主要是校验员工姓名和邮箱
			if (!validata_form_data()) {
				return;
			}
			$.ajax({
				url: '${pageContext.request.contextPath}/emp',
				type: 'post',
				data: $('#emp_add_modal form').serialize(),
				success: function(data) {
					console.log(data);
					// 判断后台处理结果
					if (data.code == 100) { // 服务器正确完成操作
						// 关闭原有对话框
						$('#emp_add_modal').modal('hide');
						// 调用系统提示
						// 当提示对话框关闭时发送ajax查询最后一页信息
						system_message(data.hint, function() {
							to_page(pages + 1);
						});
					} else {
						if (undefined != data.extend.errorFields.empName) { // 用户名验证出现异常
							validata_hint_msg('#empName_add', 'error', '用户名必须为6-16位英文、数字或者2-5中文');
						}
						if (undefined != data.extend.errorFields.email) { // 邮箱验证出现异常
							validata_hint_msg('#email_add', 'error', '电子邮箱格式错误');
						}
					}
					
				}
			});
		});
		
		// 当新增对话框中, 用户名输入框的内容发生变化
		$('#empName_add').change(function() {
			var input = this;
			$.ajax({
				url: '${pageContext.request.contextPath}/checkUser',
				type: 'get',
				data: 'empName=' + $(input).val(),
				success: function(data) {
					// 根据服务器返回过来的状态信息进行判断
					if (data.code == 100) { // 用户名存在,  则提示用户
						validata_hint_msg('#empName_add', 'error', data.extend.va_msg);
						// 在提交按钮上绑定属性, 便于进行控制
						$('#emp_save_btn').attr('ajax_va', 'error');
					} else { // 用户名不存在
						validata_hint_msg('#empName_add', 'success', '');
						// 在提交按钮上绑定属性, 便于进行控制
						$('#emp_save_btn').attr('ajax_va', 'success');
					}
				}
			});
		});
		
		// 给修改按钮添加事件
		$(document).on('click', '.edit_btn', function() {
			// 查询部门信息
			getDepts('#emp_update_modal select', false);
			// 清空表单
			remove_form('#emp_update_modal form');
			// 将修改按钮的edit-id属性的值传递给模态框内部的修改按钮 
			$('#emp_update_btn').attr('edit-id', $(this).attr('edit-id'));
			// 弹出修改对话框
			$('#emp_update_modal').modal({
				backdrop: 'static'
			});
			// 查出所对应的员工信息
			$.ajax({
				url: '${pageContext.request.contextPath}/emp/' + $(this).attr('edit-id'),
				type: 'get',
				success: function(data) {
					// 给对话框中相关属性赋值 emp_update_modal
					$('#emp_update_modal #empName_updata').text(data.extend.emp.empName);
					$('#emp_update_modal #email_update').val(data.extend.emp.email);
					$('#emp_update_modal input[name=gender]').val([data.extend.emp.gender]);
					$('#emp_update_modal select').val([data.extend.emp.dId]);
				}
			});
		});
		
		// 给修改的模态框中的修改按钮添加点击事件
		$('#emp_update_btn').click(function() {
			// 只需判断email是否合法
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			var email = $('#email_update').val();
			if (!regEmail.test(email)) { // 邮箱不合法
				validata_hint_msg('#email_add', 'error', '电子邮箱格式错误');
				return false;
			} else { // 邮箱校验成功
				validata_hint_msg('#email_add', 'success', '');
				// 保存当前按钮
				var btn = $(this);
				$.ajax({
					url: '${pageContext.request.contextPath}/emp/' + btn.attr('edit-id'),
					type: 'put',
					data: $('#emp_update_modal form').serialize(),
					success: function(data) {
						if (data.code == 100) { // 操作成功
							// 关闭原有对话框
							$('#emp_update_modal').modal('hide');
							// 调用系统提示
							// 当提示对话框关闭时发送ajax查询当前页信息
							system_message(data.hint, function() {
								to_page(pageNum);
							});
						}
					}
				});
			}
		});
		
		// 抽取删除对话框
		// content对话框的内容 
		// fn 确定按钮绑定的事件
		function delete_message(content, fn) {
			// 清空对话框的内容
			$('#delete_message_modal .modal-body p').empty();
			// 设置对话框内容
			$('#delete_message_modal .modal-body p').text(content);
			// 确定按钮绑定的事件
			$('#delete_message_modal #to_delete_btn').click(fn);
			// 显示对话框
			$('#delete_message_modal').modal({
				backdrop: 'static'
			});
		}
		
		// 给删除按钮添加事件
		$(document).on('click', '.del_btn', function() {
			var btn = $(this);
			// 员工姓名
			var empName = btn.parents('tr').find('td').eq(2).text();
			// 弹出删除对话框, 并绑定事件
			delete_message(empName, function() {
				$.ajax({
					url: '${pageContext.request.contextPath}/emp/' + btn.attr('del-id'),
					type: 'delete',
					success: function(data) {
						// 调用系统提示
						system_message(data.hint, function() {
							// 刷新当前页
							to_page(pageNum);
						});
					}
				});
			});
		});
		
		// 给全选按钮添加全选事件
		$('#check_all').click(function() {
			$('.check_item').prop('checked', $(this).prop('checked'));
		});
		
		// 给每条用户记录添加单选按钮
		$(document).on('click', '.check_item', function() {
			$('#check_all').prop('checked', $('.check_item:checked').length == $('.check_item').length);	
		});
		
		// 给上层删除按钮绑定点击事件
		$('#emp_del_all_btn').click(function() {
			if ($('.check_item:checked').length == 0) { // 元素个数为零
				system_message('请选择要删除的元素');
			} else { // 进行删除操作
				// 拼接相关字符串
				var empNames = '';
				var empIds = '';
				$.each($('.check_item:checked'), function() {
					empNames += $(this).parents('tr').find('td').eq(2).text() + ', ';
					empIds += $(this).parents('tr').find('td').eq(1).text() + '-';
				});
				empNames = empNames.substring(0, empNames.length - 2);
				empIds = empIds.substring(0, empIds.length - 1);
				
				// 弹出删除对话框, 并绑定事件
				delete_message(empNames, function() {
					$.ajax({
						url: '${pageContext.request.contextPath}/emp/' + empIds,
						type: 'delete',
						success: function(data) {
							// 调用系统提示
							system_message(data.hint, function() {
								// 刷新当前页
								to_page(pageNum);
							});
						}
					});
				});
			}
		});
		
	</script>
</body>
</html>