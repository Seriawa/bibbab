import 'package:get/get.dart';
import 'package:bibbab/app/data/services/api_service.dart';

class HomeController extends GetxController {
  ApiService apiService = Get.find();

  RxString getdata = "".obs;
  RxString get data => getdata;

  @override
  void onInit() {
  getUserData();
  super.onInit();
  }

  void getUserData() async {
  var newdata = await apiService.getUser();
  getdata.value = newdata;
  }


}
