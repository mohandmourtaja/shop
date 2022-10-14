import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/logic/controller/cart_controller.dart';
import 'package:project_1/logic/controller/category_controller.dart';
import 'package:project_1/logic/controller/product_controller.dart';
import 'package:project_1/model/product_mode.dart';
import 'package:project_1/utils/theme.dart';
import 'package:project_1/view/screens/product_details_screen.dart';
import 'package:project_1/view/widgets/text_utils.dart';

class CategoryItems extends StatelessWidget {
  final String categoryTitle;
  CategoryItems({required this.categoryTitle, Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartControlelr>();
  final categorycontroller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: Text(categoryTitle),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        ),
        body: Obx(() {
          if (categorycontroller.isAllCategoryLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
            );
          } else {
            return GridView.builder(
                itemCount: categorycontroller.categotyList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 6.0,
                  maxCrossAxisExtent: 200,
                ),
                itemBuilder: (context, index) {
                  return buildCardItems(
                    image: categorycontroller.categotyList[index].image,
                    price: categorycontroller.categotyList[index].price,
                    rate: categorycontroller.categotyList[index].rating.rate,
                    productId: categorycontroller.categotyList[index].id,
                    productModels: categorycontroller.categotyList[index],
                    onTap: () {
                      Get.to(() => ProductDetailsScreen(
                            productModels:
                                categorycontroller.categotyList[index],
                          ));
                    },
                  );
                });
          }
        }));
  }

  Widget buildCardItems(
      {required String image,
      required double price,
      required double rate,
      required int productId,
      required ProductModels productModels,
      required Function() onTap}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 5.0,
                  spreadRadius: 3.0),
            ],
          ),
          child: Column(
            children: [
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.manageFavourites(productId);
                      },
                      icon: controller.isFavourites(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModels);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ],
                );
              }),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ $price',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              text: '$rate',
                              color: Colors.white,
                              underLine: TextDecoration.none,
                            ),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
