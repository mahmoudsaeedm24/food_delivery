const express = require('express');
const  uesrRoutes  = require('./routes/user_routes');
const  categoryRoutes  = require('./routes/category_routes');
const  productRoutes  = require('./routes/product_routes');
const { base_path } = require('./routes/pathes');
const mongoose = require('mongoose');
const dotenv = require('dotenv').config(); //? imp for connection
const app = express();

app.use(express.json());
mongoose.connect(process.env.MONGO_DB,
  {
    user: process.env.USER_DB,
    pass: process.env.PASS_DB,
    dbName:process.env.DB_NAME,
  })
  .then(() => console.log('MongoDB connected'))
  .catch((err) => console.log('DB error:', err));

//? add path to URL
app.use(base_path, uesrRoutes);
app.use(base_path, categoryRoutes);
app.use(base_path, productRoutes);


app.listen(process.env.PORT,'0.0.0.0',()=>{
  console.log("run on http://localhost:3000/api/");
});

//? app.listen(int port, )