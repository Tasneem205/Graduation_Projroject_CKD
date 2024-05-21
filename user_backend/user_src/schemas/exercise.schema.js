import joi from "joi";

const exerciseSchema = joi.object({
    Excercise: joi.string()
        .regex(/^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/),
        
});
export default exerciseSchema;