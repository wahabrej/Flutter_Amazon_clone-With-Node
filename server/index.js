const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors"); // Import the CORS package
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");
const PORT = 3000;
const app = express();

// Middleware to enable CORS
app.use(cors());

// Middleware to parse JSON
app.use(express.json());

// Connect to MongoDB Atlas
const DB = "mongodb+srv://wahabreja:reja32103434@cluster0.gkjjdd3.mongodb.net/amazon";

mongoose.connect(DB, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
})
.then(() => {
    console.log("Connected to MongoDB Atlas");
})
.catch((error) => {
    console.error("Error connecting to MongoDB Atlas:", error.message);
});

// Use the authentication router
app.use(authRouter);
app.use(adminRouter);
 app.use(productRouter);

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
