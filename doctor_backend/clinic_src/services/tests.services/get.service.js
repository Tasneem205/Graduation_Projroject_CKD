import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getAllTests = async (req, res, next) => {
    try {
        const allTests = await prisma.kidney_test.findMany();
        return responses.success(res, "all tests fetched", allTests);
    } catch (error) {
        console.log(error);
        next();
    }
};

const getWithPatientId = async (req, res, next) => {
    try {
        const id = +req.params.id;
        const tests = await prisma.kidney_test.findMany[{
            where: {patient_id: id}
        }];
        return responses.success(res, "report fetched", tests);
    } catch (error) {
        console.log(error);
        next();
    }
}

const getFunctions = {
    getAllTests,
    getWithPatientId
}
export default getFunctions;