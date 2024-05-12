import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import fs from "fs";

const prisma = new PrismaClient();

const deleteAssistant = async (req, res, next) => {
    try {
        const user = await prisma.assistant.delete(
            { where: {
                AssistantID : +req.params.id
            } });
        fs.unlink(user.image_path, (err) => {
            if (err) {
                console.error('Error deleting file:', err);
                return;
            }
            console.log('File deleted successfully');
        });
        return responses.success(res, "Assistant deleted successfully", user);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default deleteAssistant;