const express = require('express')
const mongoose = require("mongoose")

const PORT = 3000
const app = express()
const DB = "mongodb+srv://hanzaw:hanzaw@cluster0.ktg4l.mongodb.net/?retryWrites=true&w=majority";


// consts
const authRouter = require("./routes/auth")
const adminRouter = require("./middlewares/auth");
const req = require('express/lib/request')

// middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);

// connect
mongoose.set('strictQuery', true);
mongoose.connect(DB)
.then(
  console.log("Mongoose Connected.")
)
.catch((e)=>{
  console.log(e)
})

app.listen(PORT,"0.0.0.0",()=>{
    console.log(`connected at port ${PORT} hello`);
})