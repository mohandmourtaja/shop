import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_1/utils/utils_string.dart';

class SettingController extends GetxController {
  var switchValue = false.obs;

  var Storage = GetStorage();
  var langLocal = ene;

  String capitalize(String profileName) {
    return profileName.split(' ').map((name) => name.capitalize).join(' ');
  }

  //language
  @override
  void onInit() async {
    super.onInit();
    langLocal = await getLanguage;
  }

  void saveLanguage(String lang) async {
    await Storage.write('lang', lang);
  }

  Future<String> get getLanguage async {
    return await Storage.read('lang');
  }

  void changeLanguage(String typelang) {
    saveLanguage(typelang);
    if (langLocal == typelang) {
      return;
    }
    if (typelang == frf) {
      langLocal = frf;
      saveLanguage(frf);
    } else if (typelang == ara) {
      langLocal = ara;
      saveLanguage(ara);
    } else {
      langLocal = ene;
      saveLanguage(ene);
    }
    update();
  }
}
