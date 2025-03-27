import 'extensions/string_extension.dart';

class Validator {
  static const String _emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const String _passwordPattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';

  /// Validates email format
  /// Returns null if valid, error message if invalid
  static String? validateEmail(String? email) {
    if (email.isEmptyOrNull) {
      return 'Email is required';
    }

    if (!RegExp(_emailPattern).hasMatch(email!)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  /// Validates password format
  /// Returns null if valid, error message if invalid
  static String? validatePassword(String? password) {
    if (password.isEmptyOrNull) {
      return 'Password is required';
    }

    if (password!.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!RegExp(_passwordPattern).hasMatch(password)) {
      return 'Password must contain at least one letter and one number';
    }

    return null;
  }

  /// Validates both email and password
  /// Returns null if both valid, error message if either is invalid
  static String? validateEmailAndPassword(String? email, String? password) {
    final emailError = validateEmail(email);
    if (emailError != null) return emailError;

    final passwordError = validatePassword(password);
    if (passwordError != null) return passwordError;

    return null;
  }
} 