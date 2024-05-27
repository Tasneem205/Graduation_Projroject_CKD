import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import fs from "fs";

const prisma = new PrismaClient();

const getAllPatients = async (req, res, next) => {
    try {
        const allPatients = await prisma.patients.findMany();
        const dataWithImages = allPatients.map(patient => {
            const imagePath = patient.image_path;
            const imageData = fs.readFileSync(imagePath, 'base64');
            return {
                ...patient,
                image_base64: imageData,
            };
        });
        return responses.success(res, "All patients fetched", dataWithImages);
    } catch (error) {
        console.log(error);
        next();
    }
};

// get patient profile
const getPatientProfile = async (req, res, next) => {
    // TODO: add medicine
    try {
        const id = +req.body.params;
        const profile = await prisma.patients.findUnique({
            where: { patientID: id }
        });
        const image = fs.readFileSync(profile.imagePath, 'base64');
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
            image,
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
    getPatientProfile
}
export default getFunctions;