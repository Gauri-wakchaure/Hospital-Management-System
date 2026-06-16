package com.hms.service;

import java.util.List;

import com.hms.entity.Prescription;

public interface PrescriptionService {

    Prescription save(Prescription prescription);

    List<Prescription> getByPatient(String patientName);
}