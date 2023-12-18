import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'fr_FR': {
          // Global
          "global.cancel": "Annuler",
          "global.ok": "OK",
          "global.yes": "Oui",
          "global.no": "Non",
          "global.save": "Enregistrer",
          "global.delete": "Supprimer",
          "global.edit": "Modifier",
          "global.search": "Rechercher",
          "global.back": "Retour",
          "global.email": "E-mail",
          "global.password": "Mot de passe",
          "global.login": "Connexion",
          "global.register": "S'inscrire",
          // ----------------

          // Settings
          "settings.title": "Paramètres",
          "settings.account": "Mon compte",
          "settings.accountDescription": "Appuyez pour changer vos données",
          "settings.darkmode": "Mode sombre",
          "settings.language": "Langue",
          "settings.logout": "Déconnexion",
          "settings.notifications": "Notifications",
          "settings.support": "Support",
          "settings.changePassword": "Changer le mot de passe",
          "settings.terms": "Termes & conditions",
          "settings.accessibility": "Accessibilité",
          // ----------------

          // Home
          // ----------------

          // Login
          "login.welcomeBack": "Bon retour !",
          "login.forgotPassword": "Mot de passe oublié ?",
          "login.rememberMe": "Se souvenir de moi",
          "login.title": "Connexion",
          "login.orContinueWith": "Ou continuer avec",
          "login.passwordError": "Veuillez entrer votre mot de passe",
          "login.legalConditionsButton": "Voir les Termes et Conditions",
          "login.acceptingTermsAndConditions":
              "En continuant à vous connecter ou à vous inscrire en utilisant les méthodes ci-dessus, vous acceptez nos conditions d'utilisation et notre politique de confidentialité.",
          // ----------------

          // Register
          "register.screenTitle": "Veuillez fournir les informations suivantes",
          "register.pseudoHint": "Pseudo",
          "register.pseudoLabel": "Pseudo",
          "register.pseudoError": "Veuillez entrer votre pseudo",
          "register.postalCodeHint": "Code Postal",
          "register.postalCodeLabel": "Code Postal",
          "register.birthDateHint": "Date de naissance",
          "register.birthDateLabel": "Date de naissance",
          "register.birthDateError": "Veuillez entrer votre date de naissance",
          "register.cityHint": "Ville",
          "register.cityLabel": "Ville",
          "register.universityHint": "Université",
          "register.universityLabel": "Université",
          "register.universityDialogClose": "Fermer",
          "register.universitySearchHint": "Rechercher une université",
          "register.countryHint": "Pays d'origine",
          "register.countryLabel": "Pays d'origine",
          "register.formationHint": "Domaine d'étude",
          "register.formationLabel": "Domaine d'étude",
          "register.formationError": "Veuillez entrer votre domaine d'études",
          "register.nextButton": "Suivant",
          "register.cityNotFound": "Ville non trouvée",
          "register.cityNotSelected": "Veuillez sélectionner une ville",
          "register.universityNotSelected":
              "Veuillez sélectionner une université",
          "register.universityNotFound": "Aucune université trouvée",
          "register.defaultUniversityChoice": "Une autre université",
          "register.universityError": "Une erreur est survenue",
          "register.cityError": "Une erreur est survenue",
          "register.postalCodeError": "Une erreur est survenue",
          "register.postalCodeNotFound":
              "Code postal introuvable, veuillez sélectionner une ville.",
          "register.postalCodeNotSelected":
              "Veuillez sélectionner un code postal",
          "register.emailHint": "E-mail",
          "register.emailLabel": "E-mail",
          "register.passwordHint": "Mot de passe",
          "register.passwordLabel": "Mot de passe",
          "register.confirmPasswordHint": "Confirmer le mot de passe",
          "register.confirmPasswordLabel": "Confirmer le mot de passe",
          "register.registerMessage": "Créer un compte",
          "register.connectionButton": "S'inscrire",
          "register.legalConditionsButton": "Voir les Termes et Conditions",
          "register.acceptTermsAndConditionsError":
              "Veuillez accepter les termes et conditions",
          "register.termsAndConditions": "Termes et Conditions",
          "register.acceptingTermsAndConditions":
              "J'accepte les termes et conditions",
          "register.error": "Erreur de connexion",
          "register.invalidCredentials": "E-mail ou mot de passe incorrect",
          "register.signInWithSocialAccountFailed":
              "Une erreur s'est produite lors de la connexion",
          "register.dividerText": "Ou",
          "register.continueWithGoogle": "Continuer avec Google",
          "register.continueWithFacebook": "Continuer avec Facebook",
          "register.continueWithApple": "Continuer avec Apple",
          "register.continueWithX": "Continuer avec X",
          "register.continueWithEmail": "Continuer avec E-mail",
          // ----------------

          // Profile
          // ----------------

          // Forgot Password
          "forgot_password.title": "Mot de passe oublié",
          "forgot_password.emailError": "Veuillez entrer votre adresse e-mail",
          "forgot_password.forgotPasswordMessage":
              "Veuillez entrer votre adresse e-mail pour recevoir un lien de réinitialisation de mot de passe.",
          "forgot_password.successMessage":
              "Un e-mail de réinitialisation de mot de passe a été envoyé à votre adresse e-mail.",
          "forgot_password.successTitle": "Réinitialisation du mot de passe",
          "forgot_password.errorTitle": "Erreur",
          "forgot_password.errorMessage":
              "Une erreur s'est produite lors de la réinitialisation du mot de passe.",
          // ----------------

          // Legal terms
          "legal_terms.title": "Termes & conditions",
          "legal_terms.legalConditionsButton": "Voir les Termes et Conditions",
          "legal_terms.acceptTermsAndConditions":
              "J'accepte les conditions générales d'utilisation",
          "legal_terms.acceptTermsAndConditionsError":
              "Veuillez accepter les termes et conditions",
          "legal_terms.termsAndConditions": "Termes et Conditions",
          // ----------------

          // Connectivity
          "connectivity.noInternetText": "Pas de connexion internet",
          "connectivity.checkConnectionText":
              "Veuillez vérifier votre connexion internet.",
          "connectivity.connectionRestoredText": "Connexion rétablie",
          "connectivity.connectionRestoredMessage":
              "Vous êtes à nouveau connecté à Internet.",
        },
        'en_US': {
          // Global
          "global.cancel": "Cancel",
          "global.ok": "Ok",
          "global.yes": "Yes",
          "global.no": "No",
          "global.save": "Save",
          "global.delete": "Delete",
          "global.edit": "Edit",
          "global.search": "Search",
          "global.back": "Back",
          "global.email": "Email",
          "global.password": "Password",
          "global.login": "Login",
          "global.register": "Register",
          // ----------------

          // Settings
          "settings.title": "Settings",
          "settings.account": "My account",
          "settings.accountDescription": "Tap to change your data",
          "settings.darkmode": "Dark mode",
          "settings.language": "Language",
          "settings.logout": "Logout",
          "settings.notifications": "Notifications",
          "settings.support": "Support",
          "settings.changePassword": "Change Password",
          "settings.terms": "Terms & conditions",
          "settings.accessibility": "Accessibility",
          // ----------------

          // Home
          // ----------------

          // Login
          "login.welcomeBack": "Welcome back!",
          "login.forgotPassword": "Forgot Password?",
          "login.rememberMe": "Remember Me",
          "login.title": "Login",
          "login.orContinueWith": "Or continue with",
          "login.passwordError": "Please enter your password",
          "login.legalConditionsButton": "View Terms and Conditions",
          "login.acceptingTermsAndConditions":
              "By continuing to log in or sign up using the methods above, you agree to our terms of use and privacy policy.",
          // ----------------

          // Register
          "register.screenTitle": "Please provide the following information",
          "register.pseudoHint": "Pseudo",
          "register.pseudoLabel": "Pseudo",
          "register.pseudoError": "Please enter your pseudo",
          "register.postalCodeHint": "Postal Code",
          "register.postalCodeLabel": "Postal Code",
          "register.birthDateHint": "Date of Birth",
          "register.birthDateLabel": "Date of Birth",
          "register.birthDateError": "Please enter your date of birth",
          "register.cityHint": "City",
          "register.cityLabel": "City",
          "register.universityHint": "University",
          "register.universityLabel": "University",
          "register.universityDialogClose": "Close",
          "register.universitySearchHint": "Search for a university",
          "register.countryHint": "Country of Origin",
          "register.countryLabel": "Country of Origin",
          "register.formationHint": "Field of Study",
          "register.formationLabel": "Field of Study",
          "register.formationError": "Please enter your field of study",
          "register.nextButton": "Next",
          "register.cityNotFound": "City not found",
          "register.cityNotSelected": "Please select a city",
          "register.universityNotSelected": "Please select a university",
          "register.universityNotFound": "No university found",
          "register.defaultUniversityChoice": "Another university",
          "register.universityError": "An error occurred",
          "register.cityError": "An error occurred",
          "register.postalCodeError": "An error occurred",
          "register.postalCodeNotFound":
              "Postal code not found, please select a city.",
          "register.postalCodeNotSelected": "Please select a postal code",
          "register.emailHint": "Email",
          "register.emailLabel": "Email",
          "register.passwordHint": "Password",
          "register.passwordLabel": "Password",
          "register.confirmPasswordHint": "Confirm Password",
          "register.confirmPasswordLabel": "Confirm Password",
          "register.registerMessage": "Create an account",
          "register.connectionButton": "Sign Up",
          "register.legalConditionsButton": "View Terms and Conditions",
          "register.acceptTermsAndConditionsError":
              "Please accept the terms and conditions",
          "register.termsAndConditions": "Terms and Conditions",
          "register.acceptingTermsAndConditions":
              "I accept terms and conditions",
          "register.error": "Connection error",
          "register.invalidCredentials": "Incorrect email or password",
          "register.signInWithSocialAccountFailed":
              "An error occurred during login",
          "register.dividerText": "Or",
          "register.continueWithGoogle": "Continue with Google",
          "register.continueWithFacebook": "Continue with Facebook",
          "register.continueWithApple": "Continue with Apple",
          "register.continueWithX": "Continue with X",
          "register.continueWithEmail": "Continue with Email",
          // ----------------

          // Profile
          // ----------------

          // Forgot Password
          "forgot_password.title": "Forgot Password",
          "forgot_password.emailError": "Please enter your email address",
          "forgot_password.forgotPasswordMessage":
              "Please enter your email address to receive a password reset link.",
          "forgot_password.successMessage":
              "A password reset email has been sent to your email address.",
          "forgot_password.successTitle": "Password Reset",
          "forgot_password.errorTitle": "Error",
          "forgot_password.errorMessage":
              "An error occurred during the password reset.",
          // ----------------

          // Legal terms
          "legal_terms.title": "Terms & conditions",
          "legal_terms.legalConditionsButton": "View Terms and Conditions",
          "legal_terms.acceptTermsAndConditions":
              "I accept the terms and conditions",
          "legal_terms.acceptTermsAndConditionsError":
              "Please accept the terms and conditions",
          "legal_terms.termsAndConditions": "Terms and Conditions",
          // ----------------

          // Connectivity
          "connectivity.noInternetText": "No internet connection",
          "connectivity.checkConnectionText":
              "Please check your internet connection.",
          "connectivity.connectionRestoredText": "Connection restored",
          "connectivity.connectionRestoredMessage":
              "You are now connected to the Internet.",
        }
      };
}
