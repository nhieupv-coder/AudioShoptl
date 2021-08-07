<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Quản lý users</h1>
	</div>
	<div class="">
		<div class="table-wrapper">
			<form id="formSubmit" action="/admin/list-user-pagination" method="post">
				<div class="row mb-3">
					<input type="text" name="search-name" value="${names}" onblur="submitSearch()"
						style="border-radius: 10px; margin-right: 3px; border-color: orange;"
						placeholder="Search&hellip;">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</div>
			</form>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>Họ Và Tên</th>
						<th>Ngày Sinh</th>
						<th>Role</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="in" value="${0}" />
					<c:forEach var="u" items="${page.content }">
						<c:set var="in" value="${in +1 }" />
						<tr>
							<td class="align-middle">${in}</td>
							<td class="align-middle"><a href="/admin/edit?id=${u.id }"><img
									src='<c:url value="/resources/static/img/post/${u.photo}"/>'
									class="avatar" alt="Avatar"> ${u.name}</a></td>
							<td class="align-middle"><fmt:formatDate
									value="${u.birthDay }" pattern="dd/MM/yyyy" /></td>
							<td class="align-middle"><c:if test="${u.admin}">Admin</c:if>
								<c:if test="${!u.admin}">User</c:if></td>
							<td class="align-middle"><c:if test="${u.actived}">
									<span class="status text-success">&bull;</span>
								Active </c:if> <c:if test="${!u.actived}">
									<span class="status text-danger">&bull;</span> Inactive
							 </c:if></td>
							<td class="align-middle"><a href="/admin/user/delete?id=d${u.id}"
								class="delete text-danger" title="Delete User"
								data-toggle="tooltip"><i class="fas fa-user-times"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr />
			<div class="clearfix">
				<div class="hint-text">
					Showing <b>${page.numberOfElements }</b> out of <b>${page.totalElements }</b>
					entries
				</div>
				<nav aria-label="...">
					<ul class="pagination">
						<li class="page-item "><a class="page-link"
							href="/admin/list-user-pagination?pageNo=${page.number-1 < 0?0:page.number-1}">Previous</a>
						</li>
						<c:forEach var="i" begin="0"
							end="${page.totalPages - 1 < 0 ? 0 :page.totalPages-1 }">
							<li class="page-item ${page.number == i ? 'active':'' }"><a
								class="page-link" href="/admin/list-user-pagination?pageNo=${i}">${i+1 }</a></li>
						</c:forEach>
						<li class="page-item"><a class="page-link"
							href="/admin/list-user-pagination?pageNo=${page.number+1 > page.totalPages-1?page.totalPages-1:page.number+1}">Next</a>
						</li>
					</ul>
			</div>
		</div>
	</div>
	<script>
	function submitSearch(){
		var a = document.getElementById("formSubmit");
		a.submit();
	}
	</script>