import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import updateSchema from "../../schemas/update_assistant.schema.js";
import bcrypt from "bcrypt";

const prisma = new PrismaClient();

const updateDoctor = async (req, res, next) => {
    try {
        const {value, error} = updateSchema.validate(req.body);
        if (error) {
            return responses.badRequest(res, "this data isn't valid");
        }
        if (req.DoctorID !== req.params.id) {
            return responses.unAuthorized(res, "You are not authorized to update this account");
        }
        let hashPass;
        if (value.Password) {
            hashPass = bcrypt.hashSync(value.Password, parseInt(process.env.SALT));
        }
        const userUpdated = await prisma.doctors.update({
            where: {
                DoctorID: +req.params.id,
            },
            data: {...value, Password: hashPass},
        });
        const {Password, ...rest} = userUpdated;
    } catch (error) {
        console.log(error);
        next();
    }
};

export default updateDoctor;