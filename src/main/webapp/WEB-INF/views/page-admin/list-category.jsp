<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
							<h6 class="m-0 font-weight-bold text-primary">Danh sách loại
								sản phẩm</h6>
						</div>
						<div class="card-body m-0 p-0">
							<div class="row mt-3 p-2">
								<div class="col">
									<form id="form-search" action="/admin/listCategory" method="post">
										<label class="p-0 m-0">Tìm kiếm theo tên: </label>
										<div class="input-group pt-2">
											<input type="text" class="form-control" onblur="submit()" value="${kws}" name="search-by"
												placeholder="Search by name ...."> <span
												class="input-group-btn">
												<button class="btn btn-default" type="submit">
													<i class="fas fa-search"></i>
												</button>
											</span>
										</div>
									</form>
								</div>
							</div>
						</div>
						<hr />
						<div class="row m-4">
							<table class="table table-bordered" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th scope="col">ID</th>
										<th scope="col">Tên Loại Hàng</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="c" items="${pageC.content}">
										<tr>
											<td>${c.id }</td>
											<td>${c.namecategory}</td>
											<td><a href="/admin/category/edit/${c.id}"
												class="btn btn-success">Edit</a> <a
												href="/admin/category/delete/d${c.id}"
												class="btn btn-danger">Delete</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<nav aria-label="Page navigation example ">
							<ul class="pagination d-flex justify-content-center">
								<li class="page-item"><a class="page-link" href="/admin/listCategory?pageNo=${pageC.number-1 < 0?0:pageC.number-1}">Previous</a></li>
								<c:forEach var="i" begin="0" end="${pageC.getTotalPages()-1 < 0 ? '0':pageC.getTotalPages()-1}">
									<li class="page-item ${i == pageC.getNumber()?'active':'' }"><a
										class="page-link"
										href="/admin/listCategory?pageNo=${i}">${i+1}</a></li>
								</c:forEach>
								<li class="page-item"><a class="page-link" href="/admin/listCategory?pageNo=${pageC.number+1 >pageC.totalPages-1?pageC.totalPages-1:pageC.number+1 }">Next</a></li>
							</ul>
						</nav>
					</div>

				</div>

			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function submit(){
	var a = document.getElementById("form-search");
	s.submit();
}
</script>