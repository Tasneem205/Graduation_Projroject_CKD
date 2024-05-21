import joi from "joi";

const createMedicationSchema = joi.object({
    medication_name: joi.string().required(),
    dosage_form: joi.string().required(),
    manufacturer: joi.string().required(),
    generic_name: joi.string().required(),
    therapeutic_class: joi.string().required(),
});

const updateMedicationSchema = joi.object({
    medication_name: joi.string(),
    dosage_form: joi.string(),
    manufacturer: joi.string(),
    generic_name: joi.string(),
    therapeutic_class: joi.string(),
});

const medicationSchemas = {
    createMedicationSchema,
    updateMedicationSchema
}

export default medicationSchemas;