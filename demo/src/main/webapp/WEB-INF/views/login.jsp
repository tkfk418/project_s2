<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <title>Login</title>
    <!-- Bootstrap core CSS -->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Additional CSS Files -->
    <link rel="stylesheet"  href="../resources/assets/css/fontawesome.css">
    <link rel="stylesheet"  href="../resources/assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet"  href="../resources/assets/css/owl.css">
    <link rel="stylesheet"  href="../resources/assets/css/animate.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
</head>
<style>
  body{
    background-color: #2D2D2D;
  }
    .intro-section {
    background-image: url("../resources/assets/images/login2.png");
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    float: left;
    padding: 75px 95px;
    min-height: 100vh;
    display: -webkit-box;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
            flex-direction: column;
    color: #FFFFFF; }
    @media (max-width: 991px) {
        .intro-section {
        padding-left: 50px;
        padding-right: 50px; } }
    @media (max-width: 767px) {
        .intro-section {
        padding: 28px; } }
    @media (max-width: 575px) {
        .intro-section {
        min-height: auto; } }
    .brand-wrapper .logo {
    height: 35px; }
    @media (max-width: 767px) {
    .brand-wrapper {
        margin-bottom: 35px; } }
    .intro-content-wrapper {
    width: 410px;
    max-width: 100%;
    margin-top: auto;
    margin-bottom: auto; }
    .intro-content-wrapper .intro-title {
        font-size: 40px;
        font-weight: bold;
        margin-bottom: 17px; }
    .intro-content-wrapper .intro-text {
        font-size: 19px;
        line-height: 1.37; }
    @media (max-width: 767px) {
    .intro-section-footer {
        margin-top: 35px; } }
    .intro-section-footer .footer-nav a {
    font-size: 20px;
    font-weight: bold;}
    @media (max-width: 767px) {
        .intro-section-footer .footer-nav a {
        font-size: 14px; } }
    .intro-section-footer .footer-nav a + a {
        margin-left: 30px; }
    .form-section {
    display: -webkit-box;
    display: flex;
    float: right;
    -webkit-box-align: center;
            align-items: center;
    -webkit-box-pack: center;
            justify-content: center; }
    @media (max-width: 767px) {
        .form-section {
        padding: 5px; } }
    .login-wrapper {
    width: 300px;
    max-width: 100%; }
    @media (max-width: 575px) {
        .login-wrapper {
        width: 100%; } }
    .login-wrapper .form-control {
        border: 0;
        border-bottom: 1px solid #DE87F1;
        border-radius: 0;
        background-color: #2D2D2D;
        font-size: 14px;
        color: #DE87F1;
        font-weight: bold;
        padding: 15px 10px;
        margin-bottom: 7px; }
        .login-wrapper .form-control::-webkit-input-placeholder {
        color: #DE87F1; }
        .login-wrapper .form-control::-moz-placeholder {
        color: #DE87F1; }
        .login-wrapper .form-control:-ms-input-placeholder {
        color: #DE87F1; }
        .login-wrapper .form-control::-ms-input-placeholder {
        color: #DE87F1; }
        .login-wrapper .form-control::placeholder {
        color: #DE87F1; }
    .login-title {
    font-size: 30px;
    font-weight: bold;
    margin-bottom: 30px; }
    .login-btn {
    padding: 13px 30px;
    background-color: rgb(195, 132, 237);
    border-radius: 0;
    font-size: 20px;
    font-weight: bold;
    color: rgb(232, 250, 183); }
    .login-btn:hover {
        border: 1px solid rgb(105, 128, 229);
        background-color: transparent;
        color: rgb(105, 128, 229); }
    .forgot-password-link {
    font-size: 14px;
    color: #FFFFFD;
    text-decoration: underline; }
    .social-login-title {
    font-size: 15px;
    color: #FFFFFF;
    display: -webkit-box;
    display: flex;
    margin-bottom: 23px; }
    .social-login-title::before, .social-login-title::after {
        content: "";
        background-image: -webkit-gradient(linear, left top, left bottom, from(#F4F4F4), to(#F4F4F4));
        background-image: linear-gradient(#F4F4F4, #F4F4F4);
        -webkit-box-flex: 1;
                flex-grow: 1;
        background-size: calc(100% - 20px) 1px;
        background-repeat: no-repeat; }
    .social-login-title::before {
        background-position: center left; }
    .social-login-title::after {
        background-position: center right; }
    .social-login-links {
    text-align: center;
    margin-bottom: 32px; }
    .social-login-link img {
    width: 40px;
    height: 40px;
    -o-object-fit: contain;
        object-fit: contain; }
    .social-login-link + .socia-login-link {
    margin-left: 16px; }
    .login-wrapper-footer-text {
    font-size: 14px;
    text-align: center;
    color: #FFFFFF;}
    .footer-nav {
    padding: 13px 25px;
    text-align: center;
    font-size: 25px;
    font-weight: bold;
    color: white; }
    .footer-nav:hover {
        border: 1px solid rgb(105, 128, 229);
        background-color: transparent;
        color: rgb(105, 128, 229); }
</style>
<body>
    <div class="container-fluid">
        <div class="row">
          <div class="col-sm-6 col-md-7 intro-section">
            <div class="brand-wrapper">
              <h1></h1>
            </div>
            <div class="intro-content-wrapper">
              <h1 class="intro-title"></h1>
            </div>
            <div class="intro-section-footer">
            </div>
          </div>
          <div class="col-sm-6 col-md-5 form-section">
            <div class="login-wrapper">
              <h2 class="login-title">Sign in</h2>
              <form action="#!">
                <div class="form-group">
                  <label for="id" class="sr-only">ID</label>
                  <input type="id" name="id" id="id" class="form-control" placeholder="id">
                </div>
                <div class="form-group mb-3">
                  <label for="password" class="sr-only">Password</label>
                  <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                </div>
                <div class="d-flex justify-content-between align-items-center mb-5">
                  <input name="login" id="login" class="btn login-btn" type="button" value="Login">
                  <a href="#!" class="forgot-password-link">Find Password</a>
                </div>
                <p class="login-wrapper-footer-text">Need an account? <a href="#!" class="text-reset">Signup here</a></p>
              </form>
              <div class="footer-nav">
                <div id="naver_id_login" style="text-align:center"><a href="${url}">
                  <img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    <!-- Scripts -->
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="../resources/assets/js/isotope.min.js"></script>
    <script src="../resources/assets/js/owl-carousel.js"></script>
    <script src="../resources/assets/js/tabs.js"></script>
    <script src="../resources/assets/js/popup.js"></script>
    <script src="../resources/assets/js/custom.js"></script>
</body>
</html>