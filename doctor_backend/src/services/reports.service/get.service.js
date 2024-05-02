import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getAllReports = async (req, res, next) => {
    try {
        const allReports = await prisma.reports.findMany();
        return responses.success(res, "all reports fetched", allReports);
    } catch (error) {
        console.log(error);
        next();
    }
};

const getReportById = async (req, res, next) => {
    try {
        const id = +req.params.id;
        const report = await prisma.reports.findUnique({
            where: {report_id: id}
        });
        return responses.success(res, "report fetched", report);
    } catch (error) {
        console.log(error);
        next();
    }
}

const functions = {
    getAllReports,
    getReportById
}
export default functions;