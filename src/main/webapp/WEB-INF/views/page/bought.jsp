<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- breadcrumb start-->
<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2>Giỏ hàng</h2>
						<p>
							Giỏ Hàng<span>-</span>Đơn Hàng Đã Mua
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- breadcrumb start-->
<!-- Button trigger modal -->
<!-- Modal -->
<!--================Cart Area =================-->
<section class="cart_area padding_top">
	<div class="container">
		<div class="cart_inner">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Ngày mua</th>
							<th></th>
							<th></th>
							<th>Địa chỉ giao</th>
							<th scope="col"></th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${listorder }">
							<tr>
								<td><fmt:formatDate value="${i.datepurchase }"
										pattern="dd/MM/yyyy" /></td>
								<td></td>
								<td></td>
								<td>${i.address }</td>
								<td></td>
								<td><a class="btn_5" href="#" data-bs-toggle="modal"
									data-bs-target="#exampleModal${i.id}">View Detail</a>
									<div class="modal fade" id="exampleModal${i.id}" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Xem Chi
														tiêt</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close">
														<i class="far fa-window-close"></i>
													</button>
												</div>
												<div class="modal-body">
													<table class="table table-default">
														<thead class="thead-inverse">
															<tr>
																<th>Ảnh MH</th>
																<th>Tên sản phẩm</th>
																<th>Số lượng</th>
																<th>Giá</th>
																<th>Tổng Tiền</th>
															</tr>
														</thead>
														<c:set var="total" value="${0}"/>
														<tbody>
															<c:forEach var="c" items="${i.listProductOrder }">
															<c:set var="total" value="${total + c.price *c.quantity}" />
																<tr>
																	<td><img
																		src="<c:url value="/resources/static/img/post/${c.product.image}"/>"
																		class="img-fluid" height="50px" alt="" /></td>
																	<td>${c.product.nameproduct}</td>
																	<td>${c.quantity}</td>
																	<td><fmt:formatNumber value=" ${c.price}" />VND</td>
																	<td><fmt:formatNumber
																			value=" ${c.price *c.quantity }" />VND</td>
																</tr>
															</c:forEach>

														</tbody>
													</table>
												</div>
												<div class="modal-footer"><h5 class="text-bolder">Tổng Tiền:&ensp;</h2><fmt:formatNumber value="${total }"/> VND</div>
											</div>
										</div>
									</div></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
				
			</div>
		</div>
</section>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<!--================End Cart Area =================-->