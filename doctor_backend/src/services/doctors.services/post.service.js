import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const addDoctor = async (req, res, next) => {
    try {
        // TODO: implement me
        return responses.success(200, "this is a success message");
    } catch (error) {
        console.log(error);
        next();
    }
};

const doctorLogin = async (req, res, next) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
        next();
    }
};

const postFunctions = {
    addDoctor,
    doctorLogin
}

export default postFunctions;