<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- breadcrumb start-->
<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2 style="font-family: 'Times New Roman', Times, serif">Sản
							phẩm</h2>
						<p>
							Trang chủ <span>-</span> Sản phẩm
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- breadcrumb start-->

<!--================Category Product Area =================-->
<section class="cat_product_area section_padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="left_sidebar_area">
					<aside class="left_widgets p_filter_widgets">
						<div class="l_w_title">
							<h3>Loại hàng</h3>
						</div>
						<div class="widgets_inner">
							<ul class="list">
								<c:forEach var="category" items="${listCategory}">
									<li ><a ${idCategory == category.id ?'class="text-danger"':''} href="/product/list-category?id=${category.id }">${category.namecategory }</a>
										<span>(${category.products.size()})</span></li>
								</c:forEach>
								<li><a href="/home/product">Tất cả sản phẩm</a></li>
							</ul>
						</div>
					</aside>

					<aside class="left_widgets p_filter_widgets">
						<div class="l_w_title">
							<h3>Hãng</h3>
						</div>
						<div class="widgets_inner">
							<ul class="list">
								<li><a href="#">Sony</a></li>
								<li><a href="#">Apple</a></li>
								<li class="active"><a href="#">JBL</a></li>
								<li><a href="#">Samsung</a></li>
								<li><a href="#">Nokia</a></li>
							</ul>

						</div>
					</aside>

				</div>
			</div>
			<div class="col-lg-9">
				<div class="row">
					<div class="col-lg-12">
						<div
							class="product_top_bar d-flex justify-content-between align-items-center">
							<div class="single_product_menu">
								<p>
									Tìm thấy <span> ${page.totalElements} </span>
								</p>
							</div>
							<form id="fsort" action="/product/search-sort-pagination" method="get"
								class="row">
								<div class="single_product_menu d-flex">
									<p>Type Sort :</p>
									<select name="typesort" onchange="submitSort()">
										<option ${typesort =='ASC'?'selected':''  } value="ASC">Tăng
											Dần</option>
										<option ${typesort =='DESC'?'selected':''  } value="DESC">Giảm
											Dần</option>
									</select>
								</div>
								<div class="single_product_menu d-flex ml-3">
									<p>Short By :</p>
									<select class="pb-0" name="sortby" onchange="submitSort()">
										<option ${sortby =='nameproduct'?'selected':''  }
											value="nameproduct">Tên</option>
										<option ${sortby =='price'?'selected':''  } value="price">Giá</option>
										<option ${sortby =='quantity'?'selected':''  }
											value="quantity">Số lượng</option>
									</select>

								</div>
								<input type="hidden" name="id" value="${idCategory }" />
							</form>
							<form action="/product/search-sort-pagination" method="post">
								<div class="single_product_menu d-flex">
									<div class="input-group">
										<input type="text" value="${kw}" class="form-control" placeholder="search" name="keyworks"
											aria-describedby="inputGroupPrepend">
												<input type="hidden" value="${idCategory}" class="form-control"  name="id"
											aria-describedby="inputGroupPrepend">
										<div class="input-group-prepend">
											<span class="input-group-text" id="inputGroupPrepend"><i
												class="ti-search"></i></span>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

				<div class="row align-items-center latest_product_inner">
					<c:if test="${empty page.content }">
						<div class="container text-center text-danger">
							<b>Không có sản phẩm nào</b>
						</div>
					</c:if>
					<c:forEach var="p" items="${page.content}">
						<div class="col-lg-4 col-sm-6">
							<div class="single_product_item">
								<img
									src="<c:url value='/resources/static/img/post/${p.image }'/>"
									alt="${p.image}" />
								<div class="single_product_text">
									<h4>${p.nameproduct}</h4>
									<h3
										${discountDao.findByProductEquals(p).size() == 0?'':'class="text-muted" style="text-decoration: line-through;"' }>
										<fmt:formatNumber value="${p.price}" />
										VND
									</h3>
									<c:if test="${not empty discountDao.findByProductEquals(p) }">
										<h3>
											<fmt:formatNumber
												value="${p.price - discountDao.findByProductEquals(p).get(0).getPercent()*p.price/100 }" />
											VND
										</h3>
									</c:if>
									<a href="/home/order?id=${p.id}" class="add_cart">+ add to
										cart<i class="ti-heart"></i>
									</a>
								</div>
							</div>
						</div>
					</c:forEach>


					<div class="col-lg-12">
						<div class="pageination">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<li class="page-item"><a class="page-link"
										href="/product/search-sort-pagination?pageNo=${page.getNumber()-1 < 0 ? 0:page.getNumber()-1}&id=${idCategory }&sortby=${sortby}&typesort=${typesort}"
										aria-label="Previous"> <i class="ti-angle-double-left"></i>
									</a></li>
									<c:forEach var="i" begin="0"
										end="${page.getTotalPages()-1 < 0 ? 0:page.getTotalPages()-1  }">
										<li class="page-item"><a class="page-link"
											href="/product/search-sort-pagination?id=${idCategory }&pageNo=${i}&sortby=${sortby}&typesort=${typesort}">${i+1}</a></li>
									</c:forEach>
									<li class="page-item"><a class="page-link"
										href="/product/search-sort-pagination?pageNo=${page.getNumber()+1 > page.getTotalPages()-1 ? page.getTotalPages()-1 : page.getNumber()+1 }&id=${idCategory }&sortby=${sortby}&typesort=${typesort}"
										aria-label="Next"> <i class="ti-angle-double-right"></i>
									</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	function submitSort() {
		document.getElementById("fsort").submit();
	}
</script>