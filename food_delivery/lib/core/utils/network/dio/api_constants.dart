abstract class ApiConstants {
  static const String baseUrl = 'http://192.168.1.9:3000/api';
  static const String contentType = 'application/json';
}

abstract class Pathes {
  static const String loginPath = '/login';
  static const String signupPath = '/signup';
  static const String userPath = '/user';
  static const String categoriesPath = '/categories';
  static const String productsPath = '/products';
  static const String productsWithCategoryPath = "/products:categoryId";
}
