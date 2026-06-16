package com.hms.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
public class Appointment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String patientName;
    private String doctorName;
    
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private LocalDate appointmentDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm")
    private LocalTime appointmentTime;
    private String problem;
    private String address;
    private Integer age;
    private String disease;
    private String status = "PENDING";

    public Long getId(){ return id; }
    public void setId(Long id){ this.id=id; }

    public String getPatientName(){ return patientName; }
    public void setPatientName(String patientName){ this.patientName=patientName; }

    public String getDoctorName(){ return doctorName; }
    public void setDoctorName(String doctorName){ this.doctorName=doctorName; }

    public LocalDate getAppointmentDate(){ return appointmentDate; }
    public void setAppointmentDate(LocalDate appointmentDate){
        this.appointmentDate=appointmentDate;
    }

    public LocalTime getAppointmentTime(){ return appointmentTime; }
    public void setAppointmentTime(LocalTime appointmentTime){
        this.appointmentTime=appointmentTime;
    }

    public String getProblem(){ return problem; }
    public void setProblem(String problem){ this.problem=problem; }

    public String getStatus(){ return status; }
    public void setStatus(String status){ this.status=status; }
    
    public String getAddress(){ return address; }
    public void setAddress(String address){ this.address=address; }

    public Integer getAge(){ return age; }
    public void setAge(Integer age){ this.age=age; }

    public String getDisease(){ return disease; }
    public void setDisease(String disease){ this.disease=disease; }
    
    
}