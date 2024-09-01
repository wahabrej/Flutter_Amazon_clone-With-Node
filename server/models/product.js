const mongoose = require('mongoose');

const productSchema = new mongoose.Schema({
  name: { type: String, required: true },
  description: { type: String, required: true },
  images: [
    {
      data: { type: String, required: true }, // Base64 string
      contentType: { type: String, required: true },
    },
  ],
  quantity: { type: Number, required: true },
  price: { type: Number, required: true },
  category: { type: String, required: true },
});

const Product = mongoose.model('Product', productSchema);

module.exports = {Product};
