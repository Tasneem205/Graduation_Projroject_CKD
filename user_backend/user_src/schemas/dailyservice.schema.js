import joi from "joi";


const waterSchema = joi.object({
    WaterML: joi.number()
});

const walkingSchema = joi.object({
    WalkingTime: joi.string()
        .regex(/^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/),
        
    WalkingSteps: joi.number()
});

const exerciseSchema = joi.object({
    Excercise: joi.string()
        .regex(/^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/),
        
});

const progress={
    waterSchema,
    walkingSchema,
    exerciseSchema,
}
export default progress;