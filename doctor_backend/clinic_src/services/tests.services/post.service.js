import { PrismaClient } from "@prisma/client";
import axios from "axios";
import responses from "../../helpers/responses.js";
import createSchema from "../../schemas/test.schema.js"

const prisma = new PrismaClient();

const addTest = async (req, res, next) => {
    try {
        const { error, value } = createSchema.validate(req.body);
        if (error) return responses.badRequest(res, error.details[0].message);
        const { test_name, PatientID,
            assistant_id, DoctorID, pot, hemo, pcv, wbc, rbc,
            pc, pcc, ba, htn, dm, cad, appet, pe, ane, age,
            bp, bgr, bu, sc, sod, sg, al, su, rc} = value;
        const date = new Date();
        const testData = {
            "age": age, "specific gravity": sg, "albumin": al,
            "suger": su, "red_blood_cells": rbc, "pus_cells": pc,
            "pus _cell_clumps": pcc, "bacteria": ba, "hupertension": htn,
            "diabetes_mellitus": dm, "coronary_artery_disease": cad, "appetite": appet,
            "pedal_edema": pe, "Anemia": ane, "blood_pressure": bp,
            "blood_glucose_random": bgr, "blood_urea": bu, "serum_creatinine": sc,
            "Sodium": sod, "Potassium": pot, "Hemoglobin": hemo,
            "packed_cell_volume": pcv, "white_blood_cell_count": wbc, "red_blood_cell_count": rc
        }
        const flaskResponse = await axios.post('http://localhost:5000/predict', testData);
        console.log(flaskResponse);
        const new_test = await prisma.kidney_test.create({
            data: {
                test_name, TestDate: date.toISOString() , PatientID,
                assistant_id, DoctorID, pot, hemo, pcv, wbc, rbc,
                pc, pcc, ba, htn, dm, cad, appet, pe, ane, age,
                bp, bgr, bu, sc, sod, sg, al, su, rc, test_class: parseFloat(flaskResponse.data.prediction)
            },
        });
        return responses.success(res, "test done successfully", new_test);
    } catch (error) {
        console.log(error);
        next();
    }
};

const postFunctions = {
    addTest
}
export default postFunctions;