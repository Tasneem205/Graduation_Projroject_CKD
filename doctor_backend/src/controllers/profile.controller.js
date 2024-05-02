import { Router } from "express";
import getFunctions from "../services/profile.services/get.service.js";
import putFunctions from "../services/profile.services/put.service.js";
const profileRouter = new Router();

profileRouter.get("/profile", getFunctions.profile);

profileRouter.get("/refreshToken", getFunctions.refreshToken);

profileRouter.get("/logout", getFunctions.logout);

profileRouter.put("/edit_profile", putFunctions.editProfile);

export default profileRouter;