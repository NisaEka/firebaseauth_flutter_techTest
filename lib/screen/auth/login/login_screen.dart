import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tech_test/const/color.dart';
import 'package:tech_test/const/textstyle.dart';
import 'package:tech_test/reusable/form/customfilledbutton.dart';
import 'package:tech_test/screen/auth/forgotpassword/forgot_password_screen.dart';
import 'package:tech_test/screen/auth/login/login_controller.dart';
import 'package:get/get.dart';
import 'package:tech_test/screen/auth/register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset("assets/img/login.png"),
                        Form(
                          key: controller.formKey,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Login",
                                  style: titleTextStyle,
                                ),
                                SizedBox(height: 25),
                                RichText(
                                  text: TextSpan(
                                    text: 'Email ',
                                    style: formlabelTextStyle,
                                    children: const <TextSpan>[
                                      TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                                    ],
                                  ),
                                ),
                                TextFormField(
                                  controller: controller.usernameLoginController,
                                  decoration: InputDecoration(hintText: "Input Username", hintStyle: hintTextStyle),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Email tidak boleh kosong";
                                    }
                                  },
                                ),
                                SizedBox(height: 8),
                                RichText(
                                  text: TextSpan(
                                    text: 'Password ',
                                    style: formlabelTextStyle,
                                    children: const <TextSpan>[
                                      TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                                    ],
                                  ),
                                ),
                                TextFormField(
                                  controller: controller.passwordLoginController,
                                  obscureText: controller.isObscurePasswordLogin,
                                  decoration: InputDecoration(
                                      hintText: "Input Password",
                                      hintStyle: hintTextStyle,
                                      suffixIcon: IconButton(
                                        icon: controller.showIcon,
                                        onPressed: () {
                                          controller.isObscurePasswordLogin
                                              ? controller.isObscurePasswordLogin = false
                                              : controller.isObscurePasswordLogin = true;
                                          controller.isObscurePasswordLogin != false
                                              ? controller.showIcon = Icon(
                                                  IconlyBold.show,
                                                  color: Colors.black,
                                                )
                                              : controller.showIcon = Icon(
                                                  IconlyBold.hide,
                                                  color: Colors.black,
                                                );
                                          controller.update();
                                        },
                                      )),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Password tidak boleh kosong";
                                    }
                                  },
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () => Get.to(ForgotPasswordScreen()),
                                    child: Text("Forgot Password?",
                                        style: listTitleTextStyle.copyWith(color: infoColor, decoration: TextDecoration.underline)),
                                  ),
                                ),
                                CustomFilledButton(
                                  color: infoColor,
                                  title: 'Login',
                                  onPressed: () async {
                                    if (controller.formKey.currentState?.validate() == true) controller.doLogin();
                                  },
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text("OR", style: listTitleTextStyle),
                                ),
                                CustomFilledButton(color: infoColor, title: "Register", onPressed: () => Get.to(RegisterScreen()),),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                controller.isLoading==true
                    ? Container(
                        decoration: BoxDecoration(color: greyColor.withOpacity(0.5)),
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      )
                    : Container(),
              ],
            ),
          );
        });
  }
}
