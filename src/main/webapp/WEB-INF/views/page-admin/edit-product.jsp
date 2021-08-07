<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Quản lý sản phẩm</h1>

	</div>
	<!-- Content Row -->
	<div class="row">
		<!-- Area Chart -->
		<div class="col-xl col-lg">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">Quản lý sản phẩm</h6>
					${message }
				
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<f:form modelAttribute="product" method="post"
						enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-3">
								<img src="<c:url value='/resources/static/img/post/${img}'/>"
									class="p-2 m-2 img-thumbnail" alt="">
								<div class="input-group mb-3">
									<form id="formImg" action="/admin/editproduct/uploadImage"
										enctype="multipart/form-data" method="post">
										<input type="file" name="img">
									</form>
								</div>
							</div>
							<div class="col-md-9">

								<label for="id" class="form-label">ID Sản phẩm: </label>
								<f:input type="text" path="id" class="form-control" readonly="${readonly }"
									aria-describedby="id" />
								<f:errors path="id" class="text-danger" />
								</br> <label for="name" class="form-label">Tên Sản phẩm: </label>
								<f:input type="text" path="nameproduct" class="form-control" />
								<f:errors path="nameproduct" class="text-danger" />
								</br> <label for="name" class="form-label">Loại sản phẩm: </label>
								<f:select path="category.id" class="form-control">
									<f:options items="${categories}" />
								</f:select>
								<label for="name" class="form-label">Giá: </label>
								<f:input path="price" type="text" id="name" class="form-control" />
								<f:errors path="price" class="text-danger" />
								</br> <label for="name" class="form-label">Số lượng: </label>
								<f:input type="number" path="quantity" class="form-control"
									aria-describedby="passwordHelpBlock" />
								<f:errors path="quantity" class="text-danger" />
								</br> <label for="name" class="form-label">Mô tả: </label>
								<f:textarea class="form-control" path="description"
									style="height: 100px" />
								<f:errors path="description" class="text-danger" />
								</br>
								<f:input type="hidden" path="image" value="${img}" />
								<hr>

								<button class="btn btn-success text-white"
									formaction="/admin/editproduct/add">Create</button>
								<button class="btn btn-primary text-white"
									formaction="/admin/editproduct/update">update</button>
								<a class="btn btn-danger text-white"
									href="/admin/editproduct/delete/${ empty product.id ?'n':product.id}"> Delete</a> <a
									class="btn btn-secondary text-white"
									href="/admin/editproduct/reset"> reset</a>

							</div>
						</div>
					</f:form>
				</div>
			</div>
		</div>
	</div>
</div>
