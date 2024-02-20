import {Router} from "express";
import getFunctions from "../services/assistants.services/get.service.js"
import deleteAssistant from "../services/assistants.services/delete.service.js"
import postFunctions from "../services/assistants.services/post.service.js"
import updateAssistant from "../services/assistants.services/put.service.js";

const assistantRouter = new Router();

assistantRouter.get("/", getFunctions.getAllAssistants);

assistantRouter.get("/:id", getFunctions.getAssistantWithId);

assistantRouter.post("/", postFunctions.addAssistant); // TODO: add middleware for authorization

assistantRouter.post("/", postFunctions.assistantLogin); // TODO: add authentication

assistantRouter.delete("/:id", deleteAssistant);

assistantRouter.put("/:id", updateAssistant);

export default assistantRouter;