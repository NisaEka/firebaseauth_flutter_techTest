import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_test/base/base_controller.dart';

class ForgotPasswordController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim()).then((value) => Get.showSnackbar(
            GetSnackBar(
              icon: Icon(
                Icons.error,
                color: Colors.white,
              ),
              message: "Password reset link sent! check your email",
              isDismissible: true,
              duration: Duration(seconds: 3),
              backgroundColor: Colors.green,
            ),
          ));
    } on FirebaseAuthException catch (e) {
      e.printError();
      Get.showSnackbar(
        GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: e.message.toString(),
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
