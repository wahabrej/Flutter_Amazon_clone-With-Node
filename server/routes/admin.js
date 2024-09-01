const express = require('express');
const multer = require('multer');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const { Product } = require('../models/product'); // Importing model correctly

// Setup multer for image uploads
const storage = multer.memoryStorage(); // Store files in memory
const upload = multer({ storage: storage });

// Route to add a new product
adminRouter.post('/admin/add-product', admin, upload.array('images'), async (req, res) => {
  try {
    const { name, description, quantity, price, category } = req.body;
    const images = req.files; // Array of files

    if (!name || !description || !quantity || !price || !category) {
      return res.status(400).json({ error: 'All fields are required' });
    }

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
    res.status(201).json(product); // Return the created product
  } catch (error) {
    console.error('Error adding product:', error); // Log error details
    res.status(500).json({ error: error.message });
  }
});

// Route to get all products
adminRouter.get('/admin/get-products', async (req, res) => {
  try {
    const products = await Product.find({});
    res.json(products); // Send products as JSON
  } catch (error) {
    console.error('Error fetching products:', error); // Log error details
    res.status(500).json({ error: error.message });
  }
});

// Route to delete a product
adminRouter.post('/admin/delete-product', async (req, res) => {
  try {
    const { id } = req.body;

    if (!id) {
      return res.status(400).json({ error: 'Product ID is required' });
    }

    const product = await Product.findByIdAndDelete(id);

    if (!product) {
      return res.status(404).json({ error: 'Product not found' });
    }

    res.json({ message: 'Product deleted successfully' });
  } catch (error) {
    console.error('Error deleting product:', error); // Log error details
    res.status(500).json({ error: error.message });
  }
});

module.exports = adminRouter;
