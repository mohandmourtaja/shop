import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_1/model/product_mode.dart';
import 'package:project_1/services/product_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favouritesList = <ProductModels>[].obs;
  var isloading = true.obs;

  var storage = GetStorage();

  // for search

  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    getProducts();

    List? stored = storage.read<List>('isFavouritesList');

    if (stored != null) {
      favouritesList =
          stored.map((e) => ProductModels.fromJson(e)).toList().obs;
    }

    super.onInit();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      //isloading(true);               نفس الي تحتها بس شكل تاني
      isloading.value = true;
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isloading(false);
    }
  }
  /////////////////////// Logic For favourite screens

  void manageFavourites(int productId) async {
    var existingindex =
        favouritesList.indexWhere((element) => element.id == productId);

    if (existingindex >= 0) {
      // 0  بيحذف

      favouritesList.removeAt(existingindex);

      await storage.remove('isFavouritesList');
    } else {
      //-1 بيضيف
      favouritesList
          .add(productList.firstWhere((element) => element.id == productId));

      await storage.write('isFavouritesList', favouritesList);
    }
  }

  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }

  ///// search bar logic

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();
    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList('');
  }
}
