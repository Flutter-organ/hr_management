import '../failures/failure.dart';

class RegisterValidator {
  static ValidationFailure? validate({
    required String email,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  }) {
    final errors = <String, List<String>>{};

    if (email.trim().isEmpty) {
      errors['email'] = ['Email is required'];
    } else if (!RegExp(
      r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$',
    ).hasMatch(email)) {
      errors['email'] = ['Invalid email format'];
    }

    if (phoneNumber.trim().isEmpty) {
      errors['phone'] = ['Phone number is required'];
    } else if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(phoneNumber)) {
      errors['phone'] = ['Invalid phone number'];
    }

    if (password.isEmpty) {
      errors['password'] = ['Password is required'];
    } else if (password.length < 8) {
      errors['password'] = ['Password must be at least 8 characters'];
    }

    if (confirmPassword.isEmpty) {
      errors['confirmPassword'] = ['Confirm password is required'];
    } else if (password != confirmPassword) {
      errors['confirmPassword'] = ['Passwords do not match'];
    }

    if (errors.isEmpty) {
      return null;
    }

    return ValidationFailure(
      message: 'Please check your input',
      fieldErrors: errors,
    );
  }
}
