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
						<h2>Sản phẩm chi tiết</h2>
						<p>
							Trang chủ <span>-</span> Mặt hàng
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- breadcrumb start-->
<!--================End Home Banner Area =================-->

<!--================Single Product Area =================-->
<div class="product_image_area section_padding">
	<div class="container">
		<div class="row s_product_inner justify-content-between">
			<div class="col-lg-7 col-xl-7">
				<div class="product_slider_img">
					<div id="vertical">
						<div
							data-thumb="<c:url value="/resources/static/img/post/${product.image }"/>">
							<img
								src="<c:url value="/resources/static/img/post/${product.image }"/>" />
						</div>

					</div>
				</div>
			</div>
			<div class="col-lg-5 col-xl-4">
				<div class="s_product_text">
					<h5>
						previous <span>|</span> next
					</h5>
					<h3>${product.nameproduct }</h3>
					<h2
						${discountDao.findByProductEquals(product).size() == 0?'':'class="text-muted" style="text-decoration: line-through;"' }>
						<fmt:formatNumber value="${product.price }" />
						VND
					</h2>
					<c:if test="${not empty discountDao.findByProductEquals(product) }">
						<h2>
							<fmt:formatNumber
								value="${product.price - discountDao.findByProductEquals(product).get(0).getPercent()*product.price/100 }" />
							VND
						</h2>
					</c:if>
					<ul class="list">
						<li><a class="active" href="/product/category"> <span>Loại
									hàng</span> : ${product.category.namecategory }
						</a></li>
						<li><a href="#"> <span>Số lượng</span> :
								${product.quantity }
						</a></li>
					</ul>
					<p>
						<span>Mô tả:</span> ${product.description }
					</p>
					<form action="/product/addtocart" method="post">
						<div
							class="card_area d-flex justify-content-between align-items-center">
							<div class="product_count">
								<span class="inumber-decrement"> <i class="ti-minus"></i></span>
								<input type="hidden" name="idproduct" value="${product.id}" />
								<input class="input-number" type="text" value="1" min="0"
									name="amount" max="10"> <span class="number-increment">
									<i class="ti-plus"></i>
								</span>
							</div>
							<button type="submit" class="btn_3 " style="border: 10px;">add
								to cart</button>
							<a href="#" class="like_us"> <i class="ti-heart"></i>
							</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!--================End Single Product Area =================-->
