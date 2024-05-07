import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const deleteMedicine = async (req, res, next) => {
    try {
        const medicine = await prisma.alarmmedicine.delete(
            { where: {
                PatientID : +req.params.id
            } });
        return responses.success(res, "Medicine deleted successfully", medicine);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default deleteMedicine;