import { PrismaClient } from "@prisma/client";
import responses from "../../helper/responses";

const prisma = new PrismaClient();

const addDoctor = async (req, res) => {
    try {
        // TODO: implement me
        return responses.success(200, "this is a success message");
    } catch (error) {
        console.log(error);
    }
};

const doctorLogin = async (req, res) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
    }
};

const postFunctions = {
    addDoctor,
    doctorLogin
}

export default postFunctions;