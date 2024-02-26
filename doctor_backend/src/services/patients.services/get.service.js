import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getAllPatients = async (req, res, next) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
        next();
    }
};

const getPatientWithId = async (req, res, next) => {
    try {
        // TODO: implement me
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