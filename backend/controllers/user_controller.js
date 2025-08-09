const User = require('../models/user_model');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

/*
? login
? signup
? get user
? update user
*/
const login = async (req, res) => {
  console.log("Login is start");
  
  try {
    const { email, password } = req.body;

    // ⛔️ 400 - Missing fields
    if (!email || !password) {
      return res.status(400).json({ message: 'Email and password are required' });
    }

    console.log(email);
    

    // 🔍 البحث عن المستخدم
    const user = await User.findOne({ email });

    // ⛔️ 404 - User not found
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    // 🔐 مقارنة الباسورد
    const isMatch = await bcrypt.compare(password, user.password);
    // const isMatch = await bcrypt.compare(pa, b);
    console.log("isMatch " + isMatch);
    console.log("password " + password);
    console.log("bcrpt : " + user.password);
    
    
    // ⛔️ 401 - Wrong password
    if (!isMatch) {
      return res.status(401).json({ message: 'Invalid password' });
    }

    // ✅ 200 - تسجيل دخول ناجح → توليد التوكن
    const token = jwt.sign(
      { id: user._id, email: user.email },
      process.env.SECRET_KEY,
      { expiresIn: process.env.JWT_EXPIRES_IN }
    );
    res.setHeader('Authorization', `Bearer ${token}`);
    return res.status(200).json(user);
  } catch (err) {
    console.error(err);
    // ⛔️ 500 - Server error
    return res.status(500).json({ message: 'Server error' });
  }
};

const signup = async (req, res) => {
  try {
    const {
      name,
      email,
      password,
      phone,
      address,
      houseNo,
      city,
      img,
    } = req.body;

    // ✅ التحقق من الحقول المطلوبة
    if (!name || !email || !password) {
      return res.status(400).json({ message: 'Name, email and password are required' });
    }

    // ✅ تحقق من وجود المستخدم مسبقًا
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(409).json({ message: 'User already exists' });
    }

    // ✅ إنشاء المستخدم الجديد (تشفير الباسورد يتم تلقائيًا في pre('save'))
    const newUser = new User({
      name,
      email,
      password,
      phone,
      address,
      houseNo,
      city,
      img,
    });

    await newUser.save();

    // ✅ توليد JWT
    const token = jwt.sign(
      { id: newUser._id, email: newUser.email },
      process.env.SECRET_KEY,
      { expiresIn: process.env.JWT_EXPIRES_IN || '1d' }
    );

    // ✅ إعداد response نظيف (بدون الباسورد)
    res.setHeader('Authorization', `Bearer ${token}`);

    return res.status(201).json({
      message: 'User registered successfully',
      user: {
        id: newUser._id,
        name: newUser.name,
        email: newUser.email,
        phone: newUser.phone,
        address: newUser.address,
        houseNo: newUser.houseNo,
        city: newUser.city,
        img: newUser.img,
        createdAt: newUser.createdAt,
      },
    });
  } catch (err) {
    console.error('Signup Error:', err);
    return res.status(500).json({ message: 'Server error' });
  }
};

const user = async (req, res) => {
  try {
    // أو لو عايز تجيب من قاعدة البيانات:
    const user = await User.findById(req.user.id);
    if (!user) return res.status(404).json({ message: 'User not found' });
    res.json(user);
  } catch (err) {
    res.status(500).json({ message: 'Server Error' });
  }
}

const updateUser = async (req, res) => {
  try {
    const user = req.user;
    const updates = req.body;

    if (!user) return res.status(404).json({ message: 'User not found' });

    // Update allowed fields
    const allowedFields = ['name', 'password', 'phone', 'address', 'houseNo', 'city', 'img'];
    for (let field of allowedFields) {
      if (updates[field] !== undefined) {
        if (field === 'password') {
          const bcrypt = require('bcryptjs');
          const salt = await bcrypt.genSalt(10);
          user.password = await bcrypt.hash(updates.password, salt);
        } else {
          user[field] = updates[field];
        }
      }
    }

    await user.save();
    const { password, ...userWithoutPassword } = user.toObject();

    res.status(200).json({ message: 'User updated', user: userWithoutPassword });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
};




module.exports = { login, signup, user, updateUser};