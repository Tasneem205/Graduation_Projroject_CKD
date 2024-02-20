import { Router } from "express";
import assistantRouter from "./assistants.controller.js";
import doctorRouter from "./doctors.controllers.js";
import followUpRouter from "./follow-ups.controller.js";
import patientRouter from "./patients.controller.js";
import reportRouter from "./reports.controller.js";
import prescriptionRouter from "./prescriptions.controller.js";

const router = new Router();

router.use("/assistant", assistantRouter);

router.use("/follow-up", followUpRouter);

router.use("/doctor", doctorRouter);

router.use("/patient", patientRouter);

router.use("/report", reportRouter);

router.use("/prescription", prescriptionRouter);
export default router;