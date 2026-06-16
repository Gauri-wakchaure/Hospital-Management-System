package com.hms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hms.entity.Prescription;
import com.hms.repository.PrescriptionRepository;

@Service
public class PrescriptionServiceImpl
        implements PrescriptionService {

    @Autowired
    private PrescriptionRepository prescriptionRepository;

    @Override
    public Prescription save(
            Prescription prescription) {

        return prescriptionRepository.save(prescription);
    }

    @Override
    public List<Prescription> getByPatient(
            String patientName) {

        return prescriptionRepository
                .findByPatientName(patientName);
    }
}