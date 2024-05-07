import { Router } from "express";
import homepage from "../services/homepage.get.js"
import getFunctions from "../services/profile.services/get.service.js";
import postFunctions from "../services/profile.services/post.service.js";

const homeRouter = new Router();

homeRouter.get("/", homepage);  // get the data of home page

homeRouter.get("/profile", getFunctions.profile);

homeRouter.get("/refreshToken", getFunctions.refreshToken);

homeRouter.get("/logout", getFunctions.logout);

homeRouter.put("/edit_profile", ()=>{});

export default homeRouter;