const express = require('express');
const routePathes = require('./pathes');
const userController = require('../controllers/user_controller');
const verifyToken = require('../middleware/verify_token');
const router = express.Router();

/*
! login
! register
! get user info
! update user
*/

//? ---------------  Routes  --------------- ؟//
router.post(routePathes.login, userController.login);
router.post(routePathes.sign_up,userController.signup);

router.get(routePathes.user,verifyToken, userController.user);
router.post(routePathes.user,verifyToken, userController.updateUser);


module.exports = router;