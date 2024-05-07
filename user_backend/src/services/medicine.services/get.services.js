import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getMedicine = async (req, res, next) => {
    try { // TODO: what if the id wasn't valid
        const medicine = await prisma.alarmmedicine.findMany({
            where: {
                PatientID : +req.params.id
            } 
        });
        return responses.success(res, "There are your medicines", medicine);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default getMedicine;