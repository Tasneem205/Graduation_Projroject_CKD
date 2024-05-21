import joi from "joi";

const diabetesSchema = joi.object({
    diabetes_value: joi.number()
        .min(2)
        .required()
})

export default diabetesSchema;