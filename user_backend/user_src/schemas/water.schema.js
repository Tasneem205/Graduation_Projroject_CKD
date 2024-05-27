import joi from "joi";

const waterSchema = joi.object({
    WaterML: joi.number()
    .max(3)
});
export default waterSchema;