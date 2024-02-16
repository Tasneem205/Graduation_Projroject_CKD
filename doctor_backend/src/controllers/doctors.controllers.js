import {Router} from "express";
import getFunctions from "../services/doctors.services/get.service"
import deleteDoctor from "../services/doctors.services/delete.service"
import postFunctions from "../services/doctors.services/post.service"
import updateDoctor from "../services/doctors.services/put.service";

const assistantRouter = new Router();

assistantRouter.get("/", getFunctions.getAllDoctors);

assistantRouter.get("/:id", getFunctions.getDoctorWithId);

assistantRouter.post("/", postFunctions.addDoctor); // TODO: add middleware for authorization

assistantRouter.post("/", postFunctions.doctorLogin); // TODO: add authentication

assistantRouter.delete("/:id", deleteDoctor);

assistantRouter.put("/:id", updateDoctor);