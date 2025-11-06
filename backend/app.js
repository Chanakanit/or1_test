var express = require('express');
var logger = require('morgan');

var planRouter = require("./src/v1/routes/plan-router")

var app = express()

app.listen(3000,()=>{
    console.log("Sever runing on port 3000");
})

app.use(logger('dev'))  //ตัวเก็บ Log ของ Backend
app.use(express.json()) //ให้ Backend อ่าน Header กับ Body ได้
app.use(express.urlencoded({ extended: true })); //ไว้รับข้อมูลที่มาจาก tag <form> เผื่อไว้สำหรับ Sprint ถัดไป

app.use('/v1/study-plans', planRouter);
module.exports = app;