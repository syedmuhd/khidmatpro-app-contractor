import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/constants/api_constant.dart';
import 'package:khidmatpro_app_vendor/models/contractor.dart';
import 'package:khidmatpro_app_vendor/models/location.dart';
import 'package:khidmatpro_app_vendor/providers/base_provider.dart';

class ContractorProvider extends BaseProvider {
  // Get currently authenticated contractors
  Future<Response<Contractor>> me() {
    return get<Contractor>(ApiConstant.contractor,
        decoder: (obj) => Contractor.fromJson(obj));
  }

  // Update contractor data
  Future<Response<Contractor>> update(payload, contractorId) {
    return patch<Contractor>("${ApiConstant.contractor}/$contractorId", payload,
        decoder: (obj) => Contractor.fromJson(obj));
  }

  // Update contractor location
  Future<Response<Location>> updateLocation(payload, contractorId) {
    return patch<Location>("${ApiConstant.location}/$contractorId", payload,
        decoder: (obj) => Location.fromJson(obj));
  }
}
