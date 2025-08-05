const jwt = require('jsonwebtoken');


/*
! 1. check token get in headers
! 2. if exist -> decode it in req.user
*/
const verifyToken = (req, res, next) => {
  try {
    // 1️⃣ الحصول على التوكن من الهيدر
    const authHeader = req.headers.authorization;

    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      return res.status(401).json({ message: 'No token provided' });
    }

    const token = authHeader.split(' ')[1];

    // 2️⃣ التحقق من التوكن
    const decoded = jwt.verify(token, process.env.SECRET_KEY);

    // 3️⃣ حفظ بيانات المستخدم في req.user
    req.user = decoded;

    // 4️⃣ المتابعة للراوت التالي
    next();

  } catch (error) {
    console.error('JWT Error:', error);
    return res.status(401).json({ message: 'Invalid or expired token' });
  }
};

module.exports = verifyToken;
