import joi from "joi";

const addMedicine = joi.object({
    medicine_name: joi.string().required(),
    time: joi.string().regex(/^(0[1-9]|1[0-2]):[0-5][0-9](am|pm)$/).required(),
    dosage: joi.string().required(),
});


export default addMedicine;