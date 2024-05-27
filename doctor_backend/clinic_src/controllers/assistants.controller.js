import {Router} from "express";
import uploader from "../middleWares/uploader.js";
import isAdmin from "../middleWares/isAdmin.js"
import getFunctions from "../services/assistants.services/get.service.js"
import deleteAssistant from "../services/assistants.services/delete.service.js"
import postFunctions from "../services/assistants.services/post.service.js"
import updateAssistant from "../services/assistants.services/put.service.js";
import upload from "../middleWares/uploader.js";

const assistantRouter = new Router();

assistantRouter.get("/", getFunctions.getAllAssistants);

assistantRouter.get("/:id", getFunctions.getAssistantWithId);

assistantRouter.post(
    "/",
    // isAdmin,
    upload('../assets/profile_images').single("file"),
    postFunctions.addAssistant
);

assistantRouter.delete(
    "/:id",
    // isAdmin,
    deleteAssistant);

assistantRouter.put(
    "/",
    upload('../assets/profile_images').single("file"),
    updateAssistant
);

export default assistantRouter;