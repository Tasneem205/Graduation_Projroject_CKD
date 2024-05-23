import { Router } from "express";
import AllWalking from "../services/walking.services/get.services.js";
import updateWalking from "../services/walking.services/put.services.js";

const walkingRouter = new Router();

walkingRouter.get("/:id", AllWalking);

walkingRouter.put("/:id", updateWalking);

export default walkingRouter;