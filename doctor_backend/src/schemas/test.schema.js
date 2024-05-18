import joi from "joi";

const createSchema = joi.object({
    test_name: joi.string(),
    DoctorID: joi.number().required(),
    assistant_id: joi.number().required(),
    PatientID: joi.number().required(),
    pot: joi.number().precision(4),
    hemo: joi.number().precision(4),
    pcv: joi.number().precision(4),
    wbc: joi.number().precision(4),
    rbc: joi.number().precision(4),
    pc: joi.number().precision(4),
    pcc: joi.number().precision(4),
    ba: joi.number().precision(4),
    htn: joi.number().precision(4),
    dm: joi.number().precision(4),
    cad: joi.number().precision(4),
    appet: joi.number().precision(4),
    pe: joi.number().precision(4),
    ane: joi.number().precision(4),
    age: joi.number(),
    bp: joi.number().precision(4),
    bgr: joi.number().precision(4),
    bu: joi.number().precision(4),
    sc: joi.number().precision(4),
    sod: joi.number().precision(4),
    sg: joi.number().precision(4),
    al: joi.number(),
    su: joi.number().precision(4),
    rc: joi.number().precision(4)
});

export default createSchema;