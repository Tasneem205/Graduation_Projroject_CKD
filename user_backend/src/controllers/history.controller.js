import { Router} from 'express'; 
const historyRouter = Router(); 

import History from '../services/History.get';
historyRouter.get("/", History);

export default historyRouter;