import 'package:flutter/services.dart';
import 'package:test_ecommerce_app/controllers/theme/ThemesController.dart';
import 'package:test_ecommerce_app/controllers/user/user_authentication_controller.dart';
import 'package:test_ecommerce_app/shared/shared_preferences.dart';
import 'package:test_ecommerce_app/controllers/controllers.dart';
import 'package:test_ecommerce_app/shared/utils.dart';
import 'package:test_ecommerce_app/themes/Themes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:test_ecommerce_app/AppBinding.dart';
import 'package:test_ecommerce_app/routes/routes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_ecommerce_app/shared/constants/ColorConstants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await SharedPreferencesClass.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: ColorConstants.mainColor, // navigation bar color
    statusBarColor: ColorConstants.mainColor, // status bar color
  ));

  runApp(App());
}
class App extends StatelessWidget {
  final ThemesController themeController = Get.put(ThemesController());

  @override
  Widget build(BuildContext context) {
    return
       Directionality(textDirection: Utils.direction,child:
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter e-commerce app',
      localizationsDelegates: const[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
         Locale('en', 'US'), // English
         Locale('ar', 'SA'), // Arabic
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first; // Fallback to the default locale if the desired one is not supported
      },
        theme: Themes.lightTheme,
        // darkTheme: Themes.darkTheme,
        // themeMode: getThemeMode(themeController.theme),
        getPages: Routes.routes,
        initialRoute: Routes.INITIAL,
        initialBinding: AppBinding(),
    ));
  }

  ThemeMode getThemeMode(String type) {
    ThemeMode themeMode = ThemeMode.system;
    switch (type) {
      case "system":
        themeMode = ThemeMode.system;
        break;
      case "dark":
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.light;
        break;
    }

    return themeMode;
  }
}
