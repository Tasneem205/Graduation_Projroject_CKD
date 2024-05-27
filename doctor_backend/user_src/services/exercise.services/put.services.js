import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import exerciseSchema from "../../schemas/exercise.schema.js";


const prisma = new PrismaClient();

const updateExercise = async (req, res, next) => {
    try {
        const { error, value } = exerciseSchema.validate(req.body);
        if (error) return responses.badRequest(res, error);
        const {Excercise} = value;

        const newExercise = await prisma.dailyProgress.update({
            where: {
                patientID: +req.params.id,
            },
            data: { Excercise },
        });
        return responses.success(res, "Exercise edited successfully", newExercise);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default updateExercise;

