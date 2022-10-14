import 'package:get/get.dart';
import 'package:project_1/logic/controller/cart_controller.dart';
import 'package:project_1/logic/controller/product_controller.dart';

import '../controller/category_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartControlelr());
    Get.put(CategoryController());
  }
}
