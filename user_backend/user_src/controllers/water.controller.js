 import { Router} from 'express'; 
const waterRouter = Router(); 
import dailyProgress from '../services/dailyservices/post.service.js';
import updatewater from '../services/water.services/put.service.js';
import allWater from '../services/water.services/get.service.js';

waterRouter.get("/", allWater);
waterRouter.post("/", dailyProgress);
waterRouter.put("/", updatewater);

export default waterRouter;