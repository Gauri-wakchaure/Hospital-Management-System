<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Login</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background: #eef1f5;
}

.login-container {
	width: 440px;
	background: white;
	border-radius: 5px;
	overflow: hidden;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.top-section {
	background: linear-gradient(135deg, #0b1f4d, #163a72);
	color: white;
	text-align: center;
	padding: 50px 20px;
}

.top-section h1 {
	font-size: 38px;
	margin-bottom: 15px;
	font-weight: bold;
	font-family: Georgia;
}

.top-section p {
	font-size: 16px;
	font-family: Georgia;
}

.form-section {
	padding: 40px;
}

.input-box {
	position: relative;
	margin-bottom: 30px;
}

.input-box input {
	width: 100%;
	border: none;
	border-bottom: 1px solid #ccc;
	padding: 12px 40px 12px 0;
	font-size: 16px;
	outline: none;
	background: transparent;
}

.input-box i {
	position: absolute;
	right: 5px;
	top: 14px;
	color: #1f2a36;
	font-size: 18px;
}

.btn {
	width: 100%;
	padding: 15px;
	border: none;
	border-radius: 30px;
	background: linear-gradient(135deg, #0b1f4d, #163a72);
	font-size: 16px;
	cursor: pointer;
	color: white;
	font-family: Georgia;
}

.btn:hover {
	background: black;
}
</style>
</head>

<body>

	<div class="login-container">

		<div class="top-section">
			<h1>DOCTOR PANEL</h1>
			<p>Hospital Management System</p>
		</div>

		<div class="form-section">

			<form action="/doctorDashboard" method="get">
			
				<div class="input-box">
					<input type="email" name="email" placeholder="Doctor Email"
						required> <i class="fa-regular fa-user"></i>
				</div>

				<div class="input-box">
					<input type="password" name="password"
						placeholder="Doctor Password" required> <i
						class="fa-solid fa-lock"></i>
				</div>

				<button type="submit" class="btn">LOGIN →</button>

			</form>

		</div>

	</div>

</body>
</html>