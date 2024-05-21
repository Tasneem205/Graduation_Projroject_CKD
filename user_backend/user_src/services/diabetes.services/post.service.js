import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import diabetesSchema from "../../schemas/diabetes.shcema.js";


const prisma = new PrismaClient();

const addDiabetes = async (req, res, next) => {
    try {
        const { error, value } = diabetesSchema.validate(req.body);
        if (error) return responses.badRequest(res, error.details[0].message);
        const diabetes_value = value;

        const entry = await prisma.diabetes.create({
          where: {
            patientID: +req.params.id,
        },
          data: {
            PatientID,
            date: Date.now(),
            diabetes_value
          },
        });
        return responses.success(res,"Diabetes added successfully",entry);        
    }
     catch (error) {
        console.log(error);
        next();
    }
};
export default addDiabetes;