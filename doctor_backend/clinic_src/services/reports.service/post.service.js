import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import reportsSchemas from "../../schemas/report.schema.js"
const prisma = new PrismaClient();

const addReport = async (req, res, next) => {
    try {
        const { error, value } = reportsSchemas.addSchema.validate(req.body);
        if (error) return responses.badRequest(res, error.details[0].message);
        const { age, authority,
            examination_date, report_date,
            tests_scans, tests_scans_notes,
            notes, doctor_id,
            patient_id, assistant_id } = value;
        const data = await prisma.reports.create({
            data: {
                age, authority,
                examination_date, report_date,
                tests_scans, tests_scans_notes,
                notes, doctor_id,
                patient_id, assistant_id
            },
        });
        return responses.success(res, "Report created successfully", data);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default addReport;