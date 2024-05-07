import { Router} from 'express'; 
const medicineRouter = Router(); 

import deleteMedicine from '../services/medicine.services/delete.services';
import addMedicine from '../services/medicine.services/post.services';
import getMedicine from '../services/medicine.services/get.services';

medicineRouter.get("/",getMedicine);
medicineRouter.delete("/", deleteMedicine);
medicineRouter.post("/", addMedicine);

export default medicineRouter;