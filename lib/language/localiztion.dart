import 'package:get/route_manager.dart';
import 'package:project_1/language/ar.dart';
import 'package:project_1/language/en.dart';
import 'package:project_1/language/fr.dart';
import 'package:project_1/utils/utils_string.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
