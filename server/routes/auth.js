const express = require('express');
const authRouter = express.Router();
const bcryptjs = require("bcryptjs");
const User = require("../models/user");
const jwt= require("jsonwebtoken");
// Define a route on the authRouter
authRouter.post("/api/signup", async(req, res) => {
try {
    const{name,email,password}= req.body;

    const exisUser=await User.findOne({email});
    if(exisUser){
     return res.status(400).json({msg:"User Already Exist"})
    }
    const hashpassword = await bcryptjs.hash(password,8)
    const user = new User({
     name:name,
     email:email,
     password:hashpassword
    })
     await user.save();
    res.json(user);
} catch (error) {
    return res.status(500).json({msg:error.message})
}
});
authRouter.post("/api/signin", async(req, res) => {
    try {
        const {email,password}=req.body;
        const user =await User.findOne({email})
        if(!user){
            return res.status(400).json({
                msg:"User email not exist",
            })
        }

       const isMatch=await bcryptjs.compare(password,user.password)
       if(!isMatch){
        return res.status(400).json({
            msg:"Incorrect password",
        })
       }
       const token= jwt.sign({id:user._id},"passwordKey");
       res.json({token,...user._doc});
        
    } catch (error) {
        return res.status(500).json({msg:error.message})
    }
    });



// Export the authRouter
module.exports = authRouter;
