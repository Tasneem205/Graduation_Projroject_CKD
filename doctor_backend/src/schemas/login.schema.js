import Joi from "joi";

const userLogin = Joi.object({
    Email: Joi.string().email().required(),
    Password: Joi.string()
        .min(8)
        .required()
        .regex(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/)
        .messages({
            "object.regex":
                "Minimum eight characters, at least one upper case, one lower case, one number and one special character",
        }),
});

export default userLogin;