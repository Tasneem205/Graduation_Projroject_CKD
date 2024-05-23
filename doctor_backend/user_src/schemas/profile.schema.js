import joi from "joi";

const profileSchema = joi.object({
    FirstName: joi.string()
        .min(3)
        .max(40)
        .regex(/^[a-z ,.']+$/i)
        .required(),
    LastName: joi.string()
        .min(3)
        .max(40)
        .regex(/^[a-z ,.']+$/i)
        .required(),
    Email: joi.string().email(),
    Password: joi.string()
        .min(8)
        .required()
        .regex(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/)
        .messages({
            "object.regex":
                "Minimum eight characters, at least one upper case, one lower case, one number and one special character",
        }),

    Phone: joi.string()
        .min(11)
        .required()
        .regex(/^(01)\d{11}$/),

    Job: joi.string()
        .min(3)
        .max(40)
        .regex(/^[a-z ,.']+$/i),

    hieght: joi.number()
        .precision(3),
        
    weight: joi.number()
        .precision(3),
    
});

const updateProfileSchema = joi.object({
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

    Phone: joi.string()
        .min(11)
        .regex(/^(01)\d{11}$/),

    Job: joi.string()
        .min(3)
        .max(40)
        .regex(/^[a-z ,.']+$/i),

    hieght: joi.number()
        .precision(3),

    weight: joi.number()
        .precision(3),
});

const schemas = {
    profileSchema,
    updateProfileSchema
}
export default schemas;