import {Router} from "express";
import getFunctions from "../services/assistants.services/get.service"
import deleteAssistant from "../services/assistants.services/delete.service"
import postFunctions from "../services/assistants.services/post.service"
import updateAssistant from "../services/assistants.services/put.service";

const assistantRouter = new Router();

assistantRouter.get("/", getFunctions.getAllAssistants);

assistantRouter.get("/:id", getFunctions.getAssistantWithId);

assistantRouter.post("/", postFunctions.addAssistant); // TODO: add middleware for authorization

assistantRouter.post("/", postFunctions.assistantLogin); // TODO: add authentication

assistantRouter.delete("/:id", deleteAssistant);

assistantRouter.put("/:id", updateAssistant);