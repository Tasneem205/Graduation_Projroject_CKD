import { Router} from 'express';
import addDiabetes from '../services/diabetes.services/post.service.js';
import getFunctions from '../services/diabetes.services/get.service.js';

const diabetesRouter = Router();

diabetesRouter.get("/all:id", getFunctions.getAllDiabetes);
diabetesRouter.get("/last:id", getFunctions.getLastDiabetes);
diabetesRouter.post("/:id", addDiabetes);

export default diabetesRouter;