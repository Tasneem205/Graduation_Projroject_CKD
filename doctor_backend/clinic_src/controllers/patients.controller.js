import {Router} from "express";
import upload from "../middleWares/uploader.js";
import getFunctions from "../services/patients.services/get.service.js"
import deletePatient from "../services/patients.services/delete.service.js"
import addPatient from "../services/patients.services/post.service.js"
import updatePatient from "../services/patients.services/put.service.js";

const patientRouter = new Router();

patientRouter.get("/", getFunctions.getAllPatients);

patientRouter.get("/:id", getFunctions.getPatientProfile);

patientRouter.post(
    "/",
    upload('../assets/profile_images').single('file'),
    addPatient
);

patientRouter.delete("/:id", deletePatient);

patientRouter.put(
    "/:id",
    upload('../assets/profile_images').single('file'),
    updatePatient
);

export default patientRouter;