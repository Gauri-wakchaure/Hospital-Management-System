package com.hms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hms.entity.Supplier;
import com.hms.repository.SupplierRepository;

@Service
public class SupplierServiceImpl implements SupplierService {

    @Autowired
    private SupplierRepository repo;

    public void saveSupplier(Supplier supplier) {
        repo.save(supplier);
    }

    public List<Supplier> getAllSuppliers() {
        return repo.findAll();
    }
}