import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String fontFamilyName = "Zeroes 3";
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Вход',
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
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Введите свой пароль',
                    labelStyle: TextStyle(
                        fontFamily: fontFamilyName,
                        color: Color.fromARGB(255, 0, 0, 0))),
              ),
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () => controller.signIn(),
              child: Text('Вход'),
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor:  const Color.fromARGB(255, 91, 0, 0),
                  foregroundColor: Colors.white,
                  elevation: 5.0,
                  padding: const EdgeInsets.all(20)),
            ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () => controller.toSignUp(),
            child: Text('Нет аккаунта? Ну сделай, че сидишь'),
            style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: const Color.fromARGB(255, 91, 0, 0),
                foregroundColor: Colors.white,
                elevation: 5.0,
                padding: const EdgeInsets.all(20)),
          )],
      ),
      ),
    );
  }
}
