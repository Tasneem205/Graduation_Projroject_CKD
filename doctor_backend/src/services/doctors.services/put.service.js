import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import updateSchema from "../../schemas/update_assistant.schema.js";
import bcrypt from "bcrypt";

const prisma = new PrismaClient();

const updateDoctor = async (req, res, next) => {
    try {
        const {value, error} = updateSchema.validate(req.body);
        console.log(value);
        if (error) {
            return responses.badRequest(res, "this data isn't valid due to : ", error);
        }
        console.log("after validation");
        if (+value.DoctorID !== +req.params.id) {
            return responses.unAuthorized(res, "You are not authorized to update this account");
        }
        console.log("after authorization");
        if (req.file) {
            const userUpdated = await prisma.doctors.update({
                where: {
                    DoctorID: +req.params.id,
                },
                data: {image_path: req.file.path},
            });
        }
        console.log("after updating in database");
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
        return responses.success(res, "doctor updated successfully", rest);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default updateDoctor;