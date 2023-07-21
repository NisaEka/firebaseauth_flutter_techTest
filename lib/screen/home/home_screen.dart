import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_test/screen/auth/login/login_screen.dart';
import 'package:tech_test/screen/home/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              actions: [
                IconButton(
                  onPressed: () async{
                    controller.doLogout();
                  },
                  icon: Icon(Icons.logout),
                )
              ],
            ),
            body: Center(child: Text("Welcome ${controller.user?.email.toString()}")));
      }
    );
  }
}
