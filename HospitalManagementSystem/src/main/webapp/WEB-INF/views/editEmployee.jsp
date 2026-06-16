<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Employee</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

body{
margin:0;
padding:0;
font-family:Arial;
background:#f4f6f9;
display:flex;
justify-content:center;
align-items:center;
min-height:100vh;
}

.container{
width:900px;
background:white;
padding:40px;
border-radius:18px;
box-shadow:0 10px 30px rgba(0,0,0,.15);
}

h2{
text-align:center;
color:#0b1f4d;
font-family:Georgia;
margin-bottom:30px;
font-size:32px;
}

.form-grid{
display:grid;
grid-template-columns:repeat(2,1fr);
gap:20px;
}

label{
display:block;
font-family:Georgia;
font-weight:bold;
margin-bottom:8px;
color:#0b1f4d;
}

input,select{
width:100%;
padding:14px;
border:1px solid #ccc;
border-radius:10px;
font-size:15px;
outline:none;
transition:.3s;
box-sizing:border-box;
}

input:focus,select:focus{
border-color:#0b1f4d;
box-shadow:0 0 8px rgba(11,31,77,.15);
}

.btn{
margin-top:30px;
width:100%;
padding:16px;
background:#0b1f4d;
color:white;
border:none;
border-radius:12px;
font-size:18px;
cursor:pointer;
font-family:Georgia;
transition:.3s;
}

.btn:hover{
background:#163a72;
transform:translateY(-3px);
}

.back{
display:inline-block;
margin-top:20px;
text-decoration:none;
color:#0b1f4d;
font-family:Georgia;
font-weight:bold;
}

.back:hover{
color:#163a72;
}

</style>
</head>

<body>

<div class="container">

<h2><i class="fas fa-user-edit"></i> Edit Employee</h2>

<form action="/updateEmployee" method="post">

<!-- hidden ID -->
<input type="hidden" name="id" value="${employee.id}">

<div class="form-grid">

<div>
<label>Employee Name</label>
<input type="text" name="name" value="${employee.name}" required>
</div>

<div>
<label>Email</label>
<input type="email" name="email" value="${employee.email}" required>
</div>

<div>
<label>Password</label>
<input type="password" name="password" value="${employee.password}" required>
</div>

<div>
<label>Department</label>
<select name="department" required>

<option value="CARDIOLOGY" ${employee.department=='CARDIOLOGY'?'selected':''}>CARDIOLOGY</option>
<option value="NEUROLOGY" ${employee.department=='NEUROLOGY'?'selected':''}>NEUROLOGY</option>
<option value="ORTHOPEDICS" ${employee.department=='ORTHOPEDICS'?'selected':''}>ORTHOPEDICS</option>
<option value="PEDIATRICS" ${employee.department=='PEDIATRICS'?'selected':''}>PEDIATRICS</option>
<option value="GYNECOLOGY" ${employee.department=='GYNECOLOGY'?'selected':''}>GYNECOLOGY</option>
<option value="ENT" ${employee.department=='ENT'?'selected':''}>ENT</option>
<option value="SKIN" ${employee.department=='SKIN'?'selected':''}>SKIN</option>
<option value="EYE" ${employee.department=='EYE'?'selected':''}>EYE</option>
<option value="ICU" ${employee.department=='ICU'?'selected':''}>ICU</option>
<option value="RADIOLOGY" ${employee.department=='RADIOLOGY'?'selected':''}>RADIOLOGY</option>
<option value="SURGERY" ${employee.department=='SURGERY'?'selected':''}>SURGERY</option>
<option value="EMERGENCY" ${employee.department=='EMERGENCY'?'selected':''}>EMERGENCY</option>
<option value="LABORATORY" ${employee.department=='LABORATORY'?'selected':''}>LABORATORY</option>
<option value="PHARMACY" ${employee.department=='PHARMACY'?'selected':''}>PHARMACY</option>
<option value="GENERAL" ${employee.department=='GENERAL'?'selected':''}>GENERAL</option>

</select>
</div>

</div>

<button type="submit" class="btn">
<i class="fas fa-save"></i> Update Employee
</button>

</form>

<a href="/doctorDashboard" class="back">
<i class="fas fa-arrow-left"></i> Back to Dashboard
</a>

</div>

</body>
</html>