import { Router} from "express";
const exerciseRouter = new Router();

import Allexercise from "../services/exercise.services/get.services.js";
import updateExercise from "../services/exercise.services/put.services.js";

exerciseRouter.get("/",Allexercise);
exerciseRouter.put("/", updateExercise);

export default exerciseRouter;