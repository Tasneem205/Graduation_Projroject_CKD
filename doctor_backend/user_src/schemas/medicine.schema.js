import joi from "joi";

const addMedicine = joi.object({
    medication_name: joi.string()
    .required(),

    dosage: joi.string()
    .required(),
});


export default addMedicine;