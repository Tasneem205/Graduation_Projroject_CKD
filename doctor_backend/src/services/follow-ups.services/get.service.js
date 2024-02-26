import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getAllFollowUps = async (req, res, next) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
        next();
    }
};

const getFollowUpWithPatientId = async (req, res, next) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
        next();
    }
};

const getFollowUpWithTimestamp = async (req, res, next) => {
    try {

    } catch (error) {
        console.log(error);
        next();
    }
}
const getFunctions = {
    getAllFollowUps,
    getFollowUpWithPatientId,
    getFollowUpWithTimestamp
}
export default getFunctions;