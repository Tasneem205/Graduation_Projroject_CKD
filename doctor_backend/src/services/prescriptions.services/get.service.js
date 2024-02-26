import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getAllPrescriptions = async (req, res, next) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
        next();
    }
};

const getPrescriptionWithPatientId = async (req, res, next) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
        next();
    }
};

const getPrescriptionWithDoctorId = async (req, res, next) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
        next();
    }
}
const functions = {
    getAllPrescriptions,
    getPrescriptionWithDoctorId,
    getPrescriptionWithPatientId
}
export default functions;