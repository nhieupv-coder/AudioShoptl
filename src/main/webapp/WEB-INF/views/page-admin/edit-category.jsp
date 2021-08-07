<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Quản lý loại sản phẩm</h1>

	</div>
	<!-- Content Row -->
	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl col-lg">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">Quản lý loại sản
						phẩm</h6>
					${message }
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="row">
						<div class="col">
							<f:form action="/admin/category/insert" method="get"
								modelAttribute="category">
								<label for="id" class="form-label">ID Loại sản phẩm: </label>
								<f:input path="id" readonly="${st}" class="form-control" />
								<f:errors class="text-danger" path="id" />
								<br />
								<label for="name" class="form-label">Tên Loại: </label>
								<f:input type="text" path="namecategory" class="form-control" />
								<f:errors class="text-danger" path="namecategory" />
								<hr>
								<button class="btn btn-success text-white" type="submit">
									Create</button>
								<button formaction="/admin/category/update"
									class="btn btn-primary  text-white">update</button>
								<a href="/admin/category/delete/${ empty category.id ?'n':category.id }"
									class="btn btn-danger text-white"> Delete</a>
								<a href="/admin/category/reset" class="btn btn-secondary text-white">
									reset</a>
							</f:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</div>