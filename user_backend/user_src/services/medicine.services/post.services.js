import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import medicineSchema from "../../schemas/medicine.schema.js";

const prisma = new PrismaClient();

const addMedicine = async (req, res, next) => {
    try {
        const { error, value } = medicineSchema.validate(req.body);
        if (error) return responses.badRequest(res, error);
        const { medicine_name, dosage} = value;

        const entry = await prisma.alarmmedicine.create({
          where: {
            PatientID: +req.params.id
            },
            data: {
              PatientID,
              time: Date.now(),
              medicine_name,
              dosage,
            }
          });
          return responses.success(res, "medicine added successfully, Waiting for doctor to confirm", entry);
    } catch (error) {
        console.log(error);
        next();
    }
};


export default addMedicine;

