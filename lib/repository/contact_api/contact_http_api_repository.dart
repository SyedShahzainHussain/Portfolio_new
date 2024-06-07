import 'package:portfolio/repository/contact_api/contact_api_repository.dart';
import 'package:portfolio/utils/app_url.dart';

import '../../data/network/base_api_services.dart';
import '../../data/network/network_api_services.dart';

class ContactHttpRepository extends ContactApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  @override
  Future<void> sendContactInfo(dynamic data) async {
      await _apiServices.postApi(AppUrl.contactApi, data, headers: {
        "Content-Type": "application/json",
        "Origin": "http://localhost",
      });
    
  }
}
