import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:bibbab/app/data/services/api_service.dart';
import 'package:bibbab/app/data/services/auth_service.dart';
import 'package:bibbab/app/data/services/storage_service.dart';

import 'app/routes/app_pages.dart';

void main()async {
  await initServices();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
Future<void> initServices() async {
  await Get.putAsync(() async => StorageService().init());
  await Get.putAsync(() async => AuthService().init());
  await Get.putAsync(() async => ApiService().init());
}