import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getMedicine = async (req, res, next) => {
    try {
        const medicine = await prisma.alarmmedicine.findMany({
            where: {
                PatientID : +req.params.id
            } 
        });
        let med = {};
        for (let i = 0; i < medicine.length; i++) {
            if (med.hasOwnProperty(medicine[i].time)) {
                med[medicine[i].time].push(medicine[i]);
            } else {
                med[medicine[i].time] = [medicine[i]];
            }
        }
        return responses.success(res, "There are your medicines", med);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default getMedicine;