final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

final RegExp _passwordRegex = RegExp(
  r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
);

final RegExp _usernameRegex = RegExp(
  r'^[a-zA-Z][a-zA-Z0-9._]{2,19}$'
);

final RegExp _egyptPhoneRegex = RegExp(
  r'^01[0-2,5]{1}[0-9]{8}$'
);



class MyValidator {
  MyValidator._();
  static String? validateEmail(String? email) {
    if (email == null) {
      return "Enter email address";
    } else if (!email.contains(_emailRegex)) {
      return "Enter valid email";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? password) {
    if (password == null) {
      return "Enter your password";
    } else if (!password.contains(_passwordRegex)) {
      return "Your password is weak";
    } else {
      return null;
    }
  }

  static String? simpleValidatePassword(String? password) {
    if (password == null || password.trim().isEmpty) {
      return 'Please enter your password';
    }
    if (password.trim().length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateUserName(String? userName) {
    if (userName == null || userName.trim().isEmpty) {
      return 'Please enter Your name';
    }
    if (!userName.contains(_usernameRegex)) {
      return 'Enter valid User Name';
    }
    return null;
  }

  static String? validateEgyPhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.trim().isEmpty) {
      return 'Please enter your phone';
    }
    if (!phoneNumber.contains(_egyptPhoneRegex)) {
      return 'Enter valid Egypt phone Number';
    }
    return null;
  }

}
