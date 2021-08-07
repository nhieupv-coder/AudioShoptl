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
							<h6 class="m-0 font-weight-bold text-primary">Quản lý giảm
								gía</h6>
						</div>
						<div class="card-body m-0 p-0">
							<div class="row mt-3 p-2">
								<div class="col-md-4">
									<label for="">Chọn sản phẩm giảm giá:</label>
									<form id="formP" action="/admin/discount/loadProduct" method="get">
										<select class="form-control"
											aria-label="Default select example" name="idproduct"
											onchange="submit()">
											<c:forEach var="i" items="${listProduct}">
												<option value="${i.id}"
													${i.id == product.id ? 'selected':''}>${i.id}-${i.nameproduct}</option>
											</c:forEach>
										</select>
									</form>
								</div>
								<form class="d-flex justify-content-center" action="/admin/discount/add-or-update" method="get">
									<div class="col-md-8">
										<label class="p-0 m-0">Nhập số % muốn giảm: </label>
										<div class="input-group pt-2">
										<div >
											<input type="hidden" value="${product.id}" name="idproduct" />
											<input type="number" min="1" step="0.1" max="100" style="width: 100px" class="form-control"
												name="percent" placeholder="Nhập số">
											<button type="submit" class="btn btn-success mt-2">Áp
												dụng</button>
												</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<hr />
						<div class="row m-4">
							<div class="col-md-8">
								<table class="table table-bordered" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th scope="col">Tên hàng hóa</th>
											<th scope="col">Giá</th>
											<th scope="col">Số lượng</th>
										</tr>
									</thead>
									<tbody>
										<input type="hidden" name="idproduct" value="${product.id}" />
										<tr>
											<td>${product.nameproduct }</td>
											<td>${product.price}VND</td>
											<td><input type="number" readonly="readonly"
												class="form-control" name="percents"
												value="${product.quantity}"></td>
										</tr>


									</tbody>
								</table>
							</div>
							<div class="col-md-4">
								<table class="table table-bordered" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th scope="col">Trạng thái</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td scope="col">Giảm giá: ${percent} %</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function submit() {
		document.getElementById("formP").submit();
	}
</script>
