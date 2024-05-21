import responses from "../../helpers/responses.js";
import { PrismaClient } from "@prisma/client";
import userLogin from "../../schemas/login.schema.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

const prisma = new PrismaClient();

const login = async (req, res, next) => {
    try {
        const {value, error} = userLogin.validate(req.body);
        if (error) return responses.badRequest(res, error.details[0].message);
        const assisExist = await prisma.assistant.findUnique(
            { where: {
                    Email: value.Email
                } });
        const docExist = await prisma.doctors.findUnique(
            { where: {
                    Email: value.Email
                } });
        if (!assisExist && !docExist) return responses.notFound(res, "email not found");
        if (assisExist) {
            const match = bcrypt.compareSync(value.Password, assisExist.Password);
            if (!match) return responses.badRequest(res, "invalid email or password");
            const token = jwt.sign(
                {
                    id: assisExist.AssistantID,
                    FirstName: assisExist.FirstName,
                    LastName: assisExist.LastName,
                },
                process.env.JWT_SECRET,
                {expiresIn: "1d",}
            );
            const refreshToken = jwt.sign(
                {
                    id: assisExist.AssistantID,
                    FirstName: assisExist.FirstName,
                    LastName: assisExist.LastName,
                },
                process.env.JWT_SECRETR,
                {expiresIn: "7d",}
            );
            const {password: hashedPassword, ...restData} = assisExist;
            res.download(assisExist.image_path);
            return responses.success(res, "logged successfully", {
                "role": "Assistant",
                ...restData,
                token,
                refreshToken,
            });
        } else {
            const match = bcrypt.compareSync(value.Password, docExist.Password);
            if (!match) return responses.badRequest(res, "invalid email or password");
            const token = jwt.sign(
                {
                    AssistantID: docExist.DoctorID,
                    FirstName: docExist.FirstName,
                    LastName: docExist.LastName,
                },
                process.env.JWT_SECRET,
                {expiresIn: "1d",}
            );
            const refreshToken = jwt.sign(
                {
                    AssistantID: docExist.DoctorID,
                    FirstName: docExist.FirstName,
                    LastName: docExist.LastName,
                },
                process.env.JWT_SECRETR,
                {expiresIn: "7d",}
            );
            const {password: hashedPassword, ...restData} = docExist;
            res.download(docExist.image_path, function(err){
                if (err) {
                    // Handle error
                    console.error('Error downloading file:', err);
                    res.status(500).send('Internal Server Error');
                } else {
                    // File has been sent successfully
                    console.log('File sent successfully');
                }
            });
            return responses.success(res, "logged successfully", {
                "role": "Doctor",
                ...restData,
                token,
                refreshToken,
            });
        }
    } catch (error) {
        console.log(error);
        next();
    }
};

export default login;