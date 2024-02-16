import { Router } from "express";
import functions from "../services/reports.service/get.service";

const reportsRouter = new Router();

reportsRouter.get("/", functions.getAllReports);

reportsRouter.get("/:timestamp", functions.getReportWithTimestamp)

export default reportsRouter;
