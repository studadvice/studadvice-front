class FormValidator {
  static String emptyPasswordErrorText =
      'Le mot de passe ne peut pas être vide';
  static String emptyEmailValidationErrorText = 'Veuillez entrer votre email';
  static String notValidEmailErrorText = 'Veuillez saisir un email valide';
  static String passwordTooShortErrorText =
      'Le mot de passe doit contenir au moins 8 caractères';
  static String passwordNotMatchingErrorText =
      'Les mots de passe ne correspondent pas';
  static String passwordCapitalLetterErrorText =
      'Le mot de passe doit contenir au moins une lettre majuscule';
  static String passwordNumberErrorText =
      'Le mot de passe doit contenir au moins un chiffre';
  static String passwordSpecialCharacterErrorText =
      'Le mot de passe doit contenir au moins un caractère spécial';
  static String confirmPasswordValidationErrorText =
      'Veuillez confirmer votre mot de passe';
  static String passwordsNotMatchingErrorText =
      'Les mots de passe ne correspondent pas';

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return emptyEmailValidationErrorText;
    }

    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    if (!emailRegExp.hasMatch(value)) {
      return notValidEmailErrorText;
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return emptyPasswordErrorText;
    }

    // Check if the password meets certain criteria
    if (value.length < 8) {
      return passwordTooShortErrorText;
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return passwordCapitalLetterErrorText;
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return passwordNumberErrorText;
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return passwordSpecialCharacterErrorText;
    }

    return null;
  }

  static String? validateConfirmPassword(
      String password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return confirmPasswordValidationErrorText;
    }

    if (password != confirmPassword) {
      return passwordsNotMatchingErrorText;
    }

    return null; // Passwords match
  }
}
