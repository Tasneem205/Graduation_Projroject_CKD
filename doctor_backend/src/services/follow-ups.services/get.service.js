import { PrismaClient } from "@prisma/client";
import responses from "../../helper/responses.js";
import {channel} from "diagnostics_channel";

const prisma = new PrismaClient();

const getAllFollowUps = async (req, res) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
    }
};

const getFollowUpWithPatientId = async (req, res) => {
    try {
        // TODO: implement me
    } catch (error) {
        console.log(error);
    }
};

const getFollowUpWithTimestamp = async (req, res) => {
    try {

    } catch (error) {
        console.log(error);
    }
}
const getFunctions = {
    getAllFollowUps,
    getFollowUpWithPatientId,
    getFollowUpWithTimestamp
}
export default getFunctions;