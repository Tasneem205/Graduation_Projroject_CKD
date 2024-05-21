import joi from "joi";

const createSchema = joi.object({
    FirstName: joi.string().min(3).max(20).required(),
    LastName: joi.string().min(3).max(20).required(),
    DateOfBirth: joi.string().regex(/^\d{4}-\d{2}-\d{2}$/).required(),
    Gender: joi.string().valid('male', 'female').required(),
    Email: joi.string().email().required(),
    DoctorID: joi.number().required(),
    Job: joi.string(),
    bloodGroup: joi.string().valid('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'),
    height: joi.number(),
    weight: joi.number(),
    assistantID: joi.number().required(),
    Phone: joi.string()
    .required()
    .min(11)
    .max(13)
    .regex(/^01[0-2][0-9]{8}$/),
});

const updateSchema = joi.object({
    FirstName: joi.string().min(3).max(20),
    LastName: joi.string().min(3).max(20),
    DateOfBirth: joi.string().regex(/^\d{2}-\d{2}-\d{4}$/).required(),
    Gender: joi.string().valid('male', 'female'),
    Email: joi.string().email(),
    DoctorID: joi.number(),
    Job: joi.string(),
    bloodGroup: joi.string().valid('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'),
    height: joi.number(),
    weight: joi.number(),
    assistantID: joi.number(),
    Phone: joi.string()
        .min(11)
        .max(13)
        .regex(/^01[0-2][0-9]{8}$/),
})

const patientSchemas = {
    createSchema,
    updateSchema
}

export default patientSchemas;