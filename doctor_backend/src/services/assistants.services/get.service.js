import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getAllAssistants = async (req, res, next) => {
    try {
        const assistants = await prisma.assistant.findMany({});
        return responses.success(res, "All assistants fetched!", assistants);
    } catch (error) {
        console.log(error);
        next();
    }
};

const getAssistantWithId = async (req, res, next) => {
    try { // TODO: what if the id wasn't valid
        const assistant = await prisma.assistant.findUnique({ where: { id: +req.params.id } });
        return responses.success(res, "Assistant found!", assistant);
    } catch (error) {
        console.log(error);
        next();
    }
};

const logoutAssistant = async (req, res, next) => {
    try {
        const { authorization } = req.headers;
        const token = authorization.split(" ")[1];
        const decodedToken = jwt.decode(token);
        await prisma.blackList.create({
        data: { jwt: token, exp: decodedToken.exp },
        });
        responses.success(res, "Logged out successfully");
    } catch (error) {
        console.log(error);
        next();
    }
};

const getFunctions = {
    getAllAssistants,
    getAssistantWithId,
    logoutAssistant
}
export default getFunctions;