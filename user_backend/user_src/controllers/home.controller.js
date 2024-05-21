import { Router } from "express";
import homepage from "../services/homepage.get.js"
import getFunctions from "../services/profile.services/get.services.js";

const homeRouter = new Router();

homeRouter.get("/:id", homepage);  // get the data of home page

homeRouter.get("/profile", getFunctions.profile);

homeRouter.get("/refreshToken", getFunctions.refreshToken);

homeRouter.get("/logout", getFunctions.logout);

homeRouter.put("/edit_profile", ()=>{});

export default homeRouter;