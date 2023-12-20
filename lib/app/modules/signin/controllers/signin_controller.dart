import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/services/api_service.dart';
import '../../../data/services/auth_service.dart';
import '../../../routes/app_pages.dart';

class SigninController extends GetxController {
  ApiService apiService = Get.find();
  AuthService authService = Get.find();

  var mailController = TextEditingController();
  var passController = TextEditingController();

  signIn() async {
    bool res =
        await authService.login(mailController.text, passController.text);
    if (res) {
      authService.isLogin = true;
      Get.offNamed(Routes.HOME);
      print('Вход в систему выполнен успешно');
    } else {
      print('Ошибка входа');
    }
  }

  toSignUp() {
    Get.toNamed(Routes.SIGNUP);
  }

}
