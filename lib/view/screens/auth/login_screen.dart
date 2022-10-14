import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/routes/routes.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../utils/theme.dart';
import '../../../utils/utils_string.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController paswordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: fromKey,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: 'LOG',
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              underLine: TextDecoration.none),
                          const SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: 'IN',
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              underLine: TextDecoration.none),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFormField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid email';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset('assets/images/email.png')
                              : const Icon(Icons.email,
                                  size: 30, color: pinkClr),
                          suffixIcon: const Text(''),
                          hintText: 'Email'),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthTextFormField(
                          controller: paswordController,
                          obscureText: controller.isVisibilty ? false : true,
                          validator: (value) {
                            if (value.toString().length <= 6) {
                              return 'password should be longer or equal 6 character';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset('assets/images/lock.png')
                              : const Icon(Icons.lock,
                                  size: 30, color: pinkClr),
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibilty();
                              },
                              icon: controller.isVisibilty
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )),
                          hintText: 'Password',
                        );
                      }),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgotPasswordScreen);
                            },
                            child: TextUtils(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                text: 'Forgot Password?',
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                underLine: TextDecoration.none)),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthButton(
                            text: "LOG IN ",
                            onPressed: () {
                              String email = emailController.text.trim();
                              String password = paswordController.text;
                              if (fromKey.currentState!.validate()) {
                                controller.logInUSingFirebase(
                                    email: email, password: password);
                              }
                            });
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      TextUtils(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          text: 'OR',
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          underLine: TextDecoration.none),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GetBuilder<AuthController>(builder: (_) {
                            return InkWell(
                                onTap: () {
                                  //controller.faceBookSignUpApp();
                                },
                                child:
                                    Image.asset('assets/images/facebook.png'));
                          }),
                          const SizedBox(
                            width: 10,
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return InkWell(
                                onTap: () {
                                  //controller.googleSignUpApp;
                                },
                                child: Image.asset('assets/images/google.png'));
                          })
                        ],
                      )
                    ],
                  ),
                ),
              ),
              ContainerUnder(
                  text: " Don't have an Account? ",
                  onPressed: () {
                    Get.offNamed(Routes.signUpScreen);
                  },
                  textType: 'Sign up')
            ],
          ),
        ),
      ),
    ));
  }
}
