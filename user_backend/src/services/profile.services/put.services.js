import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import profileSchema from "../../schemas/profile.schema.js";

const prisma = new PrismaClient();

const updateProfile = async (req, res, next) => {
    try {
       const { value, error } = profileSchema.validate(req.body);
        if (error) {
            return responses.badRequest(res, "this data isn't valid");
        }
        const profileData = await prisma.patients.update({
            where: {
                patientID: +req.params.id,
            },
            data: {...value},
        });
        return responses.success(res, "user edited successfully", profileData);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default updateProfile;
