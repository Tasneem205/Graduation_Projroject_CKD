import { Router } from "express";
import login from "../services/login.services.js"

const registrationRouter = new Router();

registrationRouter.post("/login", login);

export default registrationRouter;