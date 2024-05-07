import { Router } from 'express'; 
import waterRouter from './water.controller.js';
import pressureRouter from './pressure.controller.js';
import diabetesRouter from './diabetes.controller.js';
import medicineRouter from './medicine.controller.js';
import exerciseRouter from './exercise.controller.js';

const indexrouter = new Router();


indexrouter.use("/water", waterRouter);
indexrouter.use("/registration",()=>{});
indexrouter.use("/homepage",()=>{});
indexrouter.use("/diabetes", diabetesRouter);
indexrouter.use("/pressure", pressureRouter);
indexrouter.use("/exercise",exerciseRouter);
indexrouter.use("/medicine",medicineRouter);
// indexrouter.use("/",()=>{});

export default indexrouter;