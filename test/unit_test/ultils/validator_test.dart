import 'package:base/utils/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validate email', () {
    test('should return null if email is valid', () {
      const validateEmail = 'test@example.com';
      final result = Validator.validateEmail(validateEmail);
      expect(result, null);
    });

    test('should return error message if email is invalid', () {
      const validateEmail = 'test';
      final result = Validator.validateEmail(validateEmail);
      expect(result, 'Please enter a valid email address');
    });
  });

  group('Validate password', () {
    test('should return null if password is valid', () {
      const validatePassword = 'Aa123456';
      final result = Validator.validatePassword(validatePassword);
      expect(result, null);
    });

    test('should return error message if password is invalid', () {
      const validatePassword = '123';
      final result = Validator.validatePassword(validatePassword);
      expect(result, 'Password must be at least 8 characters long');
    });
  });
}
