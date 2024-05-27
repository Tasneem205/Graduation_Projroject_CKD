 import { Router} from 'express'; 
const waterRouter = Router(); 
import updatewater from '../services/water.services/put.service.js';
import allWater from '../services/water.services/get.service.js';

waterRouter.get("/", allWater);
waterRouter.put("/", updatewater);

export default waterRouter;