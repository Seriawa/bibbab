import 'package:get/get.dart';
import 'package:bibbab/app/data/services/auth_service.dart';
import 'package:bibbab/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  AuthService authService = Get.find();
  @override
  void onReady() async {
    await authService.tryLogin();
    if(authService.isLogin){
      Get.offNamed(Routes.HOME);
    }
    else {
      Get.offNamed(Routes.SIGNIN);
    }
    super.onReady();
  }

}
