import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import createSchema from "../../schemas/test.schema.js"
import fs from "fs";
import tf from "@tensorflow/tfjs";

const prisma = new PrismaClient();

const runModel = async (data) => {
    const modelPath = './model.json';
    const modelData = fs.readFileSync(modelPath, 'utf8');
    try {
        const modelJSON = JSON.parse(modelData);
        const model = await tf.loadLayersModel(modelJSON);
        const predictions = tf.tidy(() => {
            const dataFrame = tf.tensor2d([data]);
            return model.predict(dataFrame).dataSync();
        });
        console.log("predictions are : ", predictions);
        return predictions[0];
    } catch (e) {
        console.log("parsing error")
        console.log(e);
    }
};

const addTest = async (req, res, next) => {
    try {
        const { error, value } = createSchema.validate(req.body);
        if (error) return responses.badRequest(res, error.details[0].message);
        const { test_name, PatientID,
            assistant_id, DoctorID, pot, hemo, pcv, wbc, rbc,
            pc, pcc, ba, htn, dm, cad, appet, pe, ane, age,
            bp, bgr, bu, sc, sod, sg, al, su, rc} = value;
        const date = new Date();
        const new_test = await prisma.kidney_test.create({
            data: {
                test_name, TestDate: date.toISOString() , PatientID,
                assistant_id, DoctorID, pot, hemo, pcv, wbc, rbc,
                pc, pcc, ba, htn, dm, cad, appet, pe, ane, age,
                bp, bgr, bu, sc, sod, sg, al, su, rc
            },
        });
        const test_class = runModel(Array(
            sg, al, su, rbc, pc, pcc, ba, htn, dm,
            cad, appet, pe, ane, new_test.TestID, age, bp,
            bgr, bu, sc, sod, pot, hemo, pcv, wbc, rc));

        const addResult = await prisma.kidney_test.update[{
            where: {test_id: new_test.TestID},
            data: {test_class}
        }];
        return responses.success(res, "test done successfully", addResult);
    } catch (error) {
        console.log(error);
        next();
    }
};

const postFunctions = {
    addTest
}
export default postFunctions;