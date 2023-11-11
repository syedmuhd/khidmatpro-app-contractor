import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'app_language': 'App language',
          'theme_selection': 'Theme',
          'theme_selection_light': 'Light',
          'theme_selection_dark': 'Dark',
        },
        'my_MY': {
          'app_language': 'Pilihan bahasa',
          'theme_selection': 'Tema paparan',
          'theme_selection_light': 'Cerah',
          'theme_selection_dark': 'Gelap',
        }
      };
}
