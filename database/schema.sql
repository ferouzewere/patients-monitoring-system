-- Step 1: Define Database Schema

-- Patients Table
CREATE TABLE IF NOT EXISTS patients (
    patient_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    diagnosis TEXT,
    contact TEXT,
    address TEXT,
    payment_mode TEXT,
    other_details TEXT
);

-- Doctors Table
CREATE TABLE IF NOT EXISTS doctors (
    doctor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    specialization TEXT,
    contact TEXT,
    hospital_id INTEGER,
    FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id)
);

-- Hospitals Table
CREATE TABLE IF NOT EXISTS hospitals (
    hospital_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    location TEXT,
    level TEXT,
    services TEXT
);

-- Insurance Companies Table
CREATE TABLE IF NOT EXISTS insurance_companies (
    insurance_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    contact TEXT,
    address TEXT
);

-- Diagnoses Table
CREATE TABLE IF NOT EXISTS diagnoses (
    diagnosis_id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER,
    doctor_id INTEGER,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    temperature REAL,
    blood_pressure TEXT,
    symptoms TEXT,
    treatment TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Emergency Alerts Table
CREATE TABLE IF NOT EXISTS emergency_alerts (
    alert_id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER,
    contact_person TEXT,
    symptoms TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
