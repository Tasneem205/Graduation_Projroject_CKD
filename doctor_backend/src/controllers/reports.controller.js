import { Router } from "express";
import functions from "../services/reports.service/get.service.js";
import addReport from "../services/reports.service/post.service.js";
import deleteReport from "../services/reports.service/delete.service.js";

const reportRouter = new Router();

reportRouter.get("/", functions.getAllReports);

reportRouter.get("/:id", functions.getReportById);

reportRouter.post("/", addReport);

reportRouter.put("/:id", ()=>{});

reportRouter.delete("/:id", deleteReport);

// TODO: add generate report function for pdf version of it

export default reportRouter;