<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<section class="banner_part">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-12">
				<div class="banner_slider owl-carousel">
					<div class="single_banner_slider">
						<div class="row">
							<div class="col-lg-5 col-md-8">
								<div class="banner_text">
									<div class="banner_text_iner">
										<h1>Tai nghe DareU EH722s 7.1 Multi Led</h1>
										<p>Tai nghe mang lại âm thanh sống động, âm bass cực lớn,
											trang bị microphone</p>
										<a href="#" class="btn_2">Mua ngay</a>
									</div>
								</div>
							</div>
							<div class="banner_img d-none d-lg-block">
								<img src="<c:url value='/resources/static/img/banner/bn1.png'/>"
									alt="" />

							</div>
						</div>
					</div>
					<div class="single_banner_slider">
						<div class="row">
							<div class="col-lg-5 col-md-8">
								<div class="banner_text">
									<div class="banner_text_iner">
										<h1>Tai nghe DAREU EH925S RGB PRO</h1>
										<p>Tai nghe gamming mang lại cảm giác tuyệt vời chơ người
											nghe, trang bị dãy led sống động kem theo microphone</p>
										<a href="#" class="btn_2">Mua ngay</a>
									</div>
								</div>
							</div>
							<div class="banner_img d-none d-lg-block">
								<img src="<c:url value='/resources/static/img/banner/bn2.png'/>"
									alt="">
							</div>
						</div>
					</div>
					<div class="single_banner_slider">
						<div class="row">
							<div class="col-lg-5 col-md-8">
								<div class="banner_text">
									<div class="banner_text_iner">
										<h1>Tai Nghe Bluetooth Soundcore Space</h1>
										<p>Tai nghe Bluetooth cho bạn cảm giác thoải mái không cần
											lo lắng đến việc dây</p>
										<a href="#" class="btn_2">Mua ngay</a>
									</div>
								</div>
							</div>
							<div class="banner_img d-none d-lg-block">
								<img src="<c:url value='/resources/static/img/banner/bn3.png'/>"
									alt="">
							</div>
						</div>
					</div>
				</div>
				<div class="slider-counter"></div>
			</div>
		</div>
	</div>
</section>
<!-- banner part start-->

<!-- upcoming_event part start-->

<!-- product_list start-->
<section class="product_list section_padding"
	style="padding-bottom: 10px">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="section_tittle text-center">
					<h2>Top sản phẩm Giảm gía</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="product_list_slider owl-carousel">
					<div class="single_product_list_slider">
						<div class="row align-items-center ">
							<c:forEach var="i" items="${pageDiscount.content }">
								<div class="col-lg-3 col-sm-6">
									<div class="single_product_item">
										<img
											src="<c:url value='/resources/static/img/post/${i.product.image }'/>"
											alt="">
										<div class="single_product_text">
											<h4>${i.product.nameproduct }</h4>
											<h3 class="text-muted" style="text-decoration: line-through;">
												<fmt:formatNumber value="${i.product.price }" />
												VND
											</h3>

											<h3>
												<fmt:formatNumber
													value="${i.product.price - (i.product.price*i.percent)/100}" />
												VND
											</h3>
											<a href="/home/order?id=${i.product.id}" class="add_cart">+
												add to cart<i class="ti-heart"></i>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- product_list part start-->
<section class="product_list best_seller section_padding">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="section_tittle text-center">
					<h2>Sản phẩm bán chạy</h2>
				</div>
			</div>
		</div>
		<div class="row align-items-center ">
			<div class="col-lg-12">
				<div class="best_product_slider owl-carousel">
					<c:forEach var="i" items="${topProduct }">
						<div class="single_product_item">
							<img
								src="<c:url value='/resources/static/img/post/${i.product.image }'/>"
								alt="">
							<div class="single_product_text">
							<a href="/home/order?id=${i.product.id }">	<h4>${i.product.nameproduct }</h4></a>
								<h3><fmt:formatNumber value="${i.product.price }"/> VND</h3>
							<p class="text-danger">Số lượng đã bán: ${i.quantity }</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- product_list part end-->

<!-- subscribe_area part start-->

