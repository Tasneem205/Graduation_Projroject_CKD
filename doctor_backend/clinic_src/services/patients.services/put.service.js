import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import patientSchemas from "../../schemas/patients.schema.js";

const prisma = new PrismaClient();

const updatePatient = async (req, res, next) => {
    try {
        const id = req.params.id;
        let value, error = patientSchemas.updateSchema();
        if (error) return responses.badRequest(res, "validation error");
        if (req.file) {
            const patientUpdated = await prisma.patients.update({
                where: {
                    PatientID: +req.params.id,
                },
                data: {image_path: req.file.path},
            });
        }
        const editPatient = await prisma.patients.update({
            where: { patientID: id },
            data: {...value}
        });
        return responses.success(res, "patient edited successfully", editPatient);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default updatePatient;