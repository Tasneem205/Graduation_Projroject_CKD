import { Router} from 'express'; 
const pressureRouter = Router(); 

import addPressure from '../services/pressure.services/post.service';
import getPressure from '../services/pressure.services/get.service';

pressureRouter.get("/", getPressure);
pressureRouter.post("/", addPressure);
//pressureRouter.put("/", ()=>{});

export default pressureRouter;