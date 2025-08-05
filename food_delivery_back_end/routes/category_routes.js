const express = require('express');
const { category, categories } = require('./pathes');
const verifyToken = require('../middleware/verify_token');
const { sendCategoryController, getCategoriesController } = require('../controllers/category_controller');

const router = express.Router();

//* send category
//* get all categories

router.post(category,verifyToken ,sendCategoryController );

router.get(categories,getCategoriesController );

module.exports = router;
