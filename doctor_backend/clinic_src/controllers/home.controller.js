import { Router } from "express";
import getFunctions from "../services/homepage.services/get.service.js"
import profileRouter from "./profile.controller.js";

const homeRouter = new Router();
// divide this to assistant, doctor, manager and profile
homeRouter.get("/d", getFunctions.getHomepageDoctor);

homeRouter.get("/a", getFunctions.getHomepageAssistant);

homeRouter.get("/m", getFunctions.getHomepageManager);

homeRouter.use("/profile", profileRouter);


export default homeRouter;