import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_1/logic/controller/product_controller.dart';
import 'package:project_1/utils/theme.dart';
import 'package:project_1/view/widgets/text_utils.dart';
import 'package:readmore/readmore.dart';

class ColthesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;
  ColthesInfo({
    required this.title,
    required this.productId,
    required this.rate,
    required this.description,
    Key? key,
  }) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.white.withOpacity(0.9)
                          : Colors.grey.withOpacity(0.4),
                      shape: BoxShape.circle),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavourites(productId);
                    },
                    child: controller.isFavourites(productId)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                            size: 20,
                          ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              TextUtils(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                text: '$rate',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
              const SizedBox(
                width: 8,
              ),
              // RatingBar(
              //   rating: rate,
              //   icon: Icon(
              //     Icons.star,
              //     size: 20,
              //     color: Colors.grey,
              //   ),
              //   starCount: 5,
              //   spacing: 1,
              //   size: 20,
              //   isIndicator: false,
              //   allowHalfRating: true,
              //   onRatingCallback: (value, isIndictor) {
              //     isIndictor.value = true;
              //   },
              //   color: Colors.orangeAccent,
              // )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ReadMoreText(
            description,
            trimLines: 3,
            trimMode: TrimMode.Line,
            textAlign: TextAlign.justify,
            trimCollapsedText: 'Show More',
            trimExpandedText: 'Show Less',
            lessStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? pinkClr : mainColor),
            moreStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? pinkClr : mainColor),
            style: TextStyle(
                fontSize: 16,
                height: 2,
                color: Get.isDarkMode ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
