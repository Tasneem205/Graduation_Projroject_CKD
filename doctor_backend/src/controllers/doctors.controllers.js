import {Router} from "express";
import getFunctions from "../services/doctors.services/get.service"
import deleteDoctor from "../services/doctors.services/delete.service"
import postFunctions from "../services/doctors.services/post.service"
import updateDoctor from "../services/doctors.services/put.service";

const doctorRouter = new Router();

doctorRouter.get("/", getFunctions.getAllDoctors);

doctorRouter.get("/:id", getFunctions.getDoctorWithId);

doctorRouter.post("/", postFunctions.addDoctor); // TODO: add middleware for authorization

doctorRouter.post("/", postFunctions.doctorLogin); // TODO: add authentication

doctorRouter.delete("/:id", deleteDoctor);

doctorRouter.put("/:id", updateDoctor);

export default doctorRouter;