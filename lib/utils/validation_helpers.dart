import 'package:tech_buy/utils/string_extensions.dart';

class FieldValidators {
  ///Validator functions not available outside the validator so this has been paused
  ///
  ///
  static String? createPasscodeValidator(String? value) {
    if (value!.isEmpty) {
      return 'Field Cannot Be empty';
    } else if (value.length < 6) {
      return "Password should be greater than 6 characters";
    } else {
      return null;
    }
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Field Cannot Be empty';
    } else if (!value.isEmail && !value.isNumericOnly) {
      return "Enter a valid email";
    } else {
      return null;
    }
  }

  static String? optionalEmailValidator(String? value) {
    if (!value!.isEmail) {
      return "Enter a valid email";
    } else {
      return null;
    }
  }

  static String? notEmptyValidator(String? value) {
    if (value!.isEmpty) {
      return 'Field Cannot Be empty';
    } else {
      return null;
    }
  }

  static String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Field Cannot Be empty';
    } else if (!value.replaceAll(' ', '').isAlphabetOnly &&
        !value.contains('-')) {
      return "Only Alphabets allowed";
    } else {
      return null;
    }
  }

  static String? phoneNumberValidator(String? value) {
    if (value!.isEmpty) {
      return 'Field Cannot Be empty';
    } else if (!value.isNumericOnly) {
      return "Only Numbers allowed";
    } else if (value.length != 11) {
      return "Invalid Phone Number";
    } else {
      return null;
    }
  }

  static String? numberValidator(String? value) {
    if (value!.isEmpty) {
      return 'Field Cannot Be empty';
    } else if (!value.isNum) {
      return "Only Numbers allowed";
    } else {
      return null;
    }
  }
}
