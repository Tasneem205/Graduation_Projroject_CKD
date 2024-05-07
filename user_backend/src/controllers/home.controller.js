import { Router } from "express";
import getHomepageData from "../services/homepage.services.js/get.service.js"
import getFunctions from "../services/profile.services/get.service.js";
import postFunctions from "../services/profile.services/post.service.js";

const homeRouter = new Router();

homeRouter.get("/", getHomepageData);  // get the data of home page

homeRouter.get("/profile", getFunctions.profile);

homeRouter.get("/refreshToken", getFunctions.refreshToken);

homeRouter.get("/logout", getFunctions.logout);

homeRouter.post("/login", postFunctions.login); // TODO: add authentication

homeRouter.put("/edit_profile", ()=>{});

export default homeRouter;