import { Router} from 'express'; 
const pressureRouter = Router(); 

import addPressure from '../services/pressure.services/post.service.js';
import getPressure from '../services/pressure.services/get.service.js';

pressureRouter.get("/:id", getPressure.getAllPressure);
pressureRouter.get("/last/:id", getPressure.getLastPressure);
pressureRouter.post("/:id", addPressure);

export default pressureRouter;