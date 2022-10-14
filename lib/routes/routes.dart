import 'package:get/get.dart';
import 'package:project_1/logic/binding/auth_binding.dart';
import 'package:project_1/logic/binding/main_binding.dart';
import 'package:project_1/logic/binding/product_binding.dart';
import 'package:project_1/view/screens/auth/forgot_password.dart';
import 'package:project_1/view/screens/auth/login_screen.dart';
import 'package:project_1/view/screens/auth/signup_screen.dart';
import 'package:project_1/view/screens/cart_screen.dart';
import 'package:project_1/view/screens/main_screen.dart';
import 'package:project_1/view/screens/welcome_screen.dart';

class AppRoutes {
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signUpScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgotPasswordScreen,
        page: () => ForgotPasswordScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.mainScreen,
        page: () => MainScreen(),
        bindings: [AuthBinding(), MainBinding(), ProductBinding()]),
    GetPage(
        name: Routes.cartScreen,
        page: () => CartScreen(),
        bindings: [AuthBinding(), ProductBinding()]),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
}
