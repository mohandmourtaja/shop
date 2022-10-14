import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/logic/controller/cart_controller.dart';
import 'package:project_1/logic/controller/main_controller.dart';
import 'package:project_1/routes/routes.dart';
import 'package:project_1/utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartControlelr>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          elevation: 0,
          leading: Container(),
          actions: [
            Obx(() {
              return Badge(
                position: BadgePosition.topEnd(top: 0, end: 3),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  cartController.quantity().toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    icon: Image.asset('assets/images/shop.png')),
              );
            })
          ],
          title: Text(controller.title[controller.currentIndex.value]),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            controller.currentIndex.value = index;
          },
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ''),
          ],
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.tabs.value,
        ),
      );
    }));
  }
}
