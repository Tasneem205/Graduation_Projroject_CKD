import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import medicationSchemas from "../../schemas/medication.schema.js"
const prisma = new PrismaClient();

const getAllMedicines = async (req, res, next) => {
    try {
        const allMed = await prisma.medications.findMany();
        return responses.success(res, "All medications", allMed);
    } catch (e) {
        console.log(e);
        next();
    }
};

const getMedicineById = async (req, res, next) => {
    try {
        const id = +req.param.id;
        const allMed = await prisma.medications.findUnique({
            where: [
                { medicationIDid: id }
            ]
        });
        return responses.success(res, "medication", allMed);
    } catch (e) {
        console.log(e);
        next();
    }
};

const addMedicine = async (req, res, next) => {
    const { error, value } = medicationSchemas.createMedicationSchema.validate(req.body);
    if (error) return responses.badRequest(res, error.details[0].message);
    const { medication_name, dosage_form, manufacturer, generic_name, therapeutic_class } = value;
    const data = await prisma.medications.create({
        data: {
            medication_name,
            dosage_form,
            manufacturer,
            generic_name,
            therapeutic_class
        },
    });
    return responses.success(res, "Medication created successfully", data);
};

const updateMedicine = async (req, res, next) => {
    try {
        const { value, error } = medicationSchemas.updateMedicationSchema.validate(req.body);
        const medicationUpdated = await prisma.medications.update({
            where: {
                id: +req.params.id,
            },
            data: { ...value},
        });
        return responses.success(res, "Medication edited successfully", medicationUpdated);
    } catch (e) {
        console.log(e);
        next();
    }
};

const deleteMedicine = async (req, res, next) => {
    const medicationId = req.params.id;
    const deleteMedication = await prisma.medications.delete({
        where: { id: +medicationId }
    });
    return responses.success(res, "user deleted successfully", deleteMedication);
};

const medFunctions = {
    getAllMedicines,
    getMedicineById,
    addMedicine,
    updateMedicine,
    deleteMedicine
}

export default medFunctions;