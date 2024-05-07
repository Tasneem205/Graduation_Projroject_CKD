import { Router } from "express";
import postFunctions from "../services/tests.services/post.service.js";
import getFunctions from "../services/tests.services/get.service.js";
import deleteTest from "../services/tests.services/delete.service.js";

const testRouter = new Router();

testRouter.get("/", getFunctions.getAllTests);

testRouter.get("/:patientId", getFunctions.getWithPatientId);

testRouter.post("/", postFunctions.addTest);

testRouter.delete("/", deleteTest);

export default testRouter;