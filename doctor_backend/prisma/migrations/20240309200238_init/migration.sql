/*
  Warnings:

  - Added the required column `registrationDate` to the `patients` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `patients` ADD COLUMN `registrationDate` DATETIME(3) NOT NULL;
