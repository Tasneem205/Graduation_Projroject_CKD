import joi from "joi";

// function validateDate(value, helpers) {
//     if (!value.match(/^\d{4}-\d{2}-\d{2}$/)) {
//         return helpers.error('date invalid');
//     } else {
//         return value;
//     }
// }

const createSchema = joi.object({
    test_name: joi.string().required(),
    DoctorID: joi.number().required(),
    assistant_id: joi.number().required(),
    PatientID: joi.number().required(),
    pot: joi.number().precision(4).required(),
    hemo: joi.number().precision(4).required(),
    pcv: joi.number().precision(4).required(),
    wbc: joi.number().precision(4).required(),
    rbc: joi.string().required(),
    pc: joi.string().required(),
    pcc: joi.string().required(),
    ba: joi.string().required(),
    htn: joi.string().required(),
    dm: joi.string().required(),
    cad: joi.string().required(),
    appet: joi.string().required(),
    pe: joi.string().required(),
    ane: joi.string().required(),
    age: joi.number().required(),
    bp: joi.number().precision(4).required(),
    bgr: joi.number().precision(4).required(),
    bu: joi.number().precision(4).required(),
    sc: joi.number().precision(4).required(),
    sod: joi.number().precision(4).required(),
    sg: joi.number().precision(4).required(),
    al: joi.number().required(),
    su: joi.number().precision(4).required(),
    rc: joi.number().precision(4).required()
});

export default createSchema;