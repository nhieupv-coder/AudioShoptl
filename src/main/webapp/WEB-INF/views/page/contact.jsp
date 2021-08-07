
<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2>Liên hệ</h2>
						<p>
						Trang chủ <span>-</span> Liên hệ
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- breadcrumb start-->

<!-- ================ contact section start ================= -->
<section class="contact-section padding_top">
	<div class="container">
		<div class="d-none d-sm-block mb-5 pb-4">
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3833.802446509103!2d108.167760314784!3d16.075738143533588!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314218e6e72e66f5%3A0x46619a0e2d55370a!2zMTM3IE5ndXnhu4VuIFRo4buLIFRo4bqtcCwgVGhhbmggS2jDqiBUw6J5LCBMacOqbiBDaGnhu4N1LCDEkMOgIE7hurVuZywgVmlldG5hbQ!5e0!3m2!1sen!2s!4v1621648072079!5m2!1sen!2s"
				width="1100px" height="450" style="border: 0;" allowfullscreen=""
				loading="lazy"></iframe>

		</div>


		<div class="row">
			<div class="col-12">
				<h2 class="contact-title">Gửi thông tin tới chúng tôi</h2>
			</div>
			<div class="col-lg-8">
				<form class="form-contact contact_form" action="contact_process.php"
					method="post" id="contactForm" novalidate="novalidate">
					<div class="row">
						<div class="col-12">
							<div class="form-group">

								<textarea class="form-control w-100" name="message" id="message"
									cols="30" rows="9" onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Enter Message'"
									placeholder='Enter Message'></textarea>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<input class="form-control" name="name" id="name" type="text"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Enter your name'"
									placeholder='Enter your name'>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<input class="form-control" name="email" id="email" type="email"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Enter email address'"
									placeholder='Enter email address'>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<input class="form-control" name="subject" id="subject"
									type="text" onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Enter Subject'"
									placeholder='Enter Subject'>
							</div>
						</div>
					</div>
					<div class="form-group mt-3">
						<a href="#" class="btn_3 button-contactForm">Gửi mail</a>
					</div>
				</form>
			</div>
			<div class="col-lg-4">
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-home"></i></span>
					<div class="media-body">
						<h3>137 Nguyễn Thị Thập</h3>
						<p>Trụ sở chính</p>
					</div>
				</div>
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-tablet"></i></span>
					<div class="media-body">
						<h3>0123456789</h3>
						<p>Từ thứ 2 đến thứ 7</p>
					</div>
				</div>
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-email"></i></span>
					<div class="media-body">
						<h3>support@gmail.com</h3>
						<p>Gửi email cho chúng tôi bất cứ lúc nào</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>