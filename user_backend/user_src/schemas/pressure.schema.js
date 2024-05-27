import joi from "joi";
const pressureSchema = joi.object({
    pressureHigh: joi.number()
        .min(2)
        .required(),
        
    pressureLow: joi.number()
        .min(2)
        .required(),

    heart_rate:  joi.number()
        .required()
})

export default pressureSchema;