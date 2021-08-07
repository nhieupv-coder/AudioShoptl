<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Doanh thu</h1>
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
							<h6 class="m-0 font-weight-bold text-primary">Doanh thu theo
								loại hàng</h6>
						</div>
						<div class="card-body m-0 p-0">
							<div class="row mt-3 p-2">
								<div class="col-md-6 ">
									<label class="p-0 m-0">Chọn loại hàng: </label>
									<div class="input-group pt-2">
										<form id="formCategory" action="/admin/statistical-category"
											method="post">
											<select class="form-control" onchange="getForm()"
												aria-label="Default select example" name="category">
												<c:forEach var="i" items="${listcategory}">
													<option ${idCategory  == i.id ? 'selected':'' }
														value="${i.id}">${i.namecategory}</option>
												</c:forEach>
											</select>
										</form>
									</div>
								</div>
							</div>
						</div>
						<hr />
						<div class="row m-4">
							<table class="table table-bordered" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th scope="col">Ngày</th>
										<th scope="col">Số Lượng</th>
										<th scope="col">Doanh Thu</th>
									</tr>
								</thead>
								<c:set var="total" value="${0}" />
								<tbody>
									<c:forEach var="i" items="${page.content}">
										<tr>
											<td><fmt:formatDate value="${i.date}"
													pattern="dd-MM-yyyy" /></td>
											<td>${i.totalQuantity}</td>
											<td><fmt:formatNumber value=" ${i.statistical }" /> VND</td>
											<c:set var="total" value="${total + i.statistical }" />
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<h3>
								Tổng Doanh Thu:
								<b class="text-danger">
									<fmt:formatNumber value="${total}" />
								</b>
								VND
							</h3>
						</div>
						<nav aria-label="Page navigation example ">
							<ul class="pagination d-flex justify-content-center">
								<li class="page-item"><a class="page-link" href="/admin/statistical-category?category=${idCategory}&pageNo=${page.number-1 < 0?0:page.number-1}">Previous</a></li>
								<c:forEach var="i" begin="0" end="${page.totalPages-1 < 0?'0':page.totalPages-1 }">
									<li class="page-item ${page.number == i ? 'active':'' }"  ><a class="page-link" href="/admin/statistical-category?category=${idCategory}&pageNo=${i}">${i+1}</a></li>
								</c:forEach>
								<li class="page-item"><a class="page-link" href="/admin/statistical-category?category=${idCategory}&pageNo=${page.number+1 > page.totalPages-1?page.totalPages-1:page.number+1}">Next</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function getForm() {
		var a = document.getElementById("formCategory");
		a.submit();
	}
</script>