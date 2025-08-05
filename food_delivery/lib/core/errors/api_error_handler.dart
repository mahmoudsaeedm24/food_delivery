class ApiErrorHandler {
  static Exception handle(int? statusCode) {
    // Exception ex;
    switch (statusCode) {
      case 400:
        {
          return Exception('Invalid input. Please check your data.');
        }
      case 401:
        return Exception('Unauthorized. Please log in again.');
      case 403:
        return Exception('Forbidden. You don’t have access.');
      case 404:
        return Exception('User not found.');
      case 409:
        return Exception('Conflict detected. Try again.');
      case 422:
        return Exception('Unprocessable data.');
      case 500:
      default:
        return Exception('Server error. Please try again later.');
    }
  }
}
