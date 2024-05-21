import joi from "joi";

const walkingSchema = joi.object({
    WalkingTime: joi.string()
        .regex(/^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/),
        
    WalkingSteps: joi.number()
});
export default walkingSchema;
