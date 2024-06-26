import Express from 'express';
import { default as userIndex } from "./user_src/controllers/index.controller.js";
import dotenv from "dotenv";
import errorHandler from "./user_src/middleWares/errorHandler.js";
import morgan from "morgan";

const app = Express();

dotenv.config();

app.use(Express.json());  // parser

app.use(morgan("dev"));

app.use("/user", userIndex);

app.use(errorHandler);

app.listen(process.env.PORT, () => {
    console.log(`Listening on port ${process.env.PORT}`);
});