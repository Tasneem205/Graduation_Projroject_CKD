import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const deletePatient = async (req, res, next) => {
    try {
        const id = req.params.id;
        const deletedPatient = await prisma.patients.delete({
            where: { patientID: id }
        });
        return responses.success(res, "Patient deleted successfully", deletedPatient);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default deletePatient;