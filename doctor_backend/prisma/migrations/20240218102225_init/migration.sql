-- CreateTable
CREATE TABLE `Assistant` (
    `AssistantID` INTEGER NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR(191) NOT NULL,
    `LastName` VARCHAR(191) NOT NULL,
    `Email` VARCHAR(191) NOT NULL,
    `Password` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Assistant_Email_key`(`Email`),
    PRIMARY KEY (`AssistantID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DailyProgress` (
    `ProregressID` INTEGER NOT NULL AUTO_INCREMENT,
    `ProgressData` DATETIME(3) NOT NULL,
    `PatientID` INTEGER NOT NULL,
    `WaterML` INTEGER NOT NULL,
    `WalkingTime` TIME NOT NULL,
    `WalkingSteps` INTEGER NOT NULL,
    `Excercise` TIME NOT NULL,
    `DiabetesStatus` INTEGER NOT NULL,

    PRIMARY KEY (`ProregressID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Doctors` (
    `DoctorID` INTEGER NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR(191) NOT NULL,
    `LastName` VARCHAR(191) NOT NULL,
    `Phone_num` VARCHAR(191) NOT NULL,
    `Email` VARCHAR(191) NOT NULL,
    `Password` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Doctors_Email_key`(`Email`),
    PRIMARY KEY (`DoctorID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `followup` (
    `followupID` INTEGER NOT NULL AUTO_INCREMENT,
    `prescriptionID` INTEGER NOT NULL,
    `followup_date` DATETIME(3) NOT NULL,
    `followup_notes` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`followupID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `kidney_scan` (
    `Scan_ID` INTEGER NOT NULL AUTO_INCREMENT,
    `PatientID` INTEGER NOT NULL,
    `ScanDate` DATETIME(3) NOT NULL,
    `img` VARCHAR(191) NOT NULL,
    `class` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`Scan_ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `medications` (
    `medicationID` INTEGER NOT NULL AUTO_INCREMENT,
    `medication_name` VARCHAR(191) NOT NULL,
    `dosage_form` VARCHAR(191) NOT NULL,
    `manufacturer` VARCHAR(191) NOT NULL,
    `generic_name` VARCHAR(191) NOT NULL,
    `therapeutic_class` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`medicationID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `patients` (
    `PatientID` INTEGER NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR(191) NOT NULL,
    `LastName` VARCHAR(191) NOT NULL,
    `DateOfBirth` DATETIME(3) NOT NULL,
    `Gender` VARCHAR(191) NOT NULL,
    `Email` VARCHAR(191) NOT NULL,
    `Password` VARCHAR(191) NOT NULL,
    `DoctorID` INTEGER NOT NULL,
    `Job` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`PatientID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `prescriptions` (
    `prescriptionID` INTEGER NOT NULL AUTO_INCREMENT,
    `patientID` INTEGER NOT NULL,
    `DoctorID` INTEGER NOT NULL,
    `prescription_date` DATETIME(3) NOT NULL,
    `ExpiryDate` DATETIME(3) NOT NULL,

    PRIMARY KEY (`prescriptionID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `prescriptions_medication` (
    `prescriptionID` INTEGER NOT NULL AUTO_INCREMENT,
    `medicationID` INTEGER NOT NULL,
    `dosage` VARCHAR(191) NOT NULL,
    `frequency` VARCHAR(191) NOT NULL,
    `instructions` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`prescriptionID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
