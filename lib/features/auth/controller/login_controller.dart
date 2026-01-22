
import 'package:get/get.dart';

import '../../../core/services/network/network_client.dart';
import '../model/login_model.dart';
import '../../../app/utils/urls.dart';
import '../model/user_model.dart';
import 'auth_controller.dart';

class LoginController extends GetxController {
  bool _inProgress = false;

  String? _errorMassage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMassage;

  Future<bool> login(LoginRequestModel model) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>()
        .postRequest(Urls.login, body: model.toJson());
    if (response.isSuccess) {
      await Get.find<AuthController>().saveUserData(
        response.responseData!['data']['token'],
        UserModel.fromJson(response.responseData!['data']['user']),);
      isSuccess = true;
      _errorMassage = null;
    } else {
      _errorMassage = response.errorMessage!;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}