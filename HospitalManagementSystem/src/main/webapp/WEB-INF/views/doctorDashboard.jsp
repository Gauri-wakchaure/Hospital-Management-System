<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Dashboard</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
	margin: 0;
	font-family: Arial;
	display: flex;
	background: #f4f6f9;
}

/* Sidebar */
.sidebar {
	width: 250px;
	height: 100vh;
	background: #0b1f4d;
	color: white;
	position: fixed;
	overflow: auto;
}

.logo {
	text-align: center;
	padding: 20px;
	font-size: 22px;
	font-family: Georgia;
	font-weight: bold;
	border-bottom: 1px solid rgba(255, 255, 255, .2);
}

.sidebar a {
	display: flex;
	align-items: center;
	gap: 12px;
	padding: 14px;
	color: white;
	text-decoration: none;
	font-family: Georgia;
	transition: .3s;
}

.sidebar a:hover {
	background: #102f70;
	padding-left: 20px;
}

.dropdown-content {
	display: none;
	padding-left: 25px;
	background: #102542;
}

.dropdown-content a {
	font-size: 15px;
}

/* Main */
.main {
	margin-left: 250px;
	width: 100%;
	padding: 25px;
}

/* Topbar */
.topbar {
	height: 70px;
	background: white;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 30px;
	border-radius: 12px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, .08);
	margin-bottom: 25px;
}

.admin-info {
	font-size: 20px;
	font-weight: bold;
	font-family: Georgia;
	color: #0b1f4d;
}

/* Cards */
.cards {
	display: grid;
	grid-template-columns: repeat(3, minmax(280px, 1fr));
	gap: 30px;
}

.card {
	background: #0b1f4d;
	color: white;
	padding: 35px;
	border-radius: 16px;
	text-align: center;
	box-shadow: 0 10px 25px rgba(0, 0, 0, .3);
	transition: .4s;
}

.card:hover {
	transform: translateY(-10px);
	background: #163a72;
	box-shadow: 0 20px 35px rgba(59, 130, 246, .25);
}

.card i {
	font-size: 35px;
	margin-bottom: 15px;
}

.card h2 {
	font-size: 42px;
	margin: 10px 0;
}

.card p {
	font-size: 18px;
	font-family: Georgia;
}

/* Sections */
.section {
	display: none;
}

.active {
	display: block;
}

.form-box {
	width: 100%;
	padding: 14px;
	border: 1px solid #dcdcdc;
	border-radius: 10px;
	margin-top: 8px;
	font-size: 15px;
	outline: none;
	transition: .3s;
}

.form-box:focus {
	border-color: #0b1f4d;
	box-shadow: 0 0 8px rgba(11, 31, 77, .15);
}

label {
	font-family: Georgia;
	font-weight: bold;
	color: #0b1f4d;
}

.save-btn {
	margin-top: 25px;
	background: #0b1f4d;
	color: white;
	padding: 14px 35px;
	border: none;
	border-radius: 12px;
	font-size: 16px;
	cursor: pointer;
	transition: .3s;
}

.save-btn:hover {
	background: #163a72;
	transform: translateY(-3px);
}

.appointment-modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.55);
	backdrop-filter: blur(5px);
	justify-content: center;
	align-items: center;
	z-index: 9999;
	animation: fadeIn .3s ease;
}

.appointment-box {
	width: 90%;
	max-width: 1200px;
	background: white;
	border-radius: 18px;
	overflow: hidden;
	box-shadow: 0 18px 40px rgba(0, 0, 0, 0.25);
	animation: slideUp .35s ease;
}

