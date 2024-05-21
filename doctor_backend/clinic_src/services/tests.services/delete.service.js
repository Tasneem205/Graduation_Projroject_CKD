import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const deleteTest = async (req, res, next) => {
    try {
        const id = +req.params.id;
        const deleteTest = prisma.kidney_test.delete[{
            where: {test_id: id}
        }];
        return responses.success(res, "Test deleted successfully", deleteTest);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default deleteTest;