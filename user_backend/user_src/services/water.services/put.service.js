import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import waterSchema from "../../schemas/water.schema.js";

const prisma = new PrismaClient();

const updatewater = async (req, res, next) => {
    try {
        const { error, value } = waterSchema.validate(req.body);
        if (error) return responses.badRequest(res, error);
        const { WaterML} = value;
        
        const Updatewater = await prisma.dailyProgress.update({
            where: {
                PatientID: +req.params.id,
            },
            data: { WaterML },
        });
        return responses.success(res, "water edited successfully", Updatewater);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default updatewater;