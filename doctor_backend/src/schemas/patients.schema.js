import joi from "joi";

function validateDate(value, helpers) {
    if (!value.match(/^\d{4}-\d{2}-\d{2}$/)) {
        return helpers.error('date invalid');
    } else {
        return value;
    }
};

const createSchema = joi.object({
    FirstName: joi.string().min(3).max(20).required(),
    LastName: joi.string().min(3).max(20).required(),
    DateOfBirth: joi.date().custom(validateDate).required(),
    Gender: joi.string().valid('male', 'female').required(),
    Email: joi.string().email().required(),
    DoctorID: joi.number().required(),
    Job: joi.string(),
    bloodGroup: joi.string().valid('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'),
    height: joi.number(),
    weight: joi.number(),
    assistantID: joi.number().required(),
    registrationDate: joi.date().custom(validateDate).required()
});

const updateSchema = joi.object({
    FirstName: joi.string().min(3).max(20),
    LastName: joi.string().min(3).max(20),
    DateOfBirth: joi.date().custom(validateDate),
    Gender: joi.string().valid('male', 'female'),
    Email: joi.string().email(),
    DoctorID: joi.number(),
    Job: joi.string(),
    bloodGroup: joi.string().valid('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'),
    height: joi.number(),
    weight: joi.number(),
    assistantID: joi.number(),
    registrationDate: joi.date().custom(validateDate)
})

const patientSchemas = {
    createSchema,
    updateSchema
}

export default patientSchemas;