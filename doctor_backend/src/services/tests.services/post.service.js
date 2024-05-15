import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import createSchema from "../../schemas/test.schema.js"
import * as tf from "@tensorflow/tfjs";

const prisma = new PrismaClient();

const runModel = async (data) => {
    const modelPath = "../../../../tabular_model/model.json";
    const model = await tf.loadLayersModel(modelPath);
    const predictions = tf.tidy(() => {
        // Transform the data into tensors and cast the data into the correct expected data type
        // (in this case, the model expects a float tensor)
        const dataFrame = tf.tensor1d([data]);
        return model.predict(dataFrame).dataSync();
    });

    console.log("predictions are : ", predictions);
    return predictions[0];
};

const addTest = async (req, res, next) => {
    try {
        const { error, value } = createSchema.validate(req.body);
        if (error) return responses.badRequest(res, error.details[0].message);
        const { test_name, TestDate , PatientID,
            assistant_id, DoctorID, pot, hemo, pcv, wbc, rbc,
            pc, pcc, ba, htl, dm, cad, appet, pe, ane, age,
            bp, bgr, bu, sc, sod, sg, al, su, rc} = value;
        const new_test = await prisma.kidney_test.create[{
            data: {
                test_name, TestDate , PatientID,
                assistant_id, DoctorID, pot, hemo, pcv, wbc, rbc,
                pc, pcc, ba, htl, dm, cad, appet, pe, ane, age,
                bp, bgr, bu, sc, sod, sg, al, su, rc
            },
        }];
        /*
        sg, al, su, rbc, pc, pcc, ba, htn, dm,
        cad, appet, pe, ane, id, age, bp,
         bgr, bu, sc, sod, pot, hemo, pcv, wc, rc
         */
        // TODO: wbc => wc, rc, htl => htn,
        const test_class = runModel(Array(
            sg, al, su, rbc, pc, pcc, ba, htl, dm,
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