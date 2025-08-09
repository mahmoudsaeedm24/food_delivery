const categoryModel = require("../models/category_model");



const sendCategoryController = async (req, res) => {
  try {
    const { title, iconCode } = req.body;

    const newCategory = new categoryModel({
      title,
      iconCode,
    });

    await newCategory.save();

    return res.status(201).json({
      message: 'Category created successfully',
      category: newCategory,
    });
  } catch (err) {
    console.error(err);
    return res.status(500).json({ message: 'Server error' });
  }
}

const getCategoriesController = async (req, res) => {
  try {
    const categoryList = await categoryModel.find().lean();
    
    return res.status(200).json(categoryList );
  } catch (err) {
    console.error(err);
    return res.status(500).json({ message: 'Server error' });
  }
}

module.exports = {sendCategoryController, getCategoriesController}