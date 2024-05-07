import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const Allexercise = async (req, res, next) => {
    try {
        const exercise = await prisma.dailyProgress.findMany({
            where: {
                PatientID: +req.params.id,
            },
            select: { Excercise:true }
        });
        return responses.success(res, "Total time of exercise", exercise);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default Allexercise;