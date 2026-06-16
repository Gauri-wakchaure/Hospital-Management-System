package com.hms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hms.entity.PharmaCategory;
import com.hms.repository.PharmaCategoryRepository;

@Service
public class PharmaCategoryService {

    @Autowired
    private PharmaCategoryRepository repo;

    public void save(PharmaCategory category) {
        repo.save(category);
    }

    public List<PharmaCategory> getAll() {
        return repo.findAll();
    }
}