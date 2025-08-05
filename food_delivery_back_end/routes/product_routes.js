const express = require('express');
const { product, products,} = require('./pathes');
const productController = require('../controllers/product_controller');
const verifyToken = require('../middleware/verify_token');

const router = express.Router();

//* POST ||  /product || create one product
//* POST ||  /products || create List of products
//* Get ||  /products || Get all products or Filterd by CategoryId
//* Get ||  /products:categoryId || get part of products

router.post(product, verifyToken ,productController.createProduct);
router.post(products, verifyToken ,productController.createListOfProducts );
router.delete(products, verifyToken ,productController.deleteAllProducts );
router.get(products, verifyToken ,productController.getProducts );
// router.get(products, verifyToken ,productController.getProducts );

module.exports = router;