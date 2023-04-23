const express = require('express');
const User = require('../models/user');
const bcryptjs = require("bcryptjs")
const jwt = require("jsonwebtoken");

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
    try {
        const { name, email, password } = req.body;
        const existingUser = await User.findOne({ email });

        if (existingUser) {
            return res.status(400).json({ msg: 'User Email is already exists!.' })
        }
        const hashedPassword = await bcryptjs.hash(password, 8);

        let user = new User({
            email,
            password: hashedPassword,
            name
        })

        user = await user.save();
        res.status(200).json({ user: user })
    } catch (e) {
        // console.log(e);
        res.status(500).json({ error: e.message });
    }

});

authRouter.post("/api/signin", async (req, res) => {
    try {   
        const { email, password } = req.body;
        const user = await User.findOne({ email });
        if (!user) {
            res.status(400).json({ msg: "User with this email doesn't exist." });
        };
        const isMatch = await bcryptjs.compare(password, user.password);
        if (!isMatch) {
            res.status(400).json({ msg: "Incorrect Paassword." });
        }
        const token = jwt.sign({ id: user._id }, "passwordKey");
        res.json({ token, ...user._doc })

    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

authRouter.post("/tokenIsValid", async (req, res) => {
    try {   
       const token = req.header('x-auth-token');
       console.log(token);
       if(!token) return res.json(false);
       const vertified = jwt.verify(token,"passwordKey");
       if(!vertified)return res.json(false);

       const user = await User.findById(vertified.id);
       if(!user) return res.json(false);
       res.json(true);

    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = authRouter;