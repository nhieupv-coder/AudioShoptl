<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <section class="login_part padding_top">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_text text-center">
                        <div class="login_part_text_iner">
                            <h2>Lần đầu tiên bạn tới shop</h2>
                            <p>Vui lòng tạo tài khoản để có thể sử dụng đầy đủ các chức năng của chúng tôi</p>
                            <a href="/home/register" class="btn_3">tạo tài khoản</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
              <h3 class="text-center" style="color: red;"><i>${error}</i></h3>
                    <div class="login_part_form">
                        <div class="login_part_form_iner">
                            <h3>Welcome Back ! <br>
                              Vui lòng đăng nhập</h3>
                              <h4 class="text-danger text-center">${message}</h4>
                            <form class="row contact_form" action="/account/login" method="post" novalidate="novalidate">
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="name" name="username" value=""
                                        placeholder="Username">
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <input type="password" class="form-control"  name="password" 
                                        placeholder="Password">
                                </div>
                                <div class="col-md-12 form-group">
                                    <div class="creat_account d-flex align-items-center">
                                        <input type="checkbox" id="f-option" value="true" name="remember">
                                        <label for="f-option">Remember me</label>
                                    </div>
                                    <button type="submit"  class="btn_3">
                                        log in
                                    </button>
                                    <a class="lost_pass" href="/home/retrivepassword">forget password?</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>