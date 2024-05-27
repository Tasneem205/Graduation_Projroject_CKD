/*
  Warnings:

  - Added the required column `PressureHigh` to the `DailyProgress` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pressureLow` to the `DailyProgress` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `dailyprogress` ADD COLUMN `PressureHigh` INTEGER NOT NULL,
    ADD COLUMN `pressureLow` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `blackList` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `jwt` VARCHAR(191) NOT NULL,
    `exp` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
