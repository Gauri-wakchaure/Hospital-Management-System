<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - MEDCare</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Georgia, serif;
}

body {
	background: #f8fbff;
}

.navbar {
	padding: 20px 70px;
	background: white;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
}

.navbar-brand {
	font-size: 36px;
	font-weight: bold;
	color: #0077ff !important;
}

.nav-link {
	font-size: 19px;
	margin-left: 25px;
	color: #222 !important;
	font-weight: 500;
}

.nav-link:hover {
	color: #0077ff !important;
}

.about-section {
	padding: 80px 0;
}

.about-img img {
	width: 100%;
	border-radius: 25px;
	box-shadow: 0 20px 40px rgba(0,0,0,0.1);
}

.about-content h1 {
	font-size: 48px;
	font-weight: bold;
	margin-bottom: 20px;
}

.about-content p {
	font-size: 20px;
	line-height: 1.8;
	color: #555;
}

.card-box {
	background: white;
	padding: 30px;
	border-radius: 20px;
	box-shadow: 0 10px 25px rgba(0,0,0,0.08);
	text-align: center;
	height: 100%;
}

.card-box h3 {
	color: #0077ff;
	margin-bottom: 15px;
}

.stats {
	padding: 60px 0;
	background: white;
}

.stats h2 {
	color: #0077ff;
	font-size: 45px;
	font-weight: bold;
}

footer {
	background: #0077ff;
	color: white;
	text-align: center;
	padding: 20px;
	font-size: 17px;
}
</style>
</head>

<body>

<nav class="navbar navbar-expand-lg">

	<div class="container-fluid">

		<a class="navbar-brand" href="index">MEDCare</a>

		<button class="navbar-toggler" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarNav">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse justify-content-end"
			id="navbarNav">

			<ul class="navbar-nav">

				<li class="nav-item">
					<a class="nav-link text-primary fw-bold" href="about">About</a>
				</li>

				<li class="nav-item">
					<a class="nav-link" href="doctorLogin">Doctor Login</a>
				</li>

				<li class="nav-item">
					<a class="nav-link" href="patientLogin">Patient Login</a>
				</li>

				<li class="nav-item">
					<a class="nav-link" href="contact">Contact Us</a>
				</li>

			</ul>

		</div>

	</div>

</nav>

<section class="about-section">

	<div class="container">

		<div class="row align-items-center">

			<div class="col-lg-6 about-content">

				<h1>About MEDCare</h1>

				<p>
					MEDCare is an advanced Hospital Management System that
					connects patients, doctors and administrators on a single
					digital platform.
				</p>

				<p>
					Our system simplifies appointment booking, patient record
					management, doctor scheduling and healthcare operations.
				</p>

			</div>

			<div class="col-lg-6 about-img">

				<img
					src="https://img.freepik.com/free-photo/group-doctors-standing-hospital-corridor_1303-21202.jpg">

			</div>

		</div>

	</div>

</section>

<section class="container pb-5">

	<div class="row g-4">

		<div class="col-md-6">

			<div class="card-box">

				<h3>Our Mission</h3>

				<p>
					To provide efficient and technology-driven healthcare
					solutions that improve patient care.
				</p>

			</div>

		</div>

		<div class="col-md-6">

			<div class="card-box">

				<h3>Our Vision</h3>

				<p>
					To become a trusted healthcare platform connecting hospitals,
					doctors and patients worldwide.
				</p>

			</div>

		</div>

	</div>

</section>

<section class="stats">

	<div class="container">

		<div class="row text-center">

			<div class="col-md-3">
				<h2>500+</h2>
				<h5>Doctors</h5>
			</div>

			<div class="col-md-3">
				<h2>10K+</h2>
				<h5>Patients</h5>
			</div>

			<div class="col-md-3">
				<h2>50+</h2>
				<h5>Hospitals</h5>
			</div>

			<div class="col-md-3">
				<h2>24/7</h2>
				<h5>Support</h5>
			</div>

		</div>

	</div>

</section>

<footer>
	© 2026 Hospital Management System | Developed by Gauri Wakchaure
</footer>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>