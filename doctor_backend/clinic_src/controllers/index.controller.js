import { Router } from "express";
import login from "../services/profile.services/post.service.js"

import assistantRouter from "./assistants.controller.js";
import doctorRouter from "./doctors.controllers.js";
import followUpRouter from "./follow-ups.controller.js";
import patientRouter from "./patients.controller.js";
import reportRouter from "./reports.controller.js";
import prescriptionRouter from "./prescriptions.controller.js";
import homeRouter from "./home.controller.js";
import scanRouter from "./scans.controller.js";
import testRouter from "./tests.controller.js";
import archiveRouter from "./archive.controller.js";
import buttonRouter from "./buttons.controller.js";

const router = new Router();

router.post("/login", login)

router.use("/home", homeRouter);

router.use("/doctor", doctorRouter);

router.use("/assistant", assistantRouter);

router.use("/patient", patientRouter);

router.use("/report", reportRouter);

router.use("/scan", scanRouter);

router.use("/test", testRouter);

router.use("/prescription", prescriptionRouter);

router.use("/follow-up", followUpRouter);

router.use("/button", buttonRouter);

router.use("/archive", archiveRouter);

// router.use("/message", messageRouter);

// router.use("/notification", notificationRouter);

export default router;