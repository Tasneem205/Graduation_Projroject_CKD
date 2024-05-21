import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getAllDiabetes = async (req, res, next) => {
    try {
        const Diabetes = await prisma.diabetes.findMany({
            where: {
                patientID: +req.params.id,
            }
        });
        return responses.success(res, "All diabetes of the day!", Diabetes);
    } catch (error) {
        console.log(error);
        next();
    }
};

const getLastDiabetes = async (req, res, next) => {
    try { // TODO: what if the id wasn't valid
        const oneDiabetes = await prisma.pressure.findFirst({
            orderBy: {
                date: 'desc' // Assuming you have a createdAt field for ordering
            }, take: 1,
            where: {
            PatientID: +req.params.id
            }});
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