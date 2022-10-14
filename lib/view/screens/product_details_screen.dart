import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/model/product_mode.dart';
import 'package:project_1/view/widgets/productDetails/add_cart.dart';
import 'package:project_1/view/widgets/productDetails/clothes_info.dart';
import 'package:project_1/view/widgets/productDetails/size_list.dart';

import '../widgets/productDetails/image_sliders.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;
  const ProductDetailsScreen({required this.productModels, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlider(imageUrl: productModels.image),
              ColthesInfo(
                title: productModels.title,
                productId: productModels.id,
                rate: productModels.rating.rate,
                description: productModels.description,
              ),
              const SizeList(),
              AddCart(price: productModels.price, productModels: productModels)
            ],
          ),
        ),
      ),
    );
  }
}
