import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/logic/controller/auth_controller.dart';
import 'package:project_1/utils/theme.dart';
import 'package:project_1/utils/utils_string.dart';
import 'package:project_1/view/widgets/auth/auth_button.dart';
import 'package:project_1/view/widgets/auth/auth_text_form_field.dart';
import 'package:project_1/view/widgets/auth/check_widget.dart';
import 'package:project_1/view/widgets/text_utils.dart';

import '../../../routes/routes.dart';
import '../../widgets/auth/container_under.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();

  final TextEditingController nameComtroller = TextEditingController();
  final TextEditingController emailComtroller = TextEditingController();
  final TextEditingController paswordComtroller = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: fromKey,
          child: Column(
            children: [
              Container(
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
                              text: 'SIGN',
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              underLine: TextDecoration.none),
                          const SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: 'UP',
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              underLine: TextDecoration.none),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthTextFormField(
                          controller: nameComtroller,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset('assets/images/user.png')
                              : const Icon(Icons.person,
                                  size: 30, color: pinkClr),
                          suffixIcon: const Text(''),
                          hintText: 'User Name'),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFormField(
                          controller: emailComtroller,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid email 00';
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
                          controller: paswordComtroller,
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
                      const SizedBox(
                        height: 50,
                      ),
                      CheckWidget(),
                      const SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthButton(
                            text: "SIGN UP ",
                            onPressed: () async {
                              if (controller.isCheckBox == false) {
                                Get.snackbar('Check Box',
                                    'please, Accept terms & conditions',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white);
                              } else if (fromKey.currentState!.validate()) {
                                String name = nameComtroller.text.trim();
                                String email = emailComtroller.text.trim();
                                String password = paswordComtroller.text;
                                controller.signUpUSingFirebase(
                                    name: name,
                                    email: email,
                                    password: password);
                                controller.isCheckBox = true;
                              }
                            });
                      })
                    ],
                  ),
                ),
              ),
              ContainerUnder(
                  text: 'Already have an Account? ',
                  onPressed: () {
                    Get.offNamed(Routes.loginScreen);
                  },
                  textType: 'Log in')
            ],
          ),
        ),
      ),
    ));
  }
}
