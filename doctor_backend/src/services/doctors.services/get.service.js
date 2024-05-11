import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getAllDoctors = async (req, res, next) => {
    try {
        const doctors = await prisma.doctors.findMany({});
        res.download('');
        return responses.success(res, "All doctors fetched!", doctors);
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
        return responses.success(res, "Assistant found!", doctor);
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