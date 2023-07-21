import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_test/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:tech_test/screen/home/home_screen.dart';

class LoginController extends BaseController {
  bool isError = false;
  bool isErrorEmailLogin = false;
  bool isErrorPasswordLogin = false;
  bool isObscurePasswordLogin = true;
  bool isRemember = false;
  bool isLoading = true;

  Widget showIcon = Icon(
    IconlyBold.show,
    color: Colors.black,
  );

  final formKey = GlobalKey<FormState>();
  final usernameLoginController = TextEditingController();
  final passwordLoginController = TextEditingController();

  // LoginModel? loginModel;

  @override
  void onInit() {
    cekToken();
    usernameLoginController.text;
    passwordLoginController.text;
    super.onInit();
  }

  @override
  void dispose() {
    usernameLoginController.dispose();
    passwordLoginController.dispose();
    super.dispose();
  }

  Future cekToken() async {
    isLoading = true;
    update();
    // String? token = await storage.readToken();
    // String? role = await storage.readRole();
    // print("token : $token");
    // print("role : $role");
    // if (token != null) {
    //   Get.offAll(HomeScreen());
    // }
    isLoading = false;
    update();
  }

  Future<void> doLogin() async {
    isLoading = true;
    update();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: usernameLoginController.text,
            password: passwordLoginController.text,
          )
          .then(
            (_) => Get.showSnackbar(
              const GetSnackBar(
                message: 'Welcome',
                isDismissible: true,
                duration: Duration(seconds: 3),
                backgroundColor: Colors.green,
              ),
            ),
          )
          .then((value) => Get.offAll(() => const HomeScreen()));
      isLoading = false;
      update();
    } catch (e, i) {
      isLoading = false;
      update();
      e.printError();
      i.printError();
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Username or Password is not valid',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
