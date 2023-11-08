import 'package:khidmatpro_app_vendor/constants/storage_constant.dart';

class StorageConstantsEnum {
  final String value;

  const StorageConstantsEnum(this.value);

  static const StorageConstantsEnum apiKey =
      StorageConstantsEnum(StorageConstant.apiKey);

  static const StorageConstantsEnum isFirstTime =
      StorageConstantsEnum(StorageConstant.isFirstTime);
}
