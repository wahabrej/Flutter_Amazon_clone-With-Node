const express = require('express');
const multer = require('multer');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const Product = require('../models/product');

// Setup multer for image uploads
const storage = multer.memoryStorage(); // Store files in memory
const upload = multer({ storage: storage });

adminRouter.post('/admin/add-product', admin, upload.array('images'), async (req, res) => {
  try {
    const { name, description, quantity, price, category } = req.body;
    const images = req.files; // Array of files

    // Convert image buffer to base64
    const imageBase64 = images.map(file => ({
      data: file.buffer.toString('base64'),
      contentType: file.mimetype,
    }));

    const product = new Product({
      name,
      description,
      images: imageBase64,
      quantity,
      price,
      category,
    });

    await product.save();
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get all products
adminRouter.get('/admin/get-products', async (req, res) => {
  try {
    const products = await Product.find({});
    res.json(products); // Send products as JSON
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = adminRouter;
