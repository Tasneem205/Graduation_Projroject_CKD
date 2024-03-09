-- CreateTable
CREATE TABLE `name: homepageView` (
    `day` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `doctors` INTEGER NOT NULL,
    `patients` INTEGER NOT NULL,
    `lab_tests` INTEGER NOT NULL,
    `scans` INTEGER NOT NULL,
    `assistants` INTEGER NOT NULL,

    PRIMARY KEY (`day`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
