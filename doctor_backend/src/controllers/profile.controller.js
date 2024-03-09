import { Router } from "express";
import getFunctions from "../services/homepage.services/get.service.js";

const profileRouter = new Router();

profileRouter.get("/refreshToken", getFunctions.RefreshToken);

profileRouter.get("/logout", getFunctions.logout);

profileRouter.get("/profile", getFunctions.getProfile);

profileRouter.post("/dLogin", ()=>{}); // TODO: add authentication

profileRouter.post("/aLogin", ()=>{});

profileRouter.put("/edit_profile", ()=>{});

export default profileRouter;