.appointment-header {
	background: linear-gradient(135deg, #0b1f4d, #16397d);
	color: white;
	padding: 22px 30px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.appointment-header h2 {
	margin: 0;
	font-family: Georgia;
	font-size: 28px;
}

.appointment-header span {
	cursor: pointer;
	font-size: 24px;
}

.table-wrapper {
	max-height: 500px;
	overflow: auto;
}

.appointment-table {
	width: 100%;
	border-collapse: collapse;
}

.appointment-table th {
	background: #f5f8ff;
	color: #0b1f4d;
	padding: 16px;
	font-weight: bold;
}

.appointment-table td {
	padding: 16px;
	text-align: center;
	border-bottom: 1px solid #eee;
}

.appointment-table tr:hover {
	background: #f9fbff;
}

.approve-btn, .decline-btn {
	text-decoration: none;
	padding: 8px 14px;
	border-radius: 8px;
	color: white;
	font-size: 13px;
	font-weight: bold;
}

.approve-btn {
	background: #28a745;
}

.approve-btn:hover {
	background: #1f8a37;
}

.decline-btn {
	background: #dc3545;
	margin-left: 6px;
}

.decline-btn:hover {
	background: #b52a37;
}

.modal-footer {
	text-align: right;
	padding: 20px;
	background: #fafafa;
}

.modal-footer button {
	background: #0b1f4d;
	color: white;
	border: none;
	padding: 10px 18px;
	border-radius: 8px;
	cursor: pointer;
}

.modal-footer button:hover {
	background: #16397d;
}

@
keyframes slideUp {from { transform:translateY(40px);
	opacity: 0;
}

to {
	transform: translateY(0);
	opacity: 1;
}

}
@
keyframes fadeIn {
	from {opacity: 0;
}

to {
	opacity: 1;
}
}
</style>

<script>

function showSection(id){

    document.querySelectorAll('.section')
    .forEach(s => s.classList.remove('active'));

    let target = document.getElementById(id);

    if(target){
        target.classList.add('active');
        localStorage.setItem("activeSection", id);
    } else {
        console.error("Section not found: " + id);
    }
}

function toggleDropdown(id){

    let x = document.getElementById(id);

    if(!x) return;

    if(x.style.display === "block"){
        x.style.display = "none";
    } else {
        x.style.display = "block";
    }
}

window.onload = function(){

    let section = localStorage.getItem("activeSection");

    if(section){
        showSection(section);
    } else {
        showSection("dashboard");
    }
};


/* =========================
   APPOINTMENT MODAL
========================= */
function openAppointmentModal(doctorName){

	fetch('${pageContext.request.contextPath}/doctorAppointments/' + encodeURIComponent(doctorName.trim()))

	.then(response => response.json())

	.then(data => {

	console.log(data);

	const tbody = document.getElementById("appointmentBody");

	tbody.innerHTML = "";

	if(data.length === 0){

	tbody.innerHTML =
	"<tr><td colspan='7'>No Appointments Found</td></tr>";

	}else{

	data.forEach(function(a){

	let row = "<tr>"
	+ "<td>" + a.patientName + "</td>"
	+ "<td>" + a.address + "</td>"
	+ "<td>" + a.age + "</td>"
	+ "<td>" + a.problem + "</td>"
	+ "<td>" + a.appointmentDate + "</td>"
	+ "<td>" + a.appointmentTime + "</td>"
	+ "<td>"
	+ "<a href='/approveAppointment/" + a.id + "' class='approve-btn'>Approve</a> "
	+ "<a href='/declineAppointment/" + a.id + "' class='decline-btn'>Decline</a>"
	+ "</td>"
	+ "</tr>";

	tbody.innerHTML += row;

	});

	}

	document.getElementById("appointmentModal").style.display="flex";

	})

	.catch(function(error){

	console.log(error);
	alert("Loading Failed");

	});

	}
	
function closeAppointmentModal(){
    document.getElementById("appointmentModal").style.display = "none";
}
</script>
</head>
<body>

	<div class="sidebar">

		<div class="logo">Hospital Panel</div>

		<a href="javascript:void(0)" onclick="showSection('dashboard')"> <i
			class="fas fa-chart-line"></i> Dashboard
		</a> <a onclick="toggleDropdown('patients')"> <i
			class="fas fa-user-injured"></i> Patients
		</a>

		<div id="patients" class="dropdown-content">
			<a onclick="showSection('addPatient')"> <i
				class="fas fa-plus-circle"></i> Add Patient
			</a> <a onclick="showSection('viewPatient')"> <i class="fas fa-list"></i>
				View Patients
			</a> <a onclick="showSection('managePatient')"> <i
				class="fas fa-edit"></i> Manage Patients
			</a>
		</div>

		<a onclick="toggleDropdown('employee')"> <i class="fas fa-users"></i>
			Employee
		</a>

		<div id="employee" class="dropdown-content">
			<a onclick="showSection('addEmployee')"> <i
				class="fas fa-user-plus"></i> Add Employee
			</a> <a onclick="showSection('viewEmployee')"> <i class="fas fa-list"></i>
				View Employees
			</a> <a onclick="showSection('manageEmployee')"> <i
				class="fas fa-edit"></i> Manage Employees
			</a>
		</div>

		<a onclick="toggleDropdown('doctor')"> <i
			class="fas fa-user-doctor"></i> Doctor
		</a>

		<div id="doctor" class="dropdown-content">
			<a onclick="showSection('addDoctor')"> <i class="fas fa-plus"></i>
				Add Doctor
			</a> <a onclick="showSection('viewDoctor')"> <i class="fas fa-list"></i>
				View Doctors
			</a> <a onclick="showSection('manageDoctor')"> <i class="fas fa-edit"></i>
				Manage Doctors
			</a>
		</div>

		<a onclick="toggleDropdown('pharmacy')"> <i
			class="fas fa-capsules"></i> Pharmacy
		</a>

		<div id="pharmacy" class="dropdown-content">
			<a onclick="showSection('addCategory')"> <i
				class="fas fa-plus-circle"></i> Add Pharma Category
			</a> <a onclick="showSection('viewCategory')"> <i class="fas fa-list"></i>
				View Pharma Categories
			</a> <a onclick="showSection('addSupplier')"> <i class="fas fa-truck"></i>
				Add Suppliers
			</a> <a onclick="showSection('viewSupplier')"> <i
				class="fas fa-truck"></i> View Suppliers
			</a> <a onclick="showSection('addMedicine')"> <i class="fas fa-pills"></i>
				Add Pharmaceutical
			</a> <a onclick="showSection('viewMedicine')"> <i
				class="fas fa-capsules"></i> View Pharmaceuticals
			</a>
		</div>

		<a onclick="showSection('addPrescription')"> <i
			class="fas fa-file-medical"></i> Add Prescription
		</a> 
		
	</div>

	<div class="main">

		<div class="topbar">
			<div class="admin-info">Welcome Doctor</div>
		</div>

		<!-- Dashboard -->
		<div id="dashboard" class="section active">

			<div class="cards">

				<div class="card">
					<i class="fas fa-bed"></i>
					<h2>${patients.size()}</h2>
					<p>Total Patients</p>
				</div>

				<div class="card">
					<i class="fas fa-users"></i>
					<h2>${employees.size()}</h2>
					<p>Total Employees</p>
				</div>

				<div class="card">
					<i class="fas fa-user-doctor"></i>
					<h2>${doctors.size()}</h2>
					<p>Total Doctors</p>
				</div>

				<div class="card">
					<i class="fas fa-pills"></i>
					<h2>${categories.size()}</h2>
					<p>Total Pharmacy Categories</p>
				</div>

				<div class="card">
					<i class="fas fa-truck"></i>
					<h2>${suppliers.size()}</h2>
					<p>Total Suppliers</p>
				</div>

				<div class="card">
					<i class="fas fa-capsules"></i>
					<h2>${medicines.size()}</h2>
					<p>Total Pharmaceuticals</p>
				</div>

			</div>
		</div>

		<!-- Add Patients -->

		<div id="addPatient" class="section">

			<div
				style="background: white; padding: 35px; border-radius: 18px; box-shadow: 0 8px 25px rgba(0, 0, 0, .08); max-width: 1000px;">

				<h2
					style="font-family: Georgia; color: #0b1f4d; margin-bottom: 25px;">
					<i class="fas fa-user-plus"></i> Add New Patient
				</h2>

				<form action="/savePatient" method="post">

					<div
						style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px;">

						<div>
							<label>Patient Name</label> <input type="text" name="name"
								required class="form-box">
						</div>

						<div>
							<label>Address</label> <input type="text" name="address" required
								class="form-box">
						</div>

						<div>
							<label>Age</label> <input type="number" name="age" required
								class="form-box">
						</div>

						<div>
							<label>Birth Date</label> <input type="date" name="birthDate"
								required class="form-box">
						</div>

						<div>
							<label>Disease</label> <input type="text" name="disease" required
								class="form-box">
						</div>

						<div>
							<label>Mobile Number</label> <input type="text" name="mobile"
								required class="form-box">
						</div>

						<div>
							<label>Email</label> <input type="email" name="email" required
								class="form-box">
						</div>

						<div>
							<label>Password</label> <input type="password" name="password"
								required class="form-box">
						</div>

						<div>
							<label>Patient Type</label> <select name="patientType"
								class="form-box">
								<option>INPATIENT</option>
								<option>OUTPATIENT</option>
							</select>
						</div>

					</div>

					<button type="submit" class="save-btn">
						<i class="fas fa-save"></i> Save Patient
					</button>

				</form>

			</div>

		</div>

		<!-- View Patient -->

		<div id="viewPatient" class="section">

			<h2
				style="font-family: Georgia; color: #0b1f4d; margin-bottom: 20px;">
				Patient List</h2>

			<table
				style="width: 100%; border-collapse: collapse; background: white; box-shadow: 0 8px 20px rgba(0, 0, 0, .1);">

				<thead>
					<tr style="background: #0b1f4d; color: white; height: 50px;">
						<th>ID</th>
						<th>Name</th>
						<th>Address</th>
						<th>Age</th>
						<th>Birth Date</th>
						<th>Disease</th>
						<th>Mobile</th>
						<th>Email</th>
						<th>Password</th>
						<th>Type</th>
					</tr>
				</thead>

				<tbody>

					<c:forEach items="${patients}" var="p">

						<tr
							style="text-align: center; height: 50px; border-bottom: 1px solid #ddd;">
							<td><c:out value="${p.id}" /></td>
							<td><c:out value="${p.name}" /></td>
							<td><c:out value="${p.address}" /></td>
							<td><c:out value="${p.age}" /></td>
							<td><c:out value="${p.birthDate}" /></td>
							<td><c:out value="${p.disease}" /></td>
							<td><c:out value="${p.mobile}" /></td>
							<td><c:out value="${p.email}" /></td>
							<td><c:out value="${p.password}" /></td>
							<td><c:out value="${p.patientType}" /></td>
						</tr>

					</c:forEach>

				</tbody>
			</table>

		</div>

		<!-- Manage Patients -->

		<div id="managePatient" class="section">

			<h2
				style="font-family: Georgia; color: #0b1f4d; margin-bottom: 20px;">
				Manage Patient</h2>

			<table
				style="width: 100%; border-collapse: collapse; background: white; box-shadow: 0 8px 20px rgba(0, 0, 0, .1); border-radius: 10px; overflow: hidden;">

				<thead>
					<tr
						style="background: #0b1f4d; color: white; height: 55px; font-family: Georgia; font-size: 16px; text-align: center;">
						<th>ID</th>
						<th>Name</th>
						<th>Address</th>
						<th>Age</th>
						<th>Birth Date</th>
						<th>Disease</th>
						<th>Mobile</th>
						<th>Email</th>
						<th>Password</th>
						<th>Type</th>
						<th>Action</th>
					</tr>
				</thead>

				<tbody>

					<c:forEach items="${patients}" var="p">

						<tr
							style="text-align: center; height: 55px; border-bottom: 1px solid #ddd; background: white;">

							<td><c:out value="${p.id}" /></td>
							<td><c:out value="${p.name}" /></td>
							<td><c:out value="${p.address}" /></td>
							<td><c:out value="${p.age}" /></td>
							<td><c:out value="${p.birthDate}" /></td>
							<td><c:out value="${p.disease}" /></td>
							<td><c:out value="${p.mobile}" /></td>
							<td><c:out value="${p.email}" /></td>
							<td><c:out value="${p.password}" /></td>
							<td><c:out value="${p.patientType}" /></td>

							<td><a href="/editPatient/${p.id}"
								style="background: #0b1f4d; color: white; padding: 10px 18px; border-radius: 8px; text-decoration: none; font-family: Georgia; font-weight: bold; display: inline-block; box-shadow: 0 4px 10px rgba(0, 0, 0, .2);">
									<i class="fas fa-edit"></i> Edit
							</a></td>

						</tr>

					</c:forEach>

				</tbody>

			</table>

		</div>

		<!--- Add Employee--->

		<div id="addEmployee" class="section">

			<div
				style="background: white; padding: 35px; border-radius: 18px; box-shadow: 0 8px 25px rgba(0, 0, 0, .08); max-width: 1000px;">

				<h2
					style="font-family: Georgia; color: #0b1f4d; margin-bottom: 25px;">
					<i class="fas fa-user-plus"></i> Add Employee
				</h2>

				<form action="saveEmployee" method="post">

					<div
						style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px;">

						<div>
							<label>Employee Name</label> <input type="text" name="name"
								class="form-box" required>
						</div>

						<div>
							<label>Email</label> <input type="email" name="email"
								class="form-box" required>
						</div>

						<div>
							<label>Password</label> <input type="password" name="password"
								class="form-box" required>
						</div>

						<div>
							<label>Department</label> <select name="department"
								class="form-box" required>

								<option value="CARDIOLOGY">Cardiology</option>
								<option value="NEUROLOGY">Neurology</option>
								<option value="ORTHOPEDICS">Orthopedics</option>
								<option value="PEDIATRICS">Pediatrics</option>
								<option value="GYNECOLOGY">Gynecology</option>
								<option value="ENT">ENT</option>
								<option value="SKIN">Skin Department</option>
								<option value="EYE">Eye Department</option>
								<option value="ICU">ICU</option>
								<option value="RADIOLOGY">Radiology</option>
								<option value="SURGERY">Surgery</option>
								<option value="EMERGENCY">Emergency</option>
								<option value="LABORATORY">Laboratory</option>
								<option value="PHARMACY">Pharmacy</option>
								<option value="GENERAL">General Medicine</option>

							</select>
						</div>

					</div>

					<button type="submit" class="save-btn">
						<i class="fas fa-save"></i> Save Employee
					</button>

				</form>

			</div>
		</div>

		<!--- View Employees--->

		<div id="viewEmployee" class="section">

			<h2
				style="font-family: Georgia; color: #0b1f4d; margin-bottom: 20px;">
				Employee List</h2>

			<table
				style="width: 100%; border-collapse: collapse; background: white; box-shadow: 0 8px 20px rgba(0, 0, 0, .1);">

				<thead>
					<tr style="background: #0b1f4d; color: white; height: 50px;">
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Password</th>
						<th>Department</th>
					</tr>
				</thead>

				<tbody>

					<c:forEach items="${employees}" var="e">

						<tr
							style="text-align: center; height: 50px; border-bottom: 1px solid #ddd;">
							<td>${e.id}</td>
							<td>${e.name}</td>
							<td>${e.email}</td>
							<td>${e.password}</td>
							<td>${e.department}</td>
						</tr>

					</c:forEach>

				</tbody>
			</table>

		</div>

		<!-- Manage Employees -->

		<div id="manageEmployee" class="section">

			<h2
				style="font-family: Georgia; color: #0b1f4d; margin-bottom: 20px;">
				Manage Employee</h2>

			<table
				style="width: 100%; border-collapse: collapse; background: white; box-shadow: 0 8px 20px rgba(0, 0, 0, .1);">

				<thead>
					<tr style="background: #0b1f4d; color: white; height: 50px;">
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Password</th>
						<th>Department</th>
						<th>Action</th>
					</tr>
				</thead>

				<tbody>

					<c:forEach items="${employees}" var="e">

						<tr
							style="text-align: center; height: 50px; border-bottom: 1px solid #ddd;">

							<td>${e.id}</td>
							<td>${e.name}</td>
							<td>${e.email}</td>
							<td>${e.password}</td>
							<td>${e.department}</td>

							<td><a href="editEmployee/${e.id}"
								style="background: #0b1f4d; color: white; padding: 8px 16px; border-radius: 6px; text-decoration: none; font-family: Georgia; font-weight: bold;">
									<i class="fas fa-edit"></i> Edit
							</a></td>

						</tr>

					</c:forEach>

				</tbody>

			</table>

		</div>

		<!-- Add Doctor -->

		<div id="addDoctor" class="section">

			<div
				style="background: white; padding: 35px; border-radius: 18px; box-shadow: 0 8px 25px rgba(0, 0, 0, .08); max-width: 1000px;">

				<h2
					style="font-family: Georgia; color: #0b1f4d; margin-bottom: 25px;">
					<i class="fas fa-user-md"></i> Add New Doctor
				</h2>

				<form action="/saveDoctor" method="post">

					<div
						style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px;">

						<div>
							<label>Doctor Name</label> <input type="text" name="name"
								required class="form-box">
						</div>

						<div>
							<label>Email</label> <input type="email" name="email" required
								class="form-box">
						</div>

						<div style="grid-column: span 2;">
							<label>Department</label> <select name="department"
								class="form-box" required>

								<option value="CARDIOLOGY">Cardiology</option>
								<option value="NEUROLOGY">Neurology</option>
								<option value="ORTHOPEDICS">Orthopedics</option>
								<option value="PEDIATRICS">Pediatrics</option>
								<option value="GYNECOLOGY">Gynecology</option>
								<option value="ENT">ENT</option>
								<option value="SKIN">Skin Department</option>
								<option value="EYE">Eye Department</option>
								<option value="ICU">ICU</option>
								<option value="RADIOLOGY">Radiology</option>
								<option value="SURGERY">Surgery</option>
								<option value="EMERGENCY">Emergency</option>
								<option value="LABORATORY">Laboratory</option>
								<option value="PHARMACY">Pharmacy</option>
								<option value="GENERAL">General Medicine</option>

							</select>
						</div>

					</div>

					<button type="submit" class="save-btn">
						<i class="fas fa-save"></i> Save Doctor
					</button>

				</form>

			</div>
		</div>


		<!-- View Doctors -->

		<div id="viewDoctor" class="section">

			<h2
				style="font-family: Georgia; color: #0b1f4d; margin-bottom: 20px;">
				Doctor List</h2>

			<table
				style="width: 100%; border-collapse: collapse; background: white; box-shadow: 0 8px 20px rgba(0, 0, 0, .1);">

				<thead>
					<tr style="background: #0b1f4d; color: white; height: 50px;">
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Department</th>
					</tr>
				</thead>

				<tbody>

					<c:forEach items="${doctors}" var="d">

						<tr
							style="text-align: center; height: 50px; border-bottom: 1px solid #ddd;">
							<td><c:out value="${d.id}" /></td>
							<td><c:out value="${d.name}" /></td>
							<td><c:out value="${d.email}" /></td>
							<td><c:out value="${d.department}" /></td>
						</tr>

					</c:forEach>

				</tbody>
			</table>

		</div>

		<!-- Manage Doctors -->

		<div id="manageDoctor" class="section">

			<h2
				style="font-family: Georgia; color: #0b1f4d; margin-bottom: 20px;">
				Manage Doctor</h2>

			<table
				style="width: 100%; border-collapse: collapse; background: white; box-shadow: 0 8px 20px rgba(0, 0, 0, .1);">

				<thead>
					<tr
						style="background: #0b1f4d; color: white; height: 55px; text-align: center;">

						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Department</th>
						<th>Edit</th>
						<th>Appointments</th>

					</tr>
				</thead>

				<tbody>

					<c:forEach items="${doctors}" var="d">

						<tr
							style="text-align: center; height: 55px; border-bottom: 1px solid #ddd;">

							<td><c:out value="${d.id}" /></td>
							<td><c:out value="${d.name}" /></td>
							<td><c:out value="${d.email}" /></td>
							<td><c:out value="${d.department}" /></td>

							<!-- Edit Button -->
							<td><a href="/editDoctor/${d.id}"
								style="background: #0b1f4d; color: white; padding: 10px 16px; border-radius: 10px; text-decoration: none; font-family: Georgia; font-weight: bold; box-shadow: 0 6px 14px rgba(0, 0, 0, .15);">

									<i class="fas fa-edit"></i> Edit
							</a></td>

							<!-- Appointment Button -->
							<td>
								<button onclick="openAppointmentModal('${d.name}')"
									style="background: linear-gradient(135deg, #2e7d32, #43a047); color: white; border: none; padding: 10px 18px; border-radius: 10px; cursor: pointer; font-family: Georgia; font-size: 14px; font-weight: bold; box-shadow: 0 6px 14px rgba(0, 0, 0, .15); transition: .3s;"
									onmouseover="this.style.transform='translateY(-3px)'"
									onmouseout="this.style.transform='translateY(0)'">

									<i class="fas fa-calendar-check"></i> View Appointments

								</button>
							</td>

						</tr>

					</c:forEach>

				</tbody>

			</table>

		</div>

		<!-- Appointment Modal -->
		<div id="appointmentModal" class="appointment-modal">

			<div class="appointment-box">

				<!-- Header -->
				<div class="appointment-header">
					<h2>Appointment Requests</h2>
					<span onclick="closeAppointmentModal()">✖</span>
				</div>

				<!-- Table -->
				<div class="table-wrapper">

					<table class="appointment-table">

						<thead>
							<tr>
								<th>Patient</th>
								<th>Address</th>
								<th>Age</th>
								<th>Problem</th>
								<th>Date</th>
								<th>Time</th>
								<th>Action</th>
							</tr>
						</thead>

						<tbody id="appointmentBody">

						</tbody>
					</table>

				</div>

				<!-- Footer -->
				<div class="modal-footer">
					<button onclick="closeAppointmentModal()">Close</button>
				</div>

			</div>

		</div>
		<!-- Add Pharma Category -->

		<div id="addCategory" class="section">

			<div
				style="background: white; padding: 35px; border-radius: 18px; box-shadow: 0 8px 25px rgba(0, 0, 0, .08); max-width: 1000px;">

				<h2
					style="font-family: Georgia; color: #0b1f4d; margin-bottom: 25px;">
					<i class="fas fa-capsules"></i> Add Pharma Category
				</h2>

				<form action="/saveCategory" method="post">

					<div
						style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px;">

						<div>
							<label>Category ID</label> <input type="number" name="id"
								class="form-box" required>
						</div>

						<div>
							<label>Pharma Name</label> <input type="text" name="pharmaName"
								class="form-box" required>
						</div>

						<div style="grid-column: span 2;">
							<label>Description</label> <input type="text" name="description"
								class="form-box" required>
						</div>

						<div>
							<label>Status</label> <select name="status" class="form-box"
								required>
								<option value="ACTIVE">Active</option>
								<option value="INACTIVE">Inactive</option>
							</select>
						</div>

					</div>

					<button type="submit" class="save-btn">
						<i class="fas fa-save"></i> Save Category
					</button>

				</form>

			</div>

		</div>

		<!-- View Pharma Categories -->

		<div id="viewCategory" class="section">

			<h2
				style="font-family: Georgia; color: #0b1f4d; margin-bottom: 20px;">
				Pharma Category List</h2>

			<table
				style="width: 100%; border-collapse: collapse; background: white; box-shadow: 0 8px 20px rgba(0, 0, 0, .1);">

				<thead>
					<tr style="background: #0b1f4d; color: white; height: 50px;">
						<th>ID</th>
						<th>Pharma Name</th>
						<th>Description</th>
						<th>Status</th>
					</tr>
				</thead>

				<tbody>

					<c:forEach items="${categories}" var="c">

						<tr
							style="text-align: center; height: 50px; border-bottom: 1px solid #ddd;">
							<td>${c.id}</td>
							<td>${c.pharmaName}</td>
							<td>${c.description}</td>
							<td>${c.status}</td>
						</tr>

					</c:forEach>

				</tbody>

			</table>

		</div>

		<!-- Add Supplier -->

		<div id="addSupplier" class="section">

			<div
				style="background: white; padding: 35px; border-radius: 18px; box-shadow: 0 8px 25px rgba(0, 0, 0, .08); max-width: 1000px;">

				<h2
					style="font-family: Georgia; color: #0b1f4d; margin-bottom: 25px;">
					<i class="fas fa-truck"></i> Add Supplier
				</h2>

				<form action="/saveSupplier" method="post">

					<div
						style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px;">

						<div>
							<label>Supplier ID</label> <input type="number" name="id"
								class="form-box" required>
						</div>

						<div>
							<label>Supplier Name</label> <input type="text"
								name="supplierName" class="form-box" required>
						</div>

						<div>
							<label>Contact Number</label> <input type="text" name="contact"
								class="form-box" required>
						</div>

						<div>
							<label>Address</label> <input type="text" name="address"
								class="form-box" required>
						</div>

						<div>
							<label>Status</label> <select name="status" class="form-box"
								required>
								<option value="ACTIVE">Active</option>
								<option value="INACTIVE">Inactive</option>
							</select>
						</div>

					</div>

					<button type="submit" class="save-btn">
						<i class="fas fa-save"></i> Save Supplier
					</button>

				</form>

			</div>

		</div>


		<!-- View Suppliers -->

		<div id="viewSupplier" class="section">

			<h2
				style="font-family: Georgia; color: #0b1f4d; margin-bottom: 20px;">
				Supplier List</h2>

			<table
				style="width: 100%; border-collapse: collapse; background: white; box-shadow: 0 8px 20px rgba(0, 0, 0, .1);">

				<thead>
					<tr style="background: #0b1f4d; color: white; height: 50px;">
						<th>ID</th>
						<th>Supplier Name</th>
						<th>Contact</th>
						<th>Address</th>
						<th>Status</th>
					</tr>
				</thead>

				<tbody>

					<c:forEach items="${suppliers}" var="s">

						<tr
							style="text-align: center; height: 50px; border-bottom: 1px solid #ddd;">
							<td>${s.id}</td>
							<td>${s.supplierName}</td>
							<td>${s.contact}</td>
							<td>${s.address}</td>
							<td>${s.status}</td>
						</tr>

					</c:forEach>

				</tbody>

			</table>

		</div>

		<!-- Add Medicines -->

		<div id="addMedicine" class="section">

			<div
				style="background: white; padding: 35px; border-radius: 18px; box-shadow: 0 8px 25px rgba(0, 0, 0, .08); max-width: 1000px;">

				<h2
					style="font-family: Georgia; color: #0b1f4d; margin-bottom: 25px;">
					<i class="fas fa-pills"></i> Add Pharmaceutical
				</h2>

				<form action="/saveMedicine" method="post">

					<div
						style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px;">

						<div>
							<label>Medicine ID</label> <input type="number" name="id"
								class="form-box" required>
						</div>

						<div>
							<label>Medicine Name</label> <input type="text"
								name="medicineName" class="form-box" required>
						</div>

						<div>
							<label>Supplier Name</label> <input type="text"
								name="supplierName" class="form-box" required>
						</div>

						<div>
							<label>Stock Quantity</label> <input type="number" name="stock"
								class="form-box" required>
						</div>

						<div style="grid-column: span 2;">
							<label>Description</label> <input type="text" name="description"
								class="form-box" required>
						</div>

						<div>
							<label>Status</label> <select name="status" class="form-box"
								required>
								<option value="ACTIVE">Active</option>
								<option value="INACTIVE">Inactive</option>
							</select>
						</div>

					</div>

					<button type="submit" class="save-btn">
						<i class="fas fa-save"></i> Save Medicine
					</button>

				</form>

			</div>

		</div>

		<!-- View Medicines -->

		<div id="viewMedicine" class="section">

			<h2
				style="font-family: Georgia; color: #0b1f4d; margin-bottom: 20px;">
				Pharmaceutical List</h2>

			<table
				style="width: 100%; border-collapse: collapse; background: white; box-shadow: 0 8px 20px rgba(0, 0, 0, .1);">

				<thead>
					<tr style="background: #0b1f4d; color: white; height: 50px;">
						<th>ID</th>
						<th>Medicine Name</th>
						<th>Supplier Name</th>
						<th>Stock</th>
						<th>Description</th>
						<th>Status</th>
					</tr>
				</thead>

				<tbody>

					<c:forEach items="${medicines}" var="m">

						<tr
							style="text-align: center; height: 50px; border-bottom: 1px solid #ddd;">
							<td>${m.id}</td>
							<td>${m.medicineName}</td>
							<td>${m.supplierName}</td>
							<td>${m.stock}</td>
							<td>${m.description}</td>
							<td>${m.status}</td>
						</tr>

					</c:forEach>

				</tbody>

			</table>

		</div>

		<!-- Add Prescription -->

		<div id="addPrescription" class="section">

			<div
				style="background: white; padding: 35px; border-radius: 18px; box-shadow: 0 8px 25px rgba(0, 0, 0, .08); max-width: 1000px;">

				<h2
					style="font-family: Georgia; color: #0b1f4d; margin-bottom: 25px;">
					<i class="fas fa-file-medical"></i> Add Prescription
				</h2>

				<form action="/savePrescription" method="post">

					<p>Patient Name</p>
					<input type="text" name="patientName" class="form-box" required>

					<p>Doctor Name</p>
					<input type="text" name="doctorName" class="form-box" required>

					<p>Medicine</p>
					<input type="text" name="medicine" class="form-box" required>

					<p>Instructions</p>
					<input type="text" name="instructions" class="form-box" required>

					<button type="submit" class="save-btn">Save Prescription</button>

				</form>

			</div>

		</div>

	</div>

</body>
</html>