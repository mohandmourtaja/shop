import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/logic/controller/product_controller.dart';

class SearchFormText extends StatelessWidget {
  SearchFormText({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        builder: (_) => TextFormField(
              controller: controller.searchTextController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              onChanged: (searchName) {
                controller.addSearchToList(searchName);
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                focusColor: Colors.red,
                suffixIcon: controller.searchTextController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          controller.clearSearch();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      )
                    : null,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: "Search with name & price ",
                hintStyle: const TextStyle(
                  color: Colors.black45,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ));
  }
}
