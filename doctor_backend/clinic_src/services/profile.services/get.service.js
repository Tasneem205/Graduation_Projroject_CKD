import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import jwt from "jsonwebtoken";

const prisma = new PrismaClient();

const profile = async (req, res, next) => {
    try{
        // TODO: implement me
        const role = req.body.role;
        const id = +req.body.id;
        if (role === "doctor") {
            const doctor = await prisma.doctors.findUnique(
                { where: {
                        DoctorID: id
                    }});
            if (!doctor) return  responses.notFound(res, "Doctor not found");
            return responses.success(res, "Doctor found!", doctor);
        } else {
            const assistant = await prisma.assistant.findUnique(
                { where: {
                        AssistantID: id
                    }});
            if (!assistant) return  responses.notFound(res, "assistant not found");
            return responses.success(res, "Assistant found!", assistant);
        }
    } catch (error) {
        console.log(error);
        next();
    }
}
const refreshToken = async (req, res, next) => {
    try {
        const refresh = req.headers.authorization.split(" ")[1];
        const isBlocked = await prisma.blackList.findFirst({
            where: { jwt: refresh },
        });
        if (isBlocked) return responses.unAuthorized(res, "invalid token");
        const { exp, iat, ...payload } = jwt.verify(
            refresh,
            process.env.JWT_SECRETR
        );
        // console.log(payload);
        if (Date.now() > exp * 1000)
            return responses.unAuthorized(res, "token expired");
        const accessToken = jwt.sign(payload, process.env.JWT_SECRET, {
            expiresIn: 10 * 60,
        });
        const newRefreshToken = jwt.sign(payload, process.env.JWT_SECRETR, {
            expiresIn: "7d",
        });
        await prisma.blackList.create({ data: { jwt: refresh, exp: exp } });
        return responses.success(res, "token renewed", {
            accessToken,
            newRefreshToken,
        });
    } catch (error) {
        responses.unAuthorized(res, "Token invalid");
        next(error);
    }
}

const logout = async (req, res, next) => {
    try {
        const { authorization } = req.headers;
        const token = authorization.split(" ")[1];
        const decodedToken = jwt.decode(token);
        await prisma.blackList.create({
            data: { jwt: token, exp: decodedToken.exp },
        });
        responses.success(res, "Logged out successfully");
    } catch (error) {
        console.log(error);
        next();
    }
};

const getFunctions = {
    profile,
    refreshToken,
    logout
}

export default getFunctions;