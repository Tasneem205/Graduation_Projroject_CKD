import { Router} from 'express'; 
const pressureRouter = Router(); 

import addPressure from '../services/pressure.services/post.service.js';
import getPressure from '../services/pressure.services/get.service.js';

pressureRouter.get("/", getPressure.getAllPressure);
pressureRouter.post("/", addPressure);
//pressureRouter.put("/", ()=>{});

export default pressureRouter;