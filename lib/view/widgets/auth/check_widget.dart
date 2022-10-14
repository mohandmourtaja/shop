import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/logic/controller/auth_controller.dart';
import 'package:project_1/utils/theme.dart';
import 'package:project_1/view/widgets/text_utils.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(10)),
                child: controller.isCheckBox
                    ? Get.isDarkMode
                        ? Image.asset('assets/images/check.png')
                        : const Icon(
                            Icons.done,
                            color: pinkClr,
                          )
                    : Container()),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  text: 'I accept ',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none),
              TextUtils(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  text: 'term & conditions',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.underline),
            ],
          )
        ],
      );
    });
  }
}
