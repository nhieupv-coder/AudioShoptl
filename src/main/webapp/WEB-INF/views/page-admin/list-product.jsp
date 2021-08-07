<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Quản lý sản phẩm</h1>

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
								phẩm</h6>
						</div>
						<div class="card-body m-0 p-0">
							<div class="row mt-3 p-2">
								<div class="col-md-4">
									<form id="filterwithcategory"
										action="/admin/listproduct/pagination?pageNo=&id=">
										<label for="">Tìm kiếm theo loại hàng:</label> <select
											onchange="send()" class="form-control"
											aria-label="Default select example" name="id">
											<c:forEach items="${categories }" var="i">
												<option value="${i.getKey()}"
													${valueC.orElse('') == i.getKey()?'selected':'' }>${i.getValue()}</option>
											</c:forEach>
										</select>
									</form>
								</div>
								<div class="col-md-8">
									<label class="p-0 m-0">Tìm kiếm theo tên: </label>
									<form action="/admin/listproduct/pagination" method="post">
										<div class="input-group pt-2">
											<input type="text" class="form-control" name="kw"
												value="${kws }" placeholder="Search term..."> <span
												class="input-group-btn"> <input type="hidden"
												name="id" value="${valueC.orElse('') }" />
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
							<c:forEach var="p" items="${pageP.content}">
								<div class="col-lg-3 col-md-6 mb-2">
									<div class="card">
										<img
											src="<c:url value='/resources/static/img/post/${p.getImage()}' />"
											class="card-img-top " height="250px">
										<div class="card-body">
											<h4>${p.nameproduct }</h4>
											<h5>
												<fmt:formatNumber value="${p.price }" />
												VND
											</h5>
											<p>Số lượng: ${p.quantity }</p>
											<a href="/admin/editproduct/edit?id=${p.id}"
												class="btn btn-outline-primary text-dark">Chỉnh sửa</a> <a
												href="/admin/editproduct/delete/d${p.id}"
												class="btn btn-outline-danger text-dark">Xóa sản phẩm</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

						<nav aria-label="Page navigation example ">
							<ul class="pagination d-flex justify-content-center">
								<li class="page-item"><a class="page-link"
									href="/admin/listproduct/pagination?pageNo=${pageP.getNumber()-1 < 0 ? 0:pageP.getNumber()-1}&id=${valueC.orElse('') }">Previous</a></li>
								<c:forEach var="i" begin="0"
									end="${pageP.totalPages-1<0?1:pageP.totalPages-1}">
									<li class="page-item ${i == pageP.getNumber()?'active':'' }""><a
										class="page-link"
										href="/admin/listproduct/pagination?id=${valueC.orElse('') }&pageNo=${i}">${i+1}</a></li>
								</c:forEach>
								<li class="page-item"><a class="page-link"
									href="/admin/listproduct/pagination?pageNo=${pageP.getNumber()+1 > pageP.getTotalPages()-1 ? pageP.getTotalPages()-1 : pageP.getNumber()+1 }&id=${valueC.orElse('') }">Next</a></li>
							</ul>
						</nav>
					</div>

				</div>

			</div>
		</div>


	</div>

</div>
<script type="text/javascript">
	function send() {
		var a = document.getElementById("filterwithcategory");
		a.submit();
	}
</script>