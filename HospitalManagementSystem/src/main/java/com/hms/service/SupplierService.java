package com.hms.service;

import java.util.List;
import com.hms.entity.Supplier;

public interface SupplierService {

    void saveSupplier(Supplier supplier);

    List<Supplier> getAllSuppliers();
}