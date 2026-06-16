package com.hms.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hms.entity.Appointment;
import com.hms.repository.AppointmentRepository;

@Service
public class AppointmentService {

    @Autowired
    private AppointmentRepository repo;

    public void save(Appointment appointment){
        repo.save(appointment);
    }

    public Appointment getById(Long id){
        return repo.findById(id).orElse(null);
    }

    public List<Appointment> getByPatient(String patientName){
        return repo.findByPatientName(patientName);
    }

    public List<Appointment> findAll(){
        return repo.findAll();
    }

    public List<Appointment> getByDoctor(String doctorName){
        return repo.findByDoctorName(doctorName);
    }
    
    
}