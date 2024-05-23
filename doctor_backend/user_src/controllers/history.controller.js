import { Router} from 'express'; 
import history from '../services/history.get.js';

const historyRouter = Router();

historyRouter.get("/:id", history);

export default historyRouter;