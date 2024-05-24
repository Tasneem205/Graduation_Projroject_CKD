import { Router } from "express";
import homepage from "../services/homepage.get.js"
import getFunctions from "../services/profile.services/get.services.js";
import updateProfile from "../services/profile.services/put.services.js";
import uploader from "../../clinic_src/middleWares/uploader.js";

const homeRouter = new Router();

homeRouter.get("/:id", homepage);  // get the data of home page

homeRouter.get("/profile/:id", getFunctions.profile);

homeRouter.get("/refreshToken", getFunctions.refreshToken);

homeRouter.get("/logout", getFunctions.logout);

homeRouter.put("/edit_profile/:id",
    uploader('../assets/profile_images').single("file"),
    updateProfile);

export default homeRouter;