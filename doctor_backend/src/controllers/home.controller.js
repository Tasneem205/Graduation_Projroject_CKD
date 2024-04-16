import { Router } from "express";
import getHomepageData from "../services/homepage.services/get.service.js"
import profileRouter from "./profile.controller.js";

const homeRouter = new Router();
// divide this to assistant, doctor, manager and profile
homeRouter.get("/d", getHomepageData);  // get the data of home page

homeRouter.get("/a", getHomepageData);  // get the data of home page

homeRouter.get("/m", getHomepageData);  // get the data of home page

homeRouter.use("/profile", profileRouter);

homeRouter.put("/edit_profile", ()=>{});

export default homeRouter;