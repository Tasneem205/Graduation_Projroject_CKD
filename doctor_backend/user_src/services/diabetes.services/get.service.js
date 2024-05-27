import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getAllDiabetes = async (req, res, next) => {
    try {
        const Diabetes = await prisma.diabetes.findMany({
            where: {
                PatientID: +req.params.id,
            }
        });
        return responses.success(res, "All diabetes of the day!", Diabetes);
    } catch (error) {
        console.log(error);
        next();
    }
};

const getLastDiabetes = async (req, res, next) => {
    try {
        const oneDiabetes = await prisma.diabetes.findFirst({
            where: { PatientID: +req.params.id },
            orderBy: {
                date: 'desc'
            },
        });
        return responses.success(res, "Here is the last diabetes", oneDiabetes);
    } catch (error) {
        console.log(error);
        next();
    }
};

const getFunctions = {
    getAllDiabetes,
    getLastDiabetes
}
export default getFunctions;