import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:tech_test/base/base_controller.dart';
import 'package:tech_test/screen/auth/login/login_screen.dart';

class RegisterController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final usernameLoginController = TextEditingController();
  final passwordLoginController = TextEditingController();
  final confirmpasswordLoginController = TextEditingController();

  bool isError = false;
  bool isErrorEmailLogin = false;
  bool isErrorPasswordLogin = false;
  bool isObscurePasswordLogin = true;
  bool isObscureConfirmPasswordLogin = true;
  bool isRemember = false;
  bool isLoading = false;

  Widget showIcon = Icon(
    IconlyBold.show,
    color: Colors.black,
  );

  @override
  void onInit() {
    super.onInit();
  }

  void doRegister() async {
    try {
      if (passwordLoginController.text == confirmpasswordLoginController.text) {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: usernameLoginController.text,
              password: passwordLoginController.text,
            )
            .then((value) => Get.showSnackbar(
                  const GetSnackBar(
                    icon: Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                    message: 'Register Success',
                    isDismissible: true,
                    duration: Duration(seconds: 3),
                    backgroundColor: Colors.green,
                  ),
                ))
            .then((value) => Get.offAll(LoginScreen()));
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            message: 'Password is not match',
            isDismissible: true,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      e.message.printError();
      try {
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
      } catch (e, s) {
        print(s);
      }
    }
    update();
  }
}
