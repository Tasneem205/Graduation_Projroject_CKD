import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import fs from "fs";

const prisma = new PrismaClient();

const getAllAssistants = async (req, res, next) => {
    try {
        const assistants = await prisma.assistant.findMany({});
        const dataWithImages = assistants.map(doctor => {
            const imagePath = doctor.image_path;
            const imageData = fs.readFileSync(imagePath, 'base64');
            return {
                ...doctor,
                image_base64: imageData,
            };
        });
        return responses.success(res, "All assistants fetched!", dataWithImages);
    } catch (error) {
        console.log(error);
        next();
    }
};

const getAssistantWithId = async (req, res, next) => {
    try { // TODO: what if the id wasn't valid
        const assistant = await prisma.assistant.findUnique(
            { where: {
                AssistantID: +req.params.id
            }});
        const imageData = fs.readFileSync(assistant.imagePath, 'base64');
        const dataWithImage = {assistant, imageData};
        return responses.success(res, "Assistant found!", dataWithImage);
    } catch (error) {
        console.log(error);
        next();
    }
};

const getFunctions = {
    getAllAssistants,
    getAssistantWithId
}
export default getFunctions;