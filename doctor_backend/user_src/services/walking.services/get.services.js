import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const AllWalking = async (req, res, next) => {
    try {
        const walking = await prisma.dailyProgress.findMany({
            where: {
                PatientID: +req.params.id,
            },
            select:{ WalkingSteps:true, WalkingTime:true}
        });
        return responses.success(res, "Total steps", walking);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default AllWalking;