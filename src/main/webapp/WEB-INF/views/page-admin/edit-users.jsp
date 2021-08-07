<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Quản lý User</h1>

	</div>
	<!-- Content Row -->
	<div class="row">
		<!-- Area Chart -->
		<div class="col-xl col-lg">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">Quản lý User</h6>
					${message }

				</div>
				<!-- Card Body -->
				<div class="card-body">
					<f:form modelAttribute="user" method="post"
						enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-3">
								<img src="<c:url value='/resources/static/img/post/${empty user.photo ?"default.png":user.photo}'/>"
									class="p-2 m-2 img-thumbnail" alt="">
								<div class="input-group mb-3">								
										<input type="file" name="img">
								</div>
							</div>
							<div class="col-md-9">
								<label class="form-label">Username</label>
								<f:input path="id" class="form-control mb-1"/>
								<f:errors path="id" class="text-danger" />
								</br> <label for="name" class="form-label">Password: </label>
								<f:password path="password" class="form-control" />
								<f:errors path="password" class="text-danger" />
								</br> <label class="form-label">Họ Và Tên:</label>
								<f:input path="name" class="form-control" />
								<f:errors path="name" class="text-danger" />
								</br> <label class="form-label">E-mail</label>
								<f:input path="email" class="form-control mb-1" />
								<f:errors path="email" class="text-danger" />
								</br> <label class="form-label">Giới tính:</label> <br>
								<f:radiobuttons items="${genderselect}" path="gender"
									delimiter=" " />
								<f:errors path="gender" class="text-danger" />
								</br> <label class="form-label">Điện thoại:</label>
								<f:input path="phone" type="text" class="form-control" />
								<f:errors path="phone" class="text-danger" />
								</br> <label class="form-label">Ngày Sinh:</label>
								<f:input type="date" path="birthDay" name="bir"
									class="form-control" />
								<f:errors path="birthDay" class="text-danger" />
								<f:input type="hidden" path="photo" value="${img}" />
								<br /> <label class="form-label">Địa chỉ:</label>
								<f:input path="address" class="form-control" />
								<f:errors path="address" class="text-danger" /><br />
								<label class="form-label">Role:</label> <br>
								<f:radiobuttons items="${role}" path="admin"
									delimiter=" " />
								<f:errors path="admin" class="text-danger" /><br />
								<label class="form-label">Status:</label> <br>
								<f:radiobuttons items="${status}" path="actived"
									delimiter=" " />
								<f:errors path="actived" class="text-danger" />
								<hr>

								<button class="btn btn-success text-white"
									formaction="/admin/user/create">Create</button>
								<button class="btn btn-primary text-white"
									formaction="/admin/user/update">update</button>
								<a class="btn btn-danger text-white"
									href="/admin/user/delete?=${user.id }">
									Delete</a> <a class="btn btn-secondary text-white"
									href="/admin/user/reset"> reset</a>

							</div>
						</div>
					</f:form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function submitSearch() {
		var a = document.getElementById("formSubmit");
		a.submit();
	}
</script>