import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const deleteReport = async (req, res, next) => {
    try {
        const id = +req.params.id;
        const deleteReport = prisma.reports.delete({
            where: {report_id: id}
        });
        return responses.success(res, "report deleted successfully", deleteReport);
    } catch (error) {
        console.log(error);
        next();
    }
}

export default deleteReport;