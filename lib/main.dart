import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_1/language/localiztion.dart';
import 'package:project_1/logic/controller/theme_controller.dart';
import 'package:project_1/routes/routes.dart';
import 'package:project_1/utils/theme.dart';
import 'package:project_1/utils/utils_string.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Asroo Shop',
        debugShowCheckedModeBanner: false,
        locale: Locale(GetStorage().read<String>('lang').toString()),
        translations: LocaliztionApp(),
        fallbackLocale: Locale(ene),
        theme: ThemesData.light,
        darkTheme: ThemesData.dark,
        themeMode: ThemeController().themeDataGet,
        initialRoute: FirebaseAuth.instance.currentUser != null ||
                GetStorage().read<bool>('auth') == true
            ? AppRoutes.mainScreen
            : AppRoutes.welcome,
        getPages: AppRoutes.routes);
  }
}
