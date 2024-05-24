import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import jwt from "jsonwebtoken";
import fs from "fs";

const prisma = new PrismaClient();

const profile = async (req, res, next) => {
    try{
        const id = +req.params.id;
        const patient = await prisma.patients.findUnique({
            where: { PatientID: id }
        });
        if (!patient) return  responses.notFound(res, "User not found");
        const image = fs.readFileSync(patient.imagePath, 'base64');
        const pressure = await prisma.pressure.findFirst({
            where: { PatientID: id }
        });
        const diabetes = await prisma.diabetes.findFirst({
            where: {PatientID: id}
        });
        let pres = "";
        let heartRate = ""
        if (pressure) {
            pres = pressure.pressureHigh + "/" + pressure.pressureLow;
            heartRate = pressure.heart_rate;
        } else {
            pres = "0/0";
            heartRate = "0";
        }
        let d;
        if (diabetes)
            d = diabetes.diabetes_value;
        else
            d = 0;
        const response = {"profile data": patient,
                               "image": image,
                               "pressure": pres,
                               "heart rate": heartRate,
                               "diabetes": d};
        return responses.success(res, "User found!", response);
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
        await prisma.blackList.create[{ data: { jwt: refresh, exp: exp } }];
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