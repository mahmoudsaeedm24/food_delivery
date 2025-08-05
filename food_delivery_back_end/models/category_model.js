const mongoose = require('mongoose');
const { category_model } = require('./models');

const categorySchema = new mongoose.Schema(
  {
    title: {
      type: String,
      required: [true, 'title is required'],
      trim: true,
    },
    iconCode: {
      type: String,
    },

  }, { timestamps: true, }
)

const categoryModel = mongoose.model(category_model, categorySchema);

module.exports = categoryModel;