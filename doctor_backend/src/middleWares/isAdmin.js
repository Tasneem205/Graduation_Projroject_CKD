import jwt from "jsonwebtoken";
import responses from "../helpers/responses.js";

export const isAdmin = (req, res, next) => {
  try {
    // he is an admin if and only if his id = 0
    // so there is a doctor admin and an assistants admin
    const autherizationHeader = req.headers.authorization;
    const token = autherizationHeader.split(" ")[1];
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    console.log(decoded.id);
    if (1 != decoded.id)
      return responses.unAuthorized(res, "unauthirized user");
    next();
  } catch (error) {
    return responses.unAuthorized(res, "unauthorized action");
  }
};

export default isAdmin;