<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hospital Management System</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>

/* RESET */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Georgia, serif;
}

body {
	background: #f8fbff;
	overflow-x: hidden;
}

/* NAVBAR */
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
	transition: .3s;
}

.nav-link:hover {
	color: #0077ff !important;
}

/* HERO */
.hero {
	min-height: 90vh;
	display: flex;
	align-items: center;
	padding: 40px 80px;
}

.hero-content h1 {
	font-size: 40px;
	font-weight: 700;
	color: #111;
	font-family: Georgia, serif;
}

.hero-content p {
	font-size: 23px;
	color: #555;
	margin-top: 25px;
}

.btn-main {
	background: linear-gradient(90deg, #0077ff, #00cfff);
	color: white;
	padding: 16px 45px;
	border: none;
	border-radius: 50px;
	font-size: 19px;
	font-weight: 600;
	margin-top: 30px;
	transition: .4s;
}

.btn-main:hover {
	transform: translateY(-4px);
	box-shadow: 0 15px 25px rgba(0, 119, 255, .25);
}

/* RIGHT IMAGE */
.hero-img img {
	width: 100%;
	max-width: 700px;
	border-radius: 25px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.12);
	transition: 0.5s ease;
	cursor: pointer;
}

.hero-img img:hover {
	transform: scale(1.05) translateY(-10px);
	box-shadow: 0 30px 60px rgba(0, 119, 255, 0.25);
}

/* FOOTER */
footer {
	background: #0077ff;
	color: white;
	text-align: center;
	padding: 20px;
	font-size: 17px;
}

/* MOBILE */
@media ( max-width :991px) {
	.hero {
		padding: 50px 25px;
		text-align: center;
	}
	.hero-content h1 {
		font-size: 42px;
	}
	.hero-content p {
		font-size: 18px;
		margin: auto;
	}
	.hero-img {
		margin-top: 40px;
	}
}
</style>

</head>

<body>

	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-lg">

		<div class="container-fluid">

			<a class="navbar-brand" href="#">MEDCare</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">

				<ul class="navbar-nav">

					<li class="nav-item"><a class="nav-link" href="about">About</a>
					</li>

					<li class="nav-item"><a class="nav-link" href="doctorLogin">Doctor
							Login</a></li>

					<li class="nav-item"><a class="nav-link" href="patientLogin">Patient
							Login</a></li>

					<li class="nav-item"><a class="nav-link" href="contact">Contact
							Us</a></li>

				</ul>

			</div>

		</div>

	</nav>

	<!-- HERO -->
	<section class="hero">

		<div class="container">
			<div class="row align-items-center">

				<!-- LEFT CONTENT -->
				<div class="col-lg-6 hero-content">

					<h1>
						Good Health is not a Goal,<br> it’s a Lifestyle Upgrade
					</h1>

					<p>Take control of your health journey with smart, simple, and
						accessible healthcare solutions. We connect patients and doctors
						seamlessly to ensure faster care, better management, and improved
						well-being in one unified platform.</p>

					<button class="btn-main">Explore More</button>

				</div>

				<!-- RIGHT IMAGE -->
				<div class="col-lg-6 text-center hero-img">

					<img
						src="https://img.freepik.com/free-photo/young-doctor-standing-with-folder-hands-hospital_1303-21199.jpg"
						alt="Doctor Holding File">

				</div>

			</div>
		</div>

	</section>

	<!-- FOOTER -->
	<footer> © 2026 Hospital Management System | Developed by
		Gauri Wakchaure </footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>