import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getAllAssistants = async (req, res) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
    }
};

const getAssistantWithId = async (req, res) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
    }
};
const getFunctions = {
    getAllAssistants,
    getAssistantWithId
}
export default getFunctions;