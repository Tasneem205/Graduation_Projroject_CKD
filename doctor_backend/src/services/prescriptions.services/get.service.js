import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getPrescriptionWithPatientId = async (req, res, next) => {
    try {
        // TODO: implement me
        const id = +req.body.param;
        const data = await prisma.reservations.findMany[{
            where: {patient_id: id}
        }];
        return responses.success(res, `prescriptions of patient ` + id, data);
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
    getPrescriptionWithDoctorId,
    getPrescriptionWithPatientId
}
export default functions;