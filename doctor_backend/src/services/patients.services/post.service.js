import { PrismaClient } from "@prisma/client";
import patientSchemas from "../../schemas/patients.schema.js"
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const addPatient = async (req, res, next) => {
    try {
        let value, error = patientSchemas.createSchema();
        if (error) return responses.badRequest(res, "data isn't valid");
        const newPatient = await prisma.patients.create({
            ...value
        });
        return responses.success(res, "patient added successfully", newPatient);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default addPatient;