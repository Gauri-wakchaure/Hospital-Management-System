<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Dashboard</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

body{
margin:0;
font-family:Arial;
display:flex;
background:#f4f6f9;
}

.sidebar{
width:250px;
height:100vh;
background:#0b1f4d;
color:white;
position:fixed;
}

.logo{
text-align:center;
padding:20px;
font-size:22px;
font-family:Georgia;
font-weight:bold;
border-bottom:1px solid rgba(255,255,255,.2);
}

.sidebar a{
display:flex;
align-items:center;
gap:12px;
padding:16px;
color:white;
text-decoration:none;
font-family:Georgia;
transition:.3s;
cursor:pointer;
}

.sidebar a:hover{
background:#163a72;
padding-left:22px;
}

.main{
margin-left:250px;
width:100%;
padding:25px;
}

.topbar{
height:70px;
background:white;
display:flex;
align-items:center;
padding:0 30px;
border-radius:12px;
box-shadow:0 4px 15px rgba(0,0,0,.08);
margin-bottom:25px;
}

.admin-info{
font-size:20px;
font-weight:bold;
font-family:Georgia;
color:#0b1f4d;
}

.cards{
display:grid;
grid-template-columns:repeat(3,minmax(250px,1fr));
gap:25px;
}

.card{
background:#0b1f4d;
color:white;
padding:30px;
border-radius:16px;
text-align:center;
box-shadow:0 8px 20px rgba(0,0,0,.2);
transition:.4s;
}

.card:hover{
transform:translateY(-8px);
background:#163a72;
}

.card i{
font-size:32px;
margin-bottom:12px;
}

.card h2{
font-size:36px;
margin:10px 0;
}

.card p{
font-family:Georgia;
font-size:17px;
}

.section{
display:none;
}

.active{
display:block;
}

.profile-box{
background:white;
padding:35px;
border-radius:15px;
box-shadow:0 8px 20px rgba(0,0,0,.08);
max-width:900px;
}

.profile-box h2{
font-family:Georgia;
color:#0b1f4d;
margin-bottom:20px;
}

.profile-box p{
font-size:18px;
margin:15px 0;
}

input{
width:100%;
padding:12px;
margin-bottom:15px;
border:1px solid #ccc;
border-radius:8px;
}

button{
background:#0b1f4d;
color:white;
padding:12px 20px;
border:none;
border-radius:8px;
font-family:Georgia;
cursor:pointer;
}

button:hover{
background:#163a72;
}

table{
width:100%;
border-collapse:collapse;
margin-top:15px;
}

th{
background:#0b1f4d;
color:white;
padding:12px;
}

td{
padding:12px;
text-align:center;
border-bottom:1px solid #ddd;
}

</style>

<script>

function showSection(id){

document.querySelectorAll('.section')
.forEach(s=>s.classList.remove('active'));

document.getElementById(id)
.classList.add('active');
}

window.onload=function(){
showSection('dashboard');
}

</script>

</head>
<body>

<div class="sidebar">

<div class="logo">Patient Panel</div>

<a onclick="showSection('dashboard')">
<i class="fas fa-chart-line"></i> Dashboard
</a>

<a onclick="showSection('profile')">
<i class="fas fa-user"></i> My Profile
</a>

<a onclick="showSection('appointment')">
<i class="fas fa-calendar-check"></i> Book Appointment
</a>

<a onclick="showSection('myappointments')">
<i class="fas fa-list"></i> My Appointments
</a>

<a onclick="showSection('prescription')">
<i class="fas fa-file-medical"></i> Prescription
</a>

<a href="/">
<i class="fas fa-sign-out-alt"></i> Logout
</a>

</div>

<div class="main">

<div class="topbar">
<div class="admin-info">
Welcome ${patient.name}
</div>
</div>

<!-- Dashboard -->

<div id="dashboard" class="section active">

<div class="cards">

<div class="card">
<i class="fas fa-user"></i>
<h2>${patient.id}</h2>
<p>Patient ID</p>
</div>

<div class="card">
<i class="fas fa-heartbeat"></i>
<h2>${patient.patientType}</h2>
<p>Patient Type</p>
</div>

<div class="card">
<i class="fas fa-notes-medical"></i>
<h2>${patient.disease}</h2>
<p>Disease</p>
</div>

</div>
</div>

<!-- Profile -->

<div id="profile" class="section">

<div class="profile-box">

<h2>My Profile</h2>

<p><b>Name:</b> ${patient.name}</p>
<p><b>Email:</b> ${patient.email}</p>
<p><b>Address:</b> ${patient.address}</p>
<p><b>Age:</b> ${patient.age}</p>
<p><b>Birth Date:</b> ${patient.birthDate}</p>
<p><b>Mobile:</b> ${patient.mobile}</p>
<p><b>Disease:</b> ${patient.disease}</p>
<p><b>Patient Type:</b> ${patient.patientType}</p>

</div>
</div>

<!-- Book Appointment -->

<div id="appointment" class="section">

<div class="profile-box">

<h2>Book Appointment</h2>

<form action="/bookAppointment" method="post">

<input type="hidden" name="patientName" value="${patient.name}">
<input type="hidden" name="address" value="${patient.address}">
<input type="hidden" name="age" value="${patient.age}">
<input type="hidden" name="disease" value="${patient.disease}">

<p>Select Doctor</p>

<select name="doctorName" required style="
width:100%;
padding:12px;
margin-bottom:15px;
border:1px solid #ccc;
border-radius:8px;">

<c:forEach items="${doctors}" var="d">
<option value="${fn:trim(d.name)}">
${d.name} - ${d.department}
</option>
</c:forEach>

</select>

<p>Problem</p>
<input type="text" name="problem" placeholder="Problem" required>

<p>Date</p>
<input type="date" name="appointmentDate" required>

<p>Time</p>
<input type="time" name="appointmentTime" required>

<button type="submit">
Book Appointment
</button>

</form>

</div>
</div>
<!-- My Appointments -->

<div id="myappointments" class="section">

<div class="profile-box">

<h2>My Appointments</h2>

<table>

<tr>
<th>Problem</th>
<th>Date</th>
<th>Time</th>
<th>Status</th>
</tr>

<c:forEach items="${appointments}" var="a">

<tr>
<td>${a.problem}</td>
<td>${a.appointmentDate}</td>
<td>${a.appointmentTime}</td>
<td>${a.status}</td>
</tr>

</c:forEach>

</table>

</div>
</div>

<!-- Prescription -->

<div id="prescription" class="section">

<div class="profile-box">

<h2>Prescription</h2>

<table>

<tr>
<th>Medicine</th>
<th>Doctor</th>
<th>Instructions</th>
</tr>

<c:forEach items="${prescriptions}" var="p">

<tr>
<td>${p.medicine}</td>
<td>${p.doctorName}</td>
<td>${p.instructions}</td>
</tr>

</c:forEach>

</table>

</div>
</div>

</div>

</body>
</html>