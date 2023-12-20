import 'package:bibbab/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String fontFamilyName = "Zeroes 3";
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Зарегистрироваться',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: fontFamilyName,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              color: const Color.fromARGB(0, 255, 255, 255),
              width: 300.0,
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                controller: controller.mailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Введите свой email',
                    labelStyle: TextStyle(
                        fontFamily: fontFamilyName,
                        color: Color.fromARGB(255, 0, 0, 0))),
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              color: const Color.fromARGB(0, 255, 255, 255),
              width: 300.0,
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                controller: controller.passController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Создайте пароль (не менее 8 символов)',
                    labelStyle: TextStyle(
                        fontFamily: fontFamilyName,
                        color: Color.fromARGB(255, 0, 0, 0))),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              color: const Color.fromARGB(0, 255, 255, 255),
              width: 300.0,
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                controller: controller.passRepController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Повторите пароль',
                    labelStyle: TextStyle(
                        fontFamily: fontFamilyName,
                        color: Color.fromARGB(255, 0, 0, 0))),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () => controller.signUp(),
              child: Text('Регистрация'),
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: const Color.fromARGB(255, 91, 0, 0),
                  foregroundColor: Colors.white,
                  elevation: 5.0,
                  padding: const EdgeInsets.all(20)),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.SIGNIN),
              child: Text('Назад'),
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: const Color.fromARGB(255, 91, 0, 0),
                  foregroundColor: Colors.white,
                  elevation: 5.0,
                  padding: const EdgeInsets.all(20)),
            )
          ],
        ),
      ),
    );
  }
}
