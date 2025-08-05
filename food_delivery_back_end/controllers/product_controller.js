const ProductModel = require('../models/product_model');

const createProduct = async (req, res) => {
  try {
    const {
      title,
      price,
      poster,
      description,
      images,
      rating,
      categoryId,
    } = req.body;

    // ✅ التحقق من الحقول الأساسية
    if (!title || !price || !poster || !description || !categoryId) {
      return res.status(400).json({ message: 'Missing required fields' });
    }

    // ✅ إنشاء منتج جديد
    const product = new ProductModel({
      title,
      price,
      poster,
      description,
      images,
      rating,
      categoryId,
    });

    await product.save();

    return res.status(201).json({
      message: 'Product created successfully',
      product,
    });
  } catch (err) {
    console.error('Product Creation Error:', err);
    return res.status(500).json({ message: 'Server error' });
  }
};

const createListOfProducts = async (req, res) => {
  try {
    const productsData = req.body;

    if (!Array.isArray(productsData) || productsData.length === 0) {
      return res.status(400).json({ message: 'Invalid or empty data' });
    }

    const products = await ProductModel.insertMany(productsData);

    return res.status(201).json({
      message: 'Products added successfully',
      products,
    });
  } catch (err) {
    console.error('Insert Many Error:', err);
    return res.status(500).json({ message: 'Server error' });
  }
};


const deleteAllProducts = async (req, res) => {
  try {
    const result = await ProductModel.deleteMany({});
    res.status(200).json({
      message: "All products deleted successfully",
      deletedCount: result.deletedCount,
    });
  } catch (error) {
    res.status(500).json({
      message: "Error deleting products",
      error: error.message,
    });
  }
};


//* ✅ Get all products || filteredByCategory || filteredByName
const getProducts = async (req, res) => {
  try {
    const { categoryId, productTitle } = req.query;

    // بناء فلتر ديناميكي
    let filter = {};

    if (categoryId) {
      filter.categoryId = categoryId;
    }

    if (productTitle) {
      filter.title = { $regex: `${productTitle}`, $options: 'i' }; // موجود فيه productTitle (case-insensitive)
    }

    const products = await ProductModel.find(filter).populate('categoryId').lean();

    return res.status(200).json(products);

  } catch (err) {
    console.error('Get All Products Error:', err);
    return res.status(500).json({ message: 'Server error' });
  }
};


module.exports = {
  getProducts,
  createProduct,
  createListOfProducts,
  deleteAllProducts
};
