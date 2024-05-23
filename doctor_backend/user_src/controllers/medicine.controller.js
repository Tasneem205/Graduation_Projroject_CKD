import { Router} from 'express'; 
const medicineRouter = Router(); 

import deleteMedicine from '../services/medicine.services/delete.services.js';
import addMedicine from '../services/medicine.services/post.services.js';
import getMedicine from '../services/medicine.services/get.services.js';

medicineRouter.get("/:id",getMedicine);
medicineRouter.delete("/:id/:medId", deleteMedicine);
medicineRouter.post("/:id", addMedicine);

export default medicineRouter;