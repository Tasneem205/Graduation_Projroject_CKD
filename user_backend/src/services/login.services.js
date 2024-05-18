import responses from "../helpers/responses.js";
import { PrismaClient } from "@prisma/client";
import userLogin from "../schemas/login.schema.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

const prisma = new PrismaClient();

const login = async (req, res, next) => {
    try {
        const {value, error} = userLogin.validate(req.body);
        console.log(value);
        if (error) return responses.badRequest(res, error.details[0].message);
        const userExist = await prisma.patients.findUnique({
            where: { Email: value.Email }
        });
        console.log(userExist);
        if (!userExist) return responses.notFound(res, "email not found");
        const match = bcrypt.compareSync(value.Password, userExist.Password);
        if (!match) return responses.badRequest(res, "invalid email or password");
        const token = jwt.sign(
            {
                patient_id: userExist.patient_id,
                FirstName: userExist.FirstName,
                LastName: userExist.LastName,
            },
            process.env.JWT_SECRET,
            {expiresIn: "1d",}
        );
        const refreshToken = jwt.sign(
            {
                patient_id: userExist.patient_id,
                FirstName: userExist.FirstName,
                LastName: userExist.LastName,
            },
            process.env.JWT_SECRETR,
            {expiresIn: "7d",}
        );
        const {password: hashedPassword, ...restData} = userExist;
        return responses.success(res, "logged successfully", {
            ...restData,
            token,
            refreshToken,
        });
    } catch (error) {
        console.log(error);
        next();
    }
};

export default login;