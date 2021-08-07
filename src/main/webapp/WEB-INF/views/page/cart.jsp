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
							Trang chủ <span>-</span>Giỏ hàng
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- breadcrumb start-->

<!--================Cart Area =================-->
<section class="cart_area padding_top">
	<div class="container">
		<div class="cart_inner">
			<div class="table-responsive">
				<h3 class="text-success text-center">${message}</h3>
				<c:if test="${empty listorder }">
					<h3 class="text-danger text-center">Không có đơn hàng nào</h3>
				</c:if>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Sản phẩm</th>
							<th scope="col">Giá</th>
							<th scope="col">Giảm giá (%)</th>
							<th scope="col">Số lượng</th>
							<th scope="col">Tổng tiền</th>
							<th scope="col">Action</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${listorder}">
							<tr>
								<td>
									<div class="media">
										<div class="d-flex">
											<img
												src="<c:url value="/resources/static/img/post/${i.product.image}"/>"
												height="120px" alt="" />
										</div>
										<div class="media-body">
											<p>${i.product.nameproduct }</p>
										</div>
									</div>
								</td>
								<td>
									<h5>
										<fmt:formatNumber value="${i.product.price }" />
										VND
									</h5>
								</td>
								<td>
									<h5>
										<fmt:formatNumber
											value="${discountDao.findByProductEquals(i.product).size() == 0 ? 0:discountDao.findByProductEquals(i.product).get(0).getPercent() }" />
										%
									</h5>
								</td>
								<td>
									<form id="form_update" action="/cart/update/${i.product.id}" method="get">
										<div class="product_count">
											<span class="input-number-decrement"> </span> <input 
												class="input-number" name="quantity" type="number" value="${i.quantity }" onblur="submitAction()"
												min="0" max="100"> <span class=""></span>
										</div>
									</form>
								</td>
								<td>
									<h5>
										<fmt:formatNumber value="${i.price*i.quantity }" />
										VND
									</h5>
								</td>
								<td><a class="btn_5" href="#">Update</a></td>
								<td><a class="btn_6" href="/cart/remove?id=${i.product.id}">Xóa
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="checkout_btn_inner float-right pb-3">
					<a class="btn_1" href="/cart/deleteall">Xóa tất cả giỏ hàng</a>
				</div>
				<form action="/cart/pay" method="post">
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label"> Địa
							chỉ giao hàng: </label> <input type="text" class="form-control"
							placeholder="Nhập vào địa chỉ bạn muốn giao hàng"
							value="${address}" name="address-delivery">
					</div>
					<div class="checkout_btn_inner float-left">
						<h3 class="text-danger">
							Tổng tiền:
							<fmt:formatNumber value="${total }" />
							VND
						</h3>
						<button class="btn_1" href="/cart/pay" type="submit">Thanh
							Toán</button>
						<a class="btn_3" href="/home/bought" type="submit">Xem các đơn
							hàng đã mua</a>
					</div>

				</form>
			</div>
		</div>
</section>
<script type="text/javascript">
function submitAction (){
	var a = document.getElementById("form_update");
	a.submit();
}
</script>
<!--================End Cart Area =================-->