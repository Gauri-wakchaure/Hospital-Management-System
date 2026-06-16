package com.hms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hms.entity.Employee;
import com.hms.repository.EmployeeRepository;
import com.hms.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeRepository repo;

    @Override
    public Employee save(Employee emp) {
        return repo.save(emp);
    }

    @Override
    public List<Employee> getAll() {
        return repo.findAll();
    }
    
    @Override
    public Employee getById(Long id) {
        return repo.findById(id).orElse(null);
    }
}