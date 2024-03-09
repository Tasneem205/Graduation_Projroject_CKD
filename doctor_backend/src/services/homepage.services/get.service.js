import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import jwt from "jsonwebtoken";

const prisma = new PrismaClient();

const getHomepageData = async (req, res, next) => {
    try{

    } catch (error) {
        console.log(error);
        next();
    }
}

// const RefreshToken = async (req, res, next) => {
//     try{
//
//     } catch (error) {
//         console.log(error);
//         next();
//     }
// }
//
// const logout = async (req, res, next) => {
//     try {
//         const { authorization } = req.headers;
//         const token = authorization.split(" ")[1];
//         const decodedToken = jwt.decode(token);
//         await prisma.blackList.create({
//             data: { jwt: token, exp: decodedToken.exp },
//         });
//         responses.success(res, "Logged out successfully");
//     } catch (error) {
//         console.log(error);
//         next();
//     }
// };

export default getHomepageData;