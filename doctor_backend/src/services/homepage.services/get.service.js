import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getHomepageManager = async (req, res, next) => {
    try{
        const assistants = await prisma.assistant.count();
        const doctors = await prisma.doctors.count();
        const scans = await prisma.kidney_scan.count();
        const tests = await prisma.kidney_test.count();
        // const reports = await prisma.assistant.count();
        // TODO: update the prisma file to count the reports
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

const getHomepageDoctor = async (req, res, next) => {
    try{
        const data = {}
        return responses.success(res, "Homepage data fetched!", data);
    } catch (error) {
        console.log(error);
        next();
    }
}

const getHomepageAssistant = async (req, res, next) => {
    try{
        const data = {}
        return responses.success(res, "Homepage data fetched!", data);
    } catch (error) {
        console.log(error);
        next();
    }
}

const getFunctions = {
    getHomepageManager,
    getHomepageDoctor,
    getHomepageAssistant
}
export default getFunctions;