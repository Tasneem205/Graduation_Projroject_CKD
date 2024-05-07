import { Router } from "express";
import getFunctions from "../services/reports.service/get.service.js";
import addReport from "../services/reports.service/post.service.js";
import deleteReport from "../services/reports.service/delete.service.js";

const reportRouter = new Router();

reportRouter.get("/", getFunctions.getAllReports);

reportRouter.get("/:id", getFunctions.getReportById);

reportRouter.post("/", addReport);

// reportRouter.put("/:id", ()=>{});

reportRouter.delete("/:id", deleteReport);

// TODO: add generate report function for pdf version of it

export default reportRouter;