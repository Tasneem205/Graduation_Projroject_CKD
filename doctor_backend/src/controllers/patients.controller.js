import {Router} from "express";
import getFunctions from "../services/patients.services/get.service"
import deletePatient from "../services/patients.services/delete.service"
import addPatient from "../services/patients.services/post.service"
import updatePatient from "../services/patients.services/put.service";

const patientRouter = new Router();

patientRouter.get("/", getFunctions.getAllPatients);

patientRouter.get("/:id", getFunctions.getPatientWithId);

patientRouter.post("/", addPatient);

patientRouter.delete("/:id", deletePatient);

patientRouter.put("/:id", updatePatient);

export default patientRouter;