Sure, here's a corrected version:

```markdown
# TODO (agree on the elements to include in this file)

## PROPOSALS (possibly improve, since we're starting)

* Use getX for state management.
* Prefer using stateless widgets for screens to avoid unnecessary rebuilds. (This saves memory and CPU usage and makes the application more fluid.)
* Place controllers in the `lib/src/controllers` folder to manage view states.
* Place screens in the `lib/src/screens` folder to handle the display.
* Place widgets in the `lib/src/widgets` folder to handle the display.
* Place models in the `lib/src/models` folder to handle data.
* The bindings directory contains all the bindings for the screens. You can use the `app_binding.dart`
  file (`lib/src/common/conf`) to contain all common bindings.
* Every screen must have a controller (if state management is used) and a binding defined in the `bindings` folder.
* Store all text to be displayed into the translation files in the `common\translations` folder.

Here is an example of how the text to be translated should be stored, in the `en.json` file (as example for english):

```dart
class En {
  Map<String, String> get messages => {
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
    }
}
```

* Add colors to the `app_colors.dart` file and use them in the code.
* Add font sizes to the `app_font_sizes.dart` file and use them in the code.
* Create a class for each widget used multiple times in the code. This allows easy widget modification and translation.
* Place images in the `assets/images` folder, categorized by type.
* Place icons in the `assets/icons` folder, categorized by type.
* Place fonts in the `assets/fonts` folder, categorized by type. (Currently, there are no custom fonts; the default is GoogleFonts.lato)
* Use a `routes_configuration.dart` file (`lib/src/common/conf`) to contain all application routes. Each route corresponds to a page. (Every new page must be added to this file).


### FOR IMPORT STATEMENTS

For each directory, create an `index.dart` file-like that contains all the imports of the files in the directory.
This allows you to import the entire directory with a single import statement in the file "stud_advices.dart" (`lib/stud_advices.dart`) that 
contains all the imports of the application.

Then to import your class in the code, you can use the following statement:

```dart
import 'package:stud_advice/stud_advice.dart';
```

### Android: To use Firebase and Google Sign-In, add the SHA-1 key in the Firebase console.

Obtain this key using the following command in the terminal at the project root:

```bash
keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore
```

(Default password: android) Then, download the `google-services.json` file from the Firebase console and place it in the `android/app` folder.

If you encounter issues with Google authentication, try obtaining your SHA-1 key from your android folder by running the following command in the terminal at the project root:

```bash
./gradlew signingReport
```

This command displays all SHA-1 keys in your android folder. Add the SHA-1 corresponding to your debug signing key in the Firebase console.

### iOS: To use Firebase and Google Sign-In, add the `GoogleService-Info.plist` file in the `ios/Runner` folder.

Download this file from the Firebase console.

Apple authentication requires development on a Mac, and by default, the Apple authentication button is not displayed on Android. See the `register_options_screen.dart` and `login_options_screen.dart` files for more details.

### Facebook: Create a developer account and add the application in the Facebook console.

- [Facebook Developer](https://developers.facebook.com/)
- [Setup Developer Account Video](https://www.youtube.com/watch?v=AG_hO03Vyto)
- [Generate Facebook Hash Key](https://stackoverflow.com/questions/54657148/facebook-login-problem-with-hash-key-flutter-how-to-generate-facebook-hashk)
- [Configure Facebook Connect on Android](https://facebook.meedu.app/docs/6.x.x/android)
- [Configure Facebook Connect on iOS](https://facebook.meedu.app/docs/6.x.x/ios)

This is useful as we can configure it with our StudAdvice Facebook account.

### Native Splash Screen

To customize the native splash screen, follow the instructions of this package:
[flutter_native_splash](https://pub.dev/documentation/flutter_native_splash/latest/)

Once your splash screen is customized, run the following command to generate native files:

```bash
dart run flutter_native_splash:create
```

Then

```bash
dart run flutter_native_splash:create --path:flutter_native_splash.yaml
```
```

I corrected grammar, punctuation, and formatting. If you have specific sentences or parts you want to further discuss or modify, feel free to let me know!