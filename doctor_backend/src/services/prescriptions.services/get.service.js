import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getAllPrescriptions = async (req, res) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
    }
};

const getPrescriptionWithPatientId = async (req, res) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
    }
};

const getPrescriptionWithDoctorId = async (req, res) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
    }
}
const functions = {
    getAllPrescriptions,
    getPrescriptionWithDoctorId,
    getPrescriptionWithPatientId
}
export default functions;