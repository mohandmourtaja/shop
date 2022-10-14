import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/logic/controller/product_controller.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
        if (controller.favouritesList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/heart.png'),
                ),
                const SizedBox(
                  height: 100,
                ),
                Text(
                  'Please, App your favourites products',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                )
              ],
            ),
          );
        } else {
          return ListView.separated(
              itemBuilder: (context, index) {
                return buildfavItems(
                    image: controller.favouritesList[index].image,
                    price: controller.favouritesList[index].price,
                    title: controller.favouritesList[index].title,
                    productId: controller.favouritesList[index].id);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.favouritesList.length);
        }
      }),
    );
  }

  Widget buildfavItems({
    required String image,
    required double price,
    required String title,
    required int productId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  controller.manageFavourites(productId);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
