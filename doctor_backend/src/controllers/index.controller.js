import { Router } from "express";
import assistantRouter from "./assistants.controller";
import doctorRouter from "./doctors.controllers";
import followUpRouter from "./follow-ups.controller";
import patientRouter from "./patients.controller";
import reportRouter from "./reports.controller";
import prescriptionRouter from "./prescriptions.controller";

const router = new Router();

router.use("/assistant", assistantRouter);

router.use("/follow-up", followUpRouter);

router.use("/doctor", doctorRouter);

router.use("/patient", patientRouter);

router.use("/report", reportRouter);

router.use("/prescription", prescriptionRouter);
export default router;