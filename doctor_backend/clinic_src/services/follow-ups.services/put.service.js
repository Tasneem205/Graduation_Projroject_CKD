import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const updateFollowUp = async (req, res, next) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
        next();
    }
};

export default updateFollowUp;