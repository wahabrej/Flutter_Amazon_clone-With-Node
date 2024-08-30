const mongoose = require("mongoose");
const userSchema = mongoose.Schema({
name:{
    required:true,
    type:String,
    trim:true
},
email:{
    required:true,
    type:String,
    trim:true
},
password:{
    required:true,
    type:String,

},
address:{
    type:String,
    default:"",

},
type:{
    type:String,
    default:"user",
}



})
module.exports =mongoose.model("User",userSchema);