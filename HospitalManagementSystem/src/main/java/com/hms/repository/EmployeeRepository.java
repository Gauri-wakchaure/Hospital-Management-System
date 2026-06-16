package com.hms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.hms.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
}