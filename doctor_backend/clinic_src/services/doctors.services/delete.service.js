import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import fs from "fs"
const prisma = new PrismaClient();

const deleteDoctor = async (req, res, next) => {
    try {
        const user = await prisma.doctors.delete({
            where: { DoctorID : +req.params.id }
        });
        if (user.image_path !== "undefined images") {
            fs.unlink(user.image_path, (err) => {
                if (err) {
                    console.error('Error deleting file:', err);
                    return;
                }
                console.log('File deleted successfully');
            });
        }
        return responses.success(res, "Doctor deleted successfully", user);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default deleteDoctor;