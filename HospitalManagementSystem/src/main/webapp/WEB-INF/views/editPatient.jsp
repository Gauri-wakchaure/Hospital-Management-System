<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Patient</title>

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

<h2><i class="fas fa-user-edit"></i> Edit Patient Details</h2>

<form action="/updatePatient" method="post">

<input type="hidden" name="id" value="${patient.id}">

<div class="form-grid">

<div>
<label>Patient Name</label>
<input type="text" name="name" value="${patient.name}">
</div>

<div>
<label>Address</label>
<input type="text" name="address" value="${patient.address}">
</div>

<div>
<label>Age</label>
<input type="number" name="age" value="${patient.age}">
</div>

<div>
<label>Birth Date</label>
<input type="date" name="birthDate" value="${patient.birthDate}">
</div>

<div>
<label>Disease</label>
<input type="text" name="disease" value="${patient.disease}">
</div>

<div>
<label>Mobile</label>
<input type="text" name="mobile" value="${patient.mobile}">
</div>

<div>
<label>Patient Type</label>
<select name="patientType">

<option value="INPATIENT"
${patient.patientType=='INPATIENT'?'selected':''}>
INPATIENT
</option>

<option value="OUTPATIENT"
${patient.patientType=='OUTPATIENT'?'selected':''}>
OUTPATIENT
</option>

</select>
</div>

</div>

<button class="btn" type="submit">
<i class="fas fa-save"></i> Update Patient
</button>

<a href="/doctorDashboard" class="back">
<i class="fas fa-arrow-left"></i> Back to Dashboard
</a>

</form>

</div>

</body>
</html>