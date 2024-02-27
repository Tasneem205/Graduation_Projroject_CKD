import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import updateschema from "../../schemas/update_assistant.schema.js";

const prisma = new PrismaClient();

const updateAssistant = async (req, res, next) => {
    try {
        // TODO: implement me
        const { value, error } = updateschema.validate(req.body);
        if (error) {
            return responses.badRequest(res, "this data isn't valid");
        }
        if (req.AssistantID != req.params.id) {
            return responses.unAuthorized(res, "You are not authorized to update this account");
        }
        let hashpass;
        if (value.Password) {
            hashpass = bcrypt.hashSync(value.Password, parseInt(process.env.SALT));
        }
        const userUpdated = await prisma.assistant.update({
            where: {
                AssistantID: +req.params.id,
            },
            data: { ...value, Password: hashpass },
        });
        const { Password, ...rest } = userUpdated;
        return responses.success(res, "user edited successfully", rest);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default updateAssistant;