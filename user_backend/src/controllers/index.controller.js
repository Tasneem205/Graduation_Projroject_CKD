import { Router } from "express";

const router = new Router();

router.use("/homepage", ()=>{});

router.use("/water", ()=>{});

router.use("/walking", ()=>{});

router.use("/diabetes", ()=>{});

router.use("/pressure", ()=>{});

router.use("/exercise", ()=>{});

router.use("/medicine", ()=>{});

router.use("/history", ()=>{});

router.use("/registration", ()=>{});

router.use("/notifications", ()=>{});

router.use("/messages", ()=>{});

export default router;