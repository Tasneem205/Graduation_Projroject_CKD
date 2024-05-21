import { Router} from 'express'; 
const historyRouter = Router(); 

import History from '../services/History.get.js';
historyRouter.get("/", History);

export default historyRouter;