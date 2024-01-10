import 'package:country_picker/country_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stud_advice/firebase_options.dart';
import 'package:stud_advice/src/utils/notification_service.dart';
import 'package:stud_advice/stud_advice.dart';
import 'package:timezone/data/latest.dart' as tz;

class StudAdviceApp extends StatelessWidget {
  const StudAdviceApp({super.key});

  @override
  Widget build(BuildContext context) {
    final RoutesConfiguration routesConfiguration =
        Get.put(RoutesConfiguration());

    Get.put(DeeplTranslatorController());

    return GetMaterialApp(
      title: "Stud'Advice",
      theme: Styles.lightTheme,
      darkTheme: Styles.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesConfiguration.initialRoute,
      initialBinding: AppDependenciesBinding(),
      getPages: routesConfiguration.configureRoutes(),
      translations: AppTranslations(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        CountryLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: CustomLocale('fr', 'FR'),
      supportedLocales: [const Locale('en', 'US'), const Locale('fr', 'FR')],
    );
  }
}

Future<void> loadUniversities() async {
  final getLocalStorage = GetStorage();
  for (var locale in supportedLocales) {
    final fileLocale = '${locale.languageCode}_${locale.countryCode}';

    final path = 'assets/universities/$fileLocale.txt';

    debugPrint('Loading universities for $path');
    if (getLocalStorage.read('universities_$fileLocale') != null) {
      debugPrint('Universities for $fileLocale already loaded. Skipping.');
      continue;
    }

    try {
      var content = await rootBundle.loadString(path);
      throwIf(content == '', 'Could not load $path or it is empty');

      // Process each line and add it to the university list
      List<String> universityList = content.split('\n');
      debugPrint('Loaded $universityList universities for $fileLocale');

      universityList.removeWhere((element) => element == '');

      getLocalStorage.write('universities_$fileLocale', universityList);

      debugPrint('Universities for $fileLocale loaded successfully');
    } catch (e) {
      debugPrint('Error loading universities for $fileLocale: $e');
    }
  }
}

Future<void> loadTerms() async {
  final getLocalStorage = GetStorage();
  for (var locale in supportedLocales) {
    final fileName = '${locale.languageCode}_${locale.countryCode}';
    debugPrint('Loading legal terms for $fileName');

    final path = 'assets/legal_terms/$fileName.txt';
    var content = await rootBundle.loadString(path);

    throwIf(content == '', 'Could not load $path or it is empty');

    if (getLocalStorage.read('legal_terms_$fileName') != null) continue;
    await getLocalStorage.write('legal_terms_$fileName', content);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await NotificationService().initNotification();
  tz.initializeTimeZones();
  await GetStorage.init();
  await dotenv.load();
  await loadTerms();
  Get.put(ConnectionController());
  await loadUniversities().then((_) {
    runApp(const StudAdviceApp());
  });
}
