import {Router} from "express";
import getFunctions from "../services/follow-ups.services/get.service"
import deleteFollowUp from "../services/follow-ups.services/delete.service"
import addFollowUp from "../services/follow-ups.services/post.service"
import updateFollowUp from "../services/follow-ups.services/put.service";

const followUpsRouter = new Router();

followUpsRouter.get("/", getFunctions.getAllFollowUps);

followUpsRouter.get("/:patient_id", getFunctions.getFollowUpWithPatientId);

followUpsRouter.get("/:timestamp", getFunctions.getFollowUpWithTimestamp);

followUpsRouter.post("/", addFollowUp);

followUpsRouter.delete("/:id", deleteFollowUp);

followUpsRouter.put("/:id", updateFollowUp);

export default followUpsRouter;