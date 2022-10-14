import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/logic/controller/auth_controller.dart';
import 'package:project_1/logic/controller/setting_controller.dart';
import 'package:project_1/view/widgets/text_utils.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSM6MsJ63denPRQIUe0vCEOGgdEDboKVPnDIaA6ww7jD4Zx5v6TsTaDfeKtblsEwW1OGc&usqp=CAU'),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      text: controller
                          .capitalize(authController.displayUserName.value),
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      underLine: TextDecoration.none,
                    ),
                    TextUtils(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      text: authController.displayUserEmail.value,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      underLine: TextDecoration.none,
                    )
                  ],
                ),
              ],
            ))
      ],
    );
  }
}
