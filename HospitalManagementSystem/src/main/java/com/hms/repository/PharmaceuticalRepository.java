package com.hms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.hms.entity.Pharmaceutical;

public interface PharmaceuticalRepository extends JpaRepository<Pharmaceutical,Integer>{

}