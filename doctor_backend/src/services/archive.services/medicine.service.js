import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const getAllMedicines = async (req, res, next) => {
    // TODO: implement me
};

const getMedicineById = async (req, res, next) => {
    // TODO: implement me
};

const addMedicine = async (req, res, next) => {
    // TODO: implement me
};

const updateMedicine = async (req, res, next) => {
    // TODO: implement me
};

const deleteMedicine = async (req, res, next) => {
    // TODO: implement me
};

const medFunctions = {
    getAllMedicines,
    getMedicineById,
    addMedicine,
    updateMedicine,
    deleteMedicine
}

export default medFunctions;