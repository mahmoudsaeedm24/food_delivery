const mongoose = require('mongoose');
const { product_model, category_model } = require('./models');

const productSchema = mongoose.Schema(
  {
    categoryId: {
      type: mongoose.Schema.Types.ObjectId, // لو مرتبط بـ Category Model
      ref: category_model,
      required: true,
    },
    title: {
      type: String,
      required: true,
      trim: true,
    },
    price: {
      type: Number,
      required: true,
      default: 0.0, // أو required حسب استخدامك
    },
    poster: {
      type: String,
      required: true,
    },
    description: {
      type: String,
      required: true,
    },
    images: {
      type: [String], // array of strings (URLs)
      default: [],
    },
    rating: {
      type: Number,
      default: 0.0, // أو required حسب استخدامك
    },
  },
  {
    timestamps: true, // ← بيضيف createdAt و updatedAt تلقائيًا
  }
);
const productModel = mongoose.model(product_model, productSchema);
module.exports = productModel;
