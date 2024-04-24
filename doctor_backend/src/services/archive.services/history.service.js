import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import {all} from "express/lib/application.js";

const prisma = new PrismaClient();
const getHistory = async (req, res, next) => {
    const allData = await prisma.reservations.findMany();
    let data = {"reservation": [], "first": [], "followUp": []};
    for (const ele of allData) {
        if (ele.type === "First") {
            data.first.push(ele);
        } else if (ele.type === "Reservation") {
            data.reservation.push(ele);
        } else if (ele.type === "FollowUP") {
            data.followUp.push(ele);
        }
    }
};

export default getHistory;