const mongoose = require('mongoose');
const { user_model } = require('./models');

const userSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: [true, 'Name is required'],
      trim: true,
    },
    email: {
      type: String,
      required: [true, 'Email is required'],
      unique: true,
      lowercase: true,
      trim: true,
      match: [
        /^[^\s@]+@[^\s@]+\.[^\s@]+$/,
        'Invalid email format',
      ],
    },
    password: {
      type: String,
      required: [true, 'Password is required'],
      minlength: 6,
    },
    phone: {
      type: String,
      default: null,
    },
    address: {
      type: String,
      default: null,
    },
    houseNo: {
      type: String,
      default: null,
    },
    city: {
      type: String,
      default: null,
    },
    img: {
      type: String,
      default: null, // ممكن رابط للصورة أو base64
    },
  },
  {
    timestamps: true, // دا بيضيف createdAt و updatedAt تلقائيًا
  }
);
userSchema.pre('save', async function (next) {
  if (!this.isModified('password')) return next();
  const bcrypt = require('bcryptjs');
  const salt = await bcrypt.genSalt(10);
  this.password = await bcrypt.hash(this.password, salt);
  next();
});

const userModel = mongoose.model(user_model, userSchema);
module.exports = userModel;
