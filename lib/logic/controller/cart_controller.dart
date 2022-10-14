import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/model/product_mode.dart';
import 'package:project_1/routes/routes.dart';

import '../../utils/theme.dart';

class CartControlelr extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
    } else {
      productsMap[productModels] = 1;
    }
  }

  void removeProductFromCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
    }
  }

  void removeOneProduct(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {
    Get.defaultDialog(
        title: 'Clean Product',
        titleStyle: const TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        middleText: 'Are you sure you need clear products',
        middleTextStyle: const TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        backgroundColor: Colors.grey,
        radius: 10,
        textCancel: 'No',
        cancelTextColor: Colors.black,
        textConfirm: 'Yes',
        confirmTextColor: Colors.black,
        onCancel: () {
          Get.toNamed(Routes.cartScreen);
        },
        onConfirm: () {
          productsMap.clear();
          Get.back();
        },
        buttonColor: Get.isDarkMode ? pinkClr : mainColor);
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
