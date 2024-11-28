///
/// App Validation
///
class Validation {
  /// static method to validate the [String] input
  static bool validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  /// static method to validate the [String] input
  static bool validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return false;
    }
    return RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})')
        .hasMatch(password);
  }

  /// static method to validate the [String] input
  static bool validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return false;
    }
    return RegExp(r'^(\+[0-9]{1,2}\ ){0,1}[0-9]{9,10}$').hasMatch(phone);
  }

  /// static method to validate the [String] input
  static bool validateName(String? name) {
    if (name == null || name.isEmpty) {
      return false;
    }
    return RegExp(r'^[a-zA-Z ]+$').hasMatch(name);
  }

  /// static method to validate the [String] input
  static bool validateAddress(String? address) {
    if (address == null || address.isEmpty) {
      return false;
    }
    return RegExp(r'^[a-zA-Z0-9,\s]+$').hasMatch(address);
  }
}

/// App Validation Exception
class ValidationException implements Exception {
  /// App Validation Exception
  const ValidationException(this.error);

  /// Error thrown during the validation operation.
  final Object error;
}
