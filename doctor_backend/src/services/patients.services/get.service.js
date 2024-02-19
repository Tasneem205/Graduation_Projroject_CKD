import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getAllPatients = async (req, res) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
    }
};

const getPatientWithId = async (req, res) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
    }
};
const getFunctions = {
    getAllPatients,
    getPatientWithId
}
export default getFunctions;