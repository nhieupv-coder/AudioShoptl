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
							Trang chủ <span>-</span> Đăng ký tài khoản
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- profile -->
<div class="container-fluid px-1 py-5 mx-auto">
	<div class="row d-flex justify-content-center">
		<div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
			<h3>Đăng ký tài khoản</h3>
			<c:if test="${not empty message }">
				<div class="alert alert-primary" role="alert">${message }</div>
			</c:if>
			<div class="card">
				<f:form class="form-card" action="/account/register" method="post"
					modelAttribute="user">
					<div class="row justify-content-between text-left">
						<div class="form-group col-sm-6 flex-column d-flex">
							<label class="form-control-label px-3">Username:<span
								class="text-danger"> *</span></label>
							<f:input type="text" id="fname" path="id" />
							<f:errors path="id" class="text-danger" />
						</div>
						<div class="form-group col-sm-6 flex-column d-flex">
							<label class="form-control-label px-3">Họ Và tên:<span
								class="text-danger"> *</span></label>
							<f:input type="text" id="lname" path="name" />
							<f:errors path="name" class="text-danger" />
						</div>
					</div>
					<div class="row justify-content-between text-left">
						<div class="form-group col-sm-6 flex-column d-flex">
							<label class="form-control-label px-3">Địa chỉ email:<span
								class="text-danger"> *</span></label>
							<f:input path="email" placeholder="" />
							<f:errors path="email" class="text-danger" />
						</div>
						<div class="form-group col-sm-6 flex-column d-flex">
							<label class="form-control-label px-3">Ngày Sinh: <span
								class="text-danger"> *</span></label>
							<f:input type="date" id="mob" path="birthDay" placeholder="" />
							<f:errors path="birthDay" class="text-danger" />
						</div>
					</div>
					<div class="row justify-content-between text-left">
						<div class="form-group col-sm-6 align-self-center">
							<label class="form-control-label px-3">Giới tính: <span
								class="text-danger"> *</span></label>
							<div class="form-check form-check-inline">
								<f:radiobuttons items="${genderselect}" path="gender"
									class="form-check-input" />
							</div>
						</div>
						<div class="form-group col-sm-6 flex-column d-flex">
							<label class="form-control-label px-3">Số điện thoại:<span
								class="text-danger"> *</span></label>
							<f:input id="lname" path="phone" />
							<f:errors path="phone" class="text-danger" />
						</div>
					</div>
					<div class="row justify-content-between text-left">
						<div class="form-group col-sm-6 flex-column d-flex">
							<label class="form-control-label px-3">Mật khẩu: <span
								class="text-danger"> *</span></label>
							<f:input type="password" id="fname" path="password" />
							<f:errors path="password" class="text-danger" />
						</div>
						<div class="form-group col-sm-6 flex-column d-flex">
							<label class="form-control-label px-3">Xác nhận mật khẩu:
								<span class="text-danger"> *</span>
							</label> <input type="password" id="lname" name="confirmpass">
							<div class="text-danger">${eVal }</div>
						</div>
					</div>
					<div class="row justify-content-between text-left">
						<div class="form-group col-12 flex-column d-flex">
							<label class="form-control-label px-3">Địa chỉ:<span
								class="text-danger"> *</span></label>
							<f:input id="ans" path="address" />
							<f:errors path="address" class="text-danger" />
						</div>
					</div>

					<div class="row justify-content-end">
						<div class="form-group col-sm-6">
							<button type="submit" class="btn-block btn-outline-success">Đăng
								ký</button>
						</div>
					</div>
				</f:form>
			</div>
		</div>
	</div>
</div>