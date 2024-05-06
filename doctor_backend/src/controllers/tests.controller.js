import { Router } from "express";
import postFunctions from "../services/tests.services/post.service.js";

const testRouter = new Router();

testRouter.post("/", postFunctions.runModel());

export default testRouter;