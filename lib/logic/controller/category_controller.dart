import 'package:get/get.dart';
import 'package:project_1/services/category_services.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var categotyList = [].obs;
  var isCategoryLoading = false.obs;
  var isAllCategoryLoading = false.obs;

  List<String> imageCategory = [
    'https://images.pexels.com/photos/1432675/pexels-photo-1432675.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/8398845/pexels-photo-8398845.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/1336873/pexels-photo-1336873.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/3858268/pexels-photo-3858268.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
  ];

  @override
  void onInit() {
    getCategorys();
    super.onInit();
  }

  void getCategorys() async {
    var categoryName = await CategoryServices.getCategory();
    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  getAllCategorys(String namecategory) async {
    isAllCategoryLoading(true);
    categotyList.value = await AllCategoryServices.getAllCategory(namecategory);

    isAllCategoryLoading(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategorys(categoryNameList[index]);

    if (categoryAllName != null) {
      categotyList.value = categoryAllName;
    }
  }
}
