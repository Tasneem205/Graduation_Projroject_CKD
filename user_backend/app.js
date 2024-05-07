import Express from 'express';
import indexrouter from "./src/controllers/index.controller.js";
import dotenv from "dotenv";
import errorHandler from "./src/middleWares/errorHandler.js";
import morgan from "morgan";

import historyRouter from './src/controllers/history.controller.js';
import diabetesRouter from './src/controllers/diabetes.controller.js';
import pressureRouter from './src/controllers/pressure.controller.js';
import medicineRouter from './src/controllers/medicine.controller.js';
import waterRouter from './src/controllers/water.controller.js';
import exerciseRouter from './src/controllers/exercise.controller.js';
import homeRouter from './src/controllers/home.controller.js';

const app = Express();

dotenv.config();

app.use(Express.json());  // parser

app.use(morgan("dev"));

app.use("/user", indexrouter);

app.use("/history", historyRouter)
app.use("/diabetes", diabetesRouter)
app.use("/pressure", pressureRouter)
app.use("/medicine", medicineRouter)
app.use("/water",waterRouter)
app.use("/exercise", exerciseRouter)


app.use("/home", homeRouter)


app.use(errorHandler);

app.listen(process.env.PORT, () => {
    console.log(`Listening on port ${process.env.PORT}`);
});