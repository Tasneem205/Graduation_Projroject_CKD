import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import createSchema from "../../schemas/test.schema.js"

const prisma = new PrismaClient();
// TODO: the model requires age and id so we have to send them

const runModel = (data) => {
    let result;
    // test_name    String
    // TestDate     DateTime
    // PatientID    Int
    // assistant_id Int
    // DoctorID     Int
    // pot          Float
    // hemo         Float
    // pcv          Float
    // wbc          Float
    // rbc          Float
    // pc           String
    // pcc          String
    // ba           String
    // htl          String
    // dm           String
    // cad          String
    // appet        String
    // pe           String
    // ane          String
    // age          Int
    // bp           String
    // bgr          Float
    // bu           Float
    // sc           Float
    // sod          Float
    // sg           String
    // al           String
    // su           String
    return result;
};

const addTest = async (req, res, next) => {
    try {
        const { error, value } = createSchema.validate(req.body);
        if (error) return responses.badRequest(res, error.details[0].message);
        const { test_name, TestDate , PatientID,
            assistant_id, DoctorID, pot, hemo, pcv, wbc, rbc,
            pc, pcc, ba, htl, dm, cad, appet, pe, ane, age,
            bp, bgr, bu, sc, sod, sg, al, su} = value;
        const new_test = await prisma.kidney_test.create[{
            data: {
                test_name, TestDate , PatientID,
                assistant_id, DoctorID, pot, hemo, pcv, wbc, rbc,
                pc, pcc, ba, htl, dm, cad, appet, pe, ane, age,
                bp, bgr, bu, sc, sod, sg, al, su
            },
        }];
        const test_class = runModel({ TestID: new_test.TestID, pot, hemo, pcv, wbc, rbc,
            pc, pcc, ba, htl, dm, cad, appet, pe, ane, age,
            bp, bgr, bu, sc, sod, sg, al, su});
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