import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/logic/controller/cart_controller.dart';
import 'package:project_1/model/product_mode.dart';
import 'package:project_1/utils/theme.dart';

class CartProductCard extends StatelessWidget {
  final ProductModels productModels;
  final int index;
  final int quantinty;
  CartProductCard(
      {required this.productModels,
      required this.index,
      required this.quantinty,
      Key? key})
      : super(key: key);

  final controller = Get.find<CartControlelr>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
          color: Get.isDarkMode
              ? pinkClr.withOpacity(0.7)
              : mainColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(productModels.image),
                    fit: BoxFit.contain)),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModels.title,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '\$${controller.productSubTotal[index].toStringAsFixed(2)}',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.removeProductFromCart(productModels);
                      },
                      icon: Icon(
                        Icons.remove_circle,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      )),
                  Text(
                    '$quantinty',
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.addProductToCart(productModels);
                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ))
                ],
              ),
              IconButton(
                  onPressed: () {
                    controller.removeOneProduct(productModels);
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 20,
                    color: Get.isDarkMode ? Colors.black : Colors.red,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
