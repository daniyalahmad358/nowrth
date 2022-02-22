import 'package:email_validator/email_validator.dart';

enum PasswordStatus {
  isEmpty,
  isShort,
  noUpperCase,
  noLowerCase,
  noDigit,
  noSpecialCharacter,
  invalidCharacter,
  valid,
}

abstract class ValidateText {
  static bool firstName(String value) {
    return value.isNotEmpty;
  }

  static bool lastName(String value) {
    return value.isNotEmpty;
  }

  static bool email(String value) {
    return EmailValidator.validate(value);
  }

  static PasswordStatus password(String value) {
    String patternSpecialCharacters = r'(?=.*?[`~!@#$%^&*()-+{}|;:,<.>/?])';
    RegExp regExpUpperCase = RegExp(r'[A-Z]');
    RegExp regExpLowerCase = RegExp(r'[a-z]');
    RegExp regExpDigits = RegExp(r'[0-9]');
    RegExp regExpSpecialCharacters = RegExp(patternSpecialCharacters);
    bool hasUpperCase = regExpUpperCase.hasMatch(value);
    bool hasLowerCase = regExpLowerCase.hasMatch(value);
    bool hasDigits = regExpDigits.hasMatch(value);
    bool hasSpecialCharacters = regExpSpecialCharacters.hasMatch(value);
    if (value.isEmpty) {
      return PasswordStatus.isEmpty;
    } else if (value.length < 8) {
      return PasswordStatus.isShort;
    } else if (!hasUpperCase) {
      return PasswordStatus.noUpperCase;
    } else if (!hasLowerCase) {
      return PasswordStatus.noLowerCase;
    } else if (!hasDigits) {
      return PasswordStatus.noDigit;
    } else if (!hasSpecialCharacters &&
        !value.contains('_') &&
        !value.contains('=') &&
        !value.contains('"') &&
        !value.contains("'")) {
      return PasswordStatus.noSpecialCharacter;
    } else if (value.isNotEmpty &&
        hasUpperCase &&
        hasLowerCase &&
        hasDigits &&
        (hasSpecialCharacters ||
            value.contains('_') ||
            value.contains('=') ||
            value.contains('"') ||
            value.contains("'"))) {
      return PasswordStatus.valid;
    } else {
      return PasswordStatus.invalidCharacter;
    }
  }

  static bool confirmPassword(String _password, _confirmPassword) {
    if (_password == _confirmPassword) {
      return true;
    } else {
      return false;
    }
  }
}

String? validationError(passwordStatus) {
  switch (passwordStatus) {
    case PasswordStatus.isEmpty:
      {
        return 'Password cannot be empty';
      }
    case PasswordStatus.isShort:
      {
        return 'Must be at least 8 characters';
      }
    case PasswordStatus.noUpperCase:
      {
        return 'At least 1 uppercase character is required';
      }
    case PasswordStatus.noLowerCase:
      {
        return 'At least 1 lowercase character is required';
      }
    case PasswordStatus.noDigit:
      {
        return 'At least 1 digit is required';
      }
    case PasswordStatus.noSpecialCharacter:
      {
        return 'At least 1 special character is required';
      }
    case PasswordStatus.invalidCharacter:
      {
        return 'Contains at least 1 invalid character';
      }
    case PasswordStatus.valid:
      {
        return null;
      }
  }
}
