import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/logic/controller/auth_controller.dart';
import 'package:project_1/utils/theme.dart';
import 'package:project_1/view/widgets/auth/auth_button.dart';

import '../../../utils/utils_string.dart';
import '../../widgets/auth/auth_text_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();

  final TextEditingController emailComtroller = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        title: Text(
          'Forgot Password',
          style: TextStyle(color: Get.isDarkMode ? mainColor : pinkClr),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            )),
      ),
      body: Form(
          key: fromKey,
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: pinkClr,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'If you want to recover your account , then please provide your email ID below ..',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/images/forgetpass copy.png',
                  width: 250,
                ),
                const SizedBox(
                  height: 50,
                ),
                AuthTextFormField(
                    controller: emailComtroller,
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
                        : const Icon(Icons.email, size: 30, color: pinkClr),
                    suffixIcon: const Text(''),
                    hintText: 'Email'),
                const SizedBox(
                  height: 50,
                ),
                GetBuilder<AuthController>(builder: (_) {
                  return AuthButton(
                      text: 'SEND',
                      onPressed: () {
                        if (fromKey.currentState!.validate()) {
                          controller.resetPassword(emailComtroller.text.trim());
                        }
                      });
                })
              ],
            ),
          ))),
    ));
  }
}
