import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/routes/routes.dart';
import 'package:project_1/utils/theme.dart';
import 'package:project_1/view/widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              //color: Colors.black.withOpacity(2.0),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 60,
                      width: 230,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: const [
                          TextUtils(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            text: 'Asroo',
                            color: mainColor,
                            underLine: TextDecoration.none,
                          ),
                          SizedBox(width: 7),
                          TextUtils(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            text: 'Shop',
                            color: Colors.white,
                            underLine: TextDecoration.none,
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 250,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12)),
                    onPressed: () {
                      Get.offNamed(Routes.loginScreen);
                    },
                    child: const TextUtils(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      text: 'Get Start',
                      color: Colors.white,
                      underLine: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextUtils(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        text: "Don't have an Account",
                        color: Colors.white,
                        underLine: TextDecoration.none,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.signUpScreen);
                        },
                        child: const TextUtils(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          text: 'Sign Up',
                          color: Colors.white,
                          underLine: TextDecoration.underline,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
