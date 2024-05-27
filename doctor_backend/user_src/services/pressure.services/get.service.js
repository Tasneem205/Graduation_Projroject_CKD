import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getAllPressure = async (req, res, next) => {
    try {
        console.log(req.params.id);
        const Pressure = await prisma.pressure.findMany({
            where: { PatientID: +req.params.id }
        });
        return responses.success(res, "All pressure of the day!", Pressure);
    } catch (error) {
        console.log(error);
        next();
    }
};

const getLastPressure = async (req, res, next) => {
    try {
        const onePressure = await prisma.pressure.findFirst({
            orderBy: { date: 'desc' },
            where: { PatientID: +req.params.id }
        });
        return responses.success(res, "Here is the last pressure", onePressure);
    } catch (error) {
        console.log(error);
        next();
    }
};

const getFunctions = {
    getAllPressure,
    getLastPressure
}
export default getFunctions;