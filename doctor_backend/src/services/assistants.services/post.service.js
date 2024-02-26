import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import userLogin from "../../schemas/login.schema.js";
import userSchema from "../../schemas/user.schema.js"
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken"

const prisma = new PrismaClient();

const addAssistant = async (req, res, next) => {
    try {
        const { error, value } = userSchema.validate(req.body);
        if (error) return responses.badRequest(res, error.details[0].message);
        const { FirstName, LastName, Email, Password} = value;
        const emailExist = await prisma.assistant.findUnique({ where: { Email: Email } });
        if (emailExist) return responses.badRequest(res, "email already exist");
        const hashedPass = bcrypt.hashSync(Password, parseInt(process.env.SALT));
        const user = await prisma.assistant.create({
          data: {
            FirstName,
            LastName,
            Password: hashedPass,
            Email,
          },
        });
        const { password: hashed, ...restInfo } = user;
        return responses.success(
          res,
          "User created successfully",
          restInfo
        );        
    } catch (error) {
        console.log(error);
        next();
    }
};

const assistantLogin = async (req, res, next) => {
    try {
        const {error, value} = userLogin.validate(req.body);
        if (error) return responses.badRequest(res, error.details[0].message);
        const userExist = await prisma.assistant.findUnique({ where: { Email: value.Email } });
        if (!userExist) return responses.notFound(res, "email not found");
        const match = bcrypt.compareSync(value.Password, userExist.Password);
        if (!match) return responses.badRequest(res, "invalid email or password");
        const token = jwt.sign(
            {
                id: userExist.id,
                firstname: userExist.FirstName,
                lastname: userExist.LastName,
            },
            process.env.JWT_SECRET,
            { expiresIn: "1d", }
        );
        const refreshToken = jwt.sign(
            {
                id: userExist.id,
                firstname: userExist.FirstName,
                lastname: userExist.LastName,
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
    addAssistant,
    assistantLogin
}

export default postFunctions;