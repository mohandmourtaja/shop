import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/logic/controller/cart_controller.dart';
import 'package:project_1/utils/theme.dart';
import 'package:project_1/view/widgets/cart/cart_product_card.dart';
import 'package:project_1/view/widgets/cart/cart_total.dart';
import 'package:project_1/view/widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartControlelr>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
              title: const Text('Cart Items'),
              centerTitle: true,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {
                      controller.clearAllProducts();
                    },
                    icon: const Icon(Icons.backspace))
              ],
            ),
            body: Obx(() {
              if (controller.productsMap.isEmpty) {
                return const EmptyCart();
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 600,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return CartProductCard(
                                index: index,
                                productModels:
                                    controller.productsMap.keys.toList()[index],
                                quantinty: controller.productsMap.values
                                    .toList()[index],
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 20,
                                ),
                            itemCount: controller.productsMap.length),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: CartTotal(),
                      )
                    ],
                  ),
                );
              }
            })));
  }
}
