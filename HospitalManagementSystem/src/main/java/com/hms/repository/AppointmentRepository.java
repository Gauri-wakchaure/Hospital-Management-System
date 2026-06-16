package com.hms.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.hms.entity.Appointment;

public interface AppointmentRepository extends JpaRepository<Appointment, Long>{

    List<Appointment> findByPatientName(String patientName);

    @Query("SELECT a FROM Appointment a WHERE TRIM(LOWER(a.doctorName)) = TRIM(LOWER(:doctorName))")
    List<Appointment> findByDoctorName(@Param("doctorName") String doctorName);
}