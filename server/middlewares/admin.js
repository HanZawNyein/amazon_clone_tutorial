const jwt = require("jsonwebtoken");
const User = require("../models/user");

const admin  = async (req,res,next) => {
    try {
        const token = req.header('x-auth-token');
        if (!token) return res.status(401).json({ msg: "Token Expired, access dined" })
        const vertified = jwt.verify(token, "passwordKey")
        if (!vertified) return res.status(401).json({ msg: "Token vertified failed" })
        const user = await User.findById(vertified.id)
        if(user.type =="user"|| user.type =="seller"){
            return res.status(401).json({msg:"You are not an admin!"})
        }
        req.user = vertified.id;
        req.token = token;
        next();
    } catch (e) {
        res.status(500).json({ error: e.message })
    }
}