package com.hms.controller;

import jakarta.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.hms.entity.*;
import com.hms.service.*;

@Controller
public class PatientController {

    @Autowired
    private PatientService patientService;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private DoctorService doctorService;

    @Autowired
    private PharmaCategoryService pharmaCategoryService;

    @Autowired
    private SupplierService supplierService;

    @Autowired
    private PharmaceuticalService pharmaceuticalService;

    @Autowired
    private AppointmentService appointmentService;

    @Autowired
    private PrescriptionService prescriptionService;


    // ================= DOCTOR DASHBOARD =================

    @GetMapping("/doctorDashboard")
    public String doctorDashboard(Model model){

        model.addAttribute("patients", patientService.getAll());
        model.addAttribute("employees", employeeService.getAll());
        model.addAttribute("doctors", doctorService.getAll());
        model.addAttribute("categories", pharmaCategoryService.getAll());
        model.addAttribute("suppliers", supplierService.getAllSuppliers());
        model.addAttribute("medicines",
                pharmaceuticalService.getAllMedicines());

        model.addAttribute("appointments",
                appointmentService.findAll());

        return "doctorDashboard";
    }


    // ================= SAVE PATIENT =================

    @PostMapping("/savePatient")
    public String savePatient(@ModelAttribute Patient patient){

        patientService.save(patient);

        return "redirect:/doctorDashboard";
    }


    @GetMapping("/editPatient/{id}")
    public String editPatient(@PathVariable Long id,
                              Model model){

        model.addAttribute("patient",
                patientService.getById(id));

        return "editPatient";
    }


    @PostMapping("/updatePatient")
    public String updatePatient(
            @ModelAttribute Patient patient){

        patientService.save(patient);

        return "redirect:/doctorDashboard";
    }


    // ================= EMPLOYEE =================

    @PostMapping("/saveEmployee")
    public String saveEmployee(
            @ModelAttribute Employee emp){

        employeeService.save(emp);

        return "redirect:/doctorDashboard";
    }


    @GetMapping("/editEmployee/{id}")
    public String editEmployee(@PathVariable Long id,
                               Model model){

        model.addAttribute("employee",
                employeeService.getById(id));

        return "editEmployee";
    }


    @PostMapping("/updateEmployee")
    public String updateEmployee(
            @ModelAttribute Employee employee){

        employeeService.save(employee);

        return "redirect:/doctorDashboard";
    }


    // ================= DOCTOR =================

    @PostMapping("/saveDoctor")
    public String saveDoctor(
            @ModelAttribute Doctor doctor){

        doctorService.save(doctor);

        return "redirect:/doctorDashboard";
    }


    @GetMapping("/editDoctor/{id}")
    public String editDoctor(@PathVariable Long id,
                             Model model){

        model.addAttribute("doctor",
                doctorService.getById(id));

        return "editDoctor";
    }


    @PostMapping("/updateDoctor")
    public String updateDoctor(
            @ModelAttribute Doctor doctor){

        doctorService.save(doctor);

        return "redirect:/doctorDashboard";
    }


    // ================= CATEGORY =================

    @PostMapping("/saveCategory")
    public String saveCategory(
            @ModelAttribute PharmaCategory category){

        pharmaCategoryService.save(category);

        return "redirect:/doctorDashboard";
    }


    // ================= SUPPLIER =================

    @PostMapping("/saveSupplier")
    public String saveSupplier(
            @ModelAttribute Supplier supplier){

        supplierService.saveSupplier(supplier);

        return "redirect:/doctorDashboard";
    }


    // ================= MEDICINE =================

    @PostMapping("/saveMedicine")
    public String saveMedicine(
            @ModelAttribute Pharmaceutical medicine){

        pharmaceuticalService.saveMedicine(medicine);

        return "redirect:/doctorDashboard";
    }


    // ================= PATIENT LOGIN =================

    @PostMapping("/patientLoginCheck")
    public String patientLoginCheck(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model){

        Patient patient =
                patientService.login(email,password);

        if(patient != null){

            session.setAttribute("patient", patient);

            model.addAttribute("patient", patient);

            model.addAttribute("appointments",
                    appointmentService.getByPatient(
                            patient.getName()));

            model.addAttribute("prescriptions",
                    prescriptionService.getByPatient(
                            patient.getName()));

            model.addAttribute("doctors",
                    doctorService.getAllDoctors());

            return "patientDashboard";
        }

        model.addAttribute("error",
                "Invalid Email or Password");

        return "patientLogin";
    }


    // ================= PATIENT DASHBOARD =================

    @GetMapping("/patientDashboard")
    public String patientDashboard(
            HttpSession session,
            Model model){

        Patient patient =
                (Patient) session.getAttribute("patient");

        model.addAttribute("patient", patient);

        model.addAttribute("appointments",
                appointmentService.getByPatient(
                        patient.getName()));

        model.addAttribute("prescriptions",
                prescriptionService.getByPatient(
                        patient.getName()));

        model.addAttribute("doctors",
                doctorService.getAllDoctors());

        return "patientDashboard";
    }


    // ================= BOOK APPOINTMENT =================

    @PostMapping("/bookAppointment")
    public String bookAppointment(
            @ModelAttribute Appointment appointment){

        appointment.setStatus("PENDING");

        appointmentService.save(appointment);

        return "redirect:/patientDashboard";
    }


    // ================= APPROVE =================

    @GetMapping("/approveAppointment/{id}")
    public String approveAppointment(
            @PathVariable Long id){

        Appointment appointment =
                appointmentService.getById(id);

        appointment.setStatus("APPROVED");

        appointmentService.save(appointment);

        return "redirect:/doctorDashboard";
    }


    // ================= DECLINE =================

    @GetMapping("/declineAppointment/{id}")
    public String declineAppointment(
            @PathVariable Long id){

        Appointment appointment =
                appointmentService.getById(id);

        appointment.setStatus("DECLINED");

        appointmentService.save(appointment);

        return "redirect:/doctorDashboard";
    }


    // ================= SAVE PRESCRIPTION =================

    @PostMapping("/savePrescription")
    public String savePrescription(
            @ModelAttribute Prescription prescription){

        prescriptionService.save(prescription);

        return "redirect:/doctorDashboard";
    }
    
    @GetMapping("/doctorAppointments/{doctorName}")
    @ResponseBody
    public List<Appointment> getAppointments(@PathVariable String doctorName){

    	List<Appointment> list = appointmentService.getByDoctor(doctorName.trim());
    	
        System.out.println("Appointments found: " + list.size());

        return list;
    }
    
}