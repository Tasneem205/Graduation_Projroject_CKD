import { PrismaClient } from "@prisma/client";
import responses from "../helpers/responses.js";

const prisma = new PrismaClient();

const homepage = async (req, res, next) => {
    try {
        const walking = await prisma.dailyProgress.findMany({
            where: {
                PatientID: +req.params.id,
            },
            select:{ WalkingSteps:true, WalkingTime:true}
        });
        const water = await prisma.dailyProgress.findMany({
            where: {
                PatientID: +req.params.id,
            },
            select:{ WaterML:true}
        });
        const exercise = await prisma.dailyProgress.findMany({
            where: {
                PatientID: +req.params.id,
            },
            select: { Excercise:true }
        });

        const homeData = {
            walking,
            water,
            exercise
        }

        return responses.success(res, "Success for home", homeData);
    } catch (error) {
        console.log(error);
        next();
    }}

    export default homepage;