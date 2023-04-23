const jwt = require('jsonwebtoken');

const auth = async (req, res, next) => {
    try {
        const token = req.header('x-auth-token');
        if (!token) return res.status(401).json({ msg: "Token Expired, access dined" })
        const vertified = jwt.verify(token, "passwordKey")
        if (!vertified) return res.status(401).json({ msg: "Token vertified failed" })
        req.user = vertified.id;
        req.token = token;
        next();
    } catch (e) {
        res.status(500).json({ error: e.message })
    }
}

module.exports = auth;