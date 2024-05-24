import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import userSchema from "../../schemas/user.schema.js"
import bcrypt from "bcrypt";

const prisma = new PrismaClient();

const addAssistant = async (req, res, next) => {
    try {
        const { error, value } = userSchema.validate(req.body);
        if (error) return responses.badRequest(res, error.details[0].message);
        const { FirstName, LastName, Email, Password, PhoneNumber} = value;
        const emailExist = await prisma.assistant.findUnique({ where: { Email: Email } });
        if (emailExist) return responses.badRequest(res, "email already exist");
        const hashedPass = bcrypt.hashSync(Password, parseInt(process.env.SALT));
        const user = await prisma.assistant.create({
          data: {
            FirstName,
            LastName,
            Password: hashedPass,
            Email,
            Phone_num: PhoneNumber,
            image_path: req.file ? req.file.path : "undefined image"
          },
        });
        const { password: hashed, ...restInfo } = user;
        return responses.success(
          res,
          "Assistant created successfully",
          restInfo
        );        
    } catch (error) {
        console.log(error);
        next();
    }
};



const postFunctions = {
    addAssistant,
}

export default postFunctions;