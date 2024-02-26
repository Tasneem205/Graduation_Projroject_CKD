import {Router} from "express";
import getFunctions from "../services/assistants.services/get.service.js"
import deleteAssistant from "../services/assistants.services/delete.service.js"
import postFunctions from "../services/assistants.services/post.service.js"
import updateAssistant from "../services/assistants.services/put.service.js";
import isAdmin from "../middleWares/isAdmin.js"

const assistantRouter = new Router();

assistantRouter.get("/", getFunctions.getAllAssistants);

assistantRouter.get("/:id", getFunctions.getAssistantWithId);

assistantRouter.get("/logout", getFunctions.logoutAssistant);

assistantRouter.post("/", isAdmin, postFunctions.addAssistant);

assistantRouter.post("/login", postFunctions.assistantLogin);

assistantRouter.delete("/:id", isAdmin, deleteAssistant);

assistantRouter.put("/", updateAssistant);

export default assistantRouter;