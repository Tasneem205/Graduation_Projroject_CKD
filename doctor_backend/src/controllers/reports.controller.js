import { Router } from "express";
import functions from "../services/reports.service/get.service";

const reportRouter = new Router();

reportRouter.get("/", functions.getAllReports);

reportRouter.get("/:timestamp", functions.getReportWithTimestamp)

export default reportRouter;
