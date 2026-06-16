package com.hms.service;

import java.util.List;
import com.hms.entity.Employee;

public interface EmployeeService {
	
	Employee getById(Long id);

    Employee save(Employee emp);

    List<Employee> getAll();
}