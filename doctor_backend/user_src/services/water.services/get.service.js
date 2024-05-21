import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const allWater = async (req, res, next) => {
    try {

        const water = await prisma.dailyProgress.findMany({
            where: {
                PatientID: +req.params.id,
            },
            select:{ WaterML:true}
        });
        return responses.success(res, "Total amount of Water", water);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default allWater;