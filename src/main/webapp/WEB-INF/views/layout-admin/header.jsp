<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div id="wrapper">

	<!-- Sidebar -->
	<ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion"
		id="accordionSidebar">

		<!-- Sidebar - Brand -->
		<a
			class="sidebar-brand d-flex align-items-center justify-content-center"
			href="index.html">
			<div class="sidebar-brand-icon rotate-n-15">
				<i class="fas fa-users-cog"></i>
			</div>
			<div class="sidebar-brand-text mx-3 text-danger">Admin Page</div>
		</a>

		<!-- Divider -->

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">Quản lý</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseTwo1"
			aria-expanded="true" aria-controls="collapseTwo1"> <i
				class="fab fa-product-hunt"></i> <span>Quản lý sản phẩm</span>
		</a>
			<div id="collapseTwo1" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Quản lý sản phẩm:</h6>
					<a class="collapse-item" href="/admin/editproduct">Chỉnh sửa</a> <a
						class="collapse-item" href="/admin/listproduct/pagination">Danh sách</a>
				</div>
			</div></li>
		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseTwo"
			aria-expanded="true" aria-controls="collapseTwo"> <i
				class="fas fa-carrot"></i> <span>Quản lý loại sản phẩm</span>
		</a>
			<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Quản lý loại sản phẩm:</h6>
					<a class="collapse-item" href="/admin/editcategory">Chỉnh sửa</a> <a
						class="collapse-item" href="/admin/listCategory">Danh sách</a>
				</div>
			</div></li>
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapsethree"
			aria-expanded="true" aria-controls="collapsethree"> <i
				class="fas fa-carrot"></i> <span>Quản lý Giảm giá</span>
		</a>
			<div id="collapsethree" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Quản lý loại Giảm giá:</h6>
					<a class="collapse-item" href="/admin/discount">Chỉnh sửa</a> <a
						class="collapse-item" href="/admin/discount/list-discount">Danh sách</a>
				</div>
			</div></li>
		<!--  -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapsefour"
			aria-expanded="true" aria-controls="collapsethree"> <i
				class="fas fa-carrot"></i> <span>Quản lý User</span>
		</a>
			<div id="collapsefour" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Quản lý User:</h6>
					<a class="collapse-item" href="/admin/edit-user">Chỉnh sửa</a> <a
						class="collapse-item" href="/admin/list-user-pagination">Danh sách</a>
				</div>
			</div></li>
		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">Thống kê</div>
		<li class="nav-item"><a class="nav-link"
			href="/admin/statitiscal/bydate"> <i
				class="fas fa-fw fa-chart-area"></i> <span>Doanh theo thời
					gian</span>
		</a></li>
		<li class="nav-item"><a class="nav-link"
			href="/admin/statistical-category"> <i
				class="fas fa-fw fa-chart-area"></i> <span>Doanh theo loại</span>
		</a></li>
		<!-- Nav Item - Pages Collapse Menu -->


		<!-- Nav Item - Charts -->


		<!-- Nav Item - Tables -->
		<li class="nav-item"><a class="nav-link" href="/home">
				<i class="fas fa-fw fa-table"></i> <span>Quay Lại trang người dùng</span>
		</a></li>

		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>



	</ul>
	<!-- End of Sidebar -->

	<!-- Content Wrapper -->
	<div id="content-wrapper">
		<!-- Main Content -->
		<div id="content">

			<!-- Topbar -->
			<nav
				class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				<!-- Sidebar Toggle (Topbar) -->
				<button id="sidebarToggleTop"
					class="btn btn-link d-md-none rounded-circle mr-3">
					<i class="fa fa-bars"></i>
				</button>

				<!-- Topbar Search -->


				<!-- Topbar Navbar -->


			</nav>
			<!-- End of Topbar -->

			<!-- Begin Page Content -->

			<!-- /.container-fluid -->

		</div>