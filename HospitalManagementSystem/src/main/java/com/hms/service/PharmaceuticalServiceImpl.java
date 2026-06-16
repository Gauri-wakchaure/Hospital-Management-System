package com.hms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hms.entity.Pharmaceutical;
import com.hms.repository.PharmaceuticalRepository;

@Service
public class PharmaceuticalServiceImpl implements PharmaceuticalService {

    @Autowired
    private PharmaceuticalRepository repo;

    public void saveMedicine(Pharmaceutical medicine) {
        repo.save(medicine);
    }

    public List<Pharmaceutical> getAllMedicines() {
        return repo.findAll();
    }
}