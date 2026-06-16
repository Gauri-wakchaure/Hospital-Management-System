<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us - MEDCare</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>

*{
	margin:0;
	padding:0;
	box-sizing:border-box;
	font-family:Georgia, serif;
}

body{
	background:#f8fbff;
	overflow-x:hidden;
}

/* NAVBAR */

.navbar{
	padding:20px 70px;
	background:white;
	box-shadow:0 4px 20px rgba(0,0,0,0.05);
}

.navbar-brand{
	font-size:36px;
	font-weight:bold;
	color:#0077ff !important;
}

.nav-link{
	font-size:19px;
	margin-left:25px;
	color:#222 !important;
	font-weight:500;
	transition:.3s;
}

.nav-link:hover{
	color:#0077ff !important;
}

/* CONTACT SECTION */

.contact-section{
	padding:80px 0;
}

.contact-title{
	font-size:50px;
	font-weight:bold;
	color:#111;
	margin-bottom:20px;
}

.contact-text{
	font-size:20px;
	color:#555;
	line-height:1.8;
	margin-bottom:30px;
}

.info-box{
	background:white;
	padding:25px;
	border-radius:20px;
	box-shadow:0 10px 25px rgba(0,0,0,0.08);
	margin-bottom:20px;
}

.info-box h5{
	color:#0077ff;
	font-weight:bold;
	margin-bottom:10px;
}

.contact-form{
	background:white;
	padding:35px;
	border-radius:20px;
	box-shadow:0 10px 25px rgba(0,0,0,0.08);
}

.contact-form h2{
	margin-bottom:25px;
	font-weight:bold;
}

.form-control{
	padding:14px;
	border-radius:12px;
	margin-bottom:15px;
}

.btn-send{
	background:linear-gradient(90deg,#0077ff,#00cfff);
	color:white;
	border:none;
	padding:14px;
	width:100%;
	border-radius:50px;
	font-size:18px;
	font-weight:600;
	transition:.4s;
}

.btn-send:hover{
	transform:translateY(-3px);
	box-shadow:0 15px 25px rgba(0,119,255,.25);
}

/* MAP */

.map-section{
	padding-bottom:70px;
}

iframe{
	width:100%;
	height:400px;
	border:none;
	border-radius:20px;
	box-shadow:0 10px 25px rgba(0,0,0,0.08);
}

/* FOOTER */

footer{
	background:#0077ff;
	color:white;
	text-align:center;
	padding:20px;
	font-size:17px;
}

/* MOBILE */

@media(max-width:991px){

.contact-title{
	font-size:38px;
	text-align:center;
}

.contact-text{
	text-align:center;
}

}

</style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg">

	<div class="container-fluid">

		<a class="navbar-brand" href="index">MEDCare</a>

		<button class="navbar-toggler" type="button"
			data-bs-toggle="collapse"
			data-bs-target="#navbarNav">

			<span class="navbar-toggler-icon"></span>

		</button>

		<div class="collapse navbar-collapse justify-content-end"
			id="navbarNav">

			<ul class="navbar-nav">

				<li class="nav-item">
					<a class="nav-link" href="about">About</a>
				</li>

				<li class="nav-item">
					<a class="nav-link" href="doctorLogin">Doctor Login</a>
				</li>

				<li class="nav-item">
					<a class="nav-link" href="patientLogin">Patient Login</a>
				</li>

				<li class="nav-item">
					<a class="nav-link text-primary fw-bold"
						href="contact">Contact Us</a>
				</li>

			</ul>

		</div>

	</div>

</nav>

<!-- CONTACT -->

<section class="contact-section">

	<div class="container">

		<div class="row g-5">

			<!-- LEFT -->

			<div class="col-lg-6">

				<h1 class="contact-title">Contact MEDCare</h1>

				<p class="contact-text">

					We are here to assist you with appointments,
					patient services, doctor information and
					healthcare support.

				</p>

				<div class="info-box">

					<h5>📍 Address</h5>

					<p>
						MEDCare Hospital,<br>
						Pune, Maharashtra,<br>
						India
					</p>

				</div>

				<div class="info-box">

					<h5>📞 Phone</h5>

					<p>
						+91 9876543210
					</p>

				</div>

				<div class="info-box">

					<h5>✉ Email</h5>

					<p>
						support@medcare.com
					</p>

				</div>

			</div>

			<!-- RIGHT -->

			<div class="col-lg-6">

				<div class="contact-form">

					<h2>Send Message</h2>

					<form>

						<input type="text"
							class="form-control"
							placeholder="Enter Full Name">

						<input type="email"
							class="form-control"
							placeholder="Enter Email Address">

						<input type="text"
							class="form-control"
							placeholder="Subject">

						<textarea
							class="form-control"
							rows="5"
							placeholder="Enter Your Message"></textarea>

						<button type="submit"
							class="btn-send">

							Send Message

						</button>

					</form>

				</div>

			</div>

		</div>

	</div>

</section>

<!-- GOOGLE MAP -->

<section class="map-section">

	<div class="container">

		<iframe
			src="https://maps.google.com/maps?q=pune&t=&z=13&ie=UTF8&iwloc=&output=embed">
		</iframe>

	</div>

</section>

<!-- FOOTER -->

<footer>

	© 2026 Hospital Management System |
	Developed by Gauri Wakchaure

</footer>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>