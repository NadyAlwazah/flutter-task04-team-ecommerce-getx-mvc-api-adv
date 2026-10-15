class Validator {
  static passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    } else if (value.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    return null;
  }
}
