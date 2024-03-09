import { Router } from "express";
import getHomepageData from "../services/homepage.services/get.service.js"

const homeRouter = new Router();

homeRouter.get("/", getHomepageData);  // get the data of home page

export default homeRouter;