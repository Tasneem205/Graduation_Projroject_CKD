import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import {all} from "express/lib/application.js";

const prisma = new PrismaClient();

const getAllPatients = async (req, res, next) => {
    try {
        const allPatients = await prisma.patients.findMany();
        return responses.success(res, "All patients fetched", allPatients);
    } catch (error) {
        console.log(error);
        next();
    }
};

// get patient profile
const getPatientWithId = async (req, res, next) => {
    try {
        const id = +req.body.params;
        const profile = await prisma.patients.findUnique({
            where: { patientID: id }
        });
        const dailyProgress = await prisma.dailyProgress.findMany({
            where: { patientID: id }
        });
        const diabetes = await prisma.diabetes.findMany({
            where: { patientID: id }
        });
        const pressure = await prisma.pressure.findMany({
            where: { patientID: id }
        });
        const labTests = await prisma.kidney_test.findMany({
            where: { patientID: id }
        });
        const scans = await prisma.kidney_scan.findMany({
            where: { patientID: id }
        });
        let profileData = {
            profile,
            dailyProgress,
            diabetes,
            pressure, // destruct to pressure and heart rate
            labTests,
            scans
        };
        return responses.success(res, "profile of patient", profileData);
    } catch (error) {
        console.log(error);
        next();
    }
};
const getFunctions = {
    getAllPatients,
    getPatientWithId
}
export default getFunctions;