import joi from "joi";

const updateSchema = joi.object({
    FirstName: joi.string()
        .min(3)
        .max(40)
        .regex(/^[a-z ,.']+$/i),
    LastName: joi.string()
        .min(3)
        .max(40)
        .regex(/^[a-z ,.']+$/i),
    Email: joi.string().email(),
    Password: joi.string()
        .min(8)
        .regex(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/)
        .messages({
            "object.regex":
                "Minimum eight characters, at least one upper case, one lower case, one number and one special character",
        }),
    PhoneNumber: joi.string()
        .min(11)
        .max(13)
        .regex(/^01[0-2][0-9]{8}$/),
    DoctorID: joi.number(),
});

export default updateSchema;