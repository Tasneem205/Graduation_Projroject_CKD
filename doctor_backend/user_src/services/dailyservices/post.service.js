import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import progressschema from "../../schemas/dailyservice.schema.js";

const prisma = new PrismaClient();

const dailyProgress = async (req, res, next) => {
    try {
      const { error, value } = progressschema.validate(req.body);
      if (error) return responses.badRequest(res, error);

        const entry = await prisma.dailyProgress.create({
          where: {
            patientID: +req.params.id,
        }, 
            data: {
              ProgressDate: Date.now(),
              PatientID,
              WaterML: 0,
              WalkingTime : 0,
              WalkingSteps: 0,
              Excercise: 0
            }
          });
          return responses.success(res, "entry added successfully", entry);
    } catch (error) {
        console.log(error);
        next();
    }
};
export default dailyProgress;

// add the set interval part