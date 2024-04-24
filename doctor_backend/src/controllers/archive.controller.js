import { Router } from "express";
import getHistory from "../services/archive.services/history.service.js";
import medFunctions from "../services/archive.services/medicine.service.js";

const archiveRouter = new Router();

archiveRouter.get("/history", getHistory); // Will return the appointment history

archiveRouter.get("/medicine", medFunctions.getAllMedicines); // get all medicine

archiveRouter.get("/medicine/:id", medFunctions.getMedicineById); // get medicine with ID

archiveRouter.post("/medicine", medFunctions.addMedicine); // add new medicine

archiveRouter.put("/medicine/:id", medFunctions.updateMedicine); // update a medicine

archiveRouter.delete("/medicine/:id", medFunctions.deleteMedicine); // delete a medicine

export default archiveRouter;