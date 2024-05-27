import { PrismaClient } from "@prisma/client";
import responses from "../helpers/responses.js";

const prisma = new PrismaClient();

const history = async (req, res, next) => {
    try {
        const Diabetes = await prisma.diabetes.findMany({
            where: { PatientID: +req.params.id }
        });
        const Pressure = await prisma.pressure.findMany({
            where: { PatientID: +req.params.id }
        });
        const exercise = await prisma.dailyProgress.findMany({
            where: { PatientID: +req.params.id },
            select: { Excercise:true }
        });
        const water = await prisma.dailyProgress.findMany({
            where: { PatientID: +req.params.id },
            select:{ WaterML:true}
        });
        const walking = await prisma.dailyProgress.findMany({
            where: { PatientID: +req.params.id },
            select:{ WalkingSteps:true }
        });

        const data = {
            Diabetes,
            Pressure,
            exercise,
            walking,
            water
        }

        return responses.success(res, "Success graphs",data);
    } catch (error) {
        console.log(error);
        next();
    }
};


export default history;