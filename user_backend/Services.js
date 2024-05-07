import { PrismaClient } from "@prisma/client";
import responses from "src/helpers/responses.js";

const prisma = new PrismaClient();


const addWater = async (req, res, next) => {
    try {
        // TODO: implement me
        return responses.success(200, "this is a success message");
    } catch (error) {
        console.log(error);
        next();
    }
};



const postFunctions = {
    addWater,
    doctorLogin
}

export default postFunctions;