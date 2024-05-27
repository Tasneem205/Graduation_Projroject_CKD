import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import pressureSchema from "../../schemas/pressure.schema.js";

const prisma = new PrismaClient();

const addPressure = async (req, res, next) => {
    try {
        const { error, value } = pressureSchema.validate(req.body);
        if (error) return responses.badRequest(res, error);
        const { pressureHigh, pressureLow, heart_rate} = value;

        const entry = await prisma.pressure.create({
          where: {
            PatientID: +req.params.id
            },
            data: {
              PatientID,
              date: Date.now(),
              pressureHigh,
              pressureLow,
              heart_rate
            }
          });
          return responses.success(res, "Pressure added successfully", entry);
    } catch (error) {
        console.log(error);
        next();
    }
};


export default addPressure;