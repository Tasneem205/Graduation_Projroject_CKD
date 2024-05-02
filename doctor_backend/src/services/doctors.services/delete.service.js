import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const deleteDoctor = async (req, res, next) => {
    try {
        const user = await prisma.doctors.delete({
            where: { DoctorID : +req.params.id }
        });
        return responses.success(res, "Doctor deleted successfully", user);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default deleteDoctor;