import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getHomepageData = async (req, res, next) => {
    try{
        // const data = await prisma.homepage.findMany();
        const data = await prisma.homepage.findMany(); // TODO: find the best function
        console.log(data);
        return responses.success(res, "Homepage data fetched!", data);
    } catch (error) {
        console.log(error);
        next();
    }
}

export default getHomepageData;