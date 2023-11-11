import 'package:khidmatpro_app_vendor/constants/storage_constant.dart';

class StorageConstantsEnum {
  final String value;

  const StorageConstantsEnum(this.value);

  static const StorageConstantsEnum apiKey =
      StorageConstantsEnum(StorageConstant.apiKey);

  static const StorageConstantsEnum isFirstTime =
      StorageConstantsEnum(StorageConstant.isFirstTime);

  static const StorageConstantsEnum isDarkMode =
      StorageConstantsEnum(StorageConstant.isDarkMode);

  static const StorageConstantsEnum currentLocale =
      StorageConstantsEnum(StorageConstant.currentLocale);

  static const StorageConstantsEnum localeMY =
      StorageConstantsEnum(StorageConstant.localeMY);

  static const StorageConstantsEnum localeEN =
      StorageConstantsEnum(StorageConstant.localeEN);
}
