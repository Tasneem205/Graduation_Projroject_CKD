import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import fs from "fs";
const prisma = new PrismaClient();

const getAllDoctors = async (req, res, next) => {
    try {
        const doctors = await prisma.doctors.findMany({});
        const dataWithImages = doctors.map(doctor => {
            const imagePath = doctor.image_path;
            const imageData = fs.readFileSync(imagePath, 'base64');
            return {
                ...doctor,
                image_base64: imageData,
            };
        });
        return responses.success(res, "All doctors fetched!", dataWithImages);
    } catch (error) {
        console.log(error);
        next();
    }
};

const getDoctorWithId = async (req, res, next) => {
    try {
        const doctor = await prisma.doctors.findUnique({
            where: { AssistantID: +req.params.id }
        });
        const imageData = fs.readFileSync(doctor.imagePath, 'base64');
        const dataWithImage = {doctor, imageData};
        return responses.success(res, "Assistant found!", dataWithImage);
    } catch (error) {
        console.log(error);
        next();
    }
};
const getFunctions = {
    getAllDoctors,
    getDoctorWithId
}
export default getFunctions;