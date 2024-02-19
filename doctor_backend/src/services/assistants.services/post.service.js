import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses";

const prisma = new PrismaClient();

const addAssistant = async (req, res) => {
    try {
        // TODO: implement me
        return responses.success(200, "this is a success message");
    } catch (error) {
        console.log(error);
    }
};

const assistantLogin = async (req, res) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
    }
};

const postFunctions = {
    addAssistant,
    assistantLogin
}

export default postFunctions;