import Joi from "joi";

const userLogin = Joi.object({
    Email: Joi.string().email().required(),
    Password: Joi.string()
        .min(8)
        .required()
});

export default userLogin;