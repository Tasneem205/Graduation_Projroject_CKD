import {PrismaClient} from "@prisma/client";
import responses from "../helpers/responses.js";

const prisma = new PrismaClient();

const History = async (req, res, next) => {
    try {
        const Diabetes = await prisma.diabetes.findMany({where: {
            patientID: +req.params.id,
        }});
        const Pressure = await prisma.pressure.findMany({
            where: {
                PatientID: +req.params.id
                }
        });
        const exercise = await prisma.dailyProgress.findMany({
            where: {
                PatientID: +req.params.id,
            },
            select: { Excercise:true }
        });
        const water = await prisma.dailyProgress.findMany({
            where: {
                PatientID: +req.params.id,
            },
            select:{ WaterML:true}
        });
        const walking = await prisma.dailyProgress.findMany({
            where: {
                PatientID: +req.params.id,
            },
            select:{ WalkingSteps:true}
        });

        const data = {
            Diabetes,
            Pressure,
            exercise,
            walking,
            water
        }

        return responses.success(res, "Success graphs",data);
    } catch (error) {
        console.log(error);
        next();
    }
};


export default History;










const getHomepageManager = async (req, res, next) => {
    try{
        const assistants = await prisma.assistant.count();
        const doctors = await prisma.doctors.count();
        const scans = await prisma.kidney_scan.count();
        const tests = await prisma.kidney_test.count();
        const reports = await prisma.reports.count();
        const patients = await prisma.patients.count();
        const pieChart = [await prisma.kidney_scan.count({where :{ class : "0"}}),
            await prisma.kidney_scan.count({where :{ class : "1"}}),
            await prisma.kidney_scan.count({where :{ class : "2"}}),
            await prisma.kidney_scan.count({where :{ class : "3"}}),];
        // TODO: chart will be number of first appointments and followups for each day
        // const chart = await prisma.assistant.count();
        console.log(assistants, doctors, scans, tests, patients);
        const data = {
            doctors: doctors,
            assistants: assistants,
            scans: scans,
            tests: tests,
            reports: reports,
            patients: patients,
            pieChart: pieChart
        }
        return responses.success(res, "Homepage data fetched!", data);
    } catch (error) {
        console.log(error);
        next();
    }
}

const getHomepageDoctor = async (req, res, next) => {
    try{
        // TODO: add number of reservations for today
        // get the reservations for this doctor (first appointment, followups)
        const doctorId = +req.param.id;
        const role = req.param.role;
        if (role === "Doctor") {
            const reservations = await prisma.reservations.findMany({
                where: {doctorId},
            });
            let data = {first: [], followup: []}
            for (let i of reservations) {
                if (i.type === RESERVATION_TYPE.First) {
                    data.first.push(i);
                } else if (i.type === RESERVATION_TYPE.FollowUP) {
                    data.followup.push(i);
                }
            }
            return responses.success(res, "Homepage data fetched!", data);
        } else {
            return responses.badRequest(res, "you shouldn't be here");
        }
    } catch (error) {
        console.log(error);
        next();
    }
}

const getHomepageAssistant = async (req, res, next) => {
    try{
        // TODO: group them by doctor and date and type
        const assisId = +req.param.id;
        const role = req.param.role;
        if (role === "Assistant" ) {
            const allDoctorNames = await prisma.doctors.findMany({
                select: { DoctorID: true, FirstName: true, LastName: true }});
            const allReservations = await prisma.reservations.findMany();
            // group by doctor id then by type and send them with doctor name not id

            let data = {today: []}
            for (let i of allReservations) {
                if (i.reservation_date )
                if (i.type === RESERVATION_TYPE.First) {
                    data.first.push(i);
                } else if (i.type === RESERVATION_TYPE.FollowUP) {
                    data.followup.push(i);
                }
            }
            return responses.success(res, "Homepage data fetched!", data);
        } else {
            return responses.badRequest(res, "you shouldn't be here");
        }
    } catch (error) {
        console.log(error);
        next();
    }
}

const getFunctions = {
    getHomepageManager,
    getHomepageDoctor,
    getHomepageAssistant
}