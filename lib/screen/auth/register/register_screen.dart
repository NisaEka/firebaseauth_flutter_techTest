import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:tech_test/const/color.dart';
import 'package:tech_test/const/textstyle.dart';
import 'package:tech_test/reusable/form/customfilledbutton.dart';
import 'package:tech_test/screen/auth/forgotpassword/forgot_password_screen.dart';
import 'package:tech_test/screen/auth/register/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
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
                        // Image.asset("assets/img/login.png"),
                        Form(
                          key: controller.formKey,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Register",
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
                                SizedBox(height: 8),
                                RichText(
                                  text: TextSpan(
                                    text: 'Confirm Password ',
                                    style: formlabelTextStyle,
                                    children: const <TextSpan>[
                                      TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                                    ],
                                  ),
                                ),
                                TextFormField(
                                  controller: controller.confirmpasswordLoginController,
                                  obscureText: controller.isObscureConfirmPasswordLogin,
                                  decoration: InputDecoration(
                                      hintText: "Input Password",
                                      hintStyle: hintTextStyle,
                                      suffixIcon: IconButton(
                                        icon: controller.showIcon,
                                        onPressed: () {
                                          controller.isObscureConfirmPasswordLogin
                                              ? controller.isObscureConfirmPasswordLogin = false
                                              : controller.isObscureConfirmPasswordLogin = true;
                                          controller.isObscureConfirmPasswordLogin != false
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
                                SizedBox(height: 8),
                                CustomFilledButton(
                                  color: infoColor,
                                  title: 'Register',
                                  onPressed: () async {
                                    if (controller.formKey.currentState?.validate() == true) controller.doRegister();
                                  },
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                controller.isLoading == true
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
