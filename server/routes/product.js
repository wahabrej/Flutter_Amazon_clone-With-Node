// routes/product.js
const express = require('express');
const productRouter = express.Router();
const { Product } = require('../models/product');
const auth = require('../middlewares/auth');
console.log('Product Model:', Product); // Add this line to check if Product is imported correctly

productRouter.get('/api/products/',auth,async (req, res) => {
  try {
    const { category } = req.query;
   // const products = await Product.find({ category: 'Mobiles' });

    if (!category) {
      return res.status(400).json({ error: 'Category is required' });
    }

    const products = await Product.find({ category });
    res.json(products);
  } catch (e) {
    console.error('Error fetching products from server:', e);
    res.status(500).json({ error: e.message });
  }
});

productRouter.get("/api/products/search/:name", async (req, res) => {
  try {
    const products = await Product.find({
      name: { $regex: req.params.name, $options: "i" },
    });

    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = productRouter;
