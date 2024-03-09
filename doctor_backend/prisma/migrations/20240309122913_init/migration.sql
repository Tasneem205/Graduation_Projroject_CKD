/*
  Warnings:

  - You are about to drop the column `DiabetesStatus` on the `dailyprogress` table. All the data in the column will be lost.
  - You are about to drop the column `PressureHigh` on the `dailyprogress` table. All the data in the column will be lost.
  - You are about to drop the column `pressureLow` on the `dailyprogress` table. All the data in the column will be lost.
  - You are about to drop the column `patientID` on the `prescriptions` table. All the data in the column will be lost.
  - Added the required column `assistantID` to the `patients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bloodGroup` to the `patients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `hieght` to the `patients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `weight` to the `patients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PatientID` to the `prescriptions` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `dailyprogress` DROP COLUMN `DiabetesStatus`,
    DROP COLUMN `PressureHigh`,
    DROP COLUMN `pressureLow`;

-- AlterTable
ALTER TABLE `patients` ADD COLUMN `assistantID` INTEGER NOT NULL,
    ADD COLUMN `bloodGroup` VARCHAR(191) NOT NULL,
    ADD COLUMN `hieght` DOUBLE NOT NULL,
    ADD COLUMN `weight` DOUBLE NOT NULL;

-- AlterTable
ALTER TABLE `prescriptions` DROP COLUMN `patientID`,
    ADD COLUMN `PatientID` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `Diabetes` (
    `PatientID` INTEGER NOT NULL,
    `date` DATETIME(3) NOT NULL,
    `diabetes_value` INTEGER NOT NULL,

    PRIMARY KEY (`PatientID`, `date`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `kidney_test` (
    `TestID` INTEGER NOT NULL AUTO_INCREMENT,
    `TestDate` DATETIME(3) NOT NULL,
    `PatientID` INTEGER NOT NULL,
    `pot` DOUBLE NOT NULL,
    `hemo` DOUBLE NOT NULL,
    `pcv` DOUBLE NOT NULL,
    `wbc` DOUBLE NOT NULL,
    `rbc` DOUBLE NOT NULL,
    `pc` VARCHAR(191) NOT NULL,
    `pcc` VARCHAR(191) NOT NULL,
    `ba` VARCHAR(191) NOT NULL,
    `htl` VARCHAR(191) NOT NULL,
    `dm` VARCHAR(191) NOT NULL,
    `cad` VARCHAR(191) NOT NULL,
    `appet` VARCHAR(191) NOT NULL,
    `pe` VARCHAR(191) NOT NULL,
    `ane` VARCHAR(191) NOT NULL,
    `age` INTEGER NOT NULL,
    `bp` VARCHAR(191) NOT NULL,
    `bgr` DOUBLE NOT NULL,
    `bu` DOUBLE NOT NULL,
    `sc` DOUBLE NOT NULL,
    `sod` DOUBLE NOT NULL,
    `sg` VARCHAR(191) NOT NULL,
    `al` VARCHAR(191) NOT NULL,
    `su` VARCHAR(191) NOT NULL,
    `class` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`TestID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pressure` (
    `PatientID` INTEGER NOT NULL,
    `date` DATETIME(3) NOT NULL,
    `pressureHigh` INTEGER NOT NULL,
    `pressureLow` INTEGER NOT NULL,
    `heart_rate` INTEGER NOT NULL,

    PRIMARY KEY (`PatientID`, `date`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `video` (
    `VideoId` INTEGER NOT NULL AUTO_INCREMENT,
    `Title` VARCHAR(191) NOT NULL,
    `Category` VARCHAR(191) NOT NULL,
    `Descript` VARCHAR(191) NOT NULL,
    `Duration` TIME NOT NULL,
    `Thumbnail` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`VideoId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `DailyProgress` ADD CONSTRAINT `DailyProgress_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Diabetes` ADD CONSTRAINT `Diabetes_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `followup` ADD CONSTRAINT `followup_prescriptionID_fkey` FOREIGN KEY (`prescriptionID`) REFERENCES `prescriptions`(`prescriptionID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `kidney_scan` ADD CONSTRAINT `kidney_scan_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `kidney_test` ADD CONSTRAINT `kidney_test_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `patients` ADD CONSTRAINT `patients_DoctorID_fkey` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors`(`DoctorID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `patients` ADD CONSTRAINT `patients_assistantID_fkey` FOREIGN KEY (`assistantID`) REFERENCES `Assistant`(`AssistantID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `prescriptions` ADD CONSTRAINT `prescriptions_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `prescriptions` ADD CONSTRAINT `prescriptions_DoctorID_fkey` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors`(`DoctorID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `prescriptions_medication` ADD CONSTRAINT `prescriptions_medication_medicationID_fkey` FOREIGN KEY (`medicationID`) REFERENCES `medications`(`medicationID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pressure` ADD CONSTRAINT `pressure_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;
