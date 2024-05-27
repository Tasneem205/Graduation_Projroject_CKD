import { Router} from 'express'; 
const medicineRouter = Router(); 

import deleteMedicine from '../services/medicine.services/delete.services.js';
import addMedicine from '../services/medicine.services/post.services.js';
import getMedicine from '../services/medicine.services/get.services.js';

medicineRouter.get("/",getMedicine);
medicineRouter.delete("/", deleteMedicine);
medicineRouter.post("/", addMedicine);

export default medicineRouter;