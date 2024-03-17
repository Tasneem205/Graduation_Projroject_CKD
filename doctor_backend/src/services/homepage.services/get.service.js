import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getHomepageData = async (req, res, next) => {
    try{
        const assistants = await prisma.assistant.count();
        const doctors = await prisma.doctors.count();
        const scans = await prisma.kidney_scan.count();
        const tests = await prisma.kidney_test.count();
        // const reports = await prisma.assistant.count();
        const patients = await prisma.patients.count();
        const pieChart = [await prisma.kidney_scan.count({where :{ class : "0"}}),
            await prisma.kidney_scan.count({where :{ class : "1"}}),
            await prisma.kidney_scan.count({where :{ class : "2"}}),
            await prisma.kidney_scan.count({where :{ class : "3"}}),];
        // const chart = await prisma.assistant.count();
        console.log(assistants, doctors, scans, tests, patients);
        const data = {
            doctors: doctors,
            assistants: assistants,
            scans: scans,
            tests: tests,
            patients: patients,
            pieChart: pieChart
        }
        return responses.success(res, "Homepage data fetched!", data);
    } catch (error) {
        console.log(error);
        next();
    }
}

export default getHomepageData;

/*
`day` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `doctors` int(11) NOT NULL DEFAULT 0,
  `patients` int(11) NOT NULL DEFAULT 0,
  `lab_tests` int(11) NOT NULL DEFAULT 0,
  `scans` int(11) NOT NULL DEFAULT 0,
  `assistants` int(11) NOT NULL DEFAULT 0
 */