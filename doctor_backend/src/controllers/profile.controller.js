import { Router } from "express";
import getFunctions from "../services/profile.services/get.service.js";

const profileRouter = new Router();

profileRouter.get("/profile", getFunctions.profile);

profileRouter.get("/refreshToken", getFunctions.refreshToken);

profileRouter.get("/logout", getFunctions.logout);

profileRouter.post("/dLogin", ()=>{}); // TODO: add authentication

profileRouter.post("/aLogin", ()=>{});

profileRouter.put("/edit_profile", ()=>{});

export default profileRouter;