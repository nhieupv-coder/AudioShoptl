<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Admin Page</title>

<!-- Custom fonts for this template-->
<link href="<c:url value='/resources/static/css/all.min.css' />" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<c:url value='/resources/static/css/sb-admin-2.min.css' />" rel="stylesheet">
<style type="text/css">
.table .avatar {
    border-radius: 50%;
    vertical-align: middle;
    margin-right: 10px;
    height: 48px;
}
</style>
</head>

<body id="page-top">

	<tiles:insertAttribute name="header" />

	<tiles:insertAttribute name="body" />

	<tiles:insertAttribute name="footer" />
	
	
	<!-- Bootstrap core JavaScript-->
	<script src="<c:url value='/resources/static/js/jquery.min.js' />"></script>
	<script src="<c:url value='/resources/static/js/bootstrap.bundle.min.js' />"></script>

	<!-- Core plugin JavaScript-->
	<!-- <script src="vendor/jquery-easing/jquery.easing.min.js"></script> -->

	<!-- Custom scripts for all pages-->
	<script src="<c:url value='/resources/static/js/sb-admin-2.min.js' />"></script>
	<!-- Page level plugins -->



</body>

</html>