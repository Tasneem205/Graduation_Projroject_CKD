import responses from "../../helpers/responses.js";
import { PrismaClient } from "@prisma/client";
import userLogin from "../../schemas/login.schema.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

const prisma = new PrismaClient();

const assistantLogin = async (req, res, next) => {
    try {
        const {error, value} = userLogin.validate(req.body);
        if (error) return responses.badRequest(res, error.details[0].message);
        const userExist = await prisma.assistant.findUnique(
            { where: {
                    Email: value.Email
                } });
        if (!userExist) return responses.notFound(res, "email not found");
        const match = bcrypt.compareSync(value.Password, userExist.Password);
        if (!match) return responses.badRequest(res, "invalid email or password");
        const token = jwt.sign(
            {
                AssistantID: userExist.AssistantID,
                FirstName: userExist.FirstName,
                LastName: userExist.LastName,
            },
            process.env.JWT_SECRET,
            { expiresIn: "1d", }
        );
        const refreshToken = jwt.sign(
            {
                AssistantID: userExist.AssistantID,
                FirstName: userExist.FirstName,
                LastName: userExist.LastName,
            },
            process.env.JWT_SECRETR,
            { expiresIn: "7d", }
        );
        const { password: hashedpassword, ...restData } = userExist;
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

const postFunctions = {

}