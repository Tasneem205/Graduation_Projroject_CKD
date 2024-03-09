import { Router } from "express";
import postFunctions from "../services/doctors.services/post.service.js";

const homeRouter = new Router();

homeRouter.get("/", ()=>{});  // get the data of home page

homeRouter.get("/refreshToken", ()=>{});

homeRouter.get("/logout", ()=>{});

homeRouter.get("/profile", ()=>{});

homeRouter.post("/dLogin", ()=>{}); // TODO: add authentication

homeRouter.post("/aLogin", ()=>{});

homeRouter.put("/edit_profile", ()=>{});


export default homeRouter;