<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2 style="font-family: 'Times New Roman', Times, serif">Profile</h2>
						<p>
							Trang chủ <span>-</span> Profile
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- profile -->

<div class="container light-style flex-grow-1 container-p-y">

	<h4 class="font-weight-bold py-3 mb-4"></h4>

	<div class="card overflow-hidden">
		<div class="row no-gutters row-bordered row-border-light">
			<div class="col-md-3 pt-0">
				<div class="list-group list-group-flush account-settings-links">
					<a class="list-group-item list-group-item-action ${show?'active':'' }"
						data-toggle="list" href="#account-general">Profile</a> <a
						class="list-group-item list-group-item-action ${show?'':'active'}" data-toggle="list"
						href="#account-change-password">Đổi mật khẩu</a>
					<c:if test="${not empty message}">
						<div class="alert alert-primary" role="alert">${message}</div>
					</c:if>
				</div>
			</div>
			<div class="col-md-9">
				<div class="tab-content">
					<div class="tab-pane fade ${show?'active show':'' }" id="account-general">
						<f:form action="/account/update-profile" method="post"
							enctype="multipart/form-data" modelAttribute="user">
							<div class="card-body media align-items-center">
							 <img src='<c:url value='/resources/static/img/post/${user.photo}'/>'
                                    class="d-block ui-w-80 rounded-circle">
                                <div class="media-body ml-4">
                                    <label class="btn btn-outline-primary">
                                        <input name="image" type="file">
                                    </label> &nbsp;
                                    <div class="text-light small mt-1">Allowed JPG, GIF or PNG. Max size of 800K</div>
                                </div>
								
							</div>
							<hr class="border-light m-0">

							<div class="card-body">
								<div class="form-group">
									<label class="form-label">Username</label>
									<f:input path="id" class="form-control mb-1" readonly="true" />
									<f:errors path="id" class="text-danger" />
								</div>
								<f:input path="password" type="hidden" />
								<div class="form-group">
									<label class="form-label">Họ Và Tên:</label>
									<f:input path="name" class="form-control" />
									<f:errors path="name" class="text-danger" />
								</div>
								<div class="form-group">
									<label class="form-label">E-mail</label>
									<f:input path="email" class="form-control mb-1" />
									<f:errors path="email" class="text-danger" />
								</div>
								<div class="form-group">
									<label class="form-label">Giới tính:</label> <br>
									<f:radiobuttons items="${genderselect}" path="gender"
										delimiter=" " />
									<f:errors path="gender" class="text-danger" />
								</div>
								<div class="form-group">
									<label class="form-label">Điện thoại:</label>
									<f:input path="phone" type="text" class="form-control" />
									<f:errors path="phone" class="text-danger" />
								</div>
								<div class="form-group">
									<label class="form-label">Ngày Sinh:</label>
									<f:input type="date" path="birthDay" name="bir"
										class="form-control" />
									<f:errors path="birthDay" class="text-danger" />
								</div>
								<div class="form-group">
									<label class="form-label">Địa chỉ:</label>
									<f:input path="address" class="form-control" />
									<f:errors path="address" class="text-danger" />
								</div>
								<button type="submit" class="btn btn-outline-success">Update</button>
								&nbsp; <a type="button" class="btn btn-default"
									href="/account/profile/cancel">Cancel</a>
							</div>
						</f:form>
					</div>
					<div class="tab-pane fade ${show?'':'active show' }" id="account-change-password">
						<div class="card-body pb-2">
							<f:form action="/account/change-password" method="post">
								<div class="form-group">
									<label class="form-label">Mật Khẩu Cũ: </label> <input
										type="password" name="olderpassword" class="form-control">
									<div class="text-danger">${error1 }</div>
								</div>
								<input type="hidden" name="username" value="${user.id}" />
								<div class="form-group">
									<label class="form-label">Mật khẩu mới:</label> <input
										type="password" name="newpassword" class="form-control">
									<div class="text-danger">${error2 }</div>
								</div>

								<div class="form-group">
									<label class="form-label">Xác nhận mật khẩu:</label> <input
										type="password" name="confirmpassword" class="form-control">
									<div class="text-danger">${error3}</div>
								</div>
								<button  type="submit"
									class="btn btn-outline-success">Save</button>
							&nbsp;
							<button type="button" class="btn btn-default">Cancel</button>
							</f:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="text-right mt-3"></div>

</div>
