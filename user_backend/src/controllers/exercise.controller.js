import { Router} from "express";
const exerciseRouter = new Router();

import Allexercise from "../services/exercise.services/get.services";
import updateExercise from "../services/exercise.services/put.services";

exerciseRouter.get("/",Allexercise);
exerciseRouter.put("/", updateExercise);

export default exerciseRouter;