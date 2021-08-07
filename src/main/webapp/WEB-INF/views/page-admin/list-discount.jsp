<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Quản lý loại sản phẩm</h1>
	</div>
	<!-- Content Row -->
	<div class="row p-0 m-0">

		<!-- Area Chart -->
		<div class="col-xl col-lg p-0 m-0">

			<div class="card-body p-0">
				<div class="container-fluid m-0 p-0">
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Danh sách sản
								phẩm giảm giá</h6>
						</div>
						<div class="card-body m-0 p-0">
							<form id="searh-name" action="/admin/discount/list-discount"
								method="post">
								<div class="row mt-3 p-2">
									<div class="col">
										<label class="p-0 m-0">Tìm kiếm theo tên: </label>
										<div class="input-group pt-2">
											<input type="text" class="form-control" name="search-kw"
												value="${kws}" placeholder="Search by name..."
												onblur="send()"> <span class="input-group-btn">
												<button class="btn btn-default" type="submit">
													<i class="fas fa-search"></i>
												</button>
											</span>
										</div>
									</div>
								</div>
							</form>
						</div>
						<hr />
						<div class="row m-4">
							<table class="table table-bordered" width="100%" cellspacing="0">
								<thead>
									<tr class="text-center">
										<th scope="col">Hình ảnh</th>
										<th scope="col">Tên sản phẩm</th>
										<th scope="col">Giá sản phẩm</th>
										<th>Giảm giá</th>
										<th scope="col">Giá sau giảm giá</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="c" items="${pageC.content}">
										<tr>
											<td class="text-center"><img class="img-thumbnail"
												style="height: 120px"
												src='<c:url value="/resources/static/img/post/${c.product.image }"/>'
												alt="" /></td>
											<td>${c.product.nameproduct }</td>
											<td><fmt:formatNumber value="${c.product.price}" /> VND</td>
											<td>${c.percent}%</td>
											<td><fmt:formatNumber
													value="${c.product.price - (c.product.price*c.percent)/100}" />
												VND</td>
											<td><a href="/admin/discount/edit?id=${c.product.id}"
												class="btn btn-success">Edit</a> <a
												href="/admin/discount/delete?id=${c.id}"
												class="btn btn-danger">Delete</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<nav aria-label="Page navigation example ">
							<ul class="pagination d-flex justify-content-center">
								<li class="page-item"><a class="page-link" href="#">Previous</a></li>
								<c:forEach var="i" begin="0" end="${pageC.getTotalPages()-1}">
									<li class="page-item ${i == pageC.getNumber()?'active':'' }"><a
										class="page-link"
										href="/admin/category/pagination/list?pageNo=${i}">${i+1}</a></li>
								</c:forEach>
								<li class="page-item"><a class="page-link" href="#">Next</a></li>
							</ul>
						</nav>
					</div>

				</div>

			</div>
		</div>
	</div>
</div>
<script>
	function send() {
		var a = document.getElementById("searh-name");
		a.submit();
	}
	</sctipt>
