import { Router} from 'express'; 
const diabetesRouter = Router(); 

import addDiabetes from '../services/diabetes.services/post.service.js';
import getFunctions from '../services/diabetes.services/get.service.js';

diabetesRouter.get("/all", getFunctions.getAllDiabetes);
diabetesRouter.get("/last", getFunctions.getLastDiabetes);
diabetesRouter.post("/", addDiabetes);

export default diabetesRouter;