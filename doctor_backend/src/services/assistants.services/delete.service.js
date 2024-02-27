import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const deleteAssistant = async (req, res, next) => {
    try {
        const user = await prisma.assistant.delete({where: { id : +req.params.id } });
        return responses.success(res, "Assistant deleted successfully", user);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default deleteAssistant;