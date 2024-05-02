import joi from "joi";

const addSchema = joi.object({
    age,
    authority,
    examination_date,
    report_date,
    tests_scans,
    tests_scans_notes,
    notes,
    doctor_id,
    patient_id,
    assistant_id
});

const updateSchema = joi.object({

});

const reportsSchemas = {
    addSchema,
    updateSchema
};

export default reportsSchemas;