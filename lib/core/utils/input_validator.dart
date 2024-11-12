class InputValidator {
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    final regex = RegExp(r'^[0-9]{10}$');
    return regex.hasMatch(phoneNumber);
  }

  static bool isNotEmpty(String value) {
    return value.isNotEmpty;
  }
}
