import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/auth_service.dart';
import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  AuthService authService = Get.find();

  var mailController = TextEditingController();
  var passController = TextEditingController();
  var passRepController = TextEditingController();

  void signUp() async {
    if (!mailController.text.contains("@")) {
      showSnack("Неверная почта");
      return;
    }
    if (passController.text.length < 8) {
      showSnack("Длина пароля меньше 8 символов");
      return;
    }
    if (passController.text != passRepController.text) {
      showSnack("Неправильный пароль");
      return;
    }

    bool res = await authService.registration(
        mailController.text, passController.text);
    if (res) {
      authService.isLogin = true;
      Get.offNamed(Routes.HOME);
      showSnack('Регистрация прошла успешно', isError: false);
    } else {
      showSnack('Ошибка регистрации');
    }
  }

  void showSnack(String message, {isError = true}) {
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        backgroundColor: isError ? const Color.fromARGB(255, 255, 17, 0) : const Color.fromARGB(255, 0, 255, 8),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
