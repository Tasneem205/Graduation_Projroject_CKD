import {Router} from "express";
import getFunctions from "../services/doctors.services/get.service.js"
import deleteDoctor from "../services/doctors.services/delete.service.js"
import postFunctions from "../services/doctors.services/post.service.js"
import updateDoctor from "../services/doctors.services/put.service.js";
import isAdmin from "../middleWares/isAdmin.js";

const doctorRouter = new Router();

doctorRouter.get("/", getFunctions.getAllDoctors);

doctorRouter.get("/:id", getFunctions.getDoctorWithId);

doctorRouter.post("/", isAdmin, postFunctions.addDoctor);

doctorRouter.delete("/:id", isAdmin, deleteDoctor);

doctorRouter.put("/:id", updateDoctor);

export default doctorRouter;