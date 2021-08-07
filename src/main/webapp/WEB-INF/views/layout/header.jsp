<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="main_menu home_menu">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-12">
				<nav class="navbar navbar-expand-lg navbar-light">
					<a class="navbar-brand" href="/home">
						<h2 style="font-weight: bolder">Audio Market</h2>
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="menu_icon"><i class="fas fa-bars"></i></span>
					</button>

					<div class="collapse navbar-collapse main-menu-item"
						id="navbarSupportedContent">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" href="/home">Trang
									chủ</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/home/product">Sản phẩm</a></li>
							<li class="nav-item"><a class="nav-link" href="/home">Giới
									thiệu</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/home/contact">Liên hệ</a></li>
							<c:if test="${Admin}">
								<li class="nav-item"><a class="nav-link"
									href="/admin/editproduct">Admin</a></li>
							</c:if>
							<li class="nav-item dropdown no-arrow"><a
								class="nav-link dropdown-toggle" href="#" id="userDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <span
									class="mr-2 d-none d-lg-inline text-gray-600 small">${userLogin.getName()}
										<i class="fas fa-user-circle"></i>
								</span>
							</a> <!-- Dropdown - User Information --> 
									<div
										class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
										aria-labelledby="userDropdown">
									<c:if test="${isLogin }">
										<a class="dropdown-item" href="/home/profile"> <i
											class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
											Profile
										</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="/home/logout"> <i
											class="fas fa-sign-out-alt mr-2 text-gray-400"></i> Đăng Xuất
										</a>
									</c:if>
									<c:if test="${!isLogin}">
									
									<a class="dropdown-item" href="/home/register"
										data-target="#logoutModal"> <i
										class="fas fa-user-plus mr-2 text-gray-400"></i> Đăng Ký
									</a>
									<a class="dropdown-item" href="/account/login"
										data-target="#logoutModal"> <i
										class="fas fa-sign-in-alt mr-2 text-gray-400"></i> Đăng Nhập
									</a>
									<a class="dropdown-item" href="/home/retrivepassword"
										data-target="#logoutModal"> <i
										class="fas fa-key fa-fw mr-2 text-gray-400"></i> Quên Mật Khẩu
									</a>
								</c:if></li>
						</ul>
					</div>
					<div class="hearer_icon d-flex">
						<a id="search_1" href="javascript:void(0)"><i
							class="ti-search"></i></a>
						<div class="dropdown cart">
							<a class="dropdown-toggle" id="navbarDropdown3" role="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <a href="/home/cart"
								class="fas fa-cart-plus"></a>
							</a>
							<!-- <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <div class="single_product">
    
                                    </div>
                                </div> -->

						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<div class="search_input" id="search_input_box">
		<div class="container ">
			<form class="d-flex justify-content-between search-inner">
				<input type="text" class="form-control" id="search_input"
					placeholder="Search Here">
				<button type="submit" class="btn"></button>
				<span class="ti-close" id="close_search" title="Close Search"></span>
			</form>
		</div>
	</div>
</header>