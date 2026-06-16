package com.hms.service;

import java.util.List;
import com.hms.entity.Pharmaceutical;

public interface PharmaceuticalService {

    void saveMedicine(Pharmaceutical medicine);

    List<Pharmaceutical> getAllMedicines();
}