package com.hms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.hms.entity.Supplier;

public interface SupplierRepository extends JpaRepository<Supplier, Integer>{

}