# 📦 Food Delivery Backend

This is the backend service for the **Food Delivery App**.  
It is built with **Node.js + Express**, uses **MongoDB Atlas** as the database, and implements **JWT authentication**.

The backend provides **REST APIs** for authentication, user management, products, and categories — designed for seamless integration with the mobile app.

---

## 🚀 Features

- 🔑 **Authentication & Authorization** with JWT

- 📦 **Product Management** (create, list, delete, bulk insert)

- 📂 **Category Management**

- 👤 **User Management** (register, login, update profile)

- 🌍 **MongoDB Atlas** as the cloud database

- 🔒 **Secure Routes** protected with middleware

---

## ⚙️ Installation

### 1. Clone the repository

```bash
git clone https://github.com/mahmoudsaeedm24/food_delivery.git
cd food_delivery/backend
```

### 2. Install dependencies

```bash
npm install
```

### 3. Environment variables

Create a `.env` file inside `backend/` with:

```env
PORT=3000
MONGO_DB=your-mongo-db-url
USER_DB=your-db-user
PASS_DB=your-db-password
DB_NAME=your-db-name

JWT_EXPIRES_IN=1d
SECRET_KEY=your-secret-key
```

### 4. Run the server

```bash
npm start
```

---

## 🔑 Authentication

Some routes are **protected** and require a JWT token.

- After **signup** or **login**, you will receive a `token`.

- Add it in the **Authorization header**:

```bash
Authorization: Bearer <your_token>
```

---

# 📖 API Documentation

Below is the detailed API reference with **Postman-style request/response examples**.

---

## 👤 User & Auth Routes

### 🔹 1. Signup

**POST** `/api/signup`  
Registers a new user.

📌 **Body (JSON)**

```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "123456",
  "phone": "01012345678",
  "address": "123 Street",
  "houseNo": "12A",
  "city": "Cairo",
  "img": "https://example.com/profile.png"
}
```

📌 **Response (201)**

```json
{
  "message": "User registered successfully",
  "user": {
    "id": "64a0f23...",
    "name": "John Doe",
    "email": "john@example.com",
    "phone": "01012345678",
    "address": "123 Street",
    "houseNo": "12A",
    "city": "Cairo",
    "img": "https://example.com/profile.png",
    "createdAt": "2025-08-16T18:40:00Z"
  }
}
```

---

### 🔹 2. Login

**POST** `/api/login`  
Logs in a user and returns a JWT token.

📌 **Body (JSON)**

```json
{
  "email": "john@example.com",
  "password": "123456"
}
```

📌 **Response (200)**

```json
{
  "_id": "64a0f23...",
  "name": "John Doe",
  "email": "john@example.com",
  "phone": "01012345678",
  "address": "123 Street",
  "houseNo": "12A",
  "city": "Cairo",
  "img": "https://example.com/profile.png"
}
```

🔑 Token will be available in the **Authorization Header**.

---

### 🔹 3. Get User Info

**GET** `/api/user`  
Returns the logged-in user’s profile.  
✔ Requires JWT Token.

📌 **Headers**

```
Authorization: Bearer <your_token>
```

📌 **Response (200)**

```json
{
  "_id": "64a0f23...",
  "name": "John Doe",
  "email": "john@example.com",
  "phone": "01012345678",
  "address": "123 Street",
  "houseNo": "12A",
  "city": "Cairo",
  "img": "https://example.com/profile.png"
}
```

---

### 🔹 4. Update User

**POST** `/api/user`  
Updates user info (any field).  
✔ Requires JWT Token.

📌 **Body (JSON)**

```json
{
  "phone": "01198765432",
  "city": "Alexandria",
  "password": "newPass123"
}
```

📌 **Response (200)**

```json
{
  "message": "User updated",
  "user": {
    "_id": "64a0f23...",
    "name": "John Doe",
    "email": "john@example.com",
    "phone": "01198765432",
    "address": "123 Street",
    "houseNo": "12A",
    "city": "Alexandria",
    "img": "https://example.com/profile.png"
  }
}
```

---

## 📂 Category Routes

### 🔹 1. Create Category

**POST** `/api/category`  
Creates a new category.  
✔ Requires JWT Token.

📌 **Body (JSON)**

```json
{
  "title": "Food",
  "iconCode": "0xf8d1"
}
```

📌 **Response (201)**

```json
{
  "message": "Category created successfully",
  "category": {
    "_id": "64a2c3...",
    "title": "Food",
    "iconCode": "0xf8d1"
  }
}
```

---

### 🔹 2. Get All Categories

**GET** `/api/categories`  
Fetches all categories.

📌 **Response (200)**

```json
[
  { "_id": "64a2c3...", "title": "Food", "iconCode": "0xf8d1" },
  { "_id": "64a2c4...", "title": "Drinks", "iconCode": "0xf8d2" }
]
```

---

## 🛒 Product Routes

### 🔹 1. Create Product

**POST** `/api/product`  
Adds a single product.  
✔ Requires JWT Token.

📌 **Body (JSON)**

```json
{
  "title": "Pizza Margherita",
  "price": 100,
  "poster": "https://example.com/pizza.png",
  "description": "Classic Italian pizza",
  "images": ["https://example.com/pizza1.png"],
  "rating": 4.5,
  "categoryId": "64a0c1..."
}
```

📌 **Response (201)**

```json
{
  "message": "Product created successfully",
  "product": { ... }
}
```

---

### 🔹 2. Create Multiple Products

**POST** `/api/products`  
Bulk insert products.  
✔ Requires JWT Token.

📌 **Body (JSON)**

```json
[
  {
    "title": "Burger",
    "price": 80,
    "poster": "https://example.com/burger.png",
    "description": "Beef burger",
    "categoryId": "64a0c1..."
  },
  {
    "title": "Fries",
    "price": 30,
    "poster": "https://example.com/fries.png",
    "description": "Crispy fries",
    "categoryId": "64a0c1..."
  }
]
```

---

### 🔹 3. Delete All Products

**DELETE** `/api/products`  
Removes all products.  
✔ Requires JWT Token.

📌 **Response (200)**

```json
{
  "message": "All products deleted successfully",
  "deletedCount": 12
}
```

---

### 🔹 4. Get Products

**GET** `/api/products`  
Fetches products (supports filters).

📌 **Query Parameters**

- `categoryId` → filter by category

- `productTitle` → search by title

📌 **Example Request**

```
/api/products?categoryId=64a0c1...&productTitle=pizza
```

📌 **Response (200)**

```json
[
  {
    "_id": "64a1b2...",
    "title": "Pizza Margherita",
    "price": 100,
    "categoryId": { "_id": "64a0c1...", "title": "Food" }
  }
]
```

---

## ⚠️ Notes

- Routes marked with **✔ Requires JWT Token** need authentication.

- If testing from a **mobile app**, replace the **base API URL** with your machine’s local IP.

- On Windows, you may need to disable **Windows Defender Firewall** to allow requests from mobile.

- A fresh MongoDB cluster will **not contain demo data** — you must add your own.

---

✅ This README is now **structured, professional, and ready to use**.

هل تحب أطلعلك كمان نسخة **Postman Collection JSON** جاهزة للاستيراد مباشرة في Postman بدل ما تدخل كل API يدوي؟
