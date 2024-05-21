import { PrismaClient } from "@prisma/client";
import patientSchemas from "../../schemas/patients.schema.js"
import responses from "../../helpers/responses.js";
import bcrypt from "bcrypt";

const prisma = new PrismaClient();

const addPatient = async (req, res, next) => {
    try {
        const { error, value } = patientSchemas.createSchema.validate(req.body);
        if (error) {
            console.log(error);
            return responses.badRequest(res, `data isn't valid`);
        }
        console.log(value);
        const { FirstName, LastName, DateOfBirth, Gender, Email, DoctorID,
            Job, bloodGroup, height ,weight, assistantID, Phone} = value;
        const hashedPass = bcrypt.hashSync((value.FirstName + "_" + value.LastName), parseInt(process.env.SALT));
        const date = new Date()
        const newPatient = await prisma.patients.create({
            data: {
                FirstName: FirstName,
                LastName: LastName,
                DateOfBirth: DateOfBirth + 'T00:00:00.335Z',
                Gender: Gender,
                Email: Email,
                DoctorID: DoctorID,
                Job: Job,
                bloodGroup: bloodGroup,
                hieght: height,
                weight: weight,
                assistantID: assistantID,
                Phone: Phone,
                Password: hashedPass,
                registrationDate: date.toISOString(),
                image_path: req.file? req.file.path : ""
            }
        });
        return responses.success(res, "patient added successfully", newPatient);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default addPatient;