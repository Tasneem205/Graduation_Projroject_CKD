import {Router} from "express";
import getFunctions from "../services/prescriptions.services/get.service"
import deletePrescription from "../services/prescriptions.services/delete.service"
import addPrescription from "../services/prescriptions.services/post.service"
import updatePrescription from "../services/prescriptions.services/put.service";

const prescriptionRouter = new Router();

prescriptionRouter.get("/", getFunctions.getAllPrescriptions);

prescriptionRouter.get("/:patient_id", getFunctions.getPrescriptionWithPatientId);

prescriptionRouter.get("/:doctor_id", getFunctions.getPrescriptionWithDoctorId);

prescriptionRouter.post("/", addPrescription);

prescriptionRouter.delete("/:id", deletePrescription);

prescriptionRouter.put("/:id", updatePrescription);

export default prescriptionRouter;