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
				<button type="button" class="btn btn-info">修改</button>
				<button type="button" class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 查询结果 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>name</th>
						<th>gender</th>
						<th>email</th>
						<th>deptName</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${requestScope.pageInfo.list}" var="emp">
						<tr>
							<td>${emp.empId}</td>
							<td>${emp.empName}</td>
							<td>${emp.gender == "M" ? "男" : "女"}</td>
							<td>${emp.email}</td>
							<td>${emp.department.deptName}</td>
							<td>
								<button type="button" class="btn btn-info btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									修改
								</button>
								<button type="button" class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									删除
								</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- 统计 -->
		<div class="row">
			<div class="col-md-6">
				当前 ${requestScope.pageInfo.pageNum} 页, 总 ${requestScope.pageInfo.pages} 页, 共 ${requestScope.pageInfo.total} 条记录  
			</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  	<!-- 首页 -->
				  	<li>
				      <a href="${pageContext.request.contextPath}/emps?pn=1">首页</a>
				    </li>
				    <!-- 上一页 -->
				    <c:if test="${requestScope.pageInfo.hasPreviousPage}">
					    <li>
					      <a href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				    </c:if>
				    <!-- 中间页 -->
				    <c:forEach items="${requestScope.pageInfo.navigatepageNums}" var="pageNum">
				    	<c:if test="${pageNum == requestScope.pageInfo.pageNum}">
					    	<li class="active"><a href="${pageContext.request.contextPath}/emps?pn=${pageNum}">${pageNum}</a></li>
				    	</c:if>
				    	<c:if test="${pageNum != requestScope.pageInfo.pageNum}">
					    	<li><a href="${pageContext.request.contextPath}/emps?pn=${pageNum}">${pageNum}</a></li>
				    	</c:if>
				    </c:forEach>
				    <!-- 下一页 -->
				    <c:if test="${requestScope.pageInfo.hasNextPage}">
					    <li>
					      <a href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </c:if>
				    <!-- 末页 -->
				    <li>
				      <a href="${pageContext.request.contextPath}/emps?pn=${requestScope.pageInfo.pages}">末页</a>
				    </li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>