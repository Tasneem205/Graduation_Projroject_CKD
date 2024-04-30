import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();
const getArchive = async (req, res, next) => {
    try {
        let data = {"reservation": [], "first": [], "followUp": []};
        data["reservation"] = await prisma.reservations.findMany({
            where: [
                { type: 'Reservation' }
            ], orderBy: [
                { reservation_date: 'asc' }
            ]
        });
        data["first"] = await prisma.reservations.findMany({
            where: [
                { type: 'First' }
            ], orderBy: [
                { reservation_date: 'des' }
            ]
        });
        data["followUp"] = await prisma.reservations.findMany({
            where: [
                { type: 'FollowUp' }
            ], orderBy: [
                { reservation_date: 'des' }
            ]
        });
        return responses.success(res, "reservations got", data);
    } catch (e) {
        console.log(e);
        next();
    }
};

export default getArchive;