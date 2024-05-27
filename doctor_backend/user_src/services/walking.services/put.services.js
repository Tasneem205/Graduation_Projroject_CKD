import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import walkingSchema from "../../schemas/walking.schema.js";

const prisma = new PrismaClient();

const updateWalking = async (req, res, next) => {
    try {
        const { error, value } = walkingSchema.validate(req.body);
        if (error) return responses.badRequest(res, error);
        const { WalkingTime, WalkingSteps} = value;
        
        const updatesteps = await prisma.dailyProgress.update({
            where: {
                PatientID: +req.params.id,
            },
            data: { WalkingSteps, WalkingTime },
        });
        return responses.success(res, "Walking edited successfully", updatesteps);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default updateWalking